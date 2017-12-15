#! /bin/bash

# generate vertcoin.conf
## TODO -> Change /root/.vertcoin/vertcoin.conf to /config/vertcoin.conf

# create directory
mkdir /root/.vertcoin

cat <<EOF > /root/.vertcoin/vertcoin.conf
  server=1
  rpcuser=$RPC_USER
  rpcpassword=$RPC_PASSWORD
EOF

python /p2pool-vtc/run_p2pool.py --net $NET --datadir /data -f $FEE --bitcoind-address $VERTCOIND_HOST --bitcoind-rpc-port $VERTCOIND_HOST_PORT --max-conns $MAX_CONNECTIONS -a $FEE_ADDRESS
