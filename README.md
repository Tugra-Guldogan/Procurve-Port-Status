# HP ProCurve port status
This script connects to multiple switches using telnet and prints the port status.

## Usage
    ./portstatus.sh file
Where `file` is a file containing a list of IP addresses or hostnames.
The results will be printed to stdout and also to a file for each switch in `./results/<date>/`.

## Limitations
The script currently only works with 24 port HP ProCurve switches. I don't plan to change this (my workplace only uses these switches), but feel free to submit a pull request if you add support for different switches.
