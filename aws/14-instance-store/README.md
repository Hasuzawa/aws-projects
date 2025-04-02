## Summary

Instance with a non-root block volume and an instance store.

## EBS Volume

persistent storage.

Only some volume type supports multi-attach, and only Nitro instances can be multi-attached.

## Instance Store

temporary storage.

## Attaching Volume

To attach a volume to instance, a path and device name is needed.

The mounted EBS will show up in /dev/

xen hypervisor
```sh
>>> ls -al /dev/sd*
lrwxrwxrwx. 1 root root 4 Apr  2 14:17 /dev/sda -> xvda
lrwxrwxrwx. 1 root root 5 Apr  2 14:17 /dev/sda1 -> xvda1
lrwxrwxrwx. 1 root root 7 Apr  2 14:17 /dev/sda127 -> xvda127
lrwxrwxrwx. 1 root root 7 Apr  2 14:17 /dev/sda128 -> xvda128
lrwxrwxrwx. 1 root root 4 Apr  2 15:37 /dev/sdf -> xvdf
lrwxrwxrwx. 1 root root 4 Apr  2 15:37 /dev/sdg -> xvdg

>>> lsblk -l
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS
xvda    202:0    0   8G  0 disk 
xvda1   202:1    0   8G  0 part /
xvdf    202:80   0   8G  0 disk 
xvdg    202:96   0   8G  0 disk 
xvda127 259:0    0   1M  0 part 
xvda128 259:1    0  10M  0 part /boot/efi
```

nitro hypervisor
```sh
>>> lsblk -l
NAME        MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS
nvme0n1     259:0    0   8G  0 disk 
nvme0n1p1   259:1    0   8G  0 part /
nvme0n1p127 259:2    0   1M  0 part 
nvme0n1p128 259:3    0  10M  0 part /boot/efi
nvme1n1     259:4    0   8G  0 disk

>>> df -lh
Filesystem        Size  Used Avail Use% Mounted on
devtmpfs          4.0M     0  4.0M   0% /dev
tmpfs             453M     0  453M   0% /dev/shm
tmpfs             181M  2.7M  179M   2% /run
/dev/nvme0n1p1    8.0G  1.5G  6.5G  19% /
tmpfs             453M     0  453M   0% /tmp
/dev/nvme0n1p128   10M  1.3M  8.7M  13% /boot/efi
tmpfs              91M     0   91M   0% /run/user/1000
```
