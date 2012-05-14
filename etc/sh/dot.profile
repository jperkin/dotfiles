#!/bin/sh
#
#      Jonathan Perkin <jonathan@perkin.org.uk> wrote this file.
#
# You can freely distribute/modify it (and are encouraged to do so),
# and you are welcome to buy me a beer if we ever meet and you think
# this stuff is worth it.  Improvements and cleanups always welcome.
#
# dot.profile - environmental variables used by Bourne shells.
#
#   http://www.gnu.org/software/bash/manual/bashref.html#SEC60
#


#
# Prevent multiple-inclusion of the same version.  Use the .versionrc file
# to detect whether dotfiles have been updated since we were first sourced,
# and reload if necessary.
#
if [ -f ${HOME}/.versionrc ]; then
    read dotversion < ${HOME}/.versionrc
    if [ -n "${_DOT_PROFILE_}" ] && [ ${_DOT_PROFILE_} -eq ${dotversion} ]; then
        return
    else
        # Newer .versionrc available, set new version and fallthrough
        _DOT_PROFILE_=${dotversion}
    fi
    unset dotversion
else
    echo "Warning: Could not find ${HOME}/.versionrc"
fi

# First of all load up enough environment information to be able to exec a
# nicer shell if possible, then customise afterwards as this file will be
# parsed twice.

# Basic environment setup, sets variables used in later files
. ${HOME}/etc/sh/basicenv

# Source in sh-compatible helper functions
. ${HOME}/etc/sh/functions

# Some default, standard paths.
. ${HOME}/etc/sh/paths

# Local environment setup
. ${HOME}/etc/sh/env

# If we're currently running /bin/sh, that's because it's the lowest common
# denominator for the class of machine, and I'd prefer to run something nicer.
case "${SHELL}" in
*/bin/sh)
    # Check to see whether we're running in a terminal or not.
    if tty -s
    then
        if BASH=`command -v bash`
        then
            SHELL=${BASH}
            export SHELL

            exec ${BASH} --login
        elif KSH=`command -v ksh`
        then
            SHELL=${KSH}
            export SHELL

            ENV=${HOME}/.profile
            export ENV

            exec ${KSH}
        fi

        # Just in case we're still left with /bin/sh in interactive
        # mode, set this up to make it slightly bearable.
        stty erase '^?'
    fi
    ;;
*)
    # Probably safe to run more featureful things now.
    case "$-" in
    *i*)
        # The one, true, backwards-delete-char character.
        stty erase '^?'

        # Use vi editing mode.
        set -o vi

        # Try a more featureful prompt for ksh
        case "${SHELL}" in
        */bin/ksh)
            alias cd=promptcd
            promptcd .
            ;;
        esac
    esac
    ;;
esac

# Now that we've finished loading the best available shell, we can start
# setting up the environment to suit.

# Local aliases
. ${HOME}/etc/sh/aliases

# Local hacks (optional)
if [ -f ${HOME}/etc/sh/hacks ]; then
    . ${HOME}/etc/sh/hacks
fi

#
# Ensure that this file is not read again as part of an interactive session,
# as I've seen circumstances where e.g. NetBSD's "build.sh" appears to read
# it and spawn a sub-shell.
#
unset ENV
