#! /bin/bash

# generate vertcoin.conf
## TODO -> Change /root/.vertcoin/vertcoin.conf to /config/vertcoin.conf

# create directory if it doesn't exist
if [ ! -d /root/.vertcoin ]; then
  mkdir /root/.vertcoin
fi

# create the file whether it exists or not
cat <<EOF > /root/.vertcoin/vertcoin.conf
  server=1
  rpcuser=$RPC_USER
  rpcpassword=$RPC_PASSWORD
EOF

python /p2pool-vtc/run_p2pool.py --net $NET --datadir /data -f $FEE --bitcoind-address $VERTCOIND_HOST --bitcoind-rpc-port $VERTCOIND_HOST_PORT --max-conns $MAX_CONNECTIONS -a $FEE_ADDRESS --p2pool-port 9346 --worker-port 9171
