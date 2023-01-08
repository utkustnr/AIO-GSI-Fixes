#!/sbin/sh

# Image A12 mount system image partition in system_root
if mount /system_root; then
    exit 0
fi

# Try to get the block from /etc/recovery.fstab
block=`cat /etc/recovery.fstab | cut -d '#' -f 1 | grep /system | grep -o '/dev/[^ ]*' | head -1 | sed 's/\([[:blank:]]\).*/\1/'`
if [ -n "$block" ] && mount -t ext4 -o rw $block /system_root; then
	exit 0
fi

exit 1