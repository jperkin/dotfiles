m4_include(`common')m4_dnl
#
#      Jonathan Perkin <jonathan@perkin.org.uk> wrote this file.
#
# You can freely distribute/modify it (and are encouraged to do so),
# and you are welcome to buy me a beer if we ever meet and you think
# this stuff is worth it.  Improvements and cleanups always welcome.
#
# etc/mutt/colours - configuration file defining output colours for mutt(1).
#
#   http://www.mutt.org/doc/manual/manual-3.html#color
#

m4_ifdef([[[SITE_HOME]]],[[[m4_dnl
m4_define([[[BGCOL]]],[[[default]]])m4_dnl
]]],[[[m4_dnl
m4_define([[[BGCOL]]],[[[black]]])m4_dnl
]]])m4_dnl

uncolor index           *

# Generic
color   error           brightred       BGCOL
color   indicator       white           blue
color   markers         brightred       BGCOL
color   message         brightcyan      BGCOL
color   normal          white           BGCOL
color   status          brightyellow    blue
color   tilde           brightblue      BGCOL
color   tree            brightmagenta   BGCOL

# Index
color   index           brightyellow    BGCOL   ~N      # New
color   index           brightyellow    BGCOL   ~O      # Old
color   index           brightblue      BGCOL   ~T      # Tagged
color   index           brightred       BGCOL   ~D      # Deleted

color   index           brightred       BGCOL   '~f root@'
color   index           brightred       BGCOL   '~f mailer-daemon@'

# Mail headers
color   hdrdefault      cyan            BGCOL
color   header          brightyellow    BGCOL   "^from "
color   header          brightwhite     BGCOL   "^received: "
color   header          brightgreen     BGCOL   "^date: "
color   header          brightyellow    BGCOL   "^from: "
color   header          brightred       BGCOL   "^to: "
color   header          brightgreen     BGCOL   "^cc: "
color   header          brightblue      BGCOL   "^reply-to: "
color   header          brightcyan      BGCOL   "^subject: "
color   header          brightyellow    BGCOL   "^message-id: "
color   header          brightyellow    BGCOL   "^user-agent: "
color   header          brightyellow    BGCOL   "^x-mailer: "

# Mail body
color   attachment      brightwhite     magenta
color   signature       brightblue      BGCOL

color   body            brightblue      BGCOL   "(ftp|http|https|news)://[^ ]*"
color   body            brightblue      BGCOL   "(finger|telnet)://[^ ]*"

# Quote levels
color   quoted          brightcyan      BGCOL
color   quoted1         brightyellow    BGCOL
color   quoted2         brightgreen     BGCOL
color   quoted3         brightred       BGCOL
color   quoted4         brightcyan      BGCOL
color   quoted5         brightyellow    BGCOL
color   quoted6         brightgreen     BGCOL
color   quoted7         brightred       BGCOL
