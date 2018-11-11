#!/bin/bash
set -x
cd $HOME && pwd 
multichain-cli DemoChain stop
tail -f $HOME/.multichain/DemoChain/debug.log 
set +x