#!/usr/bin/env bash
#
#      Jonathan Perkin <jonathan@perkin.org.uk> wrote this file.
#
# You can freely distribute/modify it (and are encouraged to do so),
# and you are welcome to buy me a beer if we ever meet and you think
# this stuff is worth it.  Improvements and cleanups always welcome.
#
# dot.bash_profile - sourced by bash(1) for interactive login shells.
#
#   http://www.gnu.org/software/bash/manual/bashref.html#SEC65
#


# Source configuration for all interactive shells.
if [ -f ${HOME}/.bashrc ]; then
    . ${HOME}/.bashrc
fi
