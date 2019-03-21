#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
rolevars () {
  mkdir -p /var/plexguide/

  variable () {
    file="$1"
    if [ ! -e "$file" ]; then echo "$2" > $1; fi
  }

  variable /var/plexguide/vfs_rcsl "5"
  vfs_rcsl=$(cat /var/plexguide/vfs_rcsl)

}
