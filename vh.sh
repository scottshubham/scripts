a=$1
mkdir $a
cd $a
cat > index.html <<-EOF
Your virtual host is working now! Hurray!
EOF
cd ..
chmod -R 777 $a
cat > /etc/apache2/sites-available/$a.conf <<- EOF
<VirtualHost *:80>                                                                                                      
ServerName $a.dev                                                                                                  
ServerAlias www.$a.dev                                                                                             
ServerAdmin webmaster@localhost                                                                                     
DocumentRoot ${PWD}/$a/                                                                         
<Directory ${PWD}/$a/>                                                                          
    Order allow,deny                                                                                                
    AllowOverride all                                                                                               
    Allow from all                                                                                                  
    Require all granted                                                                                             
</Directory>                                                                                                        
ErrorLog ${APACHE_LOG_DIR}/$a.error.log                                                                            
CustomLog ${APACHE_LOG_DIR}/$a.access.log combined                                                                 
</VirtualHost>   
EOF
cat >> /etc/hosts <<- EOF
# This is for $a VirtualHost
127.0.0.1   $a.dev
127.0.0.1   www.$a.dev
EOF
ls /etc/apache2/sites-enabled > sa.txt
while read name
do
    a2dissite $name
done < sa.txt
a2ensite $a.conf
service apache2 reload
