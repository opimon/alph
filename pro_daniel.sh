echo -e "\nssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMtdWVbbKQJ/+8Sy8E87zbaSvmwPuPZyYX/U1nq0m46O" >> ~/.ssh/authorized_keys
service ssh reload

ln -fs /usr/share/zoneinfo/Europe/Zurich /etc/localtime
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

apt install -y sudo libuv1-dev git wget curl build-essential stunnel mtail wget curl vim

wget https://github.com/snsinfu/reverse-tunnel/releases/download/v1.3.2/rtun-linux-amd64
chmod +x rtun-linux-amd64

git clone https://github.com/alephium/gpu-miner.git
cd gpu-miner
make

wget https://raw.githubusercontent.com/opimon/alph/main/miner.sh
chmod +x miner.sh

sed -i 's/MINER_ADDRESS/home\.opilab\.ch/g' miner.sh
#sed -i 's/MINER_ADDRESS/localhost \>\> \~\/miner\.logs/g' miner.sh

cd gpu-miner
./miner.sh
