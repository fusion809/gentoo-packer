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
  partition   \
  stage3      \
  mounts      \
  resolv.conf \
  portage     \
  timezone    \
  fstab       \
  kernel      \
  grub        \
  virtualbox  \
  network     \
  cleanup
do
  "$SCRIPTS/scripts/$script.sh"
done

echo "All done."
