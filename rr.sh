# This will get the list of all the sites available and then disable them
ls -1 /etc/apache2/sites-enabled > se.txt
echo "Do you want to disable all the sites(y/n)?"
read x
if [ "$x" "=" "y" ]
then
    while read name
    do
        a2dissite $name
    done < se.txt
    service apache2 restart
    echo "The request has been proceeded! Thank you!"
else
    echo "The request has been canceled! Thank you!"
fi
