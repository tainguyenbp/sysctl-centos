1.Phân quyền bootloader phù hợp 

Tiêu chí:
Phân quyền bootloader phù hợp 

Lệnh kiểm tra:
ls -ll /boot/grub2/grub.cfg

Kết quả thực tế:
BLANK 

Kết quả mong đợi:
-rw------- 1 root root 5200 Jan 16 14:47 /boot/grub2/grub.cfg

Điều chỉnh:
"chown root:root /boot/grub2/grub.cfg 
chmod og-rwx /boot/grub2/grub.cfg"

==========================================================================================================================================

2. Khóa chuyển tiếp IP

Tiêu chí:
Khóa chuyển tiếp IP

Lệnh kiểm tra:
sysctl net.ipv4.ip_forward

Kết quả thực tế:
net.ipv4.ip_forward = 0 

Kết quả mong đợi:
net.ipv4.ip_forward = 0

Điều chỉnh:
uncomment  net.ipv4.ip_forward = 0 trong /etc/sysctl.conf

==========================================================================================================================================
3. Tắt chức năng chuyển hướng gói tin

Tiêu chí:
Tắt chức năng chuyển hướng gói tin

Lệnh kiểm tra:
"sysctl net.ipv4.conf.all.send_redirects  
sysctl net.ipv4.conf.default.send_redirects"

Kết quả thực tế:
"net.ipv4.conf.all.send_redirects = 1 
net.ipv4.conf.default.send_redirects = 1 "

Kết quả mong đợi:
"net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0"

Điều chỉnh:
"uncomment  net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0 trong /etc/sysctl.conf"

==========================================================================================================================================
4. Không chấp nhận gói tin định tuyến

Tiêu chí:
Không chấp nhận gói tin định tuyến

Lệnh kiểm tra:
sysctl net.ipv4.conf.all.accept_source_route net.ipv4.conf.default.accept_source_route

Kết quả thực tế:
"net.ipv4.conf.all.accept_source_route = 0 
net.ipv4.conf.default.accept_source_route = 0 "

Kết quả mong đợi:
"net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0"

Điều chỉnh:
"uncomment  net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0 trong /etc/sysctl.conf"

==========================================================================================================================================
2. 

Tiêu chí:

Lệnh kiểm tra:

Kết quả thực tế:

Kết quả mong đợi:

Điều chỉnh:


==========================================================================================================================================
2. 

Tiêu chí:

Lệnh kiểm tra:

Kết quả thực tế:

Kết quả mong đợi:

Điều chỉnh:



==========================================================================================================================================
2. 

Tiêu chí:

Lệnh kiểm tra:

Kết quả thực tế:

Kết quả mong đợi:

Điều chỉnh:




==========================================================================================================================================
2. 

Tiêu chí:

Lệnh kiểm tra:

Kết quả thực tế:

Kết quả mong đợi:

Điều chỉnh:




==========================================================================================================================================
2. 

Tiêu chí:

Lệnh kiểm tra:

Kết quả thực tế:

Kết quả mong đợi:

Điều chỉnh:





==========================================================================================================================================
2. 

Tiêu chí:

Lệnh kiểm tra:

Kết quả thực tế:

Kết quả mong đợi:

Điều chỉnh:



==========================================================================================================================================
2. 

Tiêu chí:

Lệnh kiểm tra:

Kết quả thực tế:

Kết quả mong đợi:

Điều chỉnh:




==========================================================================================================================================
2. 

Tiêu chí:

Lệnh kiểm tra:

Kết quả thực tế:

Kết quả mong đợi:

Điều chỉnh:






==========================================================================================================================================
2. 

Tiêu chí:

Lệnh kiểm tra:

Kết quả thực tế:

Kết quả mong đợi:

Điều chỉnh:




==========================================================================================================================================
2. 

Tiêu chí:

Lệnh kiểm tra:

Kết quả thực tế:

Kết quả mong đợi:

Điều chỉnh:






==========================================================================================================================================
2. 

Tiêu chí:

Lệnh kiểm tra:

Kết quả thực tế:

Kết quả mong đợi:

Điều chỉnh:




==========================================================================================================================================
2. 

Tiêu chí:

Lệnh kiểm tra:

Kết quả thực tế:

Kết quả mong đợi:

Điều chỉnh:





==========================================================================================================================================
2. 

Tiêu chí:

Lệnh kiểm tra:

Kết quả thực tế:

Kết quả mong đợi:

Điều chỉnh:




==========================================================================================================================================
2. 

Tiêu chí:

Lệnh kiểm tra:

Kết quả thực tế:

Kết quả mong đợi:

Điều chỉnh:




==========================================================================================================================================
2. 

Tiêu chí:

Lệnh kiểm tra:

Kết quả thực tế:

Kết quả mong đợi:

Điều chỉnh:







==========================================================================================================================================
2. 

Tiêu chí:

Lệnh kiểm tra:

Kết quả thực tế:

Kết quả mong đợi:

Điều chỉnh:







==========================================================================================================================================
2. 

Tiêu chí:

Lệnh kiểm tra:

Kết quả thực tế:

Kết quả mong đợi:

Điều chỉnh:






==========================================================================================================================================