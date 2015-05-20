#!/bin/bash

# print total time
# print time used by system overhead
# print time to print to std err
time (
	echo -e "\nThis are the search results for command: \n<find / -name "*bin*" -type d -maxdepth 5 2>/dev/null>"
	find / -name "*bin*" -type d -maxdepth 5 2>/dev/null 1>/dev/null
	echo -e "\nResults of the <time> command:"
)
