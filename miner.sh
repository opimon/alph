echo "Launching the miner and restart automatically if it crashes"
until ./bin/gpu-miner -a MINER_ADDRESS; do
    echo "Miner crashed with exit code $?.  Respawning.." >&2
    sleep 1
done
