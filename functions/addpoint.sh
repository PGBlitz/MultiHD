#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
addpoint () {
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
read -rp '↘️  Input Selection | Press [ENTER]: ' addpath < /dev/tty

if [[ "$addpath" == "Exit" || "$addpath" == "exit" || "$addpath" == "EXIT" ]]; then multihdstart; fi
if [[ "$addpath" == "" ]]; then addpoint; fi

addpointcheck
}

addpointcheck () {

  # adds slashes if missing
  if [[ $(echo $addpath | cut -c1) != "/" ]]; then addpath="/$addpath"; fi
  if [[ $(echo $addpath | tail -c 2) != "/" ]]; then addpath="$addpath/"; fi

tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💪 Processing Path: $addpath
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF

checkcheck1=$(ls -la "$addpath" 2>&1)
checkcheck2=$(echo $checkcheck1 | grep "cannot access")

if [[ "$checkcheck2" != "" ]]; then

tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💪 ERROR NOTICE ~ http://multihd.pgblitz.com
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PATH: $addpath

NOTE: We are unable to verify that the following path above exists!
Type "ls -la $addpath"

This command may help determine what the problem is!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
read -rp '↘️  Acknowledge Info | Press [ENTER] ' typed < /dev/tty
addpoint; fi

if [ -e "/var/plexguide/multihd.paths" ]; then
  echo "[NOT SET]" > /var/plexguide/project.final
fi



tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💪 SUCCESS NOTICE ~ http://multihd.pgblitz.com
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PATH: $addpath

NOTE: The following path does exist! We are storing the PATH for continued
use! That's it unless more paths must be added!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF

echo $addpath >> /var/plexguide/multihd.paths
read -rp '↘️  Acknowledge Info | Press [ENTER] ' typed < /dev/tty

multihdstart
}
