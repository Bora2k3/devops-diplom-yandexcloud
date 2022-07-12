#!/bin/zsh
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
