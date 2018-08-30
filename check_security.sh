#!/bin/bash

# Phân quyền bootloader phù hợp

ls -ll /boot/grub2/grub.cfg
echo "result expect: -rw------- 1 root root 5200 Jan 16 14:47 /boot/grub2/grub.cfg"
        file_grub="/boot/grub2/grub.cfg"
        if [ -f "$file_grub" ];
        then
                `chown root:root /boot/grub2/grub.cfg`
                `chmod og-rwx /boot/grub2/grub.cfg`
        else
                echo "Khong tim thay file /boot/grub2/grub.cfg"
        fi
ls -ll /boot/grub2/grub.cfg

######################## Tunning sysctl ##########################
# Khóa chuyển tiếp IP

        sysctl net.ipv4.ip_forward
echo "result expect: net.ipv4.ip_forward = 0"
        file_sysctl=""
