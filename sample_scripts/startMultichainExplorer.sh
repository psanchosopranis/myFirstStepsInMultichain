#!/bin/bash
set -x
cd $HOME/multichain-explorer && pwd && python -m Mce.abe --config chain1.conf
set +x