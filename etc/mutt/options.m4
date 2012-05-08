m4_include(`common')m4_dnl
#
#      Jonathan Perkin <jonathan@perkin.org.uk> wrote this file.
#
# You can freely distribute/modify it (and are encouraged to do so),
# and you are welcome to buy me a beer if we ever meet and you think
# this stuff is worth it.  Improvements and cleanups always welcome.
#
# etc/mutt/options - general configuration options for mutt(1)
#
#   http://www.mutt.org/doc/manual/manual-6.html#ss6.3
#


# http://www.mutt.org/doc/manual/manual-6.html#ascii_chars
set ascii_chars=yes

# http://www.mutt.org/doc/manual/manual-6.html#attribution
set attribution="* On %(%Y-%m-%d) at %(%H:%M %Z), %n wrote:\n"

# http://www.mutt.org/doc/manual/manual-6.html#confirmappend
set confirmappend=no

# http://www.mutt.org/doc/manual/manual-6.html#delete
set delete=yes

# http://www.mutt.org/doc/manual/manual-6.html#edit_headers
set edit_headers=yes

# http://www.mutt.org/doc/manual/manual-6.html#envelope_from
set envelope_from=yes

# http://www.mutt.org/doc/manual/manual-6.html#fast_reply
set fast_reply=yes

m4_ifdef([[[SITE_HOME]]],[[[m4_dnl
# Not a standard option, requires enabling
set header_cache="~/.mutt_hcache/"

]]])m4_dnl
# http://www.mutt.org/doc/manual/manual-6.html#imap_passive
set imap_passive=no

# http://www.mutt.org/doc/devel/manual.html#imap-check-subscribed
set imap_check_subscribed=yes

# http://www.mutt.org/doc/manual/manual-6.html#include
set include=yes

# http://www.mutt.org/doc/manual/manual-6.html#mail_check
set mail_check=30

# http://www.mutt.org/doc/manual/manual-6.html#menu_scroll
set menu_scroll=yes

# http://www.mutt.org/doc/manual/manual-6.html#mime_forward
set mime_forward=yes

# http://www.mutt.org/doc/manual/manual-6.html#move
set move=no

# http://www.mutt.org/doc/manual/manual-6.html#pager_index_lines
set pager_index_lines=10

# http://www.mutt.org/doc/manual/manual-6.html#pager_stop
set pager_stop=yes

# http://www.mutt.org/doc/manual/manual-6.html#postpone
set postpone=no

# http://www.mutt.org/doc/manual/manual-6.html#print_command
#
# This should probably be conditional on lp vs lpr, but will work for now..
set print_command="mp | lp"

# http://www.mutt.org/doc/manual/manual-6.html#query_command
set query_command="lbdbq '%s'"

# http://www.mutt.org/doc/manual/manual-6.html#quit
set quit=ask-no

# http://www.mutt.org/doc/manual/manual-6.html#realname
set realname="Jonathan Perkin"

# http://www.mutt.org/doc/manual/manual-6.html#reply_to
set reply_to=yes

# http://www.mutt.org/doc/manual/manual-6.html#sort
set sort=threads

# http://www.mutt.org/doc/manual/manual-6.html#tilde
set tilde=yes

# http://www.mutt.org/doc/manual/manual-6.html#timeout
set timeout=30

# http://www.mutt.org/doc/manual/manual-6.html#to_chars
set to_chars=" +TCF"

# http://www.mutt.org/doc/manual/manual-6.html#wait_key
set wait_key=no

set xterm_set_titles
set xterm_title="mutt %f (%n/%o/%m) %?b?[%b NEW]?"

#
# Other misc settings.
#
alternates (jonathan@perkin.org.uk|jperkin@(netbsd|pkgsrc).org|(jonathan.perkin|jperkin)@joyent.com)
