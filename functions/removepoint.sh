#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
removepoint () {
rolevars

# Nothing Exist; kick user back to main menu
frontoutput=$(cat /var/plexguide/multihd.paths)
if [[ "$frontoutput" == "" ]]; then
tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💪 Remove an HD or MountPoint ~ http://multihd.pgblitz.com
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

NOTE: No HD's or MountPoints have been stored! Unable to remove something
that does not exist! EXITING!

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
read -rp '↘️  Acknowledge Info | Press [ENTER] ' typed < /dev/tty
multihdstart; fi

inputphase
}

inputphase () {

rm -rf /var/plexguide/.tmp.removepointmenu 1>/dev/null 2>&1

# Starting Process
tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💪 Remove an HD/MountPoint ~ http://multihd.pgblitz.com
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

NOTE: Type a number selection in order to remove one of the HD/Mountpoints

EOF
num=0
while read p; do
  ((num++))
  echo "[$num] $p"
  echo "[$num] $p" >> /var/plexguide/.tmp.removepointmenu
done </var/plexguide/multihd.paths

tee <<-EOF

Quitting? Type >>> exit
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
read -rp '↘️  Type Number | Press [ENTER]: ' typed < /dev/tty

if [[ "$typed" == "Exit" || "$typed" == "exit" || "$typed" == "EXIT" ]]; then multihdstart; fi
if [[ "$typed" == "" ]]; then inputphase; fi

if [[ "$typed" -lt "1" && "$typed" -gt "$num" ]]; then inputphase; fi

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

# Checks to Make Sure the Path Is Valid
if [[ "$checkcheck2" != "" ]]; then
tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💪 ERROR NOTICE ~ http://multihd.pgblitz.com
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PATH: $addpath

NOTE: We are unable to verify that the following path above exists!
Type "ls -la $addpath"

Utilizing the above command may help determine what the problem is!

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
read -rp '↘️  Acknowledge Info | Press [ENTER] ' typed < /dev/tty
addpoint; fi

# Checks to Make Sure BoneHead doesn't store the same path twice
checkcheck3=$(cat /var/plexguide/multihd.paths | grep "$addpath")
if [[ "$checkcheck3" != "" ]]; then
tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💪 ERROR NOTICE ~ http://multihd.pgblitz.com
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PATH: $addpath

NOTE: This path ALREADY EXISTS in the MultiHD Setup! There is nothing else
to do! EXITING!

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
read -rp '↘️  Acknowledge Info | Press [ENTER] ' typed < /dev/tty
multihdstart
fi

# Congrats! The Path Exists and is now stored!
tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💪 SUCCESS NOTICE ~ http://multihd.pgblitz.com
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PATH: $addpath

NOTE: The path exists! The path has now been saved to our
MultiHD list!

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF

echo $addpath >> /var/plexguide/multihd.paths
read -rp '↘️  Acknowledge Info | Press [ENTER] ' typed < /dev/tty

multihdstart
}
