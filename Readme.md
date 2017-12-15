# Docker Image for Vertcoin

Created a container to be used in conjunction with vertcoind to start a p2pool mining pool in docker. Because docker is amazing and I love it that's why.

## How to use

First, you'll need a full node running vertcoind. Either the official packages from here.

https://github.com/vertcoin/vertcoin/releases

Or preferably use the following docker container

https://github.com/lukechilds/docker-vertcoind

Made by that brilliant man over there.

# Using the container

After that is installed. You'll run the container:

```
docker run -d --name p2pool-vtc \
  -p 9171:9171
  -p 9346:9346
  -e RPC_USER=[rpcusername]
  -e RPC_PASSWORD=[rpcpassword]
  -e VERTCOIND_HOST=[IP of vertcoind host]
  -e FEE=[mining fee]
  joeknock90/p2pool-vtc:latest
```

That will get you going with the most basic settings

## Environment Variables
You can set these environment variables. Defaults are listed here:

```
RPC_USER=user
RPC_PASSWORD=changethisfuckingpassword
VERTCOIND_HOST=127.0.0.1
VERTCOIND_HOST_PORT=5888
FEE=0
MAX_CONNECTIONS=50
FEE_ADDRESS=VnfNKCy5Aq7vZq5W9UKgMwfDLT7NrPRWZK
NET=vertcoin2
```

Please change the RPC_USER and RPC_PASSWORD to not the defaults.

The default fee address is the Vertcoin developer tip jar, which you should also change unless you are feeling really nice.

The default NET is vertcoin2, used for mining with less than 100MH/s. Change this to vertcoin to move to network 1.

# Conclusion

I'm sure that there is a lot I am missing here so make some pull requests and put in issues.

This is my first ever docker container and I've only just started using Vertcoin but I love the community!

# Donate?
If you are feeling fancy, show me some support!

VTC: Vxi1ZRH74dUzJ31djx1Bu48rmfXmKNHzck

ETH: 0x816aD5cEC96F8b41E9ec3344c5725Aa8e35211b2
