#!/bin/bash

# Phân quyền bootloader phù hợp

bootloader(){
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
}


######################## Tunning sysctl ##########################
# Khóa chuyển tiếp IP

net_ipv4_ip_forward(){
        sysctl net.ipv4.ip_forward
echo "result expect: net.ipv4.ip_forward = 0"
        file_sysctl="/etc/sysctl.conf"
	if [ -f "$file_sysctl" ];
	echo "file $file_sysctl found"
		then
			value_find_forward=`cat /etc/sysctl.conf | grep "net.ipv4.ip_forward" | wc -l`
			if [ "$value_find_forward" == 1 ]
				then
					value_forward=`cat /etc/sysctl.conf | grep "net.ipv4.ip_forward" | awk '{print $3}'`
					if [  "$value_forward" == 1 ]
						then
						echo "change parameter net.ipv4.ip_forward = 1 to net.ipv4.ip_forward = 0"
						sed -i 's/net.ipv4.ip_forward = 1/net.ipv4.ip_forward = 0/g' "$file_sysctl"
					else
						echo "change parameter net.ipv4.ip_forward = 0 to net.ipv4.ip_forward = 0"
						sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 0/g' "$file_sysctl"
					fi
				
			else	
				echo "add parameter net.ipv4.ip_forward = 0 to emptry"
				echo "net.ipv4.ip_forward = 0" >> "$file_sysctl"
			fi
					
	else
		echo "file $file_sysctl not found"
	fi
	
}

# Tắt chức năng chuyển hướng gói tin
net_ipv4_conf_all_send_redirects(){
        sysctl net.ipv4.conf.all.send_redirects
echo "result expect: net.ipv4.conf.all.send_redirects = 0"
        file_sysctl="/etc/sysctl.conf"
        if [ -f "$file_sysctl" ];
        echo "file $file_sysctl found"
                then
                        value_find_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.all.send_redirects" | wc -l`
                        if [ "$value_find_all_send_redirects" == 1 ]
                                then
                                        value_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.all.send_redirects" | awk '{print $3}'`
                                        if [  "$value_all_send_redirects" == 1 ]
                                                then
                                                echo "change parameter net.ipv4.conf.all.send_redirects = 1 to net.ipv4.conf.all.send_redirects = 0"
                                                sed -i 's/net.ipv4.conf.all.send_redirects = 1/net.ipv4.conf.all.send_redirects = 0/g' "$file_sysctl"
                                        else
                                                echo "change parameter net.ipv4.conf.all.send_redirects = 0 to net.ipv4.conf.all.send_redirects = 0"
                                                sed -i 's/net.ipv4.conf.all.send_redirects = 0/net.ipv4.conf.all.send_redirects = 0/g' "$file_sysctl"
                                        fi

                        else
                                echo "add parameter net.ipv4.conf.all.send_redirects = 0 to emptry"
				echo "#Tắt chức năng chuyển hướng gói tin" >> "$file_sysctl"
                                echo "net.ipv4.conf.all.send_redirects = 0" >> "$file_sysctl"
                        fi

        else
                echo "file $file_sysctl not found"
        fi

}

net_ipv4_conf_default_send_redirects(){
        sysctl net.ipv4.conf.default.send_redirects
echo "result expect: net.ipv4.conf.default.send_redirects = 0"
        file_sysctl="/etc/sysctl.conf"
        if [ -f "$file_sysctl" ];
        echo "file $file_sysctl found"
                then
                        value_find_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.default.send_redirects" | wc -l`
                        if [ "$value_find_all_send_redirects" == 1 ]
                                then
                                        value_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.default.send_redirects" | awk '{print $3}'`
                                        if [  "$value_all_send_redirects" == 1 ]
                                                then
                                                echo "change parameter net.ipv4.conf.default.send_redirects = 1 to net.ipv4.conf.default.send_redirects = 0"
                                                sed -i 's/net.ipv4.conf.default.send_redirects = 1/net.ipv4.conf.default.send_redirects = 0/g' "$file_sysctl"
                                        else
                                                echo "change parameter net.ipv4.conf.default.send_redirects = 0 to net.ipv4.conf.default.send_redirects = 0"
                                                sed -i 's/net.ipv4.conf.default.send_redirects = 0/net.ipv4.conf.default.send_redirects = 0/g' "$file_sysctl"
                                        fi

                        else
                                echo "add parameter net.ipv4.conf.default.send_redirects = 0 to emptry"
				echo "#Tắt chức năng chuyển hướng gói tin" >> "$file_sysctl"
                                echo "net.ipv4.conf.default.send_redirects = 0" >> "$file_sysctl"
                        fi

        else
                echo "file $file_sysctl not found"
        fi

}


net_ipv4_conf_default_send_redirects




























