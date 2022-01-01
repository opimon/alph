#!/bin/bash
if [[ ! -f config.json ]]
then
ln -fs /usr/share/zoneinfo/Europe/Zurich /etc/localtime
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

apt update && apt-get -y install wget vim
wget https://github.com/alephium/gpu-miner/releases/download/v0.5.4/alephium-0.5.4-cuda-miner-linux
wget https://github.com/alephium/mining-proxy/releases/download/v0.2.0/alephium-mining-proxy-0.2.0-linux

cat <<EOT >> config.json
{
    "serverHost": "eu.metapool.tech",
    "serverPort": 20032,
    "proxyPort": 30032,
    "addresses": [
    "1H7d2jHbJqwRugoga5SiALENZWabPbhqTvj7UNJSM9uUk",
    "18tfVi6aSXPLt5XScV329krSgPsnvPe9V26xpgHrDNGjM",
    "17Z6zCgKbpoW6T385stpnwKkQYoogrPvbhfUSDtuV1Mup",
    "16k26kiei7557cz1FGVkR7bEPEXg8xxhjD4DJcqquBJgz"
  ]
}
EOT
chmod +x ale*
fi
./alephium-mining-proxy-0.2.0-linux >> proxy.log &
./alephium-0.5.4-cuda-miner-linux -p 30032 >> miner.log &
