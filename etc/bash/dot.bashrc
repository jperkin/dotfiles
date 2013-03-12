#!/usr/bin/env bash
#
#      Jonathan Perkin <jonathan@perkin.org.uk> wrote this file.
#
# You can freely distribute/modify it (and are encouraged to do so),
# and you are welcome to buy me a beer if we ever meet and you think
# this stuff is worth it.  Improvements and cleanups always welcome.
#
# dot.bashrc - sourced by bash(1) for interactive non-login shells.
#
#   http://www.gnu.org/software/bash/manual/bashref.html#SEC65
#


# Environment variables.
if [ -f ${HOME}/.profile ]; then
    . ${HOME}/.profile
else
    echo "   ***    Unable to source ${HOME}/.profile!    ***"
    echo "   *** Expect some serious problems until fixed ***"
fi

# Check for whether we're running interactively or not, and set up accordingly.
case "$-" in
*i*)
    # ANSI colours.
    . ${HOME}/etc/bash/colours

    # Prompt definitions and variables.
    . ${HOME}/etc/bash/prompt

    # Set up a prompt depending on the current terminal settings.
    set_prompt

    # Load bash programmable completion
    for dir in /etc /etc/bash /usr/pkg/share/bash-completion; do
        if [ -f ${dir}/bash_completion ]; then
            . ${dir}/bash_completion
        fi
    done
    ;;
esac
