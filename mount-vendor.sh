#!/sbin/sh

# Image A12 mount system image partition in system_root
if mount /vendor; then
    exit 0
fi

# Try to get the block from /etc/recovery.fstab
block=`cat /etc/recovery.fstab | cut -d '#' -f 1 | grep /vendor | grep -o '/dev/[^ ]*' | head -1 | sed 's/\([[:blank:]]\).*/\1/'`
if [ -n "$block" ] && mount -t ext4 -o rw $block /vendor; then
    exit 0
fi

exit 1