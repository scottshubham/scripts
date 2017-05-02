# This will get the list of all the sites available and then disable them
ls -1 /etc/apache2/sites-enabled > se.txt
while read name
do
    a2dissite $name
done < se.txt
service apache2 restart
