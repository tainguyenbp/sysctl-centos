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

net_ipv4_conf_all_accept_source_route(){
        sysctl net.ipv4.conf.all.accept_source_route
echo "result expect: net.ipv4.conf.all.accept_source_route = 0"
        file_sysctl="/etc/sysctl.conf"
        if [ -f "$file_sysctl" ];
        echo "file $file_sysctl found"
                then
                        value_find_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.all.accept_source_route" | wc -l`
                        if [ "$value_find_all_send_redirects" == 1 ]
                                then
                                        value_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.all.accept_source_route" | awk '{print $3}'`
                                        if [  "$value_all_send_redirects" == 1 ]
                                                then
                                                echo "change parameter net.ipv4.conf.all.accept_source_route = 1 to net.ipv4.conf.all.accept_source_route = 0"
                                                sed -i 's/net.ipv4.conf.all.accept_source_route = 1/net.ipv4.conf.all.accept_source_route = 0/g' "$file_sysctl"
                                        else
                                                echo "change parameter net.ipv4.conf.all.accept_source_route = 0 to net.ipv4.conf.all.accept_source_route = 0"
                                                sed -i 's/net.ipv4.conf.all.accept_source_route = 0/net.ipv4.conf.all.accept_source_route = 0/g' "$file_sysctl"
                                        fi

                        else
                                echo "add parameter net.ipv4.conf.all.accept_source_route = 0 to emptry"
								echo "#Không chấp nhận gói tin định tuyến" >> "$file_sysctl"
                                echo "net.ipv4.conf.all.accept_source_route = 0" >> "$file_sysctl"
                        fi

        else
                echo "file $file_sysctl not found"
        fi

}

net_ipv4_conf_default_accept_source_route(){
        sysctl net.ipv4.conf.default.accept_source_route
echo "result expect: net.ipv4.conf.default.accept_source_route = 0"
        file_sysctl="/etc/sysctl.conf"
        if [ -f "$file_sysctl" ];
        echo "file $file_sysctl found"
                then
                        value_find_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.default.accept_source_route" | wc -l`
                        if [ "$value_find_all_send_redirects" == 1 ]
                                then
                                        value_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.default.accept_source_route" | awk '{print $3}'`
                                        if [  "$value_all_send_redirects" == 1 ]
                                                then
                                                echo "change parameter net.ipv4.conf.default.accept_source_route = 1 to net.ipv4.conf.default.accept_source_route = 0"
                                                sed -i 's/net.ipv4.conf.default.accept_source_route = 1/net.ipv4.conf.default.accept_source_route = 0/g' "$file_sysctl"
                                        else
                                                echo "change parameter net.ipv4.conf.default.accept_source_route = 0 to net.ipv4.conf.default.accept_source_route = 0"
                                                sed -i 's/net.ipv4.conf.default.accept_source_route = 0/net.ipv4.conf.default.accept_source_route = 0/g' "$file_sysctl"
                                        fi

                        else
                                echo "add parameter net.ipv4.conf.default.accept_source_route = 0 to emptry"
								echo "#Không chấp nhận gói tin định tuyến" >> "$file_sysctl"
                                echo "net.ipv4.conf.default.accept_source_route = 0" >> "$file_sysctl"
                        fi

        else
                echo "file $file_sysctl not found"
        fi

}

#Không chấp nhận chuyển hướng gói tin ICMP

net_ipv4_conf_all_accept_redirects(){
        sysctl net.ipv4.conf.all.accept_redirects
echo "result expect: net.ipv4.conf.all.accept_redirects = 0"
        file_sysctl="/etc/sysctl.conf"
        if [ -f "$file_sysctl" ];
        echo "file $file_sysctl found"
                then
                        value_find_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.all.accept_redirects" | wc -l`
                        if [ "$value_find_all_send_redirects" == 1 ]
                                then
                                        value_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.all.accept_redirects" | awk '{print $3}'`
                                        if [  "$value_all_send_redirects" == 1 ]
                                                then
                                                echo "change parameter net.ipv4.conf.all.accept_redirects = 1 to net.ipv4.conf.all.accept_redirects = 0"
                                                sed -i 's/net.ipv4.conf.all.accept_redirects = 1/net.ipv4.conf.all.accept_redirects = 0/g' "$file_sysctl"
                                        else
                                                echo "change parameter net.ipv4.conf.all.accept_redirects = 0 to net.ipv4.conf.all.accept_redirects = 0"
                                                sed -i 's/net.ipv4.conf.all.accept_redirects = 0/net.ipv4.conf.all.accept_redirects = 0/g' "$file_sysctl"
                                        fi

                        else
                                echo "add parameter net.ipv4.conf.all.accept_redirects = 0 to emptry"
								echo "#Không chấp nhận chuyển hướng gói tin ICMP" >> "$file_sysctl"
                                echo "net.ipv4.conf.all.accept_redirects = 0" >> "$file_sysctl"
                        fi

        else
                echo "file $file_sysctl not found"
        fi

}

net_ipv4_conf_default_accept_redirects(){
        sysctl net.ipv4.conf.default.accept_redirects
echo "result expect: net.ipv4.conf.default.accept_redirects = 0"
        file_sysctl="/etc/sysctl.conf"
        if [ -f "$file_sysctl" ];
        echo "file $file_sysctl found"
                then
                        value_find_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.default.accept_redirects" | wc -l`
                        if [ "$value_find_all_send_redirects" == 1 ]
                                then
                                        value_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.default.accept_redirects" | awk '{print $3}'`
                                        if [  "$value_all_send_redirects" == 1 ]
                                                then
                                                echo "change parameter net.ipv4.conf.default.accept_redirects = 1 to net.ipv4.conf.default.accept_redirects = 0"
                                                sed -i 's/net.ipv4.conf.default.accept_redirects = 1/net.ipv4.conf.default.accept_redirects = 0/g' "$file_sysctl"
                                        else
                                                echo "change parameter net.ipv4.conf.default.accept_redirects = 0 to net.ipv4.conf.default.accept_redirects = 0"
                                                sed -i 's/net.ipv4.conf.default.accept_redirects = 0/net.ipv4.conf.default.accept_redirects = 0/g' "$file_sysctl"
                                        fi

                        else
                                echo "add parameter net.ipv4.conf.default.accept_redirects = 0 to emptry"
								echo "#Không chấp nhận chuyển hướng gói tin ICMP" >> "$file_sysctl"
                                echo "net.ipv4.conf.default.accept_redirects = 0" >> "$file_sysctl"
                        fi

        else
                echo "file $file_sysctl not found"
        fi

}

#Không chấp nhận chuyển hướng gói tin ICMP bảo mật

net_ipv4_conf_all_secure_redirects(){
        sysctl net.ipv4.conf.all.secure_redirects
echo "result expect: net.ipv4.conf.all.secure_redirects = 0"
        file_sysctl="/etc/sysctl.conf"
        if [ -f "$file_sysctl" ];
        echo "file $file_sysctl found"
                then
                        value_find_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.all.secure_redirects" | wc -l`
                        if [ "$value_find_all_send_redirects" == 1 ]
                                then
                                        value_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.all.secure_redirects" | awk '{print $3}'`
                                        if [  "$value_all_send_redirects" == 1 ]
                                                then
                                                echo "change parameter net.ipv4.conf.all.secure_redirects = 1 to net.ipv4.conf.all.secure_redirects = 0"
                                                sed -i 's/net.ipv4.conf.all.secure_redirects = 1/net.ipv4.conf.all.secure_redirects = 0/g' "$file_sysctl"
                                        else
                                                echo "change parameter net.ipv4.conf.all.secure_redirects = 0 to net.ipv4.conf.all.secure_redirects = 0"
                                                sed -i 's/net.ipv4.conf.all.secure_redirects = 0/net.ipv4.conf.all.secure_redirects = 0/g' "$file_sysctl"
                                        fi

                        else
                                echo "add parameter net.ipv4.conf.all.secure_redirects = 0 to emptry"
								echo "#Không chấp nhận chuyển hướng gói tin ICMP bảo mật" >> "$file_sysctl"
                                echo "net.ipv4.conf.all.secure_redirects = 0" >> "$file_sysctl"
                        fi

        else
                echo "file $file_sysctl not found"
        fi

}

net_ipv4_conf_default_secure_redirects(){
        sysctl net.ipv4.conf.default.secure_redirects
echo "result expect: net.ipv4.conf.default.secure_redirects = 0"
        file_sysctl="/etc/sysctl.conf"
        if [ -f "$file_sysctl" ];
        echo "file $file_sysctl found"
                then
                        value_find_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.default.secure_redirects" | wc -l`
                        if [ "$value_find_all_send_redirects" == 1 ]
                                then
                                        value_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.default.secure_redirects" | awk '{print $3}'`
                                        if [  "$value_all_send_redirects" == 1 ]
                                                then
                                                echo "change parameter net.ipv4.conf.default.secure_redirects = 1 to net.ipv4.conf.default.secure_redirects = 0"
                                                sed -i 's/net.ipv4.conf.default.secure_redirects = 1/net.ipv4.conf.default.secure_redirects = 0/g' "$file_sysctl"
                                        else
                                                echo "change parameter net.ipv4.conf.default.secure_redirects = 0 to net.ipv4.conf.default.secure_redirects = 0"
                                                sed -i 's/net.ipv4.conf.default.secure_redirects = 0/net.ipv4.conf.default.secure_redirects = 0/g' "$file_sysctl"
                                        fi

                        else
                                echo "add parameter net.ipv4.conf.default.secure_redirects = 0 to emptry"
								echo "#Không chấp nhận chuyển hướng gói tin ICMP bảo mật" >> "$file_sysctl"
                                echo "net.ipv4.conf.default.secure_redirects = 0" >> "$file_sysctl"
                        fi

        else
                echo "file $file_sysctl not found"
        fi

}


# Ghi nhận nhật ký gói tin nghi ngờ

net_ipv4_conf_all_log_martians(){
        sysctl net.ipv4.conf.all.log_martians 
echo "result expect: net.ipv4.conf.all.log_martians = 1"
        file_sysctl="/etc/sysctl.conf"
        if [ -f "$file_sysctl" ];
        echo "file $file_sysctl found"
                then
                        value_find_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.all.log_martians" | wc -l`
                        if [ "$value_find_all_send_redirects" == 1 ]
                                then
                                        value_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.all.log_martians" | awk '{print $3}'`
                                        if [  "$value_all_send_redirects" == 1 ]
                                                then
                                                echo "change parameter net.ipv4.conf.all.log_martians = 0 to net.ipv4.conf.all.log_martians = 1"
                                                sed -i 's/net.ipv4.conf.all.log_martians = 1/net.ipv4.conf.all.log_martians = 1/g' "$file_sysctl"
                                        else
                                                echo "change parameter net.ipv4.conf.all.log_martians = 0 to net.ipv4.conf.all.log_martians = 1"
                                                sed -i 's/net.ipv4.conf.all.log_martians = 0/net.ipv4.conf.all.log_martians = 1/g' "$file_sysctl"
                                        fi

                        else
                                echo "add parameter net.ipv4.conf.all.log_martians = 1 to emptry"
								echo "#Ghi nhận nhật ký gói tin nghi ngờ" >> "$file_sysctl"
                                echo "net.ipv4.conf.all.log_martians = 1" >> "$file_sysctl"
                        fi

        else
                echo "file $file_sysctl not found"
        fi

}

net_ipv4_conf_default_log_martians(){
        sysctl net.ipv4.conf.default.log_martians
echo "result expect: net.ipv4.conf.default.log_martians = 1"
        file_sysctl="/etc/sysctl.conf"
        if [ -f "$file_sysctl" ];
        echo "file $file_sysctl found"
                then
                        value_find_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.default.log_martians" | wc -l`
                        if [ "$value_find_all_send_redirects" == 1 ]
                                then
                                        value_all_send_redirects=`cat /etc/sysctl.conf | grep "net.ipv4.conf.default.log_martians" | awk '{print $3}'`
                                        if [  "$value_all_send_redirects" == 1 ]
                                                then
                                                echo "change parameter net.ipv4.conf.default.log_martians = 1 to net.ipv4.conf.default.log_martians = 1"
                                                sed -i 's/net.ipv4.conf.default.log_martians = 1/net.ipv4.conf.default.log_martians = 1/g' "$file_sysctl"
                                        else
                                                echo "change parameter net.ipv4.conf.default.log_martians = 0 to net.ipv4.conf.default.log_martians = 1"
                                                sed -i 's/net.ipv4.conf.default.log_martians = 0/net.ipv4.conf.default.log_martians = 1/g' "$file_sysctl"
                                        fi

                        else
                                echo "add parameter net.ipv4.conf.default.log_martians = 1 to emptry"
								echo "#Ghi nhận nhật ký gói tin nghi ngờ" >> "$file_sysctl"
                                echo "net.ipv4.conf.default.log_martians = 1" >> "$file_sysctl"
                        fi

        else
                echo "file $file_sysctl not found"
        fi

}

# Bỏ qua các truy vấn ICMP broadcast

net_ipv4_icmp_echo_ignore_broadcasts(){
        sysctl net.ipv4.icmp_echo_ignore_broadcasts 
echo "result expect: net.ipv4.icmp_echo_ignore_broadcasts = 1"
        file_sysctl="/etc/sysctl.conf"
        if [ -f "$file_sysctl" ];
        echo "file $file_sysctl found"
                then
                        value_find_wc_l=`cat /etc/sysctl.conf | grep "net.ipv4.icmp_echo_ignore_broadcasts" | wc -l`
                        if [ "$value_find_wc_l" == 1 ]
                                then
                                        value_in_file=`cat /etc/sysctl.conf | grep "net.ipv4.icmp_echo_ignore_broadcasts" | awk '{print $3}'`
                                        if [  "$value_in_file" == 1 ]
                                                then
                                                echo "change parameter net.ipv4.icmp_echo_ignore_broadcasts = 0 to net.ipv4.icmp_echo_ignore_broadcasts = 1"
                                                sed -i 's/net.ipv4.icmp_echo_ignore_broadcasts = 1/net.ipv4.icmp_echo_ignore_broadcasts = 1/g' "$file_sysctl"
                                        else
                                                echo "change parameter net.ipv4.icmp_echo_ignore_broadcasts = 0 to net.ipv4.icmp_echo_ignore_broadcasts = 1"
                                                sed -i 's/net.ipv4.icmp_echo_ignore_broadcasts = 0/net.ipv4.icmp_echo_ignore_broadcasts = 1/g' "$file_sysctl"
                                        fi

                        else
                                echo "add parameter net.ipv4.icmp_echo_ignore_broadcasts = 1 to emptry"
								echo "#Ghi nhận nhật ký gói tin nghi ngờ" >> "$file_sysctl"
                                echo "net.ipv4.icmp_echo_ignore_broadcasts = 1" >> "$file_sysctl"
                        fi

        else
                echo "file $file_sysctl not found"
        fi

}

# Không đáp ứng gói tin ICMP hư hỏng 

net_ipv4_icmp_ignore_bogus_error_responses(){
        sysctl net.ipv4.icmp_ignore_bogus_error_responses 
echo "result expect: net.ipv4.icmp_ignore_bogus_error_responses = 1"
        file_sysctl="/etc/sysctl.conf"
        if [ -f "$file_sysctl" ];
        echo "file $file_sysctl found"
                then
                        value_find_wc_l=`cat /etc/sysctl.conf | grep "net.ipv4.icmp_ignore_bogus_error_responses" | wc -l`
                        if [ "$value_find_wc_l" == 1 ]
                                then
                                        value_in_file=`cat /etc/sysctl.conf | grep "net.ipv4.icmp_ignore_bogus_error_responses " | awk '{print $3}'`
                                        if [  "$value_in_file" == 1 ]
                                                then
                                                echo "change parameter net.ipv4.icmp_ignore_bogus_error_responses  = 0 to net.ipv4.icmp_ignore_bogus_error_responses = 1"
                                                sed -i 's/net.ipv4.icmp_ignore_bogus_error_responses = 1/net.ipv4.icmp_ignore_bogus_error_responses  = 1/g' "$file_sysctl"
                                        else
                                                echo "change parameter net.ipv4.icmp_ignore_bogus_error_responses  = 0 to net.ipv4.icmp_ignore_bogus_error_responses = 1"
                                                sed -i 's/net.ipv4.icmp_ignore_bogus_error_responses = 0/net.ipv4.icmp_ignore_bogus_error_responses  = 1/g' "$file_sysctl"
                                        fi

                        else
                                echo "add parameter net.ipv4.icmp_ignore_bogus_error_responses = 1 to emptry"
								echo "#Ghi nhận nhật ký gói tin nghi ngờ" >> "$file_sysctl"
                                echo "net.ipv4.icmp_ignore_bogus_error_responses = 1" >> "$file_sysctl"
                        fi

        else
                echo "file $file_sysctl not found"
        fi

}

# Bật bộ lọc đường dẫn ngược

net_ipv4_conf_all_rp_filter(){
        sysctl net.ipv4.conf.all.rp_filter
echo "result expect: net.ipv4.conf.all.rp_filter = 1"
        file_sysctl="/etc/sysctl.conf"
        if [ -f "$file_sysctl" ];
        echo "file $file_sysctl found"
                then
                        value_find_wc_l=`cat /etc/sysctl.conf | grep "net.ipv4.conf.all.rp_filter" | wc -l`
                        if [ "$value_find_wc_l" == 1 ]
                                then
                                        value_in_file=`cat /etc/sysctl.conf | grep "net.ipv4.conf.all.rp_filter" | awk '{print $3}'`
                                        if [  "$value_in_file" == 1 ]
                                                then
                                                echo "change parameter net.ipv4.conf.all.rp_filter = 0 to net.ipv4.conf.all.rp_filter = 1"
                                                sed -i 's/net.ipv4.conf.all.rp_filter = 1/net.ipv4.conf.all.rp_filter = 1/g' "$file_sysctl"
                                        else
                                                echo "change parameter net.ipv4.conf.all.rp_filter = 0 to net.ipv4.conf.all.rp_filter = 1"
                                                sed -i 's/net.ipv4.conf.all.rp_filter = 0/net.ipv4.conf.all.rp_filter = 1/g' "$file_sysctl"
                                        fi

                        else
                                echo "add parameter net.ipv4.conf.all.rp_filter = 1 to emptry"
								echo "#Bật bộ lọc đường dẫn ngược" >> "$file_sysctl"
                                echo "net.ipv4.conf.all.rp_filter = 1" >> "$file_sysctl"
                        fi

        else
                echo "file $file_sysctl not found"
        fi

}


net_ipv4_conf_default_rp_filter(){
        sysctl net.ipv4.conf.default.rp_filter
echo "result expect: net.ipv4.conf.default.rp_filter = 1"
        file_sysctl="/etc/sysctl.conf"
        if [ -f "$file_sysctl" ];
        echo "file $file_sysctl found"
                then
                        value_find_wc_l=`cat /etc/sysctl.conf | grep "net.ipv4.conf.default.rp_filter" | wc -l`
                        if [ "$value_find_wc_l" == 1 ]
                                then
                                        value_in_file=`cat /etc/sysctl.conf | grep "net.ipv4.conf.default.rp_filter" | awk '{print $3}'`
                                        if [  "$value_in_file" == 1 ]
                                                then
                                                echo "change parameter net.ipv4.conf.default.rp_filter = 0 to net.ipv4.conf.default.rp_filter = 1"
                                                sed -i 's/net.ipv4.conf.default.rp_filter = 1/net.ipv4.conf.default.rp_filter = 1/g' "$file_sysctl"
                                        else
                                                echo "change parameter net.ipv4.conf.default.rp_filter = 0 to net.ipv4.conf.default.rp_filter = 1"
                                                sed -i 's/net.ipv4.conf.default.rp_filter = 0/net.ipv4.conf.default.rp_filter = 1/g' "$file_sysctl"
                                        fi

                        else
                                echo "add parameter net.ipv4.conf.default.rp_filter = 1 to emptry"
								echo "#Bật bộ lọc đường dẫn ngược" >> "$file_sysctl"
                                echo "net.ipv4.conf.default.rp_filter = 1" >> "$file_sysctl"
                        fi

        else
                echo "file $file_sysctl not found"
        fi

}

# Bật chức năng TCP SYN Cookie

net_ipv4_tcp_syncookies(){
        sysctl net.ipv4.tcp_syncookies
echo "result expect: net.ipv4.tcp_syncookies = 1"
        file_sysctl="/etc/sysctl.conf"
        if [ -f "$file_sysctl" ];
        echo "file $file_sysctl found"
                then
                        value_find_wc_l=`cat /etc/sysctl.conf | grep "net.ipv4.tcp_syncookies" | wc -l`
                        if [ "$value_find_wc_l" == 1 ]
                                then
                                        value_in_file=`cat /etc/sysctl.conf | grep "net.ipv4.tcp_syncookies" | awk '{print $3}'`
                                        if [  "$value_in_file" == 1 ]
                                                then
                                                echo "change parameter net.ipv4.tcp_syncookies = 0 to net.ipv4.tcp_syncookies = 1"
                                                sed -i 's/net.ipv4.tcp_syncookies = 1/net.ipv4.tcp_syncookies = 1/g' "$file_sysctl"
                                        else
                                                echo "change parameter net.ipv4.tcp_syncookies = 0 to net.ipv4.tcp_syncookies = 1"
                                                sed -i 's/net.ipv4.tcp_syncookies = 0/net.ipv4.tcp_syncookies = 1/g' "$file_sysctl"
                                        fi

                        else
                                echo "add parameter net.ipv4.tcp_syncookies = 1 to emptry"
								echo "#Bật bộ lọc đường dẫn ngược" >> "$file_sysctl"
                                echo "net.ipv4.tcp_syncookies = 1" >> "$file_sysctl"
                        fi

        else
                echo "file $file_sysctl not found"
        fi

}

# Cài đặt và cấu hình TCP Wrapper

tcp_wrapper(){
        rpm -q tcp_wrappers tcp_wrappers-libs
echo "result expect: tcp_wrappers-* and tcp_wrappers-libs-*"
        file_sysctl="/etc/sysctl.conf"
        if [ -f "$file_sysctl" ];
        echo "file $file_sysctl found"
                then
                        value_find_wc_l=`rpm -q tcp_wrappers tcp_wrappers-libs | wc -l`
                        if [ "$value_find_wc_l" == 2 ]
                                then
					echo "done, full package"						
                        else
                                echo "setup packet tcp_wrappers lost"	
				yum install tcp_wrappers
                        fi

        else
                echo "file $file_sysctl not found"
        fi
}


tcp_wrapper





















