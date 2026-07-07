#ayo, today's covered topics are ip codes, one sends ping packages & gives Up or Down status, 
#second does the same but also sends mail to admin if node is down, and also leanred about mail command, and w3 bash course :) 
#!/bin/bash
# echo "Script is starting"
# # Function to check whether a given IP address is alive
# is_alive_ping()
# {
#     # Send only one ping packet to the IP address ($1)
#     # Redirect the output to /dev/null so nothing is displayed
#     ping -c 1 $1 > /dev/null

#     # $? stores the exit status of the previous command
#     # 0 means success (host is reachable)
#     # If ping succeeds, print the IP address
#     [ $? -eq 0 ] && echo "Node with IP: $1 is UP"
# }

# # Loop through all IP addresses 127.0.0.1 to 255,  
# # check with google.com 
# for i in 127.0.0.{1..255}
# do
#     # Call the function for each IP
#     # '&' runs the function in the background,
#     # allowing multiple pings to execute simultaneously
#     is_alive_ping $i &
#    # echo "Checking IP: $i"
#     # Remove the background job from the shell's job table
#     disown
# done
# exit


#mail code 
#!/bin/bash
for i in $1 
do  
    ping -c 1 $i > /dev/null
    if [ $? -eq 0 ]
    then
        echo "Node with IP: $i is UP"
    else 
        echo "Node with IP: $i is DOWN"
        echo "sending mail to admin" | mail -s "Node wit IP: $i is DOWN" dhvaniksurti40@gmail.com
    fi
done