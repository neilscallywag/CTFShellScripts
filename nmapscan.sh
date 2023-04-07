#!/bin/bash
echo "Enter an IP address or hostname to scan for open ports:"
read target
nmap -p- -sV $target | grep 'open' > nmap_scan_results.txt
echo "Scan complete. Results saved to nmap_scan_results.txt."
