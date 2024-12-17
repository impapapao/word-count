#!/bin/bash

log_file="/var/log/word-count.log"
current_date=$(date +'%Y-%m-%d_%H-%M-%S')

# Log function
log() {

	echo "$(date)" $1 | tee -a "$log_file"
}

# Continue to loop until user will not put any character
while true; do
	# User input of characters
	read -p "Enter a line of text: " text

	# To determine if theres a user input or not if not it will exit
	if [ -z "${text}" ]; then
		echo "User did not put any text" | tee -a >(sed "s/^/[$date] / " >> "$log_file")
		break
	fi
	
	# Count and Display the character
	char_count=$(echo -n "$text" | wc -m)
	echo "Character Count: $char_count"
done


