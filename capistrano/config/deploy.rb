server_name = "default"

ssh_key_path = "/home/ando/.ssh/id_rsa.pub"
upload_path = "/tmp/id_rsa.pub"


task :ssh_setting do 
  upload(ssh_key_path, upload_path, :via => :sftp , :recursive => true )
  run("cat #{upload_path} >> ~/.ssh/authorized_keys")
end


task :install_httpd, :role => [:web] do 
#  run "#{sudo} yum -y update"
  run "#{sudo} yum -y install httpd"
  run "#{sudo} /sbin/chkconfig httpd on"
  run "#{sudo} service httpd stop"
  run "#{sudo} chmod 777 /etc/httpd/conf/httpd.conf"
#  run "#{sudo} echo 'ServerName #{server_name}' >> /etc/httpd/conf/httpd.conf"
  run "#{sudo} service httpd start"
  run "#{sudo} chmod 777 /var/www/html"
  upload "config/html/index.html", "/var/www/html/index.html", :via => :sftp, :recursive => true
end


