# This will get the list of all the sites available and then disable them
ls -1 /etc/apache2/sites-enabled > se.txt
while read name
do
    a2dissite $name
done < se.txt
x="$(service apache2 restart)"
echo "$$$"
echo $x
echo "$$$"
# if [[ $x =~ [ * Restarting web server apache2 * fail! ] ]]
# then
#     echo "The request has been proceeded! Thank you!"
# else
#     echo "Try adding sudo to your command! Some commands in this script require sudo!"
# fi
