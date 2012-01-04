#!/bin/sh
#
#      Jonathan Perkin <jonathan@perkin.org.uk> wrote this file.
#
# You can freely distribute/modify it (and are encouraged to do so),
# and you are welcome to buy me a beer if we ever meet and you think
# this stuff is worth it.  Improvements and cleanups always welcome.
#
# dot.xinitrc - X startup file.
#
#   xdm(1), xinit(1)
#


# Share startup with the main .xsession file - shouldn't matter whether we
# start up from xdm or xinit.
if [ -f ${HOME}/.xsession ]; then
    . ${HOME}/.xsession
fi
