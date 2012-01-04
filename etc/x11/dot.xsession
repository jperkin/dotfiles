#!/bin/sh
#
#      Jonathan Perkin <jonathan@perkin.org.uk> wrote this file.
#
# You can freely distribute/modify it (and are encouraged to do so),
# and you are welcome to buy me a beer if we ever meet and you think
# this stuff is worth it.  Improvements and cleanups always welcome.
#
# dot.xsession - X startup file.
#
#   xdm(1), xinit(1)
#


# Load profile to set up correct PATH etc.
. ${HOME}/.profile

case "${OS_NAME}" in
Darwin)
    # Don't do anything on Darwin, let the Aqua/X11 thing handle it.
    exit 0
    ;;
esac

# Find out what is already running from xdm etc, and kill unwanted windows
xlsclients -l | tr ':' ' ' | while read key value; do
    case "${key}" in
    Window)
        winid="${value}"
        ;;
    Name)
        winname="${value}"
        ;;
    *)
        winname=""
    esac

    case "${winname}" in
    xconsole)
        xkill -id ${winid} >/dev/null 2>&1
        ;;
    esac
done

# Load in X resources.  If this script isn't used from xdm, then these get
# sourced from the xdm scripts anyway.
if [ -f ${HOME}/.Xresources ]; then
    xrdb -load ${HOME}/.Xresources
fi

# Unix socket font path, served from xfstt on port 7101.
if [ -r /tmp/.font-unix/fs7101 ]; then
    xset +fp unix/:7101
fi

# Local fonts directory, which should be first in path.
if [ -d ${HOME}/.fonts ]; then
    mkfontscale ${HOME}/.fonts
    mkfontdir ${HOME}/.fonts
    xset +fp ${HOME}/.fonts
fi

# Keyboard repeat rates.
xset r rate 300 40

# Turn off audible bell (yuck).
xset b off

# Turn off the Caps Lock key, which has no purpose whatsoever other than to
# annoy and confuse.  Send stderr to /dev/null as Caps_Lock may be disabled,
# e.g. by setupcon(1), and we don't want useless stuff in .xsession-errors
xmodmap -e "keysym Caps_Lock = " 2>/dev/null

# Start ssh agent before window manager so that all new terms spawned get
# access to the SSH_* environment variables.  If an ssh-agent is already
# running (from gdm or so) then use that one.
if [ -z "${SSH_AGENT_PID}" ]; then
    if command -v ssh-agent >/dev/null 2>&1; then
        eval `ssh-agent -s` >/dev/null
    fi
fi

# Default background colour for tailing xterms and root window
XBGCOL="#001030"

# Do basic configuration on each available desktop (background, cursor)
numscreens="`xdpyinfo | awk '/number of screens:/ {print $NF}'`"
i=0

while [ ${i} != ${numscreens} ]; do

    # Set the desktop background
    xsetroot -display :0.${i} -solid ${XBGCOL}

    # Set up a nicer pointer than the default.
    xsetroot -display :0.${i} -cursor_name left_ptr

    i=`expr ${i} + 1`
done

# Start Window Manager.
if command -v awesome >/dev/null 2>&1; then
    awesome
elif command -v evilwm >/dev/null 2>&1; then
    evilwm -fn -misc-monaco-medium-r-normal--10-0-0-0-p-0-iso8859-1 -snap 6 -term xterm &

    # Set up initial processes on first screen based on screen resolution.
    case "`xdpyinfo | awk '/dimensions:/ {print $2; exit}'`" in
    1440x900)
        xterm -g 158x5+244+0 -bg ${XBGCOL} -e ${HOME}/scripts/x11/roottail &
        xterm -g 80x25+954+82 &
        xterm -g 80x37+954+413 &
        ;;
    1024x768)
        xterm -g 134x7+170+0 -bg ${XBGCOL} -e ${HOME}/scripts/x11/roottail &
        xterm -g 80x25+618+86 &
        xterm -g 80x42+618+342 &
        ;;
    1280x1024)
        xterm -g 150x7+275+0 -bg ${XBGCOL} -e ${HOME}/scripts/x11/roottail &
        xterm -g 80x25+874+86 &
        xterm -g 80x25+874+342 &
        xterm -g 80x42+874+598 &
        ;;
    *)
        ;;
    esac

    if command -v xtu >/dev/null 2>&1; then
        # Magic process, a nice small configurable analogue clock.
        xtu
    else
        # Fall back on xclock which should be available.
        xclock
    fi
elif command -v cwm >/dev/null 2>&1; then
    cwm
elif command -v twm >/dev/null 2>&1; then
    # Plain native X11 desktop until we can configure something else
    twm
else
    # Hopefully at least _this_ is available..
    xterm
fi

# Finally, kill off the ssh-agent and give control back to xdm.
if [ -n "${SSH_AGENT_PID}" ]; then
    ssh-add -D < /dev/null
    eval `ssh-agent -s -k`
fi
