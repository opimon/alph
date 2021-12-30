#!/bin/bash
if [[ ! -f config.json ]]
then

apt update && apt-get -y install wget
wget https://github.com/alephium/gpu-miner/releases/download/v0.5.4/alephium-0.5.4-cuda-miner-linux
wget https://github.com/alephium/mining-proxy/releases/download/v0.2.0/alephium-mining-proxy-0.2.0-linux

cat <<EOT >> config.json
{
    "serverHost": "eu.metapool.tech",
    "serverPort": 20032,
    "proxyPort": 30032,
    "addresses": [
    "your-mining-address-1",
    "your-mining-address-2",
    "your-mining-address-3",
    "your-mining-address-4"
  ]
}
EOT
chmod +x ale*
fi
./alephium-mining-proxy-0.2.0-linux >> proxy.log &
./alephium-0.5.4-cuda-miner-linux -p 30032 >> miner.log &
