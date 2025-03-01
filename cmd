sudo apt install gnome-session-flashback
docker pull frrouting/frr
docker pull alpine
docker run --name pablo -d frrouting/frr
sudo chgrp ahmad /usr/bin/dumpcap
sudo chmod 754 /usr/bin/dumpcap
sudo setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/bin/dumpcap
