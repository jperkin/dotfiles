#
#      Jonathan Perkin <jonathan@perkin.org.uk> wrote this file.
#
# You can freely distribute/modify it (and are encouraged to do so),
# and you are welcome to buy me a beer if we ever meet and you think
# this stuff is worth it.  Improvements and cleanups always welcome.
#
# dot.cshrc - run bash if available and interactive.
#


#
# Historical anecdote - I used to have an awesome csh setup, back in the day,
# which I spent a lot of time customising and using lots of tricks.  But then I
# realised I was wasting time and effort maintaining knowledge of two diverse
# shell syntax, and moved to bourne-only (preferably bash, for reasons of
# ubiquity).
#
# Which is why I don't really understand vi(m) users who don't use set -o vi!
#

# All we want to do is run bash.  If it doesn't exist, then don't bother
# setting up the environment correctly, to "encourage" proper installation.
if ( ${?prompt} && ${SHELL} =~ *csh ) then

    setenv BASH "${HOME}/pkg/`uname -s`-`uname -r`/bin/bash"

    if ( -x ${BASH} ) then
        setenv SHELL "${BASH}"
        exec ${BASH} --login
    else
        echo "Not running bash, please fix"
    endif

    unsetenv BASH
else
    set path = ( ${HOME}/bin /sbin /usr/sbin /usr/bin /usr/ccs/bin      \
                 ${HOME}/pkg/`uname -s`-`uname -r`/sbin                 \
                 ${HOME}/pkg/`uname -s`-`uname -r`/bin                  \
                 /usr/local/sbin /usr/local/bin                         \
                 /usr/openwin/bin /usr/dt/bin )
endif
