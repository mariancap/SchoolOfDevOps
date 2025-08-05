#!/bin/bash
script_name=`basename $0`


create_user() {
	
	read -p "Create a new user:" username
	
	if id "$username" &>/dev/null;
	then
		echo "User allready exists, try again!"
		exit 1
	fi

	read -s -p "Enter a password for ${username}:" password
	echo
	read -s -p "Confirm password:" password_confirm
	echo

	if [[ "$password" != "$password_confirm" ]];
	then
		echo "Passwords did not match!"
		exit 1
	else
		echo "Passwords match!"
		sudo useradd -p $(openssl passwd -1 "$password") "$username"
                echo "User created!"
	fi


}


user_delete() {
	
	if id "$1" &>/dev/null;
	then
		sudo userdel "$1"
		echo "User "$1" deleted!"
	else
		echo "User not found!"
		exit 1
	fi
}

pass_reset() {

	if id "$1" &>/dev/null;
	then
		echo "Changing password for user "$1":"
		sudo passwd $1
	else 
		echo "User not found!"
		exit 1
	fi
	
}

user_info() {
	awk -F: '{ printf "%-14s %s\n", $1, $3 }' /etc/passwd
}

user_help() {
	
    echo "Options:"
    echo "  -c, --create        Create a new user account."
    echo "  -d, --delete        Delete an existing user account."
    echo "  -r, --reset         Reset password for an existing user account."
    echo "  -l, --list          List all user accounts on the system."
    echo "  -h, --help          Display this help and exit."
}

if [ "$1" == "-c" ];
then
        create_user

elif [ "$1" == "-d" ];
then 
	user_delete "$2"
elif [ "$1" == "-r" ];
then
	pass_reset "$2"
elif [ "$1" == "-l" ];
then
	echo "List users and their UID:"
	sleep 2
	user_info
elif
	[ "$1" == "-h" ];
then
	user_help
else

        echo "Command not found, try ./"$script_name" -h for help"
        exit 1
fi


