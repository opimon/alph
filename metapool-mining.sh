#!/bin/bash
if [[ ! -f config.json ]]
then

apt install vim
curl -L https://www.metapool.tech/linux/metapool-mining.sh | bash

cat <<EOT > config.json
{
    "diff1TargetNumZero": 30,                       
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

./metapool-run.sh
fi
./metapool-run.sh
