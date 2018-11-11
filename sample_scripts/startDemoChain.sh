#!/bin/bash
set -x
cd $HOME && pwd 
multichaind DemoChain -daemon -rpcallowip=192.168.135.0/24
multichain-cli DemoChain getinfo
tail -f $HOME/.multichain/DemoChain/debug.log 
set +x