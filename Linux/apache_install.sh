#!/bin/bash

#ISNGINX_INSTALLED=`/etc/apache2`
if  ! command -v apache2 &> /dev/null 
then
	sudo apt update -y
	sudo apt install apache2 -y
	sudo systemctl start apache2
else 
	echo "Apache is installed"
fi

START_PORT=8000
END_PORT=9990
for ((port=$START_PORT; port<=$END_PORT; port++ ))
do
	if ! sudo netstat -ntlp | grep ":$port"; 
	then
		FREE_PORT=$port
		echo "Port liber gasit: ${FREE_PORT}"

		break
	
	fi
done


if [ -z "$FREE_PORT" ]; then
    echo "Nu s-a gasit niciun port liber"
    exit 1
fi



# Curăță ports.conf și setează doar portul liber
sudo sed -i "/^Listen /d" /etc/apache2/ports.conf
echo "Listen $FREE_PORT" | sudo tee -a /etc/apache2/ports.conf

# Modifică VirtualHost în configul default
sudo sed -i "s/<VirtualHost \*\:[0-9]*>/<VirtualHost *:$FREE_PORT>/" /etc/apache2/sites-available/000-default.conf

sudo systemctl restart apache2

TOP_PORT=8050
# Pornește web serverul cu netcat pe portul găsit
echo "Webserver pornit pe portul $TOP_PORT..."
while true; do
    ./top_loop.sh | nc -l -p $TOP_PORT -q 1
done
