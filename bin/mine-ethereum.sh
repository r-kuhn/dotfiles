#!/bin/sh

# This will start ethereum mining
# Use mist as a wallet

running=0

if [ ! -e ~/log ]; then
    mkdir -f ~/log
fi


while true; do
    if xset q | grep -q 'Monitor is On'; then
        echo "Monitor is on" >> ~/log/geth.log
        if [ $running -eq 1 ]; then
            echo "Killing ethminer"
            pkill -f "ethminer"
            pkill -f "geth"
            running=0
        fi
        sleep 300 # 5 min
    else
        echo "Monitor is off" >> ~/log/geth.log
        if [ $running -eq 0 ]; then
            echo "Starting ethminer"
            geth --rpc --rpccorsdomain localhost 2>> ~/log/geth.log &  # Geth can always run
            # ethminer -G
            ethminer --farm-recheck 2000 -U -S us1.ethermine.org:4444 -FS us2.ethermine.org:4444 -O b3451a869e2c77e236a1ed75a66b1cd78a786975.neptune 2>> ~/log/geth.log &
            running=1
        fi
        sleep 30 # 30 seconds only when off otherwise system is unusable for 5 mins
    fi
done
