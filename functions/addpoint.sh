#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
startaddpoint () {
rolevars
tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💪 Add HD or MountPoint ~ http://multihd.pgblitz.com
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

NOTE1: This point must exist. PGBlitz does not format drives or mount the
secondary HDs for the user. Visit the URL on somebasics to accomplish
this. Feel free to add/change the wiki to help us all!

NOTE2: Format Example: /hd2/mystuff | /mystash/media | /secondhd/media
These are just examples!

Quitting? Type >>> exit
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
read -rp '↘️  Input Selection | Press [ENTER]: ' $addpoint < /dev/tty

if [[ "$addpoint" == "Exit" || "$addpoint" == "exit" || "$addpoint" == "EXIT" ]]; then startaddpoint; fi 
if [[ "$addpoint" == "" ]]; then startaddpoint; fi

start
}

startaddpoint () {




startaddpoint
}
