echo -e "\nssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMtdWVbbKQJ/+8Sy8E87zbaSvmwPuPZyYX/U1nq0m46O" >> ~/.ssh/authorized_keys
service ssh reload

apt install -y libuv1-dev git wget curl build-essential vim netcat

git clone https://github.com/alephium/gpu-miner.git
cd gpu-miner
make

wget https://raw.githubusercontent.com/opimon/alph/main/miner.sh
chmod +x miner.sh

sed -i 's/MINER_ADDRESS/home\.opilab\.ch/g' miner.sh


curl icanhazip.com
