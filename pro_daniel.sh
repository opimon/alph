ln -fs /usr/share/zoneinfo/Europe/Zurich /etc/localtime
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

apt update && apt install -y sudo libuv1-dev git wget curl build-essential wget curl vim

git clone https://github.com/alephium/gpu-miner.git
cd gpu-miner
make

wget https://raw.githubusercontent.com/opimon/alph/main/miner.sh
chmod +x miner.sh

sed -i 's/MINER_ADDRESS/home\.opilab\.ch \>\> \~\/miner\.logs/g' miner.sh

./miner.sh >> miner.logs &
