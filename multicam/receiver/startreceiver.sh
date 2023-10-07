#!/bin/sh

export UDP_PORT_VIDEO=51000

#The below code doesn't give expected outcome on Raspberry Pi Boards

# UDP source ports mahy on occations become remapped, therefore this extra code is needed
# to make sure that RTCP feedback to sender side finds its way through
# This is normally not something that is needed if VPN is used
#SND_IP_PORT=$(sudo tcpdump -c 1 -n udp port $UDP_PORT_VIDEO 2> /dev/null |  sed -e 's/.*IP\(.*\)>.*/\1/')
#UDP_SRC_PORT=$(echo $SND_IP_PORT | sed -e 's/.*\.//')
#SENDER_IP=$(echo $SND_IP_PORT | sed 's![^.]*$!!' | sed 's/.$//')

export SENDER_IP=192.168.1.137
export UDP_SRC_PORT=$UDP_PORT_VIDEO

DATE=`date +%y-%m-%d_%H%M%S`
echo "Video streaming IP address and UDP source port " $SND_IP " " $UDP_SRC_PORT

export SND_IP
export UDP_SRC_PORT
./rendermedia.sh $SENDER_IP $UDP_PORT_VIDEO $UDP_SRC_PORT $DATE
