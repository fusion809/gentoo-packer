#!/bin/bash
## Setting environment variables
# Latest VirtualBox guest additions
export VBGA=5.0.16

if [[ -z $STAGE3 ]]
then
  echo "STAGE3 environment variable must be set to a timestamp."
  exit 1
fi

if [[ -z $SCRIPTS ]]
then
  SCRIPTS=.
fi

chmod +x $SCRIPTS/scripts/*.sh

for script in \
  01-partition   \
  02-stage3      \
  03-mounts      \
  04-resolv.conf \
  05-portage     \
  06-timezone    \
  07-fstab       \
  08-kernel      \
  09-grub        \
  10-virtualbox  \
  11-network     \
  12-cleanup
do
  "$SCRIPTS/scripts/$script.sh"
done

echo "All done."
