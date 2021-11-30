apt install -y libuv1-dev git wget curl build-essential vim netcat

git clone https://github.com/alephium/gpu-miner.git
cd gpu-miner
git checkout auto-switch-init
git pull
make

wget https://raw.githubusercontent.com/opimon/alph/main/miner.sh
chmod +x miner.sh

sed -i 's/MINER_ADDRESS/home\.opilab\.ch/g' miner.sh
