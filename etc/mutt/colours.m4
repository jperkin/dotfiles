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
m4_define([[[BLACK]]],      [[[color0]]])m4_dnl
m4_define([[[RED]]],        [[[color1]]])m4_dnl
m4_define([[[GREEN]]],      [[[color2]]])m4_dnl
m4_define([[[YELLOW]]],     [[[color3]]])m4_dnl
m4_define([[[BLUE]]],       [[[color4]]])m4_dnl
m4_define([[[MAGENTA]]],    [[[color5]]])m4_dnl
m4_define([[[CYAN]]],       [[[color6]]])m4_dnl
m4_define([[[ORANGE]]],     [[[color9]]])m4_dnl
m4_define([[[GREY]]],       [[[color10]]])m4_dnl
m4_define([[[PURPLE]]],     [[[color13]]])m4_dnl
m4_define([[[WHITE]]],      [[[color15]]])m4_dnl

uncolor index           *

# Generic
color   error           ORANGE          BGCOL
color   indicator       brightdefault   BLACK
color   markers         PURPLE          BGCOL
color   message         PURPLE          BGCOL
color   normal          brightdefault   BGCOL
color   status          YELLOW          BLACK
color   tilde           BLUE            BGCOL
color   tree            PURPLE          BGCOL

# Index
color   index           YELLOW          BGCOL   ~N      # New
color   index           GREEN           BGCOL   ~O      # Old
color   index           BLUE            BGCOL   ~T      # Tagged
color   index           RED             BGCOL   ~D      # Deleted

color   index           ORANGE          BGCOL   '~f root@'
color   index           ORANGE          BGCOL   '~f mailer-daemon@'

# Mail headers
color   hdrdefault      CYAN            BGCOL
color   header          YELLOW          BGCOL   "^from "
color   header          white           BGCOL   "^received: "
color   header          GREEN           BGCOL   "^date: "
color   header          YELLOW          BGCOL   "^from: "
color   header          PURPLE          BGCOL   "^to: "
color   header          GREEN           BGCOL   "^cc: "
color   header          BLUE            BGCOL   "^reply-to: "
color   header          CYAN            BGCOL   "^subject: "
color   header          YELLOW          BGCOL   "^message-id: "
color   header          YELLOW          BGCOL   "^user-agent: "
color   header          YELLOW          BGCOL   "^x-mailer: "

# Mail body
color   attachment      WHITE           GREY
color   signature       BLUE            BGCOL

color   body            PURPLE          BGCOL   "(ftp|http|https|news)://[^ ]*"
color   body            PURPLE          BGCOL   "(finger|telnet)://[^ ]*"

# Quote levels
color   quoted          CYAN            BGCOL
color   quoted1         YELLOW          BGCOL
color   quoted2         GREEN           BGCOL
color   quoted3         PURPLE          BGCOL
color   quoted4         CYAN            BGCOL
color   quoted5         YELLOW          BGCOL
color   quoted6         GREEN           BGCOL
color   quoted7         PURPLE          BGCOL
