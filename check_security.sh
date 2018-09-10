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

# Giám sát kích thước audit log
max_log_file(){
        grep "max_log_file =" /etc/audit/auditd.conf
echo "result expect: max_log_file = 6  max_log_file_action = ROTATE"
        file_auditd="/etc/audit/auditd.conf"
        if [ -f "$file_auditd" ];
        echo "file $file_auditd found"
                then
                        value_find_wc_l=`grep "max_log_file =" /etc/audit/auditd.conf | wc -l`
						
                        if [ "$value_find_wc_l" == 1 ]
                                then
					value_find_file=`grep "max_log_file =" /etc/audit/auditd.conf | awk '{print $3}'`
					echo "change parameter max_log_file = $value_find_file to max_log_file = 128"
              				sed -i 's/max_log_file = '$value_find_file'/max_log_file = 128/g' "$file_auditd"
                        else
                                echo "add line max_log_file = 128 to file $file_auditd"
				echo "max_log_file = 128" >> "$file_auditd"			
                        fi

        else
                echo "file $file_sysctl not found"
        fi
}

max_log_file_action(){
        grep "max_log_file_action =" /etc/audit/auditd.conf
echo "result expect: max_log_file_action = keep_logs"
        file_auditd="/etc/audit/auditd.conf"
        if [ -f "$file_auditd" ];
        echo "file $file_auditd found"
                then
                        value_find_wc_l=`grep "max_log_file_action =" /etc/audit/auditd.conf | wc -l`
						
                        if [ "$value_find_wc_l" == 1 ]
                                then
					value_find_file=`grep "max_log_file_action =" /etc/audit/auditd.conf | awk '{print $3}'`
					echo "change parameter max_log_file_action = $value_find_file to max_log_file_action = ROTATE"
					sed -i 's/max_log_file_action = '$value_find_file'/max_log_file_action = keep_logs/g' "$file_auditd"
                        else
                                echo "add line max_log_file_action = keep_logs to file $file_auditd"	
				echo "max_log_file_action = keep_logs" >> "$file_auditd"				
                        fi

        else
                echo "file $file_sysctl not found"
        fi
}


space_left_action(){
        grep "space_left_action =" /etc/audit/auditd.conf
echo "result expect: space_left_action = email"
        file_auditd="/etc/audit/auditd.conf"
        if [ -f "$file_auditd" ];
        echo "file $file_auditd found"
                then
                        value_find_wc_l=`grep "space_left_action =" /etc/audit/auditd.conf | grep -v admin_space_left_action | wc -l`
						
                        if [ "$value_find_wc_l" == 1 ]
                                then
				value_find_file=`grep "space_left_action =" /etc/audit/auditd.conf |grep -v admin_space_left_action | awk '{print $3}'`
					if [ "$value_find_file" == "email" ]
					then
						echo "Not change parameter space_left_action = $value_find_file in file"
					else
						echo "change parameter space_left_action = $value_find_file to space_left_action = email"
                                                sed -i 's/space_left_action = '$value_find_file'/space_left_action = email/g' "$file_auditd"
					fi
                        else
                                echo "add line space_left_action = email to file $file_auditd"	
				echo "space_left_action = email" >> "$file_auditd"				
                        fi

        else
                echo "file $file_sysctl not found"
        fi
}

admin_space_left_action(){
        grep "admin_space_left_action =" /etc/audit/auditd.conf
echo "result expect: admin_space_left_action = halt"
        file_auditd="/etc/audit/auditd.conf"
        if [ -f "$file_auditd" ];
        echo "file $file_auditd found"
                then
                        value_find_wc_l=`grep "admin_space_left_action =" /etc/audit/auditd.conf | wc -l`
						
                        if [ "$value_find_wc_l" == 1 ]
                                then
				value_find_file=`grep "admin_space_left_action =" /etc/audit/auditd.conf | awk '{print $3}'`
					if [ "$value_find_file" == "halt" ]
					then 
						echo "Not change parameter admin_space_left_action = $value_find_file in file"
					else
						echo "change parameter admin_space_left_action = $value_find_file to admin_space_left_action = halt"
						sed -i 's/admin_space_left_action = '$value_find_file'/admin_space_left_action = halt/g' "$file_auditd"
					fi
                        else
                                echo "add line admin_space_left_action = halt to file $file_auditd"	
				echo "admin_space_left_action = halt" >> "$file_auditd"
                        fi

        else
                echo "file $file_sysctl not found"
	fi
	
}

action_mail_acct(){
        grep "action_mail_acct =" /etc/audit/auditd.conf
echo "result expect: action_mail_acct = root"
        file_auditd="/etc/audit/auditd.conf"
        if [ -f "$file_auditd" ];
        echo "file $file_auditd found"
                then
                        value_find_wc_l=`grep "action_mail_acct =" /etc/audit/auditd.conf | wc -l`

                        if [ "$value_find_wc_l" == 1 ]
                                then
				value_find_file=`grep "action_mail_acct =" /etc/audit/auditd.conf | awk '{print $3}'`
					if [ "$value_find_file" == "root" ]
					then
						echo "Not change parameter action_mail_acct = $value_find_file in file"
				else
					echo "change parameter action_mail_acct = $value_find_file to action_mail_acct = root"
					sed -i 's/action_mail_acct = '$value_find_file'/action_mail_acct = root/g' "$file_auditd"
				fi
                        else
                                echo "add line action_mail_acct = root to file $file_auditd"
                                echo "action_mail_acct = root" >> "$file_auditd"
                        fi

        else
                echo "file $file_sysctl not found"
        fi
}

enabled_service_auditd(){
		
	var=`cat /etc/centos-release | awk '{print $2}'`	
	if [ "$var" == "Linux" ]
		then 
			echo "enable service auditd on centos 7"
			systemctl enable auditd			
				
	elif [ "$var" == "release" ] 
		then
		echo "enable service auditd on centos 6"
		chkconfig auditd on
	else
		echo "command not execute"	
	fi

}

time_change_auditd(){

		echo "result expect: "
		echo "-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change" 
		echo "-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change"
		echo "-a always,exit -F arch=b64 -S clock_settime -k time-change"
		echo "-a always,exit -F arch=b32 -S clock_settime -k time-change -w /etc/localtime -p wa -k time-change"
		
		file_path=/etc/audit/audit.rules		

	value_b64_adjtimex=`cat /etc/audit/audit.rules | grep "always" | grep "arch=b64" | grep "adjtimex" | grep "settimeofday" | grep "time-change" | wc -l`
	value_b32_adjtimex=`cat /etc/audit/audit.rules | grep "always" | grep "arch=b32" | grep "adjtimex" | grep "settimeofday" | grep "time-change" | wc -l`
	value_b64_clock_settime=`cat /etc/audit/audit.rules | grep "always" | grep "arch=b64" | grep "clock_settime" | grep "time-change" | wc -l`
	value_b32_clock_settime=`cat /etc/audit/audit.rules | grep "always" | grep "arch=b32" | grep "clock_settime" | grep "time-change" | grep "/etc/localtime" | wc -l`
# '-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change 
	if [ "$value_b64_adjtimex" == 0 ]
		then
		echo "Add -a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change to $file_path"
		echo "-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change" >> "$file_path"
			
	else
		echo "Not -a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change to $file_path "
			
	fi
# '-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change 	
	if [ "$value_b32_adjtimex" == 0 ]
		then
		echo "Add -a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change to $file_path"
                echo "-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change" >> "$file_path"

	else
		echo "Not -a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change to $file_path "	
	fi
# '-a always,exit -F arch=b64 -S clock_settime -k time-change 
	if [ "$value_b64_clock_settime" == 0 ]
                then
                echo "Add -a always,exit -F arch=b64 -S clock_settime -k time-change to $file_path"
                echo "-a always,exit -F arch=b64 -S clock_settime -k time-change" >> "$file_path"

        else
                echo "Not -a always,exit -F arch=b64 -S clock_settime -k time-change to $file_path "
        fi
# '-a always,exit -F arch=b32 -S clock_settime -k time-change -w /etc/localtime -p wa -k time-change
	if [ "$value_b32_clock_settime" == 0 ]
                then
                echo "Add -a always,exit -F arch=b32 -S clock_settime -k time-change -w /etc/localtime -p wa -k time-change to $file_path"
                echo "-a always,exit -F arch=b32 -S clock_settime -k time-change -w /etc/localtime -p wa -k time-change" >> "$file_path"

        else
                echo "Not -a always,exit -F arch=b32 -S clock_settime -k time-change -w /etc/localtime -p wa -k time-change to $file_path"
        fi
	
}


audit_identity(){

                echo "result expect: "
                echo "'-w /etc/group -p wa -k identity "
                echo "'-w /etc/passwd -p wa -k identity "
                echo "'-w /etc/gshadow -p wa -k identity "
                echo "'-w /etc/shadow -p wa -k identity "
		echo "'-w /etc/security/opasswd -p wa -k identity"

                file_path=/etc/audit/audit.rules
		
		value_group_identity=`cat /etc/audit/audit.rules | grep "/etc/group" | grep "identity" | wc -l`
		value_passwd_identity=`cat /etc/audit/audit.rules | grep "/etc/passwd" | grep "identity" | wc -l`
		value_gshadow_identity=`cat /etc/audit/audit.rules | grep "/etc/gshadow" | grep "identity" | wc -l`
		value_shadow_identity=`cat /etc/audit/audit.rules | grep "/etc/shadow" | grep "identity" | wc -l`
		value_opasswd_identity=`cat /etc/audit/audit.rules | grep "/etc/security/opasswd" | grep "identity" | wc -l`
# -w /etc/group -p wa -k identity 
		if [ "$value_group_identity" == 0 ]
                	then
				echo "Add -w /etc/group -p wa -k identity to $file_path" 
				echo "-w /etc/group -p wa -k identity" >> "$file_path"
		else
			echo "Not -w /etc/group -p wa -k identity to  $file_path"
		fi
# -w /etc/passwd -p wa -k identity  		
		if [ "$value_passwd_identity" == 0 ]
                        then
                                echo "Add -w /etc/passwd -p wa -k identity to $file_path"
                                echo "-w /etc/passwd -p wa -k identity" >> "$file_path"
                else
                        echo "Not -w /etc/passwd -p wa -k identity $file_path"
                fi
# -w /etc/gshadow -p wa -k identity 
		if [ "$value_gshadow_identity" == 0 ]
                        then
                                echo "Add -w /etc/gshadow -p wa -k identity to $file_path"
                                echo "-w /etc/gshadow -p wa -k identity" >> "$file_path"
                else
                        echo "Not -w /etc/gshadow -p wa -k identity to $file_path"
                fi
# -w /etc/shadow -p wa -k identity 		
		if [ "$value_shadow_identity" == 0 ]
                        then
                                echo "Add -w /etc/shadow -p wa -k identity to $file_path"
                                echo "-w /etc/shadow -p wa -k identity" >> "$file_path"
                else
                        echo "Not -w /etc/shadow -p wa -k identity to $file_path"
                fi
# -w /etc/security/opasswd -p wa -k identity		
		if [ "$value_opasswd_identity" == 0 ]
                        then
                                echo "Add -w /etc/security/opasswd -p wa -k identity to $file_path"
                                echo "-w /etc/security/opasswd -p wa -k identity" >> "$file_path"
                else
                        echo "Not -w /etc/security/opasswd -p wa -k identity to $file_path"
                fi
}


audit_login(){

                echo "result expect: "
                echo "-w /var/log/lastlog -p wa -k logins"
		echo "-w /var/run/faillock/ -p wa -k logins"
	
	file_path=/etc/audit/audit.rules
	
	value_lastlog_logins=`cat /etc/audit/audit.rules | grep "lastlog" | grep "logins"`
	value_faillock_logins=`cat /etc/audit/audit.rules | grep "faillock" | grep "logins"`
# -w /var/log/lastlog -p wa -k logins
	if [ "$value_lastlog_logins" == 0 ]
                        then
                                echo "Add -w /var/log/lastlog -p wa -k logins to $file_path"
                                echo "-w /var/log/lastlog -p wa -k logins" >> "$file_path"
        else
                      echo "Not -w /var/log/lastlog -p wa -k logins to $file_path"
        fi

# -w /var/run/faillock/ -p wa -k logins	
        if [ "$value_faillock_logins" == 0 ]
                        then
                                echo "Add -w /var/run/faillock/ -p wa -k logins to $file_path"
                                echo "-w /var/run/faillock/ -p wa -k logins" >> "$file_path"
        else
                       echo "Not -w /var/run/faillock/ -p wa -k logins to $file_path"
        fi

}

auditctl_delete(){

                echo "result expect: "
                echo "-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete"
                echo "-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete"

                file_path=/etc/audit/audit.rules
				
				value_auditctl_b64_delete=`cat /etc/audit/audit.rules | grep "arch=b64" | grep "unlinkat" | grep "renameat" | grep "4294967295" | grep "delete" | wc -l`
				value_auditctl_b32_delete=`cat /etc/audit/audit.rules | grep "arch=b32" | grep "unlinkat" | grep "renameat" | grep "4294967295" | grep "delete" | wc -l`
				
# -a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete

        if [ "$value_auditctl_b64_delete" == 0 ]
                        then
                                echo "Add -a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete to $file_path"
                                echo "-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete" >> "$file_path"
        else
                      echo "Not -a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete to $file_path"
        fi

# -a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete
        if [ "$value_auditctl_b32_delete" == 0 ]
                        then
                                echo "Add -a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete to $file_path"
                                echo "-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete" >> "$file_path"
        else
                       echo "Not -a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete to $file_path"
        fi
				
}

auditctl_scope(){

                echo "result expect: "
                echo "-w /etc/sudoers -p wa -k scope"
                echo "-w /etc/sudoers.d/ -p wa -k scope"

                file_path=/etc/audit/audit.rules
				
				value_auditctl_scope=`cat /etc/audit/audit.rules | grep "/etc/sudoers" | grep "scope" | wc -l`
				value_auditctl_scope=`cat /etc/audit/audit.rules | grep "/etc/sudoers.d/" | grep "scope" | wc -l`
				
# -w /etc/sudoers -p wa -k scope

        if [ "$value_auditctl_scope" == 0 ]
                        then
                                echo "Add -w /etc/sudoers -p wa -k scope to $file_path"
                                echo "-w /etc/sudoers -p wa -k scope" >> "$file_path"
        else
                      echo "Not -w /etc/sudoers -p wa -k scope to $file_path"
        fi

# -w /etc/sudoers.d/ -p wa -k scope
        if [ "$value_auditctl_scope" == 0 ]
                        then
                                echo "Add -w /etc/sudoers.d/ -p wa -k scope to $file_path"
                                echo "-w /etc/sudoers.d/ -p wa -k scope" >> "$file_path"
        else
                       echo "Not -w /etc/sudoers.d/ -p wa -k scope to $file_path"
        fi
				
}

auditctl_actions(){

                echo "result expect: "
                echo "-w /var/log/sudo.log -p wa -k actions"

                file_path=/etc/audit/audit.rules
				
		value_auditctl_actions=`cat /etc/audit/audit.rules | grep "/var/log/sudo.log" | grep "actions" | wc -l`
				
# -w /var/log/sudo.log -p wa -k actions

        if [ "$value_auditctl_actions" == 0 ]
                        then
                                echo "Add -w /var/log/sudo.log -p wa -k actions to $file_path"
                                echo "-w /var/log/sudo.log -p wa -k actions" >> "$file_path"
        else
                      echo "Not -w /var/log/sudo.log -p wa -k actions to $file_path"
        fi
				
}


setup_ntp_chrony(){

        year=$(date -d "$i days ago" +"%Y")
        month=$(date -d "$i days ago" +"%-m")
        day=$(date -d "$i days ago" +"%-d")
        ymd=$year$month$day
		
		cd /etc/
		mv yum.conf yum.conf."$ymd"
		
		echo "[main]" >> /etc/yum.conf
		echo "cachedir=/var/cache/yum/$basearch/$releasever" >> /etc/yum.conf
		echo "keepcache=0" >> /etc/yum.conf
		echo "debuglevel=2" >> /etc/yum.conf
		echo "logfile=/var/log/yum.log" >> /etc/yum.conf
		echo "exactarch=1" >> /etc/yum.conf
		echo "obsoletes=1" >> /etc/yum.conf
		echo "gpgcheck=1" >> /etc/yum.conf
		echo "plugins=1" >> /etc/yum.conf
		echo "installonly_limit=3" >> /etc/yum.conf
		echo "#exclude=lighttpd* nginx* spawn-fcgi* webalizer*" >> /etc/yum.conf
		echo "proxy=http://10.80.70.196:3128" >> /etc/yum.conf
		echo "proxy_username=httpuser" >> /etc/yum.conf
		echo "proxy_password=123456" >> /etc/yum.conf
		
		yum clean all && yum install ntp chrony

	var=`cat /etc/centos-release | awk '{print $2}'`	
	if [ "$var" == "Linux" ]
		then 
			echo "enable service ntpd and chronyd on centos 7"
			systemctl enable chronyd && systemctl enable ntpd			
				
	elif [ "$var" == "release" ] 
		then
		echo "enable service ntpd and chronyd on centos 6"
		chkconfig ntpd on && chkconfig chronyd on	
	else
		echo "command not execute"	
	fi
			
}

enable_service_rsyslog(){

	var=`cat /etc/centos-release | awk '{print $2}'`
        if [ "$var" == "Linux" ]
                then
                        echo "enable service rsyslog on centos 7"
				systemctl enable rsyslog	
        elif [ "$var" == "release" ]
                then
                echo "enable service rsyslog on centos 6"
			chkconfig rsyslog on	
        else
                echo "command not execute"
        fi
	
}

enable_service_crond(){

        var=`cat /etc/centos-release | awk '{print $2}'`
        if [ "$var" == "Linux" ]
                then
                        echo "enable service crond on centos 7"
                                systemctl enable crond
        elif [ "$var" == "release" ]
                then
                echo "enable service rsyslog on centos 6"
                        chkconfig crond on
        else
                echo "command not execute"
        fi

}

chown_chmod_crond(){

		chown root:root /etc/cron.daily  /etc/cron.hourly /etc/cron.monthly /etc/cron.weekly
		chmod og-rwx /etc/cron.daily /etc/cron.hourly /etc/cron.monthly /etc/cron.weekly
			
}

tunning_ssh(){

	chown root:root /etc/ssh/sshd_config 
	chmod og-rwx /etc/ssh/sshd_config
	
	file_ssh="/etc/ssh/sshd_config"
	
	value_protocal=`egrep "^Protocol" /etc/ssh/sshd_config | wc -l`
	if [ "$value_protocal" == 0 ]
		then 
		echo "add line Protocol 2 to $file_ssh"
		echo "Protocol 2" >> "$file_ssh"
	else
		value_find_protocol=`egrep "^Protocol" /etc/ssh/sshd_config | awk '{print $2}'`
		if [ "$value_find_protocol" == 2 ]
			then 
				echo "not change value protocol 2"
		else
			echo "change parameter Protocol '$value_find_protocol to Protocol 2"
			sed -i 's/Protocol '$value_find_protocol'/Protocol 2/g' "$file_ssh"
		fi
	fi
}


MaxAuthTries_ssh(){

        file_ssh="/etc/ssh/sshd_config"

        value_MaxAuthTries=`egrep "#MaxAuthTries" /etc/ssh/sshd_config | wc -l`
        if [ "$value_MaxAuthTries" == 0 ]
                then
                echo "add line MaxAuthTries 4 to $file_ssh"
                echo "MaxAuthTries 4" >> "$file_ssh"
        else
                value_find_MaxAuthTries=`egrep "#MaxAuthTries" /etc/ssh/sshd_config | awk '{print $2}'`
                if [ "$value_find_MaxAuthTries" == 4 ]
                        then
                                echo "not change value MaxAuthTries 4"
				sed -i 's/#MaxAuthTries '$value_find_MaxAuthTries'/MaxAuthTries 4/g' "$file_ssh"
                else
                        echo "change parameter MaxAuthTries '$value_find_MaxAuthTries to MaxAuthTries 4"
                        sed -i 's/#MaxAuthTries '$value_find_MaxAuthTries'/MaxAuthTries 4/g' "$file_ssh"
                fi
        fi
}


MACs_ssh(){

        file_ssh="/etc/ssh/sshd_config"

        value_MACs=`egrep "MACs" /etc/ssh/sshd_config | wc -l`
        if [ "$value_MACs" == 0 ]
                then
                echo "Add line MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com,curve25519-sha256@libssh.org,diffie-hellman-group-exchange-sha256 to $file_ssh"
                echo "MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com,curve25519-sha256@libssh.org,diffie-hellman-group-exchange-sha256" >> "$file_ssh"
        else      
                echo "not change parameter MACs"
        fi
}


ClientAliveInterval_ssh(){

        file_ssh="/etc/ssh/sshd_config"

        value_ClientAliveInterval=`egrep "#ClientAliveInterval" /etc/ssh/sshd_config | wc -l`
        if [ "$value_ClientAliveInterval" == 0 ]
                then
                echo "add line ClientAliveInterval 0 to $file_ssh"
                echo "ClientAliveInterval 0" >> "$file_ssh"
        else
                value_find_ClientAliveInterval=`egrep "#ClientAliveInterval" /etc/ssh/sshd_config | awk '{print $2}'`
                if [ "$value_find_ClientAliveInterval" == 0 ]
                        then
                                echo "not change value ClientAliveInterval 0"
								sed -i 's/#ClientAliveInterval '$value_find_ClientAliveInterval'/ClientAliveInterval 0/g' "$file_ssh"
                else
                        echo "change parameter ClientAliveInterval '$value_find_ClientAliveInterval to ClientAliveInterval 4"
                        sed -i 's/#ClientAliveInterval '$value_find_ClientAliveInterval'/ClientAliveInterval 0/g' "$file_ssh"
                fi
        fi
}


ClientAliveCountMax_ssh(){

        file_ssh="/etc/ssh/sshd_config"

        value_ClientAliveCountMax=`egrep "#ClientAliveCountMax" /etc/ssh/sshd_config | wc -l`
        if [ "$value_ClientAliveCountMax" == 0 ]
                then
                echo "add line ClientAliveCountMax 300 to $file_ssh"
                echo "ClientAliveCountMax 300" >> "$file_ssh"
        else
                value_find_ClientAliveCountMax=`egrep "#ClientAliveCountMax" /etc/ssh/sshd_config | awk '{print $2}'`
                if [ "$value_find_ClientAliveCountMax" == 0 ]
                        then
                                echo "not change value ClientAliveCountMax 300"
								sed -i 's/#ClientAliveCountMax '$value_find_ClientAliveCountMax'/ClientAliveCountMax 300/g' "$file_ssh"
                else
                        echo "change parameter ClientAliveCountMax '$value_find_ClientAliveCountMax to ClientAliveCountMax 300"
                        sed -i 's/#ClientAliveCountMax '$value_find_ClientAliveCountMax'/ClientAliveCountMax 300/g' "$file_ssh"
                fi
        fi
}


LoginGraceTime_ssh(){

        file_ssh="/etc/ssh/sshd_config"

        value_LoginGraceTime=`egrep "#LoginGraceTime" /etc/ssh/sshd_config | wc -l`
        if [ "$value_LoginGraceTime" == 0 ]
                then
                echo "add line LoginGraceTime 60 to $file_ssh"
                echo "LoginGraceTime 60" >> "$file_ssh"
        else
                value_find_LoginGraceTime=`egrep "#LoginGraceTime" /etc/ssh/sshd_config | awk '{print $2}'`
                if [ "$value_find_LoginGraceTime" == 0 ]
                        then
                                echo "not change value LoginGraceTime 60"
								sed -i 's/#LoginGraceTime '$value_find_LoginGraceTime'/LoginGraceTime 60/g' "$file_ssh"
                else
                        echo "change parameter LoginGraceTime '$value_find_LoginGraceTime to LoginGraceTime 60"
                        sed -i 's/#LoginGraceTime '$value_find_LoginGraceTime'/LoginGraceTime 60/g' "$file_ssh"
                fi
        fi
}


bootloader
net_ipv4_ip_forward
net_ipv4_conf_all_send_redirects

net_ipv4_conf_default_send_redirects
net_ipv4_conf_all_accept_source_route
net_ipv4_conf_default_accept_source_route
net_ipv4_conf_all_accept_redirects
net_ipv4_conf_default_accept_redirects
net_ipv4_conf_all_secure_redirects
net_ipv4_conf_default_secure_redirects
net_ipv4_conf_all_log_martians
net_ipv4_conf_default_log_martians
net_ipv4_icmp_echo_ignore_broadcasts


net_ipv4_icmp_ignore_bogus_error_responses

net_ipv4_conf_all_rp_filter
net_ipv4_conf_default_rp_filter

net_ipv4_tcp_syncookies

tcp_wrapper
max_log_file
max_log_file_action
space_left_action
admin_space_left_action
action_mail_acct
enabled_service_auditd
time_change_auditd
audit_identity
audit_login
auditctl_delete
auditctl_scope
auditctl_actions
setup_ntp_chrony
enable_service_rsyslog
enable_service_crond
chown_chmod_crond
tunning_ssh
MaxAuthTries_ssh
MACs_ssh
ClientAliveInterval_ssh
ClientAliveCountMax_ssh
LoginGraceTime_ssh

