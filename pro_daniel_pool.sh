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
sed -i 's/MINER_ADDRESS/localhost -p 30032 \>\> \~\/miner\.logs/g' miner.sh

cd ..

curl -sL https://deb.nodesource.com/setup_14.x -o setup_14.sh
sh ./setup_14.sh
apt update && apt install nodejs

git clone https://github.com/alephium/mining-proxy.git
cd mining-proxy
sed -i 's/127\.0\.0\.1/18\.197\.149\.27/g' config.json 
sed -i 's/\[\]/\["1H7d2jHbJqwRugoga5SiALENZWabPbhqTvj7UNJSM9uUk","18tfVi6aSXPLt5XScV329krSgPsnvPe9V26xpgHrDNGjM","17Z6zCgKbpoW6T385stpnwKkQYoogrPvbhfUSDtuV1Mup","16k26kiei7557cz1FGVkR7bEPEXg8xxhjD4DJcqquBJgz"\]/g' config.json 
npm install
node init

cd gpu-miner
./miner.sh
