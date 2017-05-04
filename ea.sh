# This will get the list of all the sites available and then disable them
ls -1 /etc/apache2/sites-available > ea.txt
while read name
do
    a2ensite $name
done < ea.txt
service apache2 restart
