# Installing MultiChain on Linux

```sh
devel1@VBXLFD271:~/Escritorio/MULTICHAIN_MATERIAL$ su -
Contraseña: 
root@VBXLFD271:~# 

root@VBXLFD271:~# mkdir tmp
root@VBXLFD271:~# cd tmp
root@VBXLFD271:~/tmp# pwd
/root/tmp

root@VBXLFD271:~/tmp# wget https://www.multichain.com/download/multichain-1.0.6.tar.gz
--2018-10-27 15:12:58--  https://www.multichain.com/download/multichain-1.0.6.tar.gz
Resolviendo www.multichain.com (www.multichain.com)... 162.243.214.85
Conectando con www.multichain.com (www.multichain.com)[162.243.214.85]:443... conectado.
Petición HTTP enviada, esperando respuesta... 200 OK
Longitud: 10028071 (9,6M) [application/x-gzip]
Guardando como: “multichain-1.0.6.tar.gz”

multichain-1.0.6.tar.gz                     100%[==========================================================================================>]   9,56M  2,19MB/s    en 6,5s    

2018-10-27 15:13:05 (1,48 MB/s) - “multichain-1.0.6.tar.gz” guardado [10028071/10028071]

root@VBXLFD271:~/tmp# tar -xvzf multichain-1.0.6.tar.gz
multichain-1.0.6/
multichain-1.0.6/multichain-util
multichain-1.0.6/multichain-cli
multichain-1.0.6/README.txt
multichain-1.0.6/multichaind
multichain-1.0.6/multichaind-cold

root@VBXLFD271:~/tmp/multichain-1.0.6# ls -la
total 23180
drwxrwxr-x 2 devel1 devel1    4096 ago  2 13:50 .
drwxr-xr-x 3 root   root      4096 oct 27 15:13 ..
-rwxr-xr-x 1 devel1 devel1 2869048 ago  2 13:48 multichain-cli
-rwxr-xr-x 1 devel1 devel1 9422872 ago  2 13:48 multichaind
-rwxr-xr-x 1 devel1 devel1 9090584 ago  2 13:48 multichaind-cold
-rwxr-xr-x 1 devel1 devel1 2297144 ago  2 13:48 multichain-util
-rw-r--r-- 1 devel1 devel1   40087 ago  2 14:06 README.txt

root@VBXLFD271:~/tmp/multichain-1.0.6# mv --verbose multichaind multichain-cli multichain-util /usr/local/bin
renamed 'multichaind' -> '/usr/local/bin/multichaind'
renamed 'multichain-cli' -> '/usr/local/bin/multichain-cli'
renamed 'multichain-util' -> '/usr/local/bin/multichain-util'

```

# Como Usuario

```sh
devel1@VBXLFD271:~$ multichain-util create DemoChain

MultiChain 1.0.6 Utilities (latest protocol 10011)

Blockchain parameter set was successfully generated.
You can edit it in /home/devel1/.multichain/DemoChain/params.dat before running multichaind for the first time.

To generate blockchain please run "multichaind DemoChain -daemon".

```

```sh
devel1@VBXLFD271:~$ tree /home/devel1/.multichain/DemoChain/
/home/devel1/.multichain/DemoChain/
├── multichain.conf
└── params.dat

0 directories, 2 files

 
```

## Contenido de /home/devel1/.multichain/DemoChain/params.dat

```sh
# ==== MultiChain configuration file ====

# Created by multichain-util 
# Protocol version: 10011 


# The following parameters can only be edited if this file is a prototype of another configuration file. 
# Please run "multichain-util clone DemoChain <new-network-name>" to generate new network. 


# Basic chain parameters

chain-protocol = multichain             # Chain protocol: multichain (permissions, native assets) or bitcoin
chain-description = MultiChain DemoChain # Chain description, embedded in genesis block coinbase, max 90 chars.
root-stream-name = root                 # Root stream name, blank means no root stream.
root-stream-open = true                 # Allow anyone to publish in root stream
chain-is-testnet = false                # Content of the 'testnet' field of API responses, for compatibility.
target-block-time = 15                  # Target time between blocks (transaction confirmation delay), seconds. (2 - 86400)
maximum-block-size = 8388608            # Maximum block size in bytes. (1000 - 1000000000)

# Global permissions

anyone-can-connect = false              # Anyone can connect, i.e. a publicly readable blockchain.
anyone-can-send = false                 # Anyone can send, i.e. transaction signing not restricted by address.
anyone-can-receive = false              # Anyone can receive, i.e. transaction outputs not restricted by address.
anyone-can-receive-empty = true         # Anyone can receive empty output, i.e. without permission grants, asset transfers and zero native currency.
anyone-can-create = false               # Anyone can create new streams.
anyone-can-issue = false                # Anyone can issue new native assets.
anyone-can-mine = false                 # Anyone can mine blocks (confirm transactions).
anyone-can-activate = false             # Anyone can grant or revoke connect, send and receive permissions.
anyone-can-admin = false                # Anyone can grant or revoke all permissions.
support-miner-precheck = true           # Require special metadata output with cached scriptPubKey for input, to support advanced miner checks.
allow-arbitrary-outputs = false         # Allow arbitrary (without clear destination) scripts.
allow-p2sh-outputs = true               # Allow pay-to-scripthash (P2SH) scripts, often used for multisig. Ignored if allow-arbitrary-outputs=true.
allow-multisig-outputs = true           # Allow bare multisignature scripts, rarely used but still supported. Ignored if allow-arbitrary-outputs=true.

# Consensus requirements

setup-first-blocks = 60                 # Length of initial setup phase in blocks, in which mining-diversity,
                                        # admin-consensus-* and mining-requires-peers are not applied. (1 - 31536000)
mining-diversity = 0.3                  # Miners must wait <mining-diversity>*<active miners> between blocks. (0 - 1)
admin-consensus-upgrade = 0.5           # <admin-consensus-upgrade>*<active admins> needed to upgrade the chain. (0 - 1)
admin-consensus-admin = 0.5             # <admin-consensus-admin>*<active admins> needed to change admin perms. (0 - 1)
admin-consensus-activate = 0.5          # <admin-consensus-activate>*<active admins> to change activate perms. (0 - 1)
admin-consensus-mine = 0.5              # <admin-consensus-mine>*<active admins> to change mining permissions. (0 - 1)
admin-consensus-create = 0.0            # <admin-consensus-create>*<active admins> to change create permissions. (0 - 1)
admin-consensus-issue = 0.0             # <admin-consensus-issue>*<active admins> to change issue permissions. (0 - 1)

# Defaults for node runtime parameters

lock-admin-mine-rounds = 10             # Ignore forks that reverse changes in admin or mine permissions after this many mining rounds have passed. Integer only. (0 - 10000)
mining-requires-peers = true            # Nodes only mine blocks if connected to other nodes (ignored if only one permitted miner).
mine-empty-rounds = 10                  # Mine this many rounds of empty blocks before pausing to wait for new transactions. If negative, continue indefinitely (ignored if target-adjust-freq>0). Non-integer allowed. (-1 - 1000)
mining-turnover = 0.5                   # Prefer pure round robin between a subset of active miners to minimize forks (0.0) or random equal participation for all permitted miners (1.0). (0 - 1)

# Native blockchain currency (likely not required)

initial-block-reward = 0                # Initial block mining reward in raw native currency units. (0 - 1000000000000000000)
first-block-reward = -1                 # Different mining reward for first block only, ignored if negative. (-1 - 1000000000000000000)
reward-halving-interval = 52560000      # Interval for halving of mining rewards, in blocks. (60 - 1000000000)
reward-spendable-delay = 1              # Delay before mining reward can be spent, in blocks. (1 - 100000)
minimum-per-output = 0                  # Minimum native currency per output (anti-dust), in raw units.
                                        # If set to -1, this is calculated from minimum-relay-fee. (-1 - 1000000000)
maximum-per-output = 100000000000000    # Maximum native currency per output, in raw units. (0 - 1000000000000000000)
minimum-relay-fee = 0                   # Minimum transaction fee, per 1000 bytes, in raw units of native currency. (0 - 1000000000)
native-currency-multiple = 100000000    # Number of raw units of native currency per display unit. (0 - 1000000000)

# Advanced mining parameters

skip-pow-check = false                  # Skip checking whether block hashes demonstrate proof of work.
pow-minimum-bits = 8                    # Initial and minimum proof of work difficulty, in leading zero bits. (1 - 32)
target-adjust-freq = -1                 # Interval between proof of work difficulty adjustments, in seconds, if negative - never adjusted. (-1 - 4294967295)
allow-min-difficulty-blocks = false     # Allow lower difficulty blocks if none after 2*<target-block-time>.

# Standard transaction definitions

only-accept-std-txs = true              # Only accept and relay transactions which qualify as 'standard'.
max-std-tx-size = 4194304               # Maximum size of standard transactions, in bytes. (1024 - 100000000)
max-std-op-returns-count = 32           # Maximum number of OP_RETURN metadata outputs in standard transactions. (0 - 1024)
max-std-op-return-size = 2097152        # Maximum size of OP_RETURN metadata in standard transactions, in bytes. (0 - 67108864)
max-std-op-drops-count = 5              # Maximum number of OP_DROPs per output in standard transactions. (0 - 100)
max-std-element-size = 8192             # Maximum size of data elements in standard transactions, in bytes. (128 - 32768)

# The following parameters were generated by multichain-util.
# They SHOULD ONLY BE EDITED IF YOU KNOW WHAT YOU ARE DOING. 

default-network-port = 7441             # Default TCP/IP port for peer-to-peer connection with other nodes.
default-rpc-port = 7440                 # Default TCP/IP port for incoming JSON-RPC API requests.
chain-name = DemoChain                  # Chain name, used as first argument for multichaind and multichain-cli.
protocol-version = 10011                # Protocol version at the moment of blockchain genesis.
network-message-start = fde8e5f2        # Magic value sent as the first 4 bytes of every peer-to-peer message.
address-pubkeyhash-version = 006fede8   # Version bytes used for pay-to-pubkeyhash addresses.
address-scripthash-version = 05f4a123   # Version bytes used for pay-to-scripthash addresses.
private-key-version = 802ff456          # Version bytes used for exporting private keys.
address-checksum-value = 7652d476       # Bytes used for XOR in address checksum calculation.

# The following parameters were generated by multichaind.
# They SHOULD NOT BE EDITED. 

genesis-pubkey = [null]                 # Genesis block coinbase output public key.
genesis-version = [null]                # Genesis block version.
genesis-timestamp = [null]              # Genesis block timestamp.
genesis-nbits = [null]                  # Genesis block difficulty (nBits).
genesis-nonce = [null]                  # Genesis block nonce.
genesis-pubkey-hash = [null]            # Genesis block coinbase output public key hash.
genesis-hash = [null]                   # Genesis block hash.
chain-params-hash = [null]              # Hash of blockchain parameters, to prevent accidental changes.



```

## Contenido de /home/devel1/.multichain/DemoChain/multichain.conf

```sh
rpcuser=multichainrpc
rpcpassword=2yRyYnfEZU3ENhxVcdUenLg4g2QKvYW9qjeNhwvpBpa4
```

### Arranque 

```sh
devel1@VBXLFD271:~$ multichaind DemoChain -daemon

devel1@VBXLFD271:~$ multichaind DemoChain -daemon

MultiChain 1.0.6 Daemon (latest protocol 10011)

Starting up node...

Looking for genesis block...
Genesis block found

Other nodes can connect to this node using:
multichaind DemoChain@10.0.2.15:7441

This host has multiple IP addresses, so from some networks:
multichaind DemoChain@192.168.135.3:7441
multichaind DemoChain@172.23.0.1:7441
multichaind DemoChain@172.21.0.1:7441
multichaind DemoChain@172.17.0.1:7441
multichaind DemoChain@172.20.0.1:7441

Listening for API requests on port 7440 (local only - see rpcallowip setting)

Node ready.

```

### Puertos abiertos
```
COMMAND     PID            USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
systemd-r  481 systemd-resolve   13u  IPv4  16415      0t0  TCP 127.0.0.53:53 (LISTEN)
cupsd      685            root    6u  IPv6  19864      0t0  TCP [::1]:631 (LISTEN)
cupsd      685            root    7u  IPv4  19865      0t0  TCP 127.0.0.1:631 (LISTEN)
sshd      1296            root    3u  IPv4  27391      0t0  TCP *:22 (LISTEN)
sshd      1296            root    4u  IPv6  27393      0t0  TCP *:22 (LISTEN)
multichai 3301          devel1   25u  IPv6  35428      0t0  TCP [::1]:7440 (LISTEN)
multichai 3301          devel1   26u  IPv4  35429      0t0  TCP 127.0.0.1:7440 (LISTEN)
multichai 3301          devel1   27u  IPv6  35430      0t0  TCP *:7441 (LISTEN)
multichai 3301          devel1   28u  IPv4  35431      0t0  TCP *:7441 (LISTEN)
```

### Log
```sh
devel1@VBXLFD271:~$ tail -f ~/.multichain/DemoChain/debug.log 
2018-10-28 17:29:05 MultiChainMiner: Block Found - 00f8db3804c62bd767609f0be0028ddfea7690e0ae605c51c9f4873ca6f431aa, prev: 00193aef53e928b7ed36712ba0ddd38455a2f95cdf0f6908baa5b9c1846c9810, height: 14, txs: 1
2018-10-28 17:29:05 UpdateTip:            new best=00f8db3804c62bd767609f0be0028ddfea7690e0ae605c51c9f4873ca6f431aa  height=14  log2_work=11.906891  tx=15  date=2018-10-28 17:29:05 progress=1.000000  cache=0
2018-10-28 17:29:31 MultiChainMiner: Block Found - 00aea011fea5ef55f865b5f93c5959f65c0f35e2e6083d55b413b251d3d27e43, prev: 00f8db3804c62bd767609f0be0028ddfea7690e0ae605c51c9f4873ca6f431aa, height: 15, txs: 1
2018-10-28 17:29:31 UpdateTip:            new best=00aea011fea5ef55f865b5f93c5959f65c0f35e2e6083d55b413b251d3d27e43  height=15  log2_work=12  tx=16  date=2018-10-28 17:29:31 progress=1.000000  cache=0
2018-10-28 17:29:40 MultiChainMiner: Block Found - 005514d7136fd786224ca5caa5db829918f756d316d3509ca1ba9624299e1217, prev: 00aea011fea5ef55f865b5f93c5959f65c0f35e2e6083d55b413b251d3d27e43, height: 16, txs: 1
2018-10-28 17:29:40 UpdateTip:            new best=005514d7136fd786224ca5caa5db829918f756d316d3509ca1ba9624299e1217  height=16  log2_work=12.087463  tx=17  date=2018-10-28 17:29:40 progress=1.000000  cache=0
2018-10-28 17:29:56 MultiChainMiner: Block Found - 0037c1b061df479c0f82518831eb03bd81db8619ad4f2088e7fd21d674f626f2, prev: 005514d7136fd786224ca5caa5db829918f756d316d3509ca1ba9624299e1217, height: 17, txs: 1
2018-10-28 17:29:56 UpdateTip:            new best=0037c1b061df479c0f82518831eb03bd81db8619ad4f2088e7fd21d674f626f2  height=17  log2_work=12.169925  tx=18  date=2018-10-28 17:29:56 progress=1.000000  cache=0
2018-10-28 17:30:11 MultiChainMiner: Block Found - 005300075996a8260c8a6f80ecf0d43b2edcb238dfffcb37d61c4b4e72011cbf, prev: 0037c1b061df479c0f82518831eb03bd81db8619ad4f2088e7fd21d674f626f2, height: 18, txs: 1
2018-10-28 17:30:11 UpdateTip:            new best=005300075996a8260c8a6f80ecf0d43b2edcb238dfffcb37d61c4b4e72011cbf  height=18  log2_work=12.247928  tx=19  date=2018-10-28 17:30:11 progress=1.000000  cache=0
2018-10-28 17:30:25 MultiChainMiner: Block Found - 004fc378ac6076cc09d58bd23590abf2c6852cd618ecbc70791d5db0e50d0036, prev: 005300075996a8260c8a6f80ecf0d43b2edcb238dfffcb37d61c4b4e72011cbf, height: 19, txs: 1
2018-10-28 17:30:25 UpdateTip:            new best=004fc378ac6076cc09d58bd23590abf2c6852cd618ecbc70791d5db0e50d0036  height=19  log2_work=12.321928  tx=20  date=2018-10-28 17:30:25 progress=1.000000  cache=0
2018-10-28 17:30:41 MultiChainMiner: Block Found - 005603ca9df1f155917057a5e9477257a6f0206796f800eb467e56e6b58ea241, prev: 004fc378ac6076cc09d58bd23590abf2c6852cd618ecbc70791d5db0e50d0036, height: 20, txs: 1
2018-10-28 17:30:41 UpdateTip:            new best=005603ca9df1f155917057a5e9477257a6f0206796f800eb467e56e6b58ea241  height=20  log2_work=12.392317  tx=21  date=2018-10-28 17:30:41 progress=1.000000  cache=0
2018-10-28 17:30:54 MultiChainMiner: Block Found - 008ffe065378529c7474892751b348430aeab01040e67d0fb426b57619bdcbd2, prev: 005603ca9df1f155917057a5e9477257a6f0206796f800eb467e56e6b58ea241, height: 21, txs: 1
2018-10-28 17:30:54 UpdateTip:            new best=008ffe065378529c7474892751b348430aeab01040e67d0fb426b57619bdcbd2  height=21  log2_work=12.459432  tx=22  date=2018-10-28 17:30:54 progress=1.000000  cache=0
2018-10-28 17:31:03 MultiChainMiner: Block Found - 00dc5074bafb76e672e24ccfed6c821e7870beb9dd766488b9ee3401848fca20, prev: 008ffe065378529c7474892751b348430aeab01040e67d0fb426b57619bdcbd2, height: 22, txs: 1
2018-10-28 17:31:03 UpdateTip:            new best=00dc5074bafb76e672e24ccfed6c821e7870beb9dd766488b9ee3401848fca20  height=22  log2_work=12.523562  tx=23  date=2018-10-28 17:31:03 progress=1.000000  cache=0
... ... ...
```

### Status
```json
devel1@VBXLFD271:~$ multichain-cli DemoChain getinfo
{"method":"getinfo","params":[],"id":"36642015-1540748230","chain_name":"DemoChain"}

{
    "version" : "1.0.6",
    "nodeversion" : 10006901,
    "protocolversion" : 10011,
    "chainname" : "DemoChain",
    "description" : "MultiChain DemoChain",
    "protocol" : "multichain",
    "port" : 7441,
    "setupblocks" : 60,
    "nodeaddress" : "DemoChain@10.0.2.15:7441",
    "burnaddress" : "1XXXXXXWwzXXXXXXWDXXXXXXZKXXXXXXYxXxgu",
    "incomingpaused" : false,
    "miningpaused" : false,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "walletdbversion" : 2,
    "reindex" : false,
    "blocks" : 45,
    "timeoffset" : 0,
    "connections" : 0,
    "proxy" : "",
    "difficulty" : 0.00000006,
    "testnet" : false,
    "keypoololdest" : 1540747577,
    "keypoolsize" : 2,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00000000,
    "errors" : ""
}

devel1@VBXLFD271:~$ multichain-cli DemoChain listaddresses
{"method":"listaddresses","params":[],"id":"53026272-1540750597","chain_name":"DemoChain"}

[
    {
        "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
        "ismine" : true
    }
]

devel1@VBXLFD271:~$ multichain-cli DemoChain getwalletinfo
{"method":"getwalletinfo","params":[],"id":"76795743-1540750784","chain_name":"DemoChain"}

{
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "walletdbversion" : 2,
    "txcount" : 2,
    "utxocount" : 1,
    "keypoololdest" : 1540747577,
    "keypoolsize" : 2
}
```

## En servidor 2:

```sh
devel1@VBXLFD272:~$ ping 192.168.135.3
PING 192.168.135.3 (192.168.135.3) 56(84) bytes of data.
64 bytes from 192.168.135.3: icmp_seq=1 ttl=64 time=1.71 ms
64 bytes from 192.168.135.3: icmp_seq=2 ttl=64 time=4.80 ms
64 bytes from 192.168.135.3: icmp_seq=3 ttl=64 time=0.429 ms
^C
--- 192.168.135.3 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 4ms
rtt min/avg/max/mdev = 0.429/2.313/4.803/1.836 ms
devel1@VBXLFD272:~$ multichaind DemoChain@192.168.135.3:7441

MultiChain 1.0.6 Daemon (latest protocol 10011)

Retrieving blockchain parameters from the seed node 192.168.135.3:7441 ...
Blockchain successfully initialized.

Please ask blockchain admin or user having activate permission to let you connect and/or transact:
multichain-cli DemoChain grant 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg connect
multichain-cli DemoChain grant 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg connect,send,receive

```

## En Servidor 1 (granting access)
```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain grant 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg connect,send,receive
{"method":"grant","params":["1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg","connect,send,receive"],"id":"39330375-1540749827","chain_name":"DemoChain"}

4f8364f4d01a6dd8caa535abee010ed3f46baff16e7460bbc497de8722fcfa32
```

## En el log del servidor 1 se observó:
```sh
... ... ...
2018-10-28 18:00:52 mchn: Sending minimal parameter set to 192.168.135.4:48134
2018-10-28 18:00:52 receive version message: /MultiChain:0.1.0.11/: version 70002, blocks=-1, us=192.168.135.3:7441, peer=1
2018-10-28 18:00:52 Added time data, samples 2, offset +0 (+0 minutes)
2018-10-28 18:03:47 mchn: Granting connect,send,receive permission(s) to address 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg (0-4294967295)
2018-10-28 18:03:47 CommitTransaction: 4f8364f4d01a6dd8caa535abee010ed3f46baff16e7460bbc497de8722fcfa32, vin: 1, vout: 2
... ... ...
```

## En Servidor 2
```sh

devel1@VBXLFD272:~$ tree ~/.multichain/
/home/devel1/.multichain/
├── DemoChain
│   ├── db.log
│   ├── debug.log
│   ├── multichain.conf
│   ├── params.dat
│   ├── peers.dat
│   ├── permissions.db
│   │   ├── 000003.log
│   │   ├── CURRENT
│   │   ├── LOCK
│   │   ├── LOG
│   │   └── MANIFEST-000002
│   ├── permissions.log
│   ├── seed.dat
│   └── wallet.dat
└── multichain.conf

devel1@VBXLFD272:~$ more .multichain/DemoChain/multichain.conf 
rpcuser=multichainrpc
rpcpassword=Fqmfbvn5aMCa6GBQHQsVSfLoZD95svYXZDWsdiMZefKX

```

```sh
devel1@VBXLFD272:~$ multichaind DemoChain -daemon

MultiChain 1.0.6 Daemon (latest protocol 10011)

Starting up node...

Retrieving blockchain parameters from the seed node 192.168.135.3:7441 ...
Other nodes can connect to this node using:
multichaind DemoChain@10.0.2.15:7441

This host has multiple IP addresses, so from some networks:
multichaind DemoChain@192.168.135.4:7441
multichaind DemoChain@172.17.0.1:7441
multichaind DemoChain@172.21.0.1:7441
multichaind DemoChain@172.20.0.1:7441
multichaind DemoChain@172.23.0.1:7441

Listening for API requests on port 7440 (local only - see rpcallowip setting)

Node ready.

devel1@VBXLFD272:~$ multichain-cli DemoChain getinfo
{"method":"getinfo","params":[],"id":"39245477-1540750451","chain_name":"DemoChain"}

{
    "version" : "1.0.6",
    "nodeversion" : 10006901,
    "protocolversion" : 10011,
    "chainname" : "DemoChain",
    "description" : "MultiChain DemoChain",
    "protocol" : "multichain",
    "port" : 7441,
    "setupblocks" : 60,
    "nodeaddress" : "DemoChain@10.0.2.15:7441",
    "burnaddress" : "1XXXXXXWwzXXXXXXWDXXXXXXZKXXXXXXYxXxgu",
    "incomingpaused" : false,
    "miningpaused" : false,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "walletdbversion" : 2,
    "reindex" : false,
    "blocks" : 70,
    "timeoffset" : 0,
    "connections" : 1,
    "proxy" : "",
    "difficulty" : 0.00000006,
    "testnet" : false,
    "keypoololdest" : 1540749651,
    "keypoolsize" : 2,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00000000,
    "errors" : ""
}

devel1@VBXLFD272:~$ multichain-cli DemoChain listaddresses
{"method":"listaddresses","params":[],"id":"55657649-1540750554","chain_name":"DemoChain"}

[
    {
        "address" : "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg",
        "ismine" : true
    }
]


devel1@VBXLFD272:~$ multichain-cli DemoChain getwalletinfo
{"method":"getwalletinfo","params":[],"id":"53351370-1540750733","chain_name":"DemoChain"}

{
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "walletdbversion" : 2,
    "txcount" : 1,
    "utxocount" : 1,
    "keypoololdest" : 1540749651,
    "keypoolsize" : 2
}

```

### Como se ven los peers entre sí

Nodo 1:
```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain getpeerinfo
{"method":"getpeerinfo","params":[],"id":"16603727-1540750891","chain_name":"DemoChain"}

[
    {
        "id" : 3,
        "addr" : "192.168.135.4:48210",
        "addrlocal" : "192.168.135.3:7441",
        "services" : "0000000000000001",
        "lastsend" : 1540750889,
        "lastrecv" : 1540750889,
        "bytessent" : 30746,
        "bytesrecv" : 8013,
        "conntime" : 1540750396,
        "pingtime" : 0.09119800,
        "version" : 70002,
        "subver" : "/MultiChain:0.1.0.11/",
        "handshakelocal" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
        "handshake" : "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg",
        "inbound" : true,
        "startingheight" : 0,
        "banscore" : 0,
        "synced_headers" : -1,
        "synced_blocks" : -1,
        "inflight" : [
        ],
        "whitelisted" : false
    }
]
```

Nodo 2:
```sh
devel1@VBXLFD272:~$ multichain-cli DemoChain getpeerinfo
{"method":"getpeerinfo","params":[],"id":"68294724-1540750978","chain_name":"DemoChain"}

[
    {
        "id" : 2,
        "addr" : "192.168.135.3:7441",
        "addrlocal" : "192.168.135.4:48210",
        "services" : "0000000000000001",
        "lastsend" : 1540750970,
        "lastrecv" : 1540750970,
        "bytessent" : 8525,
        "bytesrecv" : 31258,
        "conntime" : 1540750396,
        "pingtime" : 0.02663700,
        "version" : 70002,
        "subver" : "/MultiChain:0.1.0.11/",
        "handshakelocal" : "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg",
        "handshake" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
        "inbound" : false,
        "startingheight" : 70,
        "banscore" : 0,
        "synced_headers" : 70,
        "synced_blocks" : 70,
        "inflight" : [
        ],
        "whitelisted" : false
    }
]
```

### Parar ambos nodos 

Nodo 2:
```sh
devel1@VBXLFD272:~$ multichain-cli DemoChain stop
{"method":"stop","params":[],"id":"14325795-1540751382","chain_name":"DemoChain"}

MultiChain server stopping


devel1@VBXLFD272:~$ tail -f ~/.multichain/DemoChain/debug.log 
2018-10-28 18:29:42 msghand thread interrupt
2018-10-28 18:29:42 dumpaddr thread stop
2018-10-28 18:29:42 opencon thread interrupt
2018-10-28 18:29:42 net thread interrupt
2018-10-28 18:29:42 Shutdown: In progress...
2018-10-28 18:29:42 RPCAcceptHandler: Error: Operation canceled
2018-10-28 18:29:42 MultiChainMiner terminated
2018-10-28 18:29:42 StopNode()
2018-10-28 18:29:42 Node stopped
2018-10-28 18:29:42 Shutdown: done

```

Nodo 1:
```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain stop
{"method":"stop","params":[],"id":"23258312-1540751466","chain_name":"DemoChain"}

MultiChain server stopping

devel1@VBXLFD271:~$ tail -f ~/.multichain/DemoChain/debug.log 
2018-10-28 18:31:07 net thread interrupt
2018-10-28 18:31:07 msghand thread interrupt
2018-10-28 18:31:07 addcon thread interrupt
2018-10-28 18:31:07 opencon thread interrupt
2018-10-28 18:31:07 Shutdown: In progress...
2018-10-28 18:31:07 RPCAcceptHandler: Error: Operation canceled
2018-10-28 18:31:07 MultiChainMiner terminated
2018-10-28 18:31:07 StopNode()
2018-10-28 18:31:07 Node stopped
2018-10-28 18:31:07 Shutdown: done
```

### Añadir la configuración de restricción de acceso en ambos servidores

* en `~.multichain/DemoChain/params.dat`

```sh
rpcallowip = 192.168.135.0/24
```

```sh
devel1@VBXLFD271:~$ grep rpc ~/.multichain/DemoChain/params.dat
default-rpc-port = 7440                 # Default TCP/IP port for incoming JSON-RPC API requests.
rpcallowip = 192.168.135.0/24


devel1@VBXLFD272:~$ grep rpc ~/.multichain/DemoChain/params.dat
default-rpc-port = 7440                 # Default TCP/IP port for incoming JSON-RPC API requests.
rpcallowip = 192.168.135.0/24
```

### NOTA Arranque adecuado:
```sh
multichaind DemoChain -daemon -rpcallowip=192.168.135.0/24
```

### NOTA: Se han creado los siguientes `scripts` de utilidad:

#### startDemoChain.sh:
```sh
#!/bin/bash
set -x
cd $HOME && pwd 
multichaind DemoChain -daemon -rpcallowip=192.168.135.0/24
multichain-cli DemoChain getinfo
tail -f $HOME/.multichain/DemoChain/debug.log 
set +x
```

#### stopDemoChain.sh:
```sh
#!/bin/bash
set -x
cd $HOME && pwd 
multichain-cli DemoChain stop
tail -f $HOME/.multichain/DemoChain/debug.log 
set +x
```

#### startMultichainExplorer.sh
```sh
#!/bin/bash
set -x
cd $HOME/multichain-explorer && pwd && python -m Mce.abe --config chain1.conf
set +x
```

### En Nodo 1: creación de un primer `stream` 
```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain 

MultiChain 1.0.6 RPC client


Interactive mode

DemoChain: create stream stream1 false

{"method":"create","params":["stream","stream1",false],"id":"89335163-1540802806","chain_name":"DemoChain"}

8c9227d484850e2ed2e8a796152aee0cc912ea0a3e987c03c7fd0e981268f985

DemoChain: gettransaction "8c9227d484850e2ed2e8a796152aee0cc912ea0a3e987c03c7fd0e981268f985"
{"method":"gettransaction","params":["8c9227d484850e2ed2e8a796152aee0cc912ea0a3e987c03c7fd0e981268f985"],"id":"98467376-1540803035","chain_name":"DemoChain"}

{
    "amount" : 0.00000000,
    "fee" : 0.00000000,
    "confirmations" : 11,
    "blockhash" : "00de76417e747b2d9f2cbed06726b4700ee63c5b1ed148850b5c268f56b995f5",
    "blockindex" : 1,
    "blocktime" : 1540802821,
    "txid" : "8c9227d484850e2ed2e8a796152aee0cc912ea0a3e987c03c7fd0e981268f985",
    "walletconflicts" : [
    ],
    "valid" : true,
    "time" : 1540802806,
    "timereceived" : 1540802806,
    "details" : [
        {
            "account" : "",
            "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
            "category" : "send",
            "amount" : 0.00000000,
            "vout" : 1,
            "fee" : 0.00000000
        },
        {
            "account" : "",
            "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
            "category" : "receive",
            "amount" : 0.00000000,
            "vout" : 1
        }
    ],
    "hex" : "0100000001f526f44a430290276a0dd59bbf43bd286e624eedcb34fe7fdb04261cae2becd3010000006b483045022100f7e13c2133e3b2cbec9c0a14c2dca165bc40fc5c1ea1cc4ba117edac203b787702205bb161310e8c1afc452a584c04af52c47e93ecf54e34ebdd14d1435e48df68de0121033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff020000000000000000120f73706b6e0200010773747265616d31756a00000000000000001976a914d9072b1912e87ed2ce281356ea00728825a5229188ac00000000"
}
```

```sh
DemoChain: liststreams
{"method":"liststreams","params":[],"id":"45778865-1540803488","chain_name":"DemoChain"}

[
    {
        "name" : "root",
        "createtxid" : "8c475ab6655be6a8582a03c1af5c952cc9847eb15db2d677b182f8564434d05d",
        "streamref" : "0-0-0",
        "open" : true,
        "details" : {
        },
        "subscribed" : true,
        "synchronized" : true,
        "items" : 2,
        "confirmed" : 2,
        "keys" : 1,
        "publishers" : 2
    },
    {
        "name" : "stream1",
        "createtxid" : "8c9227d484850e2ed2e8a796152aee0cc912ea0a3e987c03c7fd0e981268f985",
        "streamref" : "93-266-37516",
        "open" : false,
        "details" : {
        },
        "subscribed" : false
    }
]

DemoChain: listpermissions stream1.*
{"method":"listpermissions","params":["stream1.*"],"id":"91612762-1540803555","chain_name":"DemoChain"}

[
    {
        "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
        "for" : {
            "type" : "stream",
            "name" : "stream1",
            "streamref" : "93-266-37516"
        },
        "type" : "admin",
        "startblock" : 0,
        "endblock" : 4294967295
    },
    {
        "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
        "for" : {
            "type" : "stream",
            "name" : "stream1",
            "streamref" : "93-266-37516"
        },
        "type" : "activate",
        "startblock" : 0,
        "endblock" : 4294967295
    },
    {
        "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
        "for" : {
            "type" : "stream",
            "name" : "stream1",
            "streamref" : "93-266-37516"
        },
        "type" : "write",
        "startblock" : 0,
        "endblock" : 4294967295
    }
]

```

```sh
DemoChain: publish stream1 key1 73747265616d2064617461
{"method":"publish","params":["stream1","key1","73747265616d2064617461"],"id":"97559104-1540803681","chain_name":"DemoChain"}

31adbb59025e80c33e5ea5e98be7817d5a26836bd8d78b1d0bcdadbf4bc0de13
```

### En Nodo 2:
```sh
DemoChain: liststreams
{"method":"liststreams","params":[],"id":"94391978-1540803881","chain_name":"DemoChain"}

[
    {
        "name" : "root",
        "createtxid" : "8c475ab6655be6a8582a03c1af5c952cc9847eb15db2d677b182f8564434d05d",
        "streamref" : "0-0-0",
        "open" : true,
        "details" : {
        },
        "subscribed" : true,
        "synchronized" : true,
        "items" : 2,
        "confirmed" : 2,
        "keys" : 1,
        "publishers" : 2
    },
    {
        "name" : "stream1",
        "createtxid" : "8c9227d484850e2ed2e8a796152aee0cc912ea0a3e987c03c7fd0e981268f985",
        "streamref" : "93-266-37516",
        "open" : false,
        "details" : {
        },
        "subscribed" : false
    }
]

DemoChain: subscribe stream1                                                                                                                                               
{"method":"subscribe","params":["stream1"],"id":"71986621-1540803929","chain_name":"DemoChain"}

DemoChain: liststreams      
{"method":"liststreams","params":[],"id":"25926780-1540803953","chain_name":"DemoChain"}

[
    {
        "name" : "root",
        "createtxid" : "8c475ab6655be6a8582a03c1af5c952cc9847eb15db2d677b182f8564434d05d",
        "streamref" : "0-0-0",
        "open" : true,
        "details" : {
        },
        "subscribed" : true,
        "synchronized" : true,
        "items" : 2,
        "confirmed" : 2,
        "keys" : 1,
        "publishers" : 2
    },
    {
        "name" : "stream1",
        "createtxid" : "8c9227d484850e2ed2e8a796152aee0cc912ea0a3e987c03c7fd0e981268f985",
        "streamref" : "93-266-37516",
        "open" : false,
        "details" : {
        },
        "subscribed" : true,
        "synchronized" : true,
        "items" : 1,
        "confirmed" : 1,
        "keys" : 1,
        "publishers" : 1
    }
]
```

>Nota: Ya aparece como "subscribed" : true

```sh
DemoChain: liststreamitems stream1
{"method":"liststreamitems","params":["stream1"],"id":"69253063-1540804053","chain_name":"DemoChain"}

[
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "key1",
        "data" : "73747265616d2064617461",
        "confirmations" : 11,
        "blocktime" : 1540803692,
        "txid" : "31adbb59025e80c33e5ea5e98be7817d5a26836bd8d78b1d0bcdadbf4bc0de13"
    }
]
```

### De vuelta en Nodo 1
```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain 

MultiChain 1.0.6 RPC client


Interactive mode

DemoChain: subscribe stream1

{"method":"subscribe","params":["stream1"],"id":"65372410-1540833779","chain_name":"DemoChain"}

DemoChain: liststreamitems stream1
{"method":"liststreamitems","params":["stream1"],"id":"98878151-1540833810","chain_name":"DemoChain"}

[
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "key1",
        "data" : "73747265616d2064617461",
        "confirmations" : 11,
        "blocktime" : 1540803692,
        "txid" : "31adbb59025e80c33e5ea5e98be7817d5a26836bd8d78b1d0bcdadbf4bc0de13"
    }
]
DemoChain: liststreamkeys stream1 
{"method":"liststreamkeys","params":["stream1"],"id":"72006247-1540833819","chain_name":"DemoChain"}

[
    {
        "key" : "key1",
        "items" : 1,
        "confirmed" : 1
    }
]

DemoChain: grant "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg" send
{"method":"grant","params":["1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg","send"],"id":"83225345-1540834009","chain_name":"DemoChain"}

cb2988e0e1d3cc3b1e777cd2556aa0556465364674777f9015c7b3c323778ef4
DemoChain: grant "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg" stream1.write
{"method":"grant","params":["1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg","stream1.write"],"id":"17845448-1540834033","chain_name":"DemoChain"}

4246d93eab9e3c6dfd5323f0feb82ff0881978e309fb71b316e37dd20eb569e3

```

### En el log del Nodo 1 se puede ver:

```sh
2018-10-29 17:26:49 mchn: Granting send permission(s) to address 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg (0-4294967295)
2018-10-29 17:26:49 CommitTransaction: cb2988e0e1d3cc3b1e777cd2556aa0556465364674777f9015c7b3c323778ef4, vin: 1, vout: 2
2018-10-29 17:27:03 MultiChainMiner: Block Found - 00efc2341bb537f482738a884d12d335248be2a3cd3ea7f538cb8642385b929e, prev: 00cbfb639c7292a2f4717a93dd2d1f7e32a481549d17dbd1986f3e5e418b08b0, height: 115, txs: 2
2018-10-29 17:27:03 UpdateTip:            new best=00efc2341bb537f482738a884d12d335248be2a3cd3ea7f538cb8642385b929e  height=115  log2_work=14.857981  tx=122  date=2018-10-29 17:27:03 progress=1.000000  cache=0
2018-10-29 17:27:13 mchn: Granting write permission(s) to address 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg (0-4294967295), Entity TxID: 8c9227d484850e2ed2e8a796152aee0cc912ea0a3e987c03c7fd0e981268f985, Name: stream1
2018-10-29 17:27:13 CommitTransaction: 4246d93eab9e3c6dfd5323f0feb82ff0881978e309fb71b316e37dd20eb569e3, vin: 1, vout: 2
```

### Ahora en el Nodo 1 nuevamente (Nota: siguiendo el guión debería haberse hecho en el Nodo 2 pero, por despiste, se hizo en el nodo 1)
```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain

MultiChain 1.0.6 RPC client


Interactive mode

DemoChain: publish stream1 key1 736f6d65206f746865722064617461

{"method":"publish","params":["stream1","key1","736f6d65206f746865722064617461"],"id":"36802476-1540834294","chain_name":"DemoChain"}

5ea4324a95a516aa110d48af18e7cc4c03907e2c02fb26fb9c3dc29d8b48c1e5

DemoChain: publish stream1 key2 53747265616d732052756c6521
{"method":"publish","params":["stream1","key2","53747265616d732052756c6521"],"id":"67540590-1540834353","chain_name":"DemoChain"}

90ab2ae78f587069c106096c45213ebcf7baa4956a4872e9021c1434e8ecd42c


```

### Ahora sí, desde el Nodo 2 vamos a introducir los siguientes mensajes:
```
HolaMundodesdeelNodo2
486f6c61204d756e646f20646573646520656c204e6f646f2032
publish stream1 key1 486f6c61204d756e646f20646573646520656c204e6f646f2032

{"saludo":"HolaMundodesdeNodo2!!!"}
7b2273616c75646f223a2022486f6c61204d756e646f206465736465204e6f646f203220212121227d
publish stream1 key2 7b2273616c75646f223a2022486f6c61204d756e646f206465736465204e6f646f203220212121227d

```

```sh
devel1@VBXLFD272:~$ multichain-cli DemoChain

MultiChain 1.0.6 RPC client


Interactive mode

DemoChain: publish stream1 key1 486f6c61204d756e646f20646573646520656c204e6f646f2032

{"method":"publish","params":["stream1","key1","486f6c61204d756e646f20646573646520656c204e6f646f2032"],"id":"46130750-1540835312","chain_name":"DemoChain"}

720e5f3025ea1dc9a473b636c3e0480e0c802802ef3a7644731a49a91579b6ae

DemoChain: publish stream1 key2 7b2273616c75646f223a2022486f6c61204d756e646f206465736465204e6f646f203220212121227d
{"method":"publish","params":["stream1","key2","7b2273616c75646f223a2022486f6c61204d756e646f206465736465204e6f646f203220212121227d"],"id":"27451362-1540835405","chain_name":"DemoChain"}

94c6e2cb6911b1010be12678b6e962373c64dbd442c286147797dd879d9260aa


```


### Now let’s query the stream’s contents in many different ways. Back on the first server:

* subscribe stream1
* liststreamitems stream1 (should show 5 items)


```sh
DemoChain: liststreamitems stream1
{"method":"liststreamitems","params":["stream1"],"id":"48000687-1540835580","chain_name":"DemoChain"}

[
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "key1",
        "data" : "73747265616d2064617461",
        "confirmations" : 62,
        "blocktime" : 1540803692,
        "txid" : "31adbb59025e80c33e5ea5e98be7817d5a26836bd8d78b1d0bcdadbf4bc0de13"
    },
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "key1",
        "data" : "736f6d65206f746865722064617461",
        "confirmations" : 39,
        "blocktime" : 1540834306,
        "txid" : "5ea4324a95a516aa110d48af18e7cc4c03907e2c02fb26fb9c3dc29d8b48c1e5"
    },
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "key2",
        "data" : "53747265616d732052756c6521",
        "confirmations" : 32,
        "blocktime" : 1540834360,
        "txid" : "90ab2ae78f587069c106096c45213ebcf7baa4956a4872e9021c1434e8ecd42c"
    },
    {
        "publishers" : [
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
        ],
        "key" : "key1",
        "data" : "486f6c61204d756e646f20646573646520656c204e6f646f2032",
        "confirmations" : 21,
        "blocktime" : 1540835333,
        "txid" : "720e5f3025ea1dc9a473b636c3e0480e0c802802ef3a7644731a49a91579b6ae"
    },
    {
        "publishers" : [
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
        ],
        "key" : "key2",
        "data" : "7b2273616c75646f223a2022486f6c61204d756e646f206465736465204e6f646f203220212121227d",
        "confirmations" : 10,
        "blocktime" : 1540835414,
        "txid" : "94c6e2cb6911b1010be12678b6e962373c64dbd442c286147797dd879d9260aa"
    }
]
```
![imagen1](images/Imagen1.png)

* liststreamkeys stream1 (2 keys)

```sh
DemoChain: liststreamkeys stream1
{"method":"liststreamkeys","params":["stream1"],"id":"66597484-1540835646","chain_name":"DemoChain"}

[
    {
        "key" : "key1",
        "items" : 3,
        "confirmed" : 3
    },
    {
        "key" : "key2",
        "items" : 2,
        "confirmed" : 2
    }
]
```
* liststreamkeyitems stream1 key1 (3 items with this key) 

```sh
DemoChain: liststreamkeyitems stream1 key1
{"method":"liststreamkeyitems","params":["stream1","key1"],"id":"57883759-1540835687","chain_name":"DemoChain"}

[
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "key1",
        "data" : "73747265616d2064617461",
        "confirmations" : 63,
        "blocktime" : 1540803692,
        "txid" : "31adbb59025e80c33e5ea5e98be7817d5a26836bd8d78b1d0bcdadbf4bc0de13"
    },
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "key1",
        "data" : "736f6d65206f746865722064617461",
        "confirmations" : 40,
        "blocktime" : 1540834306,
        "txid" : "5ea4324a95a516aa110d48af18e7cc4c03907e2c02fb26fb9c3dc29d8b48c1e5"
    },
    {
        "publishers" : [
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
        ],
        "key" : "key1",
        "data" : "486f6c61204d756e646f20646573646520656c204e6f646f2032",
        "confirmations" : 22,
        "blocktime" : 1540835333,
        "txid" : "720e5f3025ea1dc9a473b636c3e0480e0c802802ef3a7644731a49a91579b6ae"
    }
]
```
![imagen1](images/Imagen2.png)

* liststreamkeyitems stream1 key2 (2 items with this key) 

```sh
DemoChain: liststreamkeyitems stream1 key2
{"method":"liststreamkeyitems","params":["stream1","key2"],"id":"24276567-1540835762","chain_name":"DemoChain"}

[
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "key2",
        "data" : "53747265616d732052756c6521",
        "confirmations" : 33,
        "blocktime" : 1540834360,
        "txid" : "90ab2ae78f587069c106096c45213ebcf7baa4956a4872e9021c1434e8ecd42c"
    },
    {
        "publishers" : [
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
        ],
        "key" : "key2",
        "data" : "7b2273616c75646f223a2022486f6c61204d756e646f206465736465204e6f646f203220212121227d",
        "confirmations" : 11,
        "blocktime" : 1540835414,
        "txid" : "94c6e2cb6911b1010be12678b6e962373c64dbd442c286147797dd879d9260aa"
    }
]
```
![imagen1](images/Imagen3.png)

* liststreampublishers stream1 (2 publishers)

```sh
DemoChain: liststreampublishers stream1
{"method":"liststreampublishers","params":["stream1"],"id":"68152641-1540835810","chain_name":"DemoChain"}

[
    {
        "publisher" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
        "items" : 3,
        "confirmed" : 3
    },
    {
        "publisher" : "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg",
        "items" : 2,
        "confirmed" : 2
    }
]
```

* liststreampublisheritems stream1 1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt (3 items by this publisher)

```sh
DemoChain: liststreampublisheritems stream1 1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt 
{"method":"liststreampublisheritems","params":["stream1","1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"],"id":"94055884-1540835899","chain_name":"DemoChain"}

[
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "key1",
        "data" : "73747265616d2064617461",
        "confirmations" : 63,
        "blocktime" : 1540803692,
        "txid" : "31adbb59025e80c33e5ea5e98be7817d5a26836bd8d78b1d0bcdadbf4bc0de13"
    },
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "key1",
        "data" : "736f6d65206f746865722064617461",
        "confirmations" : 40,
        "blocktime" : 1540834306,
        "txid" : "5ea4324a95a516aa110d48af18e7cc4c03907e2c02fb26fb9c3dc29d8b48c1e5"
    },
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "key2",
        "data" : "53747265616d732052756c6521",
        "confirmations" : 33,
        "blocktime" : 1540834360,
        "txid" : "90ab2ae78f587069c106096c45213ebcf7baa4956a4872e9021c1434e8ecd42c"
    }
]
```

![imagen1](images/Imagen4.png)
* liststreampublisheritems stream1 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg (2 items by this publisher)

```sh
DemoChain: liststreampublisheritems stream1 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg
{"method":"liststreampublisheritems","params":["stream1","1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"],"id":"51751221-1540835934","chain_name":"DemoChain"}

[
    {
        "publishers" : [
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
        ],
        "key" : "key1",
        "data" : "486f6c61204d756e646f20646573646520656c204e6f646f2032",
        "confirmations" : 22,
        "blocktime" : 1540835333,
        "txid" : "720e5f3025ea1dc9a473b636c3e0480e0c802802ef3a7644731a49a91579b6ae"
    },
    {
        "publishers" : [
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
        ],
        "key" : "key2",
        "data" : "7b2273616c75646f223a2022486f6c61204d756e646f206465736465204e6f646f203220212121227d",
        "confirmations" : 11,
        "blocktime" : 1540835414,
        "txid" : "94c6e2cb6911b1010be12678b6e962373c64dbd442c286147797dd879d9260aa"
    }
]
```
![imagen1](images/Imagen5.png)

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain gettransaction 94c6e2cb6911b1010be12678b6e962373c64dbd442c286147797dd879d9260aa
{"method":"gettransaction","params":["94c6e2cb6911b1010be12678b6e962373c64dbd442c286147797dd879d9260aa"],"id":"14413349-1541011670","chain_name":"DemoChain"}

{
    "amount" : 0.00000000,
    "confirmations" : 11,
    "blockhash" : "0095c0d85686f8bb0dbdf1659e82d65c9d498cb6f389a2f22f22a44e5239cdc4",
    "blockindex" : 1,
    "blocktime" : 1540835414,
    "txid" : "94c6e2cb6911b1010be12678b6e962373c64dbd442c286147797dd879d9260aa",
    "walletconflicts" : [
    ],
    "valid" : true,
    "time" : 1540835406,
    "timereceived" : 1540835406,
    "details" : [
    ],
    "hex" : "0100000001f48e7723c3b3c715907f77744636656455a06a55d27c771e3bccd3e1e08829cb000000006a47304402201f6566830b52d93924894b40f512820c1dd4cb67d1d18928038b48c503632c2902204b4adef9c67a7b61888cc76f735cc7155b7c6afbe46ffb9649be7d92b61516e0012102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddffffffff0200000000000000004b1473706b650cee2a1596a7e8d22e0e8584d427928c750873706b6b6b657932756a297b2273616c75646f223a2022486f6c61204d756e646f206465736465204e6f646f203220212121227d00000000000000001976a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac00000000"
}
```

![imagen1](images/Imagen6.png)

![imagen1](images/Imagen7.png)

![imagen1](images/Imagen8.png)

# ASSETS

### En nodo 1: 
Now we are going to create a new asset and send it between nodes. On the first server, get the address that has the permission to create assets:

```sh
DemoChain: listpermissions issue
{"method":"listpermissions","params":["issue"],"id":"25877722-1541233328","chain_name":"DemoChain"}

[
    {
        "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
        "for" : null,
        "type" : "issue",
        "startblock" : 0,
        "endblock" : 4294967295
    }
]
```

### En nodo 2: Se produce el mismo resultado. Por ahora sólo el usuario asociado a la dirección del primer usuario (admin) que se creó al crear la Multichain por primera vez:

```sh
DemoChain: listpermissions issue
{"method":"listpermissions","params":["issue"],"id":"95818386-1541233467","chain_name":"DemoChain"}

[
    {
        "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
        "for" : null,
        "type" : "issue",
        "startblock" : 0,
        "endblock" : 4294967295
    }
]
```

### En Nodo 1:
Now we’ll create a new asset on this node with 1000 units, each of which can be subdivided into 100 parts, sending it to itself (GENESIS)

```sh
DemoChain: issue 1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt asset1 1000 0.01
{"method":"issue","params":["1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt","asset1",1000,0.01000000],"id":"51390516-1541233776","chain_name":"DemoChain"}

259c3624dd8fe7c366dcf9e8ec7c2b9d5da95c5af2e3242a5291cdf9576f816c
```

### En el `Explorer`

![imagen1](images/Imagen9.png)

![imagen1](images/Imagen10.png)


```json
{
  "blockhash": "009b6ff2e0173566fe19fb5a10e5b85df183134dbf1378d73c61ceac1b7ec2bc", 
  "blocktime": 1541233785, 
  "confirmations": 11, 
  "data": [], 
  "hex": "01000000012cd4ece834141c02e972486a95a4baf7bc3e21456c0906c16970588fe72aab90010000006b483045022100a77130fc32bbc37429f71c2b35eb8bcd0c75ca27a67773505be437bb593d20a3022053da97bc905b0202d80e755b0808a89e74f9e200aeb4219f679a62e647981c7a0121033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff0300000000000000002776a914d9072b1912e87ed2ce281356ea00728825a5229188ac0c73706b67a086010000000000750000000000000000181573706b6e0100010661737365743100410464000000756a00000000000000001976a914d9072b1912e87ed2ce281356ea00728825a5229188ac00000000", 
  "issue": {
    "details": {}, 
    "multiple": 100, 
    "name": "asset1", 
    "open": false, 
    "type": "issuefirst"
  }, 
  "locktime": 0, 
  "time": 1541233785, 
  "txid": "259c3624dd8fe7c366dcf9e8ec7c2b9d5da95c5af2e3242a5291cdf9576f816c", 
  "version": 1, 
  "vin": [
    {
      "scriptSig": {
        "asm": "3045022100a77130fc32bbc37429f71c2b35eb8bcd0c75ca27a67773505be437bb593d20a3022053da97bc905b0202d80e755b0808a89e74f9e200aeb4219f679a62e647981c7a01 033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8", 
        "hex": "483045022100a77130fc32bbc37429f71c2b35eb8bcd0c75ca27a67773505be437bb593d20a3022053da97bc905b0202d80e755b0808a89e74f9e200aeb4219f679a62e647981c7a0121033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8"
      }, 
      "sequence": 4294967295, 
      "txid": "90ab2ae78f587069c106096c45213ebcf7baa4956a4872e9021c1434e8ecd42c", 
      "vout": 1
    }
  ], 
  "vout": [
    {
      "assets": [
        {
          "assetref": "167-266-39973", 
          "issuetxid": "259c3624dd8fe7c366dcf9e8ec7c2b9d5da95c5af2e3242a5291cdf9576f816c", 
          "name": "asset1", 
          "qty": 1000.0, 
          "raw": 100000, 
          "type": "issuefirst"
        }
      ], 
      "items": [], 
      "n": 0, 
      "permissions": [], 
      "scriptPubKey": {
        "addresses": [
          "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ], 
        "asm": "OP_DUP OP_HASH160 d9072b1912e87ed2ce281356ea00728825a52291 OP_EQUALVERIFY OP_CHECKSIG 73706b67a086010000000000 OP_DROP", 
        "hex": "76a914d9072b1912e87ed2ce281356ea00728825a5229188ac0c73706b67a08601000000000075", 
        "reqSigs": 1, 
        "type": "pubkeyhash"
      }, 
      "value": 0.0
    }, 
    {
      "assets": [], 
      "items": [], 
      "n": 1, 
      "permissions": [], 
      "scriptPubKey": {
        "asm": "73706b6e0100010661737365743100410464000000 OP_DROP OP_RETURN", 
        "hex": "1573706b6e0100010661737365743100410464000000756a", 
        "type": "nulldata"
      }, 
      "value": 0.0
    }, 
    {
      "assets": [], 
      "items": [], 
      "n": 2, 
      "permissions": [], 
      "scriptPubKey": {
        "addresses": [
          "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ], 
        "asm": "OP_DUP OP_HASH160 d9072b1912e87ed2ce281356ea00728825a52291 OP_EQUALVERIFY OP_CHECKSIG", 
        "hex": "76a914d9072b1912e87ed2ce281356ea00728825a5229188ac", 
        "reqSigs": 1, 
        "type": "pubkeyhash"
      }, 
      "value": 0.0
    }
  ]
}

```

### On both servers, verify that the asset named asset1 is listed:

### Nodo 1:
```sh
DemoChain: listassets

{"method":"listassets","params":[],"id":"12565552-1541235222","chain_name":"DemoChain"}

[
    {
        "name" : "asset1",
        "issuetxid" : "259c3624dd8fe7c366dcf9e8ec7c2b9d5da95c5af2e3242a5291cdf9576f816c",
        "assetref" : "167-266-39973",
        "multiple" : 100,
        "units" : 0.01000000,
        "open" : false,
        "details" : {
        },
        "issueqty" : 1000.00000000,
        "issueraw" : 100000,
        "subscribed" : false
    }
]

```

### Nodo 2:
```sh
DemoChain: listassets
{"method":"listassets","params":[],"id":"11292062-1541235232","chain_name":"DemoChain"}

[
    {
        "name" : "asset1",
        "issuetxid" : "259c3624dd8fe7c366dcf9e8ec7c2b9d5da95c5af2e3242a5291cdf9576f816c",
        "assetref" : "167-266-39973",
        "multiple" : 100,
        "units" : 0.01000000,
        "open" : false,
        "details" : {
        },
        "issueqty" : 1000.00000000,
        "issueraw" : 100000,
        "subscribed" : false
    }
]

```

### Now check the asset balances on each server. 

### Nodo 1 (The first should show a balance of 1000)
```sh
DemoChain: gettotalbalances
{"method":"gettotalbalances","params":[],"id":"50905125-1541236207","chain_name":"DemoChain"}

[
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 1000.00000000
    }
]
```

### Nodo 2 (... and the second should show no assets at all)
```sh
DemoChain: gettotalbalances
{"method":"gettotalbalances","params":[],"id":"54473237-1541236242","chain_name":"DemoChain"}

[
]

```

### Help `gettotalbalances`

```sh
DemoChain: help gettotalbalances
{"method":"help","params":["gettotalbalances"],"id":"21347682-1541235471","chain_name":"DemoChain"}

gettotalbalances ( minconf includeWatchonly includeLocked )

Returns a list of all the asset balances in this node’s wallet, with at least minconf confirmations.

Arguments:
1. minconf                          (numeric, optional, default=1) Only include transactions confirmed at least this many times.
2. includeWatchonly                 (bool, optional, default=false) Also include balance in watchonly addresses (see 'importaddress')
3. includeLocked                    (bool, optional, default=false) Also take locked outputs into account

Result:
An array of Objects with totals and details for each asset.

Examples:

The total amount in the server across all accounts
> multichain-cli DemoChain gettotalbalances 

The total amount in the server across all accounts, with at least 5 confirmations
> multichain-cli DemoChain gettotalbalances 6

The total amount in the default account with at least 1 confirmation
> multichain-cli DemoChain gettotalbalances 

The total amount in the account named tabby with at least 6 confirmations
> multichain-cli DemoChain gettotalbalances 6 true

As a json rpc call
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "gettotalbalances", "params": ["tabby", 6] }' -H 'content-type: text/plain;' http://127.0.0.1:7440

```

### Verifiquemos que `addresses` hay en cada servidor en este momento:

### Nodo 1:
```sh
DemoChain: listaddresses "*" true
{"method":"listaddresses","params":["*",true],"id":"16423526-1541236444","chain_name":"DemoChain"}

[
    {
        "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
        "ismine" : true,
        "iswatchonly" : false,
        "isscript" : false,
        "pubkey" : "033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8",
        "iscompressed" : true,
        "account" : "",
        "synchronized" : true
    }
]

```

### Nodo 2:
```sh
DemoChain: listaddresses "*" true
{"method":"listaddresses","params":["*",true],"id":"50238082-1541236559","chain_name":"DemoChain"}

[
    {
        "address" : "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg",
        "ismine" : true,
        "iswatchonly" : false,
        "isscript" : false,
        "pubkey" : "02f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773dd",
        "iscompressed" : true,
        "account" : "",
        "synchronized" : true
    }
]

```

### On the first server, now try sending 100 units of the asset to the second server’s wallet:

```sh
DemoChain: sendasset 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg asset1 100
{"method":"sendasset","params":["1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg","asset1",100],"id":"53138924-1541236712","chain_name":"DemoChain"}

1ed3e7560da9efd012a9ae915b352c6d31f7755787992a239ad01d66397933ad
```

![imagen1](images/Imagen11.png)

![imagen1](images/Imagen12.png)

```json
{
  "blockhash": "006f755a1a4cdea6ba21eb5d26b11a94f4253866f3104fbba6848184ba4bc55d", 
  "blocktime": 1541236729, 
  "confirmations": 11, 
  "data": [], 
  "hex": "01000000016c816f57f9cd91522a24e3f25a5ca95d9d2b7cece8f9dc66c3e78fdd24369c25000000006a4730440220039551d83092b7a5f312c6365e26515566c97810b935285204cc638550edf70e02207c394ef8d6a07da4ac358d08d1f73fea9dbf9a791d11a73fe42bcba1568554220121033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff0200000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b719d2b7cece8f9dc66c3e78fdd24369c2510270000000000007500000000000000003776a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b719d2b7cece8f9dc66c3e78fdd24369c25905f0100000000007500000000", 
  "locktime": 0, 
  "time": 1541236729, 
  "txid": "1ed3e7560da9efd012a9ae915b352c6d31f7755787992a239ad01d66397933ad", 
  "version": 1, 
  "vin": [
    {
      "scriptSig": {
        "asm": "30440220039551d83092b7a5f312c6365e26515566c97810b935285204cc638550edf70e02207c394ef8d6a07da4ac358d08d1f73fea9dbf9a791d11a73fe42bcba15685542201 033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8", 
        "hex": "4730440220039551d83092b7a5f312c6365e26515566c97810b935285204cc638550edf70e02207c394ef8d6a07da4ac358d08d1f73fea9dbf9a791d11a73fe42bcba1568554220121033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8"
      }, 
      "sequence": 4294967295, 
      "txid": "259c3624dd8fe7c366dcf9e8ec7c2b9d5da95c5af2e3242a5291cdf9576f816c", 
      "vout": 0
    }
  ], 
  "vout": [
    {
      "assets": [
        {
          "assetref": "167-266-39973", 
          "issuetxid": "259c3624dd8fe7c366dcf9e8ec7c2b9d5da95c5af2e3242a5291cdf9576f816c", 
          "name": "asset1", 
          "qty": 100.0, 
          "raw": 10000, 
          "type": "transfer"
        }
      ], 
      "items": [], 
      "n": 0, 
      "permissions": [], 
      "scriptPubKey": {
        "addresses": [
          "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
        ], 
        "asm": "OP_DUP OP_HASH160 ad9011a02cc6b7ad4a2eb01c46e297f4dc854d04 OP_EQUALVERIFY OP_CHECKSIG 73706b719d2b7cece8f9dc66c3e78fdd24369c251027000000000000 OP_DROP", 
        "hex": "76a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b719d2b7cece8f9dc66c3e78fdd24369c25102700000000000075", 
        "reqSigs": 1, 
        "type": "pubkeyhash"
      }, 
      "value": 0.0
    }, 
    {
      "assets": [
        {
          "assetref": "167-266-39973", 
          "issuetxid": "259c3624dd8fe7c366dcf9e8ec7c2b9d5da95c5af2e3242a5291cdf9576f816c", 
          "name": "asset1", 
          "qty": 900.0, 
          "raw": 90000, 
          "type": "transfer"
        }
      ], 
      "items": [], 
      "n": 1, 
      "permissions": [], 
      "scriptPubKey": {
        "addresses": [
          "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ], 
        "asm": "OP_DUP OP_HASH160 d9072b1912e87ed2ce281356ea00728825a52291 OP_EQUALVERIFY OP_CHECKSIG 73706b719d2b7cece8f9dc66c3e78fdd24369c25905f010000000000 OP_DROP", 
        "hex": "76a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b719d2b7cece8f9dc66c3e78fdd24369c25905f01000000000075", 
        "reqSigs": 1, 
        "type": "pubkeyhash"
      }, 
      "value": 0.0
    }
  ]
}


```

### Now check the asset balances on each server, including transactions with zero confirmations. They should be 900 and 100 respectively:

### Nodo 1:
```sh
DemoChain: gettotalbalances
{"method":"gettotalbalances","params":[],"id":"19291681-1541236804","chain_name":"DemoChain"}

[
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 900.00000000
    }
]


```

### En Nodo 2:
 
```sh
DemoChain: gettotalbalances      
{"method":"gettotalbalances","params":[],"id":"54311285-1541236869","chain_name":"DemoChain"}

[
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 100.00000000
    }
]

```

![imagen1](images/Imagen13a.png)

![imagen1](images/Imagen13b.png)


# Combining assets and streams

### In this section we’ll create a transaction that sends 125 units of asset1 along with some metadata written to a stream.

### On the first server (Nodo 1), run:
```sh
DemoChain: sendwithdata 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg '{"asset1":125}' '{"for":"stream1","key":"transfer","data":"486921"}'
{"method":"sendwithdata","params":["1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg",{"asset1":125},{"for":"stream1","key":"transfer","data":"486921"}],"id":"15598396-1541238060","chain_name":"DemoChain"}

b1167afccb4b7d1aa64ca8953d0b6f47a7752693c60890efa49de2a2f5e45d5c

```

>Nota: "data":"486921"
![imagen1](images/Imagen13c.png)

### Now this transaction can be examined on the second server (Nodo 2) as below (In the output from this command, you should see the balance field showing the incoming 125 units of asset1 and the items field containing the stream item that was added. )
```sh
DemoChain: getwallettransaction b1167afccb4b7d1aa64ca8953d0b6f47a7752693c60890efa49de2a2f5e45d5c
{"method":"getwallettransaction","params":["b1167afccb4b7d1aa64ca8953d0b6f47a7752693c60890efa49de2a2f5e45d5c"],"id":"73635868-1541238158","chain_name":"DemoChain"}

{
    "balance" : {
        "amount" : 0.00000000,
        "assets" : [
            {
                "name" : "asset1",
                "assetref" : "167-266-39973",
                "qty" : 125.00000000
            }
        ]
    },
    "myaddresses" : [
        "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
    ],
    "addresses" : [
        "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
    ],
    "permissions" : [
    ],
    "items" : [
        {
            "type" : "stream",
            "name" : "stream1",
            "streamref" : "93-266-37516",
            "publishers" : [
                "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
            ],
            "key" : "transfer",
            "data" : "486921"
        }
    ],
    "data" : [
        "486921"
    ],
    "confirmations" : 11,
    "blockhash" : "00d9ee551ef424175b1db8e72518ba42a8aeee18f87f707100ada9b3693e008b",
    "blockindex" : 1,
    "blocktime" : 1541238070,
    "txid" : "b1167afccb4b7d1aa64ca8953d0b6f47a7752693c60890efa49de2a2f5e45d5c",
    "valid" : true,
    "time" : 1541238060,
    "timereceived" : 1541238060
}
```

### Now check the asset balances on each server, including transactions with zero confirmations. 

### Nodo 1:
```sh
DemoChain: gettotalbalances                                                                                                         
{"method":"gettotalbalances","params":[],"id":"48140409-1541238339","chain_name":"DemoChain"}

[
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 775.00000000
    }
]



```

### En Nodo 2:
 
```sh
DemoChain: gettotalbalances
{"method":"gettotalbalances","params":[],"id":"78033514-1541238373","chain_name":"DemoChain"}

[
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 225.00000000
    }
]


```

![imagen1](images/Imagen14.png)

![imagen1](images/Imagen15a.png)

![imagen1](images/Imagen15b.png)

![imagen1](images/Imagen16a.png)

![imagen1](images/Imagen16b.png)


```sh
{
  "blockhash": "00d9ee551ef424175b1db8e72518ba42a8aeee18f87f707100ada9b3693e008b", 
  "blocktime": 1541238070, 
  "confirmations": 11, 
  "data": [
    "486921"
  ], 
  "hex": "0100000001ad337939661dd09a232a99875775f7316d2c355b91aea912d0efa90d56e7d31e010000006b483045022100e11e2faf125f82ccf379d3ceac4ef03191404998c1a363d7195f498902d17576022018710708da7b40efc279f2ffdb42d67782a4a566aece4229cfe1b10b4775dfe00121033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff0300000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b719d2b7cece8f9dc66c3e78fdd24369c25d430000000000000750000000000000000291473706b650cee2a1596a7e8d22e0e8584d427928c750c73706b6b7472616e73666572756a0348692100000000000000003776a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b719d2b7cece8f9dc66c3e78fdd24369c25bc2e0100000000007500000000", 
  "locktime": 0, 
  "time": 1541238070, 
  "txid": "b1167afccb4b7d1aa64ca8953d0b6f47a7752693c60890efa49de2a2f5e45d5c", 
  "version": 1, 
  "vin": [
    {
      "scriptSig": {
        "asm": "3045022100e11e2faf125f82ccf379d3ceac4ef03191404998c1a363d7195f498902d17576022018710708da7b40efc279f2ffdb42d67782a4a566aece4229cfe1b10b4775dfe001 033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8", 
        "hex": "483045022100e11e2faf125f82ccf379d3ceac4ef03191404998c1a363d7195f498902d17576022018710708da7b40efc279f2ffdb42d67782a4a566aece4229cfe1b10b4775dfe00121033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8"
      }, 
      "sequence": 4294967295, 
      "txid": "1ed3e7560da9efd012a9ae915b352c6d31f7755787992a239ad01d66397933ad", 
      "vout": 1
    }
  ], 
  "vout": [
    {
      "assets": [
        {
          "assetref": "167-266-39973", 
          "issuetxid": "259c3624dd8fe7c366dcf9e8ec7c2b9d5da95c5af2e3242a5291cdf9576f816c", 
          "name": "asset1", 
          "qty": 125.0, 
          "raw": 12500, 
          "type": "transfer"
        }
      ], 
      "items": [], 
      "n": 0, 
      "permissions": [], 
      "scriptPubKey": {
        "addresses": [
          "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
        ], 
        "asm": "OP_DUP OP_HASH160 ad9011a02cc6b7ad4a2eb01c46e297f4dc854d04 OP_EQUALVERIFY OP_CHECKSIG 73706b719d2b7cece8f9dc66c3e78fdd24369c25d430000000000000 OP_DROP", 
        "hex": "76a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b719d2b7cece8f9dc66c3e78fdd24369c25d43000000000000075", 
        "reqSigs": 1, 
        "type": "pubkeyhash"
      }, 
      "value": 0.0
    }, 
    {
      "assets": [], 
      "items": [
        {
          "createtxid": "8c9227d484850e2ed2e8a796152aee0cc912ea0a3e987c03c7fd0e981268f985", 
          "data": "486921", 
          "key": "transfer", 
          "name": "stream1", 
          "publishers": [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
          ], 
          "streamref": "93-266-37516", 
          "type": "stream"
        }
      ], 
      "n": 1, 
      "permissions": [], 
      "scriptPubKey": {
        "asm": "73706b650cee2a1596a7e8d22e0e8584d427928c OP_DROP 73706b6b7472616e73666572 OP_DROP OP_RETURN 2189640", 
        "hex": "1473706b650cee2a1596a7e8d22e0e8584d427928c750c73706b6b7472616e73666572756a03486921", 
        "type": "nulldata"
      }, 
      "value": 0.0
    }, 
    {
      "assets": [
        {
          "assetref": "167-266-39973", 
          "issuetxid": "259c3624dd8fe7c366dcf9e8ec7c2b9d5da95c5af2e3242a5291cdf9576f816c", 
          "name": "asset1", 
          "qty": 775.0, 
          "raw": 77500, 
          "type": "transfer"
        }
      ], 
      "items": [], 
      "n": 2, 
      "permissions": [], 
      "scriptPubKey": {
        "addresses": [
          "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ], 
        "asm": "OP_DUP OP_HASH160 d9072b1912e87ed2ce281356ea00728825a52291 OP_EQUALVERIFY OP_CHECKSIG 73706b719d2b7cece8f9dc66c3e78fdd24369c25bc2e010000000000 OP_DROP", 
        "hex": "76a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b719d2b7cece8f9dc66c3e78fdd24369c25bc2e01000000000075", 
        "reqSigs": 1, 
        "type": "pubkeyhash"
      }, 
      "value": 0.0
    }
  ]
}


```

### You can also view this item directly within the stream:

### Nodo 1:
```sh
DemoChain: liststreamitems stream1
{"method":"liststreamitems","params":["stream1"],"id":"20407900-1541238511","chain_name":"DemoChain"}

[
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "key1",
        "data" : "73747265616d2064617461",
        "confirmations" : 96,
        "blocktime" : 1540803692,
        "txid" : "31adbb59025e80c33e5ea5e98be7817d5a26836bd8d78b1d0bcdadbf4bc0de13"
    },
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "key1",
        "data" : "736f6d65206f746865722064617461",
        "confirmations" : 73,
        "blocktime" : 1540834306,
        "txid" : "5ea4324a95a516aa110d48af18e7cc4c03907e2c02fb26fb9c3dc29d8b48c1e5"
    },
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "key2",
        "data" : "53747265616d732052756c6521",
        "confirmations" : 66,
        "blocktime" : 1540834360,
        "txid" : "90ab2ae78f587069c106096c45213ebcf7baa4956a4872e9021c1434e8ecd42c"
    },
    {
        "publishers" : [
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
        ],
        "key" : "key1",
        "data" : "486f6c61204d756e646f20646573646520656c204e6f646f2032",
        "confirmations" : 55,
        "blocktime" : 1540835333,
        "txid" : "720e5f3025ea1dc9a473b636c3e0480e0c802802ef3a7644731a49a91579b6ae"
    },
    {
        "publishers" : [
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
        ],
        "key" : "key2",
        "data" : "7b2273616c75646f223a2022486f6c61204d756e646f206465736465204e6f646f203220212121227d",
        "confirmations" : 44,
        "blocktime" : 1540835414,
        "txid" : "94c6e2cb6911b1010be12678b6e962373c64dbd442c286147797dd879d9260aa"
    },
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "transfer",
        "data" : "486921",
        "confirmations" : 11,
        "blocktime" : 1541238070,
        "txid" : "b1167afccb4b7d1aa64ca8953d0b6f47a7752693c60890efa49de2a2f5e45d5c"
    }
]

```
![imagen1](images/Imagen17a.png)

### Nodo 2:
```sh
DemoChain: liststreamitems stream1
{"method":"liststreamitems","params":["stream1"],"id":"70845486-1541238559","chain_name":"DemoChain"}

[
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "key1",
        "data" : "73747265616d2064617461",
        "confirmations" : 96,
        "blocktime" : 1540803692,
        "txid" : "31adbb59025e80c33e5ea5e98be7817d5a26836bd8d78b1d0bcdadbf4bc0de13"
    },
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "key1",
        "data" : "736f6d65206f746865722064617461",
        "confirmations" : 73,
        "blocktime" : 1540834306,
        "txid" : "5ea4324a95a516aa110d48af18e7cc4c03907e2c02fb26fb9c3dc29d8b48c1e5"
    },
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "key2",
        "data" : "53747265616d732052756c6521",
        "confirmations" : 66,
        "blocktime" : 1540834360,
        "txid" : "90ab2ae78f587069c106096c45213ebcf7baa4956a4872e9021c1434e8ecd42c"
    },
    {
        "publishers" : [
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
        ],
        "key" : "key1",
        "data" : "486f6c61204d756e646f20646573646520656c204e6f646f2032",
        "confirmations" : 55,
        "blocktime" : 1540835333,
        "txid" : "720e5f3025ea1dc9a473b636c3e0480e0c802802ef3a7644731a49a91579b6ae"
    },
    {
        "publishers" : [
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
        ],
        "key" : "key2",
        "data" : "7b2273616c75646f223a2022486f6c61204d756e646f206465736465204e6f646f203220212121227d",
        "confirmations" : 44,
        "blocktime" : 1540835414,
        "txid" : "94c6e2cb6911b1010be12678b6e962373c64dbd442c286147797dd879d9260aa"
    },
    {
        "publishers" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "key" : "transfer",
        "data" : "486921",
        "confirmations" : 11,
        "blocktime" : 1541238070,
        "txid" : "b1167afccb4b7d1aa64ca8953d0b6f47a7752693c60890efa49de2a2f5e45d5c"
    }
]
```


![imagen17b](images/Imagen17b.png)

# API REST

[MultiChain JSON-RPC API commands](https://www.multichain.com/developers/json-rpc-api/)

```sh
DemoChain: getblockchainparams true

{"method":"getblockchainparams","params":[true],"id":"31259191-1541358391","chain_name":"DemoChain"}

{
    "chain-protocol" : "multichain",
    "chain-description" : "MultiChain DemoChain",
    "root-stream-name" : "root",
    "root-stream-open" : true,
    "chain-is-testnet" : false,
    "target-block-time" : 15,
    "maximum-block-size" : 8388608,
    "default-network-port" : 7441,
    "default-rpc-port" : 7440,
    "anyone-can-connect" : false,
    "anyone-can-send" : false,
    "anyone-can-receive" : false,
    "anyone-can-receive-empty" : true,
    "anyone-can-create" : false,
    "anyone-can-issue" : false,
    "anyone-can-mine" : false,
    "anyone-can-activate" : false,
    "anyone-can-admin" : false,
    "support-miner-precheck" : true,
    "allow-arbitrary-outputs" : false,
    "allow-p2sh-outputs" : true,
    "allow-multisig-outputs" : true,
    "setup-first-blocks" : 60,
    "mining-diversity" : 0.30000000,
    "admin-consensus-upgrade" : 0.50000000,
    "admin-consensus-admin" : 0.50000000,
    "admin-consensus-activate" : 0.50000000,
    "admin-consensus-mine" : 0.50000000,
    "admin-consensus-create" : 0.00000000,
    "admin-consensus-issue" : 0.00000000,
    "lock-admin-mine-rounds" : 10,
    "mining-requires-peers" : true,
    "mine-empty-rounds" : 10.00000000,
    "mining-turnover" : 0.50000000,
    "first-block-reward" : -1,
    "initial-block-reward" : 0,
    "reward-halving-interval" : 52560000,
    "reward-spendable-delay" : 1,
    "minimum-per-output" : 0,
    "maximum-per-output" : 100000000000000,
    "minimum-relay-fee" : 0,
    "native-currency-multiple" : 100000000,
    "skip-pow-check" : false,
    "pow-minimum-bits" : 8,
    "target-adjust-freq" : -1,
    "allow-min-difficulty-blocks" : false,
    "only-accept-std-txs" : true,
    "max-std-tx-size" : 4194304,
    "max-std-op-returns-count" : 32,
    "max-std-op-return-size" : 2097152,
    "max-std-op-drops-count" : 5,
    "max-std-element-size" : 8192,
    "chain-name" : "DemoChain",
    "protocol-version" : 10011,
    "network-message-start" : "fde8e5f2",
    "address-pubkeyhash-version" : "006fede8",
    "address-scripthash-version" : "05f4a123",
    "private-key-version" : "802ff456",
    "address-checksum-value" : "7652d476",
    "genesis-pubkey" : "033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8",
    "genesis-version" : 1,
    "genesis-timestamp" : 1540747577,
    "genesis-nbits" : 536936447,
    "genesis-nonce" : 201,
    "genesis-pubkey-hash" : "d9072b1912e87ed2ce281356ea00728825a52291",
    "genesis-hash" : "00375d5ff8fec14d6dd3f6417e34aa050c42eb8ec0540f78df8f235a48a97586",
    "chain-params-hash" : "3e72b83375284ccd53b17b7af4a17a72d5baf74433d9cbb8120e8f7bddf7c523"
}
DemoChain: help getblockchainparams
{"method":"help","params":["getblockchainparams"],"id":"18388958-1541358412","chain_name":"DemoChain"}

getblockchainparams ( displaynames with-upgrades )

Returns a list of values of this blockchain’s parameters

Arguments:
1. displaynames                     (boolean, optional, default=true) use display names instead of internal
2. with-upgrades                    (boolean, optional, default=true) Take upgrades into account 

Result:
An object containing various blockchain parameters.

Examples:
> multichain-cli DemoChain getblockchainparams 
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getblockchainparams", "params": [] }' -H 'content-type: text/plain;' http://127.0.0.1:7440

```

```sh
devel1@VBXLFD271:~$ more .multichain/DemoChain/multichain.conf 
rpcuser=multichainrpc
rpcpassword=2yRyYnfEZU3ENhxVcdUenLg4g2QKvYW9qjeNhwvpBpa4
rpcport=7440

```

```sh
devel1@VBXLFD271:~/.multichain/DemoChain$ curl --verbose --user multichainrpc:2yRyYnfEZU3ENhxVcdUenLg4g2QKvYW9qjeNhwvpBpa4 --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getblockchainparams", "params": [] }' -H 'content-type: text/plain;' http://127.0.0.1:7440
* Rebuilt URL to: http://127.0.0.1:7440/
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to 127.0.0.1 (127.0.0.1) port 7440 (#0)
* Server auth using Basic with user 'multichainrpc'
> POST / HTTP/1.1
> Host: 127.0.0.1:7440
> Authorization: Basic bXVsdGljaGFpbnJwYzoyeVJ5WW5mRVpVM0VOaHhWY2RVZW5MZzRnMlFLdllXOXFqZU5od3ZwQnBhNA==
> User-Agent: curl/7.61.0
> Accept: */*
> content-type: text/plain;
> Content-Length: 83
> 
* upload completely sent off: 83 out of 83 bytes
< HTTP/1.1 200 OK
< Date: Sun, 04 Nov 2018 19:10:52 +0000
< Connection: close
< Content-Length: 2193
< Content-Type: application/json
< Server: bitcoin-json-rpc/v0.10.0.0-unk
< 
{"result":{"chain-protocol":"multichain","chain-description":"MultiChain DemoChain","root-stream-name":"root","root-stream-open":true,"chain-is-testnet":false,"target-block-time":15,"maximum-block-size":8388608,"default-network-port":7441,"default-rpc-port":7440,"anyone-can-connect":false,"anyone-can-send":false,"anyone-can-receive":false,"anyone-can-receive-empty":true,"anyone-can-create":false,"anyone-can-issue":false,"anyone-can-mine":false,"anyone-can-activate":false,"anyone-can-admin":false,"support-miner-precheck":true,"allow-arbitrary-outputs":false,"allow-p2sh-outputs":true,"allow-multisig-outputs":true,"setup-first-blocks":60,"mining-diversity":0.30000000,"admin-consensus-upgrade":0.50000000,"admin-consensus-admin":0.50000000,"admin-consensus-activate":0.50000000,"admin-consensus-mine":0.50000000,"admin-consensus-create":0.00000000,"admin-consensus-issue":0.00000000,"lock-admin-mine-rounds":10,"mining-requires-peers":true,"mine-empty-rounds":10.00000000,"mining-turnover":0.50000000,"first-block-reward":-1,"initial-block-reward":0,"reward-halving-interval":52560000,"reward-spendable-delay":1,"minimum-per-output":0,"maximum-per-output":100000000000000,"minimum-relay-fee":0,"native-currency-multiple":100000000,"skip-pow-check":false,"pow-minimum-bits":8,"target-adjust-freq":-1,"allow-min-difficulty-blocks":false,"only-accept-std-txs":true,"max-std-tx-size":4194304,"max-std-op-returns-count":32,"max-std-op-return-size":2097152,"max-std-op-drops-count":5,"max-std-element-size":8192,"chain-name":"DemoChain","protocol-version":10011,"network-message-start":"fde8e5f2","address-pubkeyhash-version":"006fede8","address-scripthash-version":"05f4a123","private-key-version":"802ff456","address-checksum-value":"7652d476","genesis-pubkey":"033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8","genesis-version":1,"genesis-timestamp":1540747577,"genesis-nbits":536936447,"genesis-nonce":201,"genesis-pubkey-hash":"d9072b1912e87ed2ce281356ea00728825a52291","genesis-hash":"00375d5ff8fec14d6dd3f6417e34aa050c42eb8ec0540f78df8f235a48a97586","chain-params-hash":"3e72b83375284ccd53b17b7af4a17a72d5baf74433d9cbb8120e8f7bddf7c523"},"error":null,"id":"curltest"}
* Closing connection 0

```

```json
{
    "error": null,
    "id": "curltest",
    "result": {
        "address-checksum-value": "7652d476",
        "address-pubkeyhash-version": "006fede8",
        "address-scripthash-version": "05f4a123",
        "admin-consensus-activate": 0.5,
        "admin-consensus-admin": 0.5,
        "admin-consensus-create": 0.0,
        "admin-consensus-issue": 0.0,
        "admin-consensus-mine": 0.5,
        "admin-consensus-upgrade": 0.5,
        "allow-arbitrary-outputs": false,
        "allow-min-difficulty-blocks": false,
        "allow-multisig-outputs": true,
        "allow-p2sh-outputs": true,
        "anyone-can-activate": false,
        "anyone-can-admin": false,
        "anyone-can-connect": false,
        "anyone-can-create": false,
        "anyone-can-issue": false,
        "anyone-can-mine": false,
        "anyone-can-receive": false,
        "anyone-can-receive-empty": true,
        "anyone-can-send": false,
        "chain-description": "MultiChain DemoChain",
        "chain-is-testnet": false,
        "chain-name": "DemoChain",
        "chain-params-hash": "3e72b83375284ccd53b17b7af4a17a72d5baf74433d9cbb8120e8f7bddf7c523",
        "chain-protocol": "multichain",
        "default-network-port": 7441,
        "default-rpc-port": 7440,
        "first-block-reward": -1,
        "genesis-hash": "00375d5ff8fec14d6dd3f6417e34aa050c42eb8ec0540f78df8f235a48a97586",
        "genesis-nbits": 536936447,
        "genesis-nonce": 201,
        "genesis-pubkey": "033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8",
        "genesis-pubkey-hash": "d9072b1912e87ed2ce281356ea00728825a52291",
        "genesis-timestamp": 1540747577,
        "genesis-version": 1,
        "initial-block-reward": 0,
        "lock-admin-mine-rounds": 10,
        "max-std-element-size": 8192,
        "max-std-op-drops-count": 5,
        "max-std-op-return-size": 2097152,
        "max-std-op-returns-count": 32,
        "max-std-tx-size": 4194304,
        "maximum-block-size": 8388608,
        "maximum-per-output": 100000000000000,
        "mine-empty-rounds": 10.0,
        "minimum-per-output": 0,
        "minimum-relay-fee": 0,
        "mining-diversity": 0.3,
        "mining-requires-peers": true,
        "mining-turnover": 0.5,
        "native-currency-multiple": 100000000,
        "network-message-start": "fde8e5f2",
        "only-accept-std-txs": true,
        "pow-minimum-bits": 8,
        "private-key-version": "802ff456",
        "protocol-version": 10011,
        "reward-halving-interval": 52560000,
        "reward-spendable-delay": 1,
        "root-stream-name": "root",
        "root-stream-open": true,
        "setup-first-blocks": 60,
        "skip-pow-check": false,
        "support-miner-precheck": true,
        "target-adjust-freq": -1,
        "target-block-time": 15
    }
}
```

## HELP API
```sh
DemoChain: help
{"method":"help","params":[],"id":"61813011-1541360334","chain_name":"DemoChain"}

== Blockchain ==
getbestblockhash
getblock "hash"|height ( verbose )
getblockchaininfo
getblockcount
getblockhash index
getchaintips
getdifficulty
getmempoolinfo
getrawmempool ( verbose )
gettxout "txid" n ( includemempool )
gettxoutsetinfo
listassets ( asset-identifier(s) verbose count start )
listblocks block-set-identifier ( verbose )
listpermissions ( "permission(s)" address(es) verbose )
liststreams ( stream-identifier(s) verbose count start )
listupgrades (upgrade-identifier(s))
verifychain ( checklevel numblocks )

== Control ==
clearmempool 
getblockchainparams ( displaynames with-upgrades )
getinfo
getruntimeparams 
help ( command )
pause "task(s)" 
resume "task(s)" 
setlastblock ( "hash"|height )
setruntimeparam "parameter-name" parameter-value 
stop

== Generating ==
getgenerate
gethashespersec
setgenerate generate ( genproclimit )

== Mining ==
getblocktemplate ( "jsonrequestobject" )
getmininginfo
getnetworkhashps ( blocks height )
prioritisetransaction txid priority-delta fee-delta
submitblock hexdata ( "jsonparametersobject" )

== Network ==
addnode "node" "add"|"remove"|"onetry"
getaddednodeinfo dns ( "node" )
getconnectioncount
getnettotals
getnetworkinfo
getpeerinfo
ping

== Rawtransactions ==
appendrawchange "tx-hex" "address" ( native-fee )
appendrawdata tx-hex data-hex|object 
appendrawtransaction "tx-hex" [{"txid":"id","vout":n},...] ( {"address":amount,...} [data] "action" ) 
createrawtransaction [{"txid":"id","vout":n},...] {"address":amount,...} ( [data] "action" ) 
decoderawtransaction "tx-hex"
decodescript script-hex
getrawtransaction "txid" ( verbose )
sendrawtransaction "tx-hex" ( allowhighfees )
signrawtransaction "tx-hex" ( [{"txid":"id","vout":n,"scriptPubKey":"hex","redeemScript":"hex"},...] ["privatekey1",...] sighashtype )

== Util ==
createkeypairs ( count )
createmultisig nrequired keys
estimatefee nblocks
estimatepriority nblocks
validateaddress "address"|"pubkey"|"privkey"
verifymessage "address" "signature" "message"

== Wallet ==
addmultisigaddress nrequired keys ( "account" )
appendrawexchange "hex" "txid" vout ask-assets 
approvefrom "from-address" "upgrade-identifier" ( approve )
backupwallet "destination"
combineunspent ( "address(es)" minconf maxcombines mininputs maxinputs maxtime )
completerawexchange hex txid vout ask-assets ( "data-hex"|object ) 
create "entity-type" "entity-name" open ( custom-fields )
createfrom "from-address" "entity-type" "entity-name" open ( custom-fields )
createrawexchange "txid" vout ask-assets
createrawsendfrom "from-address" {"address":amount,...} ( [data] "action" ) 
decoderawexchange "tx-hex" ( verbose )
disablerawtransaction "tx-hex"
dumpprivkey "address"
dumpwallet "filename"
encryptwallet "passphrase"
getaccount "address"
getaccountaddress "account"
getaddressbalances "address" ( minconf includeLocked ) 
getaddresses ( verbose )
getaddressesbyaccount "account"
getaddresstransaction "address" "txid" ( verbose )
getassetbalances ( "account" minconf includeWatchonly includeLocked )
getassettransaction "asset-identifier" "txid" ( verbose )
getbalance ( "account" minconf includeWatchonly )
getmultibalances ( address(es) assets minconf includeLocked includeWatchonly ) 
getnewaddress ( "account" )
getrawchangeaddress
getreceivedbyaccount "account" ( minconf )
getreceivedbyaddress "address" ( minconf )
getstreamitem "stream-identifier" "txid" ( verbose )
gettotalbalances ( minconf includeWatchonly includeLocked )
gettransaction "txid" ( includeWatchonly )
gettxoutdata "txid" vout ( count-bytes start-byte )
getunconfirmedbalance
getwalletinfo
getwallettransaction "txid" ( includeWatchonly verbose )
grant "address(es)" "permission(s)" ( native-amount startblock endblock "comment" "comment-to" )
grantfrom "from-address" "to-address(es)" "permission(s)" ( native-amount startblock endblock "comment" "comment-to" )
grantwithdata "address(es)" "permission(s)" "data-hex"|object ( native-amount startblock endblock )
grantwithdatafrom "from-address" "to-address(es)" "permission(s)" "data-hex"|object ( native-amount startblock endblock )
importaddress address(es) ( "label" rescan )
importprivkey privkey(s) ( "label" rescan )
importwallet "filename" ( rescan )
issue "address" "asset-name"|asset-params quantity ( smallest-unit native-amount custom-fields )
issuefrom "from-address" "to-address" "asset-name"|asset-params quantity ( smallest-unit native-amount custom-fields )
issuemore "address" "asset-identifier" quantity ( native-amount custom-fields )
issuemorefrom "from-address" "to-address" "asset-identifier" quantity ( native-amount custom-fields )
keypoolrefill ( newsize )
listaccounts ( minconf includeWatchonly)
listaddresses ( address(es) verbose count start ) 
listaddressgroupings
listaddresstransactions "address" ( count skip verbose )
listassettransactions "asset-identifier" ( verbose count start local-ordering )
listlockunspent
listreceivedbyaccount ( minconf includeempty includeWatchonly )
listreceivedbyaddress ( minconf includeempty includeWatchonly )
listsinceblock ( blockhash target-confirmations includeWatchonly )
liststreamblockitems "stream-identifier" block-set-identifier ( verbose count start )
liststreamitems "stream-identifier" ( verbose count start local-ordering )
liststreamkeyitems "stream-identifier" "key" ( verbose count start local-ordering )
liststreamkeys "stream-identifier" ( key(s) verbose count start local-ordering )
liststreampublisheritems "stream-identifier" "address" ( verbose count start local-ordering )
liststreampublishers "stream-identifier" ( address(es) verbose count start local-ordering )
listtransactions ( "account" count from includeWatchonly )
listunspent ( minconf maxconf addresses )
listwallettransactions ( count skip includeWatchonly verbose )
lockunspent unlock [{"txid":"txid","vout":n},...]
move "fromaccount" "toaccount" amount ( minconf "comment" )
preparelockunspent asset-quantities ( lock )
preparelockunspentfrom "from-address" asset-quantities ( lock )
publish "stream-identifier" "key" "data-hex"
publishfrom "from-address" "stream-identifier" "key" "data-hex"
resendwallettransactions
revoke "address(es)" "permission(s)" ( native-amount "comment" "comment-to" )
revokefrom "from-address" "to-address(es)" "permission(s)" ( native-amount "comment" "comment-to" )
send "address" amount|asset-quantities ( "comment" "comment-to" )
sendasset "address" "asset-identifier" asset-qty ( native-amount "comment" "comment-to" )
sendassetfrom "from-address" "to-address" "asset-identifier" asset-qty ( native-amount "comment" "comment-to" )
sendfrom "from-address" "to-address" amount|asset-quantities ( "comment" "comment-to" )
sendfromaccount "fromaccount" toaddress amount ( minconf "comment" "comment-to" )
sendmany "fromaccount" {"address":amount,...} ( minconf "comment" )
sendwithdata "address" amount|asset-quantities "data-hex"|object
sendwithdatafrom "from-address" "to-address" amount|asset-quantities "data-hex"|object
setaccount "address" "account"
settxfee amount
signmessage "address"|"privkey" "message"
subscribe entity-identifier(s) ( rescan )
unsubscribe entity-identifier(s)
walletlock
walletpassphrase "passphrase" timeout
walletpassphrasechange "oldpassphrase" "newpassphrase"
```

# Nuevas direcciones

```sh
DemoChain: help getnewaddress
{"method":"help","params":["getnewaddress"],"id":"50446007-1541359734","chain_name":"DemoChain"}

getnewaddress ( "account" )

Returns a new address for receiving payments.
If 'account' is specified (deprecated), it is added to the address book 
so payments received with the address will be credited to 'account'.

Arguments:
1. "account"                        (string, optional) The account name for the address to be linked to.
If not provided, the default account "" is used.
It can also be set to the empty string "" to represent the default account.
The account does not need to exist, it will be created if there is no account by the given name.

Result:
"address"                           (string) The new address

Examples:
> multichain-cli DemoChain getnewaddress 
> multichain-cli DemoChain getnewaddress ""
> multichain-cli DemoChain getnewaddress "myaccount"
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getnewaddress", "params": ["myaccount"] }' -H 'content-type: text/plain;' http://127.0.0.1:7440
```

```sh
DemoChain: getnewaddress "Cuenta#1"
{"method":"getnewaddress","params":["Cuenta#1"],"id":"42240681-1541360007","chain_name":"DemoChain"}

error code: -702
error message:
Accounts are not supported with scalable wallet - if you need accounts, run multichaind -walletdbversion=1 -rescan, but the wallet will perform worse
DemoChain: getnewaddress           
{"method":"getnewaddress","params":[],"id":"66527934-1541360031","chain_name":"DemoChain"}

18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT

DemoChain: listaddresses
{"method":"listaddresses","params":[],"id":"39844356-1541360083","chain_name":"DemoChain"}

[
    {
        "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
        "ismine" : true
    },
    {
        "address" : "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT",
        "ismine" : true
    }
]

DemoChain: listaddresses "*" true
{"method":"listaddresses","params":["*",true],"id":"67434186-1541361147","chain_name":"DemoChain"}

[
    {
        "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
        "ismine" : true,
        "iswatchonly" : false,
        "isscript" : false,
        "pubkey" : "033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8",
        "iscompressed" : true,
        "account" : "",
        "synchronized" : true
    },
    {
        "address" : "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT",
        "ismine" : true,
        "iswatchonly" : false,
        "isscript" : false,
        "pubkey" : "03c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9f",
        "iscompressed" : true,
        "account" : "",
        "synchronized" : true
    }
]


DemoChain: dumpprivkey "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
{"method":"dumpprivkey","params":["18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"],"id":"57131496-1541360727","chain_name":"DemoChain"}

VGeuMb2J2JMrKHBr7BCWTFkKED3RCkCFYhCUNux3wqqJFttLG6jtT5ci


```

![Imagen20](images/Imagen20.png)


![imagen21a](images/Imagen21a.png)
![imagen21b](images/Imagen21b.png)
![imagen21c](images/Imagen21c.png)
![imagen21ca](images/Imagen21ca.png)
![imagen21d](images/Imagen21d.png)
![imagen21e](images/Imagen21e.png)
![imagen21f](images/Imagen21f.png)
![imagen21g](images/Imagen21g.png)
![imagen21h](images/Imagen21h.png)
![imagen21i](images/Imagen21i.png)
![imagen21j](images/Imagen21j.png)

## Nota: Importante: no se genera una nueva entrada en `multichain.conf' 

```sh
devel1@VBXLFD271:~$ more .multichain/DemoChain/multichain.conf 
rpcuser=multichainrpc
rpcpassword=2yRyYnfEZU3ENhxVcdUenLg4g2QKvYW9qjeNhwvpBpa4
rpcport=7440

```

# Asset reissuance

## Multi-stage asset creation and metadata

[Asset reissuance](https://www.multichain.com/developers/asset-reissuance/)

## Creating the asset
Let’s begin by creating the asset to be used in this tutorial. We start by finding an address that can create assets:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain listpermissions issue
{"method":"listpermissions","params":["issue"],"id":"66623446-1541582323","chain_name":"DemoChain"}

[
    {
        "address" : "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT",
        "for" : null,
        "type" : "issue",
        "startblock" : 0,
        "endblock" : 4294967295
    },
    {
        "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
        "for" : null,
        "type" : "issue",
        "startblock" : 0,
        "endblock" : 4294967295
    }
]
devel1@VBXLFD271:~$ multichain-cli DemoChain listaddresses "*" true
{"method":"listaddresses","params":["*",true],"id":"52912472-1541582356","chain_name":"DemoChain"}

[
    {
        "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
        "ismine" : true,
        "iswatchonly" : false,
        "isscript" : false,
        "pubkey" : "033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8",
        "iscompressed" : true,
        "account" : "",
        "synchronized" : true
    },
    {
        "address" : "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT",
        "ismine" : true,
        "iswatchonly" : false,
        "isscript" : false,
        "pubkey" : "03c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9f",
        "iscompressed" : true,
        "account" : "",
        "synchronized" : true
    }
]
```

> Nota: An address is suitable if it appears in the output of the first command, and also in the second command together with `"ismine" : true.`

Now let’s issue an open asset named GBP using this address, creating 50000 asset units, each of which can be divided into 100 parts, and include some metadata. The issued units will be sent back to the same address:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain issuefrom 18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT 18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT '{"name":"GBP","open":true}' 50000 0.01 0 '{"origin":"uk", "stage":"01", "purpose":"parts prepayment"}'
{"method":"issuefrom","params":["18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT","18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT",{"name":"GBP","open":true},50000,0.01000000,0,{"origin":"uk","stage":"01","purpose":"parts prepayment"}],"id":"26002671-1541582626","chain_name":"DemoChain"}

b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a

```

![Imagen30a](images/Imagen30a.png)

![Imagen30b](images/Imagen30b.png)

![Imagen30c](images/Imagen30c.png)

![Imagen30d](images/Imagen30d.png)


Let’s take a look at the new asset:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain help listassets 
{"method":"help","params":["listassets"],"id":"26763618-1541583185","chain_name":"DemoChain"}

listassets ( asset-identifier(s) verbose count start )

Returns list of defined assets

Arguments:
1. "asset-identifier"               (string, optional) Asset identifier - one of the following: issue txid, asset reference, asset name.
 or
1. asset-identifier(s)              (array, optional) A json array of asset identifiers 
2. verbose                          (boolean, optional, default=false) If true, returns list of all issue transactions, including follow-ons 
3. count                            (number, optional, default=INT_MAX - all) The number of assets to display
4. start                            (number, optional, default=-count - last) Start from specific asset, 0 based, if negative - from the end

Result:
An array containing list of defined assets

Examples:
> multichain-cli DemoChain listassets 
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "listassets", "params": [] }' -H 'content-type: text/plain;' http://127.0.0.1:7440

devel1@VBXLFD271:~$ multichain-cli DemoChain listassets GBP true
{"method":"listassets","params":["GBP",true],"id":"89115003-1541583248","chain_name":"DemoChain"}

[
    {
        "name" : "GBP",
        "issuetxid" : "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a",
        "assetref" : "217-267-25009",
        "multiple" : 100,
        "units" : 0.01000000,
        "open" : true,
        "details" : {
            "origin" : "uk",
            "stage" : "01",
            "purpose" : "parts prepayment"
        },
        "issueqty" : 50000.00000000,
        "issueraw" : 5000000,
        "subscribed" : false,
        "issues" : [
            {
                "txid" : "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a",
                "qty" : 50000.00000000,
                "raw" : 5000000,
                "details" : {
                    "origin" : "uk",
                    "stage" : "01",
                    "purpose" : "parts prepayment"
                },
                "issuers" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ]
            }
        ]
    }
]
```

Note the `issuetxid` which matches the transaction ID displayed before, the `"open" : true` field, meaning that more units of the asset can be created in future, the details field containing the metadata we provided, and the `issueqty` issuance quantity.

We can also check the balance of this asset for this address, which should be `50000`:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain help getaddressbalances
{"method":"help","params":["getaddressbalances"],"id":"39512604-1541585734","chain_name":"DemoChain"}

getaddressbalances "address" ( minconf includeLocked ) 

Returns asset balances for specified address

Arguments:
1. "address"                        (string, required) Address to return balance for.
2. minconf                          (numeric, optional, default=1) Only include transactions confirmed at least this many times.
3. includeLocked                    (bool, optional, default=false) Also take locked outputs into account

Result:
An array of Objects with totals and details for each asset.

Examples:

The total amount in the server across all accounts
> multichain-cli DemoChain getaddressbalances "1M72Sfpbz1BPpXFHz9m3CdqATR44Jvaydd"
> multichain-cli DemoChain getaddressbalances "1M72Sfpbz1BPpXFHz9m3CdqATR44Jvaydd" 0 true
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getaddressbalances", "params": ["1M72Sfpbz1BPpXFHz9m3CdqATR44Jvaydd"] }' -H 'content-type: text/plain;' http://127.0.0.1:7440

devel1@VBXLFD271:~$ multichain-cli DemoChain getaddressbalances 18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT
{"method":"getaddressbalances","params":["18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"],"id":"35627812-1541585811","chain_name":"DemoChain"}

[
    {
        "name" : "GBP",
        "assetref" : "217-267-25009",
        "qty" : 50000.00000000
    }
]


```

## Issuing more asset units
Now we’ll issue some more units of the same asset. First, let’s create a new address which will receive the new units:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain getnewaddress
{"method":"getnewaddress","params":[],"id":"47704622-1541585920","chain_name":"DemoChain"}

15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3

```

We need to grant this address the permission to receive (and later, send) transactions:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain grant 15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3 receive,send
{"method":"grant","params":["15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3","receive,send"],"id":"28425625-1541586002","chain_name":"DemoChain"}

d90ca98b99265307cdf8d73a8e0dc73e338890011968bf9dc5348e532c0c3565
```

Now we’re ready to issue `25000` more units of GBP to this new address, with some additional metadata:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain issuemorefrom 18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT 15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3 GBP 25000 0 '{"origin":"europe", "stage":"02", "approval":"department"}'
{"method":"issuemorefrom","params":["18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT","15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3","GBP",25000,0,{"origin":"europe","stage":"02","approval":"department"}],"id":"28919335-1541586104","chain_name":"DemoChain"}

3b117ce4a04585572d36cb231a0cf3cf81c041637ef63e9042f1777f38133f89

```

![Imagen31a](images/Imagen31a.png)

![Imagen31b](images/Imagen31b.png)

![Imagen31c](images/Imagen31c.png)

![Imagen31d](images/Imagen31d.png)


```json
{
  "blockhash": "00ac146c77db27c731856f3bd117ca33255928f1dc45c2293c5d1e53eacca866", 
  "blocktime": 1541582643, 
  "confirmations": 32, 
  "data": [], 
  "hex": "0100000001d15ffe18f65eab2a11e517b30a2da936bfd9a104606580064978bbdba3d47e39010000006a47304402206887ad99113774730cbd68a1c772f3e5f77b1fe63e241aa149937080b85f37ae02205f8dc1ebe7c36836a1b731c0e35fc056a0b84d8fe2d6f9c38eeb859bab823d43012103c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9fffffffff0300000000000000002776a9143aaa622500ef363a9697343cd268c21da3de8b3988ac0c73706b67404b4c0000000000750000000000000000454273706b6e0100010347425000410464000000000201016f726967696e0002756b737461676500023031707572706f736500107061727473207072657061796d656e74756a00000000000000001976a9143aaa622500ef363a9697343cd268c21da3de8b3988ac00000000", 
  "issue": {
    "details": {
      "origin": "uk", 
      "purpose": "parts prepayment", 
      "stage": "01"
    }, 
    "multiple": 100, 
    "name": "GBP", 
    "open": true, 
    "type": "issuefirst"
  }, 
  "locktime": 0, 
  "time": 1541582643, 
  "txid": "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a", 
  "version": 1, 
  "vin": [
    {
      "scriptSig": {
        "asm": "304402206887ad99113774730cbd68a1c772f3e5f77b1fe63e241aa149937080b85f37ae02205f8dc1ebe7c36836a1b731c0e35fc056a0b84d8fe2d6f9c38eeb859bab823d4301 03c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9f", 
        "hex": "47304402206887ad99113774730cbd68a1c772f3e5f77b1fe63e241aa149937080b85f37ae02205f8dc1ebe7c36836a1b731c0e35fc056a0b84d8fe2d6f9c38eeb859bab823d43012103c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9f"
      }, 
      "sequence": 4294967295, 
      "txid": "397ed4a3dbbb78490680656004a1d9bf36a92d0ab317e5112aab5ef618fe5fd1", 
      "vout": 1
    }
  ], 
  "vout": [
    {
      "assets": [
        {
          "assetref": "217-267-25009", 
          "issuetxid": "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a", 
          "name": "GBP", 
          "qty": 50000.0, 
          "raw": 5000000, 
          "type": "issuefirst"
        }
      ], 
      "items": [], 
      "n": 0, 
      "permissions": [], 
      "scriptPubKey": {
        "addresses": [
          "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
        ], 
        "asm": "OP_DUP OP_HASH160 3aaa622500ef363a9697343cd268c21da3de8b39 OP_EQUALVERIFY OP_CHECKSIG 73706b67404b4c0000000000 OP_DROP", 
        "hex": "76a9143aaa622500ef363a9697343cd268c21da3de8b3988ac0c73706b67404b4c000000000075", 
        "reqSigs": 1, 
        "type": "pubkeyhash"
      }, 
      "value": 0.0
    }, 
    {
      "assets": [], 
      "items": [], 
      "n": 1, 
      "permissions": [], 
      "scriptPubKey": {
        "asm": "73706b6e0100010347425000410464000000000201016f726967696e0002756b737461676500023031707572706f736500107061727473207072657061796d656e74 OP_DROP OP_RETURN", 
        "hex": "4273706b6e0100010347425000410464000000000201016f726967696e0002756b737461676500023031707572706f736500107061727473207072657061796d656e74756a", 
        "type": "nulldata"
      }, 
      "value": 0.0
    }, 
    {
      "assets": [], 
      "items": [], 
      "n": 2, 
      "permissions": [], 
      "scriptPubKey": {
        "addresses": [
          "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
        ], 
        "asm": "OP_DUP OP_HASH160 3aaa622500ef363a9697343cd268c21da3de8b39 OP_EQUALVERIFY OP_CHECKSIG", 
        "hex": "76a9143aaa622500ef363a9697343cd268c21da3de8b3988ac", 
        "reqSigs": 1, 
        "type": "pubkeyhash"
      }, 
      "value": 0.0
    }
  ]
}
```

![Imagen31e](images/Imagen31e.png)

![Imagen31f](images/Imagen31f.png)

> NOTA: VER en la casilla `To address` la dirección del `receptor` o `asset holder`

Now let’s check our asset’s status:

devel1@VBXLFD271:~$ multichain-cli DemoChain listassets GBP
{"method":"listassets","params":["GBP"],"id":"49573268-1541586964","chain_name":"DemoChain"}

[
    {
        "name" : "GBP",
        "issuetxid" : "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a",
        "assetref" : "217-267-25009",
        "multiple" : 100,
        "units" : 0.01000000,
        "open" : true,
        "details" : {
            "origin" : "uk",
            "stage" : "01",
            "purpose" : "parts prepayment"
        },
        "issueqty" : 75000.00000000,
        "issueraw" : 7500000,
        "subscribed" : false
    }
]
```

Note the increased `issueqty` field, but the metadata shown is still for the original issuance only. For more details:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain listassets GBP true
{"method":"listassets","params":["GBP",true],"id":"77668068-1541586972","chain_name":"DemoChain"}

[
    {
        "name" : "GBP",
        "issuetxid" : "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a",
        "assetref" : "217-267-25009",
        "multiple" : 100,
        "units" : 0.01000000,
        "open" : true,
        "details" : {
            "origin" : "uk",
            "stage" : "01",
            "purpose" : "parts prepayment"
        },
        "issueqty" : 75000.00000000,
        "issueraw" : 7500000,
        "subscribed" : false,
        "issues" : [
            {
                "txid" : "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a",
                "qty" : 50000.00000000,
                "raw" : 5000000,
                "details" : {
                    "origin" : "uk",
                    "stage" : "01",
                    "purpose" : "parts prepayment"
                },
                "issuers" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ]
            },
            {
                "txid" : "3b117ce4a04585572d36cb231a0cf3cf81c041637ef63e9042f1777f38133f89",
                "qty" : 25000.00000000,
                "raw" : 2500000,
                "details" : {
                    "origin" : "europe",
                    "stage" : "02",
                    "approval" : "department"
                },
                "issuers" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ]
            }
        ]
    }
]
```

This includes an `issues` array that provides details of each individual issuance for this asset. For each element in the array, the txid transaction ID is shown, along with the quantity in qty and the metadata details of that issuance.

We can also view the new asset’s balance for both addresses:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain getmultibalances "*" GBP
{"method":"getmultibalances","params":["*","GBP"],"id":"89868477-1541587217","chain_name":"DemoChain"}

{
    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 25000.00000000
        }
    ],
    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 50000.00000000
        }
    ],
    "total" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 75000.00000000
        }
    ]
}
```

This should show `50000` units for `18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT`, `25000` units for `15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3`, and a `total` of `75000` units.

## Granting issue permissions

In this stage we’ll give other addresses the permission to issue more units of the asset. Let’s begin by seeing the current asset permissions:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain listpermissions GBP.*
{"method":"listpermissions","params":["GBP.*"],"id":"22195651-1541587410","chain_name":"DemoChain"}

[
    {
        "address" : "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT",
        "for" : {
            "type" : "asset",
            "name" : "GBP",
            "assetref" : "217-267-25009"
        },
        "type" : "admin",
        "startblock" : 0,
        "endblock" : 4294967295
    },
    {
        "address" : "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT",
        "for" : {
            "type" : "asset",
            "name" : "GBP",
            "assetref" : "217-267-25009"
        },
        "type" : "issue",
        "startblock" : 0,
        "endblock" : 4294967295
    }
]
```

The issuing address `18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT` should have two permissions for the asset. The issue permission allows it to issue more units of the asset, and the `admin` permission allows it to control the permissions of other addresses for this asset.

Now let’s try issuing more units of the asset `from the second address` (`15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3`) (to itself):

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain issuemorefrom 15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3 15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3 GBP 15000 0
{"method":"issuemorefrom","params":["15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3","15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3","GBP",15000,0],"id":"44045137-1541587569","chain_name":"DemoChain"}

error code: -704
error message:
Issuing more units for this asset is not allowed from this address
```

An error should be displayed, indicating that this address does not have permission to issue more units. So let’s use the first address to grant them:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain grantfrom 18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT 15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3 GBP.issue
{"method":"grantfrom","params":["18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT","15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3","GBP.issue"],"id":"22934515-1541587651","chain_name":"DemoChain"}

e6d8e7218e938bad049c1f276d27724bdc03e4ad25727887a06de721f89c2f29

```

Let’s check that the permission change was applied:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain listpermissions GBP.issue
{"method":"listpermissions","params":["GBP.issue"],"id":"86423965-1541587714","chain_name":"DemoChain"}

[
    {
        "address" : "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3",
        "for" : {
            "type" : "asset",
            "name" : "GBP",
            "assetref" : "217-267-25009"
        },
        "type" : "issue",
        "startblock" : 0,
        "endblock" : 4294967295
    },
    {
        "address" : "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT",
        "for" : {
            "type" : "asset",
            "name" : "GBP",
            "assetref" : "217-267-25009"
        },
        "type" : "issue",
        "startblock" : 0,
        "endblock" : 4294967295
    }
]

```

Both addresses should now be displayed

![Imagen32a](images/Imagen32a.png)

![Imagen32b](images/Imagen32b.png)

![Imagen32c](images/Imagen32c.png)


```json
{
  "blockhash": "00ac146c77db27c731856f3bd117ca33255928f1dc45c2293c5d1e53eacca866", 
  "blocktime": 1541582643, 
  "confirmations": 44, 
  "data": [], 
  "hex": "0100000001d15ffe18f65eab2a11e517b30a2da936bfd9a104606580064978bbdba3d47e39010000006a47304402206887ad99113774730cbd68a1c772f3e5f77b1fe63e241aa149937080b85f37ae02205f8dc1ebe7c36836a1b731c0e35fc056a0b84d8fe2d6f9c38eeb859bab823d43012103c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9fffffffff0300000000000000002776a9143aaa622500ef363a9697343cd268c21da3de8b3988ac0c73706b67404b4c0000000000750000000000000000454273706b6e0100010347425000410464000000000201016f726967696e0002756b737461676500023031707572706f736500107061727473207072657061796d656e74756a00000000000000001976a9143aaa622500ef363a9697343cd268c21da3de8b3988ac00000000", 
  "issue": {
    "details": {
      "origin": "uk", 
      "purpose": "parts prepayment", 
      "stage": "01"
    }, 
    "multiple": 100, 
    "name": "GBP", 
    "open": true, 
    "type": "issuefirst"
  }, 
  "locktime": 0, 
  "time": 1541582643, 
  "txid": "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a", 
  "version": 1, 
  "vin": [
    {
      "scriptSig": {
        "asm": "304402206887ad99113774730cbd68a1c772f3e5f77b1fe63e241aa149937080b85f37ae02205f8dc1ebe7c36836a1b731c0e35fc056a0b84d8fe2d6f9c38eeb859bab823d4301 03c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9f", 
        "hex": "47304402206887ad99113774730cbd68a1c772f3e5f77b1fe63e241aa149937080b85f37ae02205f8dc1ebe7c36836a1b731c0e35fc056a0b84d8fe2d6f9c38eeb859bab823d43012103c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9f"
      }, 
      "sequence": 4294967295, 
      "txid": "397ed4a3dbbb78490680656004a1d9bf36a92d0ab317e5112aab5ef618fe5fd1", 
      "vout": 1
    }
  ], 
  "vout": [
    {
      "assets": [
        {
          "assetref": "217-267-25009", 
          "issuetxid": "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a", 
          "name": "GBP", 
          "qty": 50000.0, 
          "raw": 5000000, 
          "type": "issuefirst"
        }
      ], 
      "items": [], 
      "n": 0, 
      "permissions": [], 
      "scriptPubKey": {
        "addresses": [
          "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
        ], 
        "asm": "OP_DUP OP_HASH160 3aaa622500ef363a9697343cd268c21da3de8b39 OP_EQUALVERIFY OP_CHECKSIG 73706b67404b4c0000000000 OP_DROP", 
        "hex": "76a9143aaa622500ef363a9697343cd268c21da3de8b3988ac0c73706b67404b4c000000000075", 
        "reqSigs": 1, 
        "type": "pubkeyhash"
      }, 
      "value": 0.0
    }, 
    {
      "assets": [], 
      "items": [], 
      "n": 1, 
      "permissions": [], 
      "scriptPubKey": {
        "asm": "73706b6e0100010347425000410464000000000201016f726967696e0002756b737461676500023031707572706f736500107061727473207072657061796d656e74 OP_DROP OP_RETURN", 
        "hex": "4273706b6e0100010347425000410464000000000201016f726967696e0002756b737461676500023031707572706f736500107061727473207072657061796d656e74756a", 
        "type": "nulldata"
      }, 
      "value": 0.0
    }, 
    {
      "assets": [], 
      "items": [], 
      "n": 2, 
      "permissions": [], 
      "scriptPubKey": {
        "addresses": [
          "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
        ], 
        "asm": "OP_DUP OP_HASH160 3aaa622500ef363a9697343cd268c21da3de8b39 OP_EQUALVERIFY OP_CHECKSIG", 
        "hex": "76a9143aaa622500ef363a9697343cd268c21da3de8b3988ac", 
        "reqSigs": 1, 
        "type": "pubkeyhash"
      }, 
      "value": 0.0
    }
  ]
}
```

![Imagen32d](images/Imagen32d.png)

As both addresses have issue permissions, so let’s try the reissuance from the second address again:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain issuemorefrom 15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3 15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3 GBP 15000 0
{"method":"issuemorefrom","params":["15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3","15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3","GBP",15000,0],"id":"48023261-1541588255","chain_name":"DemoChain"}

464196be7d676a0d236ba6eb9dc7298803eb9183204605e6a16bb3bca1f8ec29

```


This time a transaction ID should be shown instead of an error. Let’s look at all issuances of the asset so far:

![Imagen33a](images/Imagen33a.png)

![Imagen33b](images/Imagen33b.png)

![Imagen33c](images/Imagen33c.png)

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain listassets GBP true
{"method":"listassets","params":["GBP",true],"id":"49913416-1541588530","chain_name":"DemoChain"}

[
    {
        "name" : "GBP",
        "issuetxid" : "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a",
        "assetref" : "217-267-25009",
        "multiple" : 100,
        "units" : 0.01000000,
        "open" : true,
        "details" : {
            "origin" : "uk",
            "stage" : "01",
            "purpose" : "parts prepayment"
        },
        "issueqty" : 90000.00000000,
        "issueraw" : 9000000,
        "subscribed" : false,
        "issues" : [
            {
                "txid" : "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a",
                "qty" : 50000.00000000,
                "raw" : 5000000,
                "details" : {
                    "origin" : "uk",
                    "stage" : "01",
                    "purpose" : "parts prepayment"
                },
                "issuers" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ]
            },
            {
                "txid" : "3b117ce4a04585572d36cb231a0cf3cf81c041637ef63e9042f1777f38133f89",
                "qty" : 25000.00000000,
                "raw" : 2500000,
                "details" : {
                    "origin" : "europe",
                    "stage" : "02",
                    "approval" : "department"
                },
                "issuers" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ]
            },
            {
                "txid" : "464196be7d676a0d236ba6eb9dc7298803eb9183204605e6a16bb3bca1f8ec29",
                "qty" : 15000.00000000,
                "raw" : 1500000,
                "details" : {
                },
                "issuers" : [
                    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3"
                ]
            }
        ]
    }
]

devel1@VBXLFD271:~$ multichain-cli DemoChain getmultibalances "*" GBP
{"method":"getmultibalances","params":["*","GBP"],"id":"77447057-1541588643","chain_name":"DemoChain"}

{
    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 40000.00000000
        }
    ],
    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 50000.00000000
        }
    ],
    "total" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 90000.00000000
        }
    ]
}

```

Note that `three issuances` are now shown, with `the third` showing an `empty details field` (since no metadata was passed to the issuemorefrom command) and a different address in the issuers field from the first two.

```json
                "details" : {
                },
                "issuers" : [
                    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3"
                ]
```

![Imagen34a](images/Imagen34a.png)

![Imagen34b](images/Imagen34b.png)

```json
{
  "blockhash": "00ac146c77db27c731856f3bd117ca33255928f1dc45c2293c5d1e53eacca866", 
  "blocktime": 1541582643, 
  "confirmations": 55, 
  "data": [], 
  "hex": "0100000001d15ffe18f65eab2a11e517b30a2da936bfd9a104606580064978bbdba3d47e39010000006a47304402206887ad99113774730cbd68a1c772f3e5f77b1fe63e241aa149937080b85f37ae02205f8dc1ebe7c36836a1b731c0e35fc056a0b84d8fe2d6f9c38eeb859bab823d43012103c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9fffffffff0300000000000000002776a9143aaa622500ef363a9697343cd268c21da3de8b3988ac0c73706b67404b4c0000000000750000000000000000454273706b6e0100010347425000410464000000000201016f726967696e0002756b737461676500023031707572706f736500107061727473207072657061796d656e74756a00000000000000001976a9143aaa622500ef363a9697343cd268c21da3de8b3988ac00000000", 
  "issue": {
    "details": {
      "origin": "uk", 
      "purpose": "parts prepayment", 
      "stage": "01"
    }, 
    "multiple": 100, 
    "name": "GBP", 
    "open": true, 
    "type": "issuefirst"
  }, 
  "locktime": 0, 
  "time": 1541582643, 
  "txid": "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a", 
  "version": 1, 
  "vin": [
    {
      "scriptSig": {
        "asm": "304402206887ad99113774730cbd68a1c772f3e5f77b1fe63e241aa149937080b85f37ae02205f8dc1ebe7c36836a1b731c0e35fc056a0b84d8fe2d6f9c38eeb859bab823d4301 03c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9f", 
        "hex": "47304402206887ad99113774730cbd68a1c772f3e5f77b1fe63e241aa149937080b85f37ae02205f8dc1ebe7c36836a1b731c0e35fc056a0b84d8fe2d6f9c38eeb859bab823d43012103c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9f"
      }, 
      "sequence": 4294967295, 
      "txid": "397ed4a3dbbb78490680656004a1d9bf36a92d0ab317e5112aab5ef618fe5fd1", 
      "vout": 1
    }
  ], 
  "vout": [
    {
      "assets": [
        {
          "assetref": "217-267-25009", 
          "issuetxid": "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a", 
          "name": "GBP", 
          "qty": 50000.0, 
          "raw": 5000000, 
          "type": "issuefirst"
        }
      ], 
      "items": [], 
      "n": 0, 
      "permissions": [], 
      "scriptPubKey": {
        "addresses": [
          "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
        ], 
        "asm": "OP_DUP OP_HASH160 3aaa622500ef363a9697343cd268c21da3de8b39 OP_EQUALVERIFY OP_CHECKSIG 73706b67404b4c0000000000 OP_DROP", 
        "hex": "76a9143aaa622500ef363a9697343cd268c21da3de8b3988ac0c73706b67404b4c000000000075", 
        "reqSigs": 1, 
        "type": "pubkeyhash"
      }, 
      "value": 0.0
    }, 
    {
      "assets": [], 
      "items": [], 
      "n": 1, 
      "permissions": [], 
      "scriptPubKey": {
        "asm": "73706b6e0100010347425000410464000000000201016f726967696e0002756b737461676500023031707572706f736500107061727473207072657061796d656e74 OP_DROP OP_RETURN", 
        "hex": "4273706b6e0100010347425000410464000000000201016f726967696e0002756b737461676500023031707572706f736500107061727473207072657061796d656e74756a", 
        "type": "nulldata"
      }, 
      "value": 0.0
    }, 
    {
      "assets": [], 
      "items": [], 
      "n": 2, 
      "permissions": [], 
      "scriptPubKey": {
        "addresses": [
          "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
        ], 
        "asm": "OP_DUP OP_HASH160 3aaa622500ef363a9697343cd268c21da3de8b39 OP_EQUALVERIFY OP_CHECKSIG", 
        "hex": "76a9143aaa622500ef363a9697343cd268c21da3de8b3988ac", 
        "reqSigs": 1, 
        "type": "pubkeyhash"
      }, 
      "value": 0.0
    }
  ]
}
```

## Metadata-only issuance

Finally let’s see an example of a reissuance whose sole purpose is to add some metadata to the asset, and not create any new units. This is achieved simply by passing zero for the quantity parameter:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain issuemorefrom 18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT 18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT GBP 0 0 '{"approval":"head office"}'
{"method":"issuemorefrom","params":["18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT","18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT","GBP",0,0,{"approval":"head office"}],"id":"83799643-1541597789","chain_name":"DemoChain"}

65f8b3971f3451a171dd549b3a6a8617a531b38897775d1d4f73c95af3a1c310

```

![Imagen35a](images/Imagen35a.png)

![Imagen35b](images/Imagen35b.png)

![Imagen35c](images/Imagen35c.png)

![Imagen35d](images/Imagen35d.png)

![Imagen35e](images/Imagen35e.png)

![Imagen35f](images/Imagen35f.png)

The metadata-only issuance event can be viewed here:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain listassets GBP true
{"method":"listassets","params":["GBP",true],"id":"19162107-1541598390","chain_name":"DemoChain"}

[
    {
        "name" : "GBP",
        "issuetxid" : "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a",
        "assetref" : "217-267-25009",
        "multiple" : 100,
        "units" : 0.01000000,
        "open" : true,
        "details" : {
            "origin" : "uk",
            "stage" : "01",
            "purpose" : "parts prepayment"
        },
        "issueqty" : 90000.00000000,
        "issueraw" : 9000000,
        "subscribed" : false,
        "issues" : [
            {
                "txid" : "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a",
                "qty" : 50000.00000000,
                "raw" : 5000000,
                "details" : {
                    "origin" : "uk",
                    "stage" : "01",
                    "purpose" : "parts prepayment"
                },
                "issuers" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ]
            },
            {
                "txid" : "3b117ce4a04585572d36cb231a0cf3cf81c041637ef63e9042f1777f38133f89",
                "qty" : 25000.00000000,
                "raw" : 2500000,
                "details" : {
                    "origin" : "europe",
                    "stage" : "02",
                    "approval" : "department"
                },
                "issuers" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ]
            },
            {
                "txid" : "464196be7d676a0d236ba6eb9dc7298803eb9183204605e6a16bb3bca1f8ec29",
                "qty" : 15000.00000000,
                "raw" : 1500000,
                "details" : {
                },
                "issuers" : [
                    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3"
                ]
            },
            {
                "txid" : "65f8b3971f3451a171dd549b3a6a8617a531b38897775d1d4f73c95af3a1c310",
                "qty" : 0.00000000,
                "raw" : 0,
                "details" : {
                    "approval" : "head office"
                },
                "issuers" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ]
            }
        ]
    }
]

```

## Where to go from here

Congratulations! You have successfully created a new asset, with multiple issuance events and associated metadata. In a similar way to assets, streams can also be created with custom metadata, but in this case there is no notion of a follow-on event.

### 1) Subscribing to an asset using the `subscribe` command, then using `listassettransactions` and `getassettransaction` to query the full list of that asset’s transactions, whether or not they involve an address in this node’s wallet.

En nodo 1:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain help subscribe
{"method":"help","params":["subscribe"],"id":"62256747-1541598745","chain_name":"DemoChain"}

subscribe entity-identifier(s) ( rescan )

Subscribes to the stream.

Arguments:
1. "stream-identifier"              (string, required) Stream identifier - one of the following: stream txid, stream reference, stream name.
 or
1. "asset-identifier"               (string, required) Asset identifier - one of the following: asset txid, asset reference, asset name.
 or
1. entity-identifier(s)             (array, optional) A json array of stream or asset identifiers 
2. rescan                           (boolean, optional, default=true) Rescan the wallet for transactions

Note: This call can take minutes to complete if rescan is true.

Result:

Examples:

Subscribe to the stream with rescan
> multichain-cli DemoChain subscribe "test-stream"

Subscribe to the stream without rescan
> multichain-cli DemoChain subscribe "test-stream" false

As a JSON-RPC call
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "subscribe", "params": ["test-stream", false] }' -H 'content-type: text/plain;' http://127.0.0.1:7440


devel1@VBXLFD271:~$ multichain-cli DemoChain help listassettransactions 
{"method":"help","params":["listassettransactions"],"id":"76388538-1541598990","chain_name":"DemoChain"}

listassettransactions "asset-identifier" ( verbose count start local-ordering )

Lists transactions involving asset.

Arguments:
1. "asset-identifier"               (string, required) Asset identifier - one of the following: asset txid, asset reference, asset name.
2. verbose                          (boolean, optional, default=false) If true, returns information about transaction 
3. count                            (number, optional, default=10) The number of transactions to display
4. start                            (number, optional, default=-count - last) Start from specific transaction, 0 based, if negative - from the end
5. local-ordering                   (boolean, optional, default=false) If true, transactions appear in the order they were processed by the wallet,
                                                                       if false - in the order they appear in blockchain

Result:
"stream-items"                      (array) List of transactions.

Examples:
> multichain-cli DemoChain listassettransactions "test-asset"
> multichain-cli DemoChain listassettransactions "test-asset" true 10 100
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "listassettransactions", "params": ["test-asset", false, 20] }' -H 'content-type: text/plain;' http://127.0.0.1:7440

```

Probamos en nodo 1 `listassettransactions` sin antes subscribirme a el `asset`

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain listassettransactions GBP true
{"method":"listassettransactions","params":["GBP",true],"id":"69633991-1541598863","chain_name":"DemoChain"}

error code: -703
error message:
Not subscribed to this asset
```

Nos subscribimos al asset `GBP` (with rescan) en nodo 1
```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain subscribe "GBP" true
{"method":"subscribe","params":["GBP",true],"id":"15070639-1541599202","chain_name":"DemoChain"}

```

Probamos nuevament en nodo 1 `listassettransactions`:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain subscribe "GBP" true
{"method":"subscribe","params":["GBP",true],"id":"15070639-1541599202","chain_name":"DemoChain"}

devel1@VBXLFD271:~$ multichain-cli DemoChain listassettransactions GBP true
{"method":"listassettransactions","params":["GBP",true],"id":"75453070-1541599271","chain_name":"DemoChain"}

[
    {
        "addresses" : {
            "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : 50000.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 66,
        "blockhash" : "00ac146c77db27c731856f3bd117ca33255928f1dc45c2293c5d1e53eacca866",
        "blockindex" : 1,
        "blocktime" : 1541582643,
        "txid" : "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a",
        "valid" : true,
        "time" : 1541582626,
        "timereceived" : 1541582626,
        "vin" : [
            {
                "txid" : "397ed4a3dbbb78490680656004a1d9bf36a92d0ab317e5112aab5ef618fe5fd1",
                "vout" : 1,
                "addresses" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ],
                "type" : "pubkeyhash",
                "ismine" : true,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ]
            }
        ],
        "vout" : [
            {
                "n" : 0,
                "addresses" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ],
                "type" : "pubkeyhash",
                "ismine" : true,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                    {
                        "name" : "GBP",
                        "assetref" : "217-267-25009",
                        "qty" : 50000.00000000,
                        "type" : "issuefirst"
                    }
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            },
            {
                "n" : 1,
                "addresses" : [
                ],
                "type" : "nulldata",
                "ismine" : false,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            },
            {
                "n" : 2,
                "addresses" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ],
                "type" : "pubkeyhash",
                "ismine" : true,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            }
        ],
        "hex" : "0100000001d15ffe18f65eab2a11e517b30a2da936bfd9a104606580064978bbdba3d47e39010000006a47304402206887ad99113774730cbd68a1c772f3e5f77b1fe63e241aa149937080b85f37ae02205f8dc1ebe7c36836a1b731c0e35fc056a0b84d8fe2d6f9c38eeb859bab823d43012103c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9fffffffff0300000000000000002776a9143aaa622500ef363a9697343cd268c21da3de8b3988ac0c73706b67404b4c0000000000750000000000000000454273706b6e0100010347425000410464000000000201016f726967696e0002756b737461676500023031707572706f736500107061727473207072657061796d656e74756a00000000000000001976a9143aaa622500ef363a9697343cd268c21da3de8b3988ac00000000"
    },
    {
        "addresses" : {
            "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" : 25000.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 44,
        "blockhash" : "000872cee4372756a538d353c3f23b707f220e901951e313e15a38ca01da3589",
        "blockindex" : 1,
        "blocktime" : 1541586127,
        "txid" : "3b117ce4a04585572d36cb231a0cf3cf81c041637ef63e9042f1777f38133f89",
        "valid" : true,
        "time" : 1541586104,
        "timereceived" : 1541586104,
        "vin" : [
            {
                "txid" : "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a",
                "vout" : 2,
                "addresses" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ],
                "type" : "pubkeyhash",
                "ismine" : true,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ]
            }
        ],
        "vout" : [
            {
                "n" : 0,
                "addresses" : [
                    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3"
                ],
                "type" : "pubkeyhash",
                "ismine" : true,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                    {
                        "name" : "GBP",
                        "assetref" : "217-267-25009",
                        "qty" : 25000.00000000,
                        "type" : "issuemore"
                    }
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            },
            {
                "n" : 1,
                "addresses" : [
                ],
                "type" : "nulldata",
                "ismine" : false,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            },
            {
                "n" : 2,
                "addresses" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ],
                "type" : "pubkeyhash",
                "ismine" : true,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            }
        ],
        "hex" : "01000000014a02362fdd13ca61927cd46a946595bde183ef5762110b442ab2da826a0f61b1020000006a47304402207ba2ab505f6ab4464dcac785baf5f4846e5be42cb8b3f91425af606d26ac22cc02206fde045eeaf068453dbc3552729f0818ecf50df115616e192b1b68e0490abdbb012103c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9fffffffff0300000000000000003776a9142291d2bc7aee4c4c591bfcd98d3364f5dd8cb61688ac1c73706b6fe183ef5762110b442ab2da826a0f61b1a025260000000000750000000000000000491473706b65e183ef5762110b442ab2da826a0f61b1753073706b75016f726967696e00066575726f7065737461676500023032617070726f76616c000a6465706172746d656e74756a00000000000000001976a9143aaa622500ef363a9697343cd268c21da3de8b3988ac00000000"
    },
    {
        "addresses" : {
            "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" : 15000.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 22,
        "blockhash" : "00341fe461262a3e671d8b13f8177eca8898184ae2df4b5d6cf1c2470fc56cd7",
        "blockindex" : 1,
        "blocktime" : 1541588274,
        "txid" : "464196be7d676a0d236ba6eb9dc7298803eb9183204605e6a16bb3bca1f8ec29",
        "valid" : true,
        "time" : 1541588255,
        "timereceived" : 1541588255,
        "vin" : [
            {
                "txid" : "e6d8e7218e938bad049c1f276d27724bdc03e4ad25727887a06de721f89c2f29",
                "vout" : 0,
                "addresses" : [
                    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3"
                ],
                "type" : "pubkeyhash",
                "ismine" : true,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ]
            }
        ],
        "vout" : [
            {
                "n" : 0,
                "addresses" : [
                    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3"
                ],
                "type" : "pubkeyhash",
                "ismine" : true,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                    {
                        "name" : "GBP",
                        "assetref" : "217-267-25009",
                        "qty" : 15000.00000000,
                        "type" : "issuemore"
                    }
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            },
            {
                "n" : 1,
                "addresses" : [
                    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3"
                ],
                "type" : "pubkeyhash",
                "ismine" : true,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            }
        ],
        "hex" : "0100000001292f9cf821e76da087787225ade403dc4b72276d271f9c04ad8b938e21e7d8e6000000006a4730440220406150e31e6b26855c9122a09bf3d1aa993795fa218f37975cadf0bfdd1d763d022000c3c9775bfd880cafde2e44934ef5d11297ab7fc26aab76c46985046087e13a0121030b57a7bdc3fa4714717fa4eeebd067051a4728b1ac5dbf6a6ac4cdfd55a4459fffffffff0200000000000000003776a9142291d2bc7aee4c4c591bfcd98d3364f5dd8cb61688ac1c73706b6fe183ef5762110b442ab2da826a0f61b160e31600000000007500000000000000001976a9142291d2bc7aee4c4c591bfcd98d3364f5dd8cb61688ac00000000"
    },
    {
        "addresses" : {
            "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : 0.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 11,
        "blockhash" : "00f7715590cc142ebb8865242b5cfc84832483d776a4b4c2b286bce11199d210",
        "blockindex" : 1,
        "blocktime" : 1541597810,
        "txid" : "65f8b3971f3451a171dd549b3a6a8617a531b38897775d1d4f73c95af3a1c310",
        "valid" : true,
        "time" : 1541597789,
        "timereceived" : 1541597789,
        "vin" : [
            {
                "txid" : "e6d8e7218e938bad049c1f276d27724bdc03e4ad25727887a06de721f89c2f29",
                "vout" : 1,
                "addresses" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ],
                "type" : "pubkeyhash",
                "ismine" : true,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ]
            }
        ],
        "vout" : [
            {
                "n" : 0,
                "addresses" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ],
                "type" : "pubkeyhash",
                "ismine" : true,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            },
            {
                "n" : 1,
                "addresses" : [
                ],
                "type" : "nulldata",
                "ismine" : false,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            },
            {
                "n" : 2,
                "addresses" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ],
                "type" : "pubkeyhash",
                "ismine" : true,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            }
        ],
        "hex" : "0100000001292f9cf821e76da087787225ade403dc4b72276d271f9c04ad8b938e21e7d8e6010000006a47304402205fa0af0c6fe1378ac191e1c1f02b4ca79f9d1bdfe4f8121f3051ca7c4920dad9022057ee2417ef974c87c33e9be761e53c15a640d8e83150cde060cea78ec15dd32e012103c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9fffffffff0300000000000000003776a9143aaa622500ef363a9697343cd268c21da3de8b3988ac1c73706b6fe183ef5762110b442ab2da826a0f61b10000000000000000750000000000000000331473706b65e183ef5762110b442ab2da826a0f61b1751a73706b7501617070726f76616c000b68656164206f6666696365756a00000000000000001976a9143aaa622500ef363a9697343cd268c21da3de8b3988ac00000000"
    }
]

```

Usando ahora `getassettransaction` en nodo 1:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain help getassettransaction
{"method":"help","params":["getassettransaction"],"id":"66505907-1541599465","chain_name":"DemoChain"}

getassettransaction "asset-identifier" "txid" ( verbose )

Retrieves a specific transaction txid involving asset.

Arguments:
1. "asset-identifier"               (string, required) Asset identifier - one of the following: asset txid, asset reference, asset name.
2. "txid"                           (string, required) The transaction id
3. verbose                          (boolean, optional, default=false) If true, returns information about item transaction 

Result:
"transaction"                       (object) Information about an individual transaction from the perspective of a particular asset.

Examples:
> multichain-cli DemoChain getassettransaction "myasset" "mytxid"
> multichain-cli DemoChain getassettransaction "myasset" "mytxid"  true
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getassettransaction", "params": ["myasset", "mytxid", false] }' -H 'content-type: text/plain;' http://127.0.0.1:7440


devel1@VBXLFD271:~$ multichain-cli DemoChain getassettransaction "GBP" "464196be7d676a0d236ba6eb9dc7298803eb9183204605e6a16bb3bca1f8ec29"  true
{"method":"getassettransaction","params":["GBP","464196be7d676a0d236ba6eb9dc7298803eb9183204605e6a16bb3bca1f8ec29",true],"id":"99258538-1541599631","chain_name":"DemoChain"}

{
    "addresses" : {
        "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" : 15000.00000000
    },
    "items" : [
    ],
    "data" : [
    ],
    "confirmations" : 22,
    "blockhash" : "00341fe461262a3e671d8b13f8177eca8898184ae2df4b5d6cf1c2470fc56cd7",
    "blockindex" : 1,
    "blocktime" : 1541588274,
    "txid" : "464196be7d676a0d236ba6eb9dc7298803eb9183204605e6a16bb3bca1f8ec29",
    "valid" : true,
    "time" : 1541588255,
    "timereceived" : 1541588255,
    "vin" : [
        {
            "txid" : "e6d8e7218e938bad049c1f276d27724bdc03e4ad25727887a06de721f89c2f29",
            "vout" : 0,
            "addresses" : [
                "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3"
            ],
            "type" : "pubkeyhash",
            "ismine" : true,
            "iswatchonly" : false,
            "amount" : 0.00000000,
            "assets" : [
            ]
        }
    ],
    "vout" : [
        {
            "n" : 0,
            "addresses" : [
                "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3"
            ],
            "type" : "pubkeyhash",
            "ismine" : true,
            "iswatchonly" : false,
            "amount" : 0.00000000,
            "assets" : [
                {
                    "name" : "GBP",
                    "assetref" : "217-267-25009",
                    "qty" : 15000.00000000,
                    "type" : "issuemore"
                }
            ],
            "permissions" : [
            ],
            "items" : [
            ]
        },
        {
            "n" : 1,
            "addresses" : [
                "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3"
            ],
            "type" : "pubkeyhash",
            "ismine" : true,
            "iswatchonly" : false,
            "amount" : 0.00000000,
            "assets" : [
            ],
            "permissions" : [
            ],
            "items" : [
            ]
        }
    ],
    "hex" : "0100000001292f9cf821e76da087787225ade403dc4b72276d271f9c04ad8b938e21e7d8e6000000006a4730440220406150e31e6b26855c9122a09bf3d1aa993795fa218f37975cadf0bfdd1d763d022000c3c9775bfd880cafde2e44934ef5d11297ab7fc26aab76c46985046087e13a0121030b57a7bdc3fa4714717fa4eeebd067051a4728b1ac5dbf6a6ac4cdfd55a4459fffffffff0200000000000000003776a9142291d2bc7aee4c4c591bfcd98d3364f5dd8cb61688ac1c73706b6fe183ef5762110b442ab2da826a0f61b160e31600000000007500000000000000001976a9142291d2bc7aee4c4c591bfcd98d3364f5dd8cb61688ac00000000"
}


```

En nodo 2: No hay constancia del asset `GBP` 

```sh
DemoChain: listassettransactions GBP true
{"method":"listassettransactions","params":["GBP",true],"id":"54413864-1541599949","chain_name":"DemoChain"}

error code: -703
error message:
Not subscribed to this asset

```

En nodo 2: Intentamos subscribirnos al asset `GBP`


```sh
DemoChain: subscribe "GBP" true                         
{"method":"subscribe","params":["GBP",true],"id":"64255518-1541600044","chain_name":"DemoChain"}

```

Ahora en nodo 2 pueden verse las transacciones asociadas al asset `GBP`:

```sh
DemoChain: listassettransactions GBP true               
{"method":"listassettransactions","params":["GBP",true],"id":"35300439-1541600096","chain_name":"DemoChain"}

[
    {
        "addresses" : {
            "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : 50000.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 66,
        "blockhash" : "00ac146c77db27c731856f3bd117ca33255928f1dc45c2293c5d1e53eacca866",
        "blockindex" : 1,
        "blocktime" : 1541582643,
        "txid" : "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a",
        "valid" : true,
        "time" : 1541582643,
        "timereceived" : 1541600044,
        "vin" : [
            {
                "txid" : "397ed4a3dbbb78490680656004a1d9bf36a92d0ab317e5112aab5ef618fe5fd1",
                "vout" : 1,
                "addresses" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ],
                "type" : "pubkeyhash",
                "ismine" : false,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ]
            }
        ],
        "vout" : [
            {
                "n" : 0,
                "addresses" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ],
                "type" : "pubkeyhash",
                "ismine" : false,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                    {
                        "name" : "GBP",
                        "assetref" : "217-267-25009",
                        "qty" : 50000.00000000,
                        "type" : "issuefirst"
                    }
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            },
            {
                "n" : 1,
                "addresses" : [
                ],
                "type" : "nulldata",
                "ismine" : false,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            },
            {
                "n" : 2,
                "addresses" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ],
                "type" : "pubkeyhash",
                "ismine" : false,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            }
        ],
        "hex" : "0100000001d15ffe18f65eab2a11e517b30a2da936bfd9a104606580064978bbdba3d47e39010000006a47304402206887ad99113774730cbd68a1c772f3e5f77b1fe63e241aa149937080b85f37ae02205f8dc1ebe7c36836a1b731c0e35fc056a0b84d8fe2d6f9c38eeb859bab823d43012103c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9fffffffff0300000000000000002776a9143aaa622500ef363a9697343cd268c21da3de8b3988ac0c73706b67404b4c0000000000750000000000000000454273706b6e0100010347425000410464000000000201016f726967696e0002756b737461676500023031707572706f736500107061727473207072657061796d656e74756a00000000000000001976a9143aaa622500ef363a9697343cd268c21da3de8b3988ac00000000"
    },
    {
        "addresses" : {
            "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" : 25000.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 44,
        "blockhash" : "000872cee4372756a538d353c3f23b707f220e901951e313e15a38ca01da3589",
        "blockindex" : 1,
        "blocktime" : 1541586127,
        "txid" : "3b117ce4a04585572d36cb231a0cf3cf81c041637ef63e9042f1777f38133f89",
        "valid" : true,
        "time" : 1541586127,
        "timereceived" : 1541600045,
        "vin" : [
            {
                "txid" : "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a",
                "vout" : 2,
                "addresses" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ],
                "type" : "pubkeyhash",
                "ismine" : false,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ]
            }
        ],
        "vout" : [
            {
                "n" : 0,
                "addresses" : [
                    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3"
                ],
                "type" : "pubkeyhash",
                "ismine" : false,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                    {
                        "name" : "GBP",
                        "assetref" : "217-267-25009",
                        "qty" : 25000.00000000,
                        "type" : "issuemore"
                    }
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            },
            {
                "n" : 1,
                "addresses" : [
                ],
                "type" : "nulldata",
                "ismine" : false,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            },
            {
                "n" : 2,
                "addresses" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ],
                "type" : "pubkeyhash",
                "ismine" : false,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            }
        ],
        "hex" : "01000000014a02362fdd13ca61927cd46a946595bde183ef5762110b442ab2da826a0f61b1020000006a47304402207ba2ab505f6ab4464dcac785baf5f4846e5be42cb8b3f91425af606d26ac22cc02206fde045eeaf068453dbc3552729f0818ecf50df115616e192b1b68e0490abdbb012103c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9fffffffff0300000000000000003776a9142291d2bc7aee4c4c591bfcd98d3364f5dd8cb61688ac1c73706b6fe183ef5762110b442ab2da826a0f61b1a025260000000000750000000000000000491473706b65e183ef5762110b442ab2da826a0f61b1753073706b75016f726967696e00066575726f7065737461676500023032617070726f76616c000a6465706172746d656e74756a00000000000000001976a9143aaa622500ef363a9697343cd268c21da3de8b3988ac00000000"
    },
    {
        "addresses" : {
            "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" : 15000.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 22,
        "blockhash" : "00341fe461262a3e671d8b13f8177eca8898184ae2df4b5d6cf1c2470fc56cd7",
        "blockindex" : 1,
        "blocktime" : 1541588274,
        "txid" : "464196be7d676a0d236ba6eb9dc7298803eb9183204605e6a16bb3bca1f8ec29",
        "valid" : true,
        "time" : 1541588274,
        "timereceived" : 1541600045,
        "vin" : [
            {
                "txid" : "e6d8e7218e938bad049c1f276d27724bdc03e4ad25727887a06de721f89c2f29",
                "vout" : 0,
                "addresses" : [
                    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3"
                ],
                "type" : "pubkeyhash",
                "ismine" : false,
                "iswatchonly" : false
            }
        ],
        "vout" : [
            {
                "n" : 0,
                "addresses" : [
                    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3"
                ],
                "type" : "pubkeyhash",
                "ismine" : false,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                    {
                        "name" : "GBP",
                        "assetref" : "217-267-25009",
                        "qty" : 15000.00000000,
                        "type" : "issuemore"
                    }
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            },
            {
                "n" : 1,
                "addresses" : [
                    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3"
                ],
                "type" : "pubkeyhash",
                "ismine" : false,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            }
        ],
        "hex" : "0100000001292f9cf821e76da087787225ade403dc4b72276d271f9c04ad8b938e21e7d8e6000000006a4730440220406150e31e6b26855c9122a09bf3d1aa993795fa218f37975cadf0bfdd1d763d022000c3c9775bfd880cafde2e44934ef5d11297ab7fc26aab76c46985046087e13a0121030b57a7bdc3fa4714717fa4eeebd067051a4728b1ac5dbf6a6ac4cdfd55a4459fffffffff0200000000000000003776a9142291d2bc7aee4c4c591bfcd98d3364f5dd8cb61688ac1c73706b6fe183ef5762110b442ab2da826a0f61b160e31600000000007500000000000000001976a9142291d2bc7aee4c4c591bfcd98d3364f5dd8cb61688ac00000000"
    },
    {
        "addresses" : {
            "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : 0.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 11,
        "blockhash" : "00f7715590cc142ebb8865242b5cfc84832483d776a4b4c2b286bce11199d210",
        "blockindex" : 1,
        "blocktime" : 1541597810,
        "txid" : "65f8b3971f3451a171dd549b3a6a8617a531b38897775d1d4f73c95af3a1c310",
        "valid" : true,
        "time" : 1541597810,
        "timereceived" : 1541600045,
        "vin" : [
            {
                "txid" : "e6d8e7218e938bad049c1f276d27724bdc03e4ad25727887a06de721f89c2f29",
                "vout" : 1,
                "addresses" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ],
                "type" : "pubkeyhash",
                "ismine" : false,
                "iswatchonly" : false
            }
        ],
        "vout" : [
            {
                "n" : 0,
                "addresses" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ],
                "type" : "pubkeyhash",
                "ismine" : false,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            },
            {
                "n" : 1,
                "addresses" : [
                ],
                "type" : "nulldata",
                "ismine" : false,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            },
            {
                "n" : 2,
                "addresses" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ],
                "type" : "pubkeyhash",
                "ismine" : false,
                "iswatchonly" : false,
                "amount" : 0.00000000,
                "assets" : [
                ],
                "permissions" : [
                ],
                "items" : [
                ]
            }
        ],
        "hex" : "0100000001292f9cf821e76da087787225ade403dc4b72276d271f9c04ad8b938e21e7d8e6010000006a47304402205fa0af0c6fe1378ac191e1c1f02b4ca79f9d1bdfe4f8121f3051ca7c4920dad9022057ee2417ef974c87c33e9be761e53c15a640d8e83150cde060cea78ec15dd32e012103c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9fffffffff0300000000000000003776a9143aaa622500ef363a9697343cd268c21da3de8b3988ac1c73706b6fe183ef5762110b442ab2da826a0f61b10000000000000000750000000000000000331473706b65e183ef5762110b442ab2da826a0f61b1751a73706b7501617070726f76616c000b68656164206f6666696365756a00000000000000001976a9143aaa622500ef363a9697343cd268c21da3de8b3988ac00000000"
    }
]
``` 

En nodo 1: vamos a lanzar una transferencia de importe del asset `GBP` a una cuenta (en este caso la del administrador) del nodo 2:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain sendassetfrom "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg" "GBP" 1000 0 "Donation" "Mr.Palmer"
{"method":"sendassetfrom","params":["18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT","1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg","GBP",1000,0,"Donation","Mr.Palmer"],"id":"71618777-1541601269","chain_name":"DemoChain"}

e97c40c50a14e5ba2d0d303c8915c53505849f2663caca2817987e9044d382f4

```

![Imagen36a](images/Imagen36a.png)

![Imagen36b](images/Imagen36b.png)

![Imagen36c](images/Imagen36c.png)

![Imagen36d](images/Imagen36d.png)

![Imagen36e](images/Imagen36e.png)

Vamos a observar el histórico de transacciones asociadas al asset `GBP` en ambos nodos:

en Nodo 1:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain listassettransactions GBP false
{"method":"listassettransactions","params":["GBP",false],"id":"11863742-1541602973","chain_name":"DemoChain"}

[
    {
        "addresses" : {
            "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : 50000.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 77,
        "blockhash" : "00ac146c77db27c731856f3bd117ca33255928f1dc45c2293c5d1e53eacca866",
        "blockindex" : 1,
        "blocktime" : 1541582643,
        "txid" : "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a",
        "valid" : true,
        "time" : 1541582626,
        "timereceived" : 1541582626
    },
    {
        "addresses" : {
            "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" : 25000.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 55,
        "blockhash" : "000872cee4372756a538d353c3f23b707f220e901951e313e15a38ca01da3589",
        "blockindex" : 1,
        "blocktime" : 1541586127,
        "txid" : "3b117ce4a04585572d36cb231a0cf3cf81c041637ef63e9042f1777f38133f89",
        "valid" : true,
        "time" : 1541586104,
        "timereceived" : 1541586104
    },
    {
        "addresses" : {
            "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" : 15000.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 33,
        "blockhash" : "00341fe461262a3e671d8b13f8177eca8898184ae2df4b5d6cf1c2470fc56cd7",
        "blockindex" : 1,
        "blocktime" : 1541588274,
        "txid" : "464196be7d676a0d236ba6eb9dc7298803eb9183204605e6a16bb3bca1f8ec29",
        "valid" : true,
        "time" : 1541588255,
        "timereceived" : 1541588255
    },
    {
        "addresses" : {
            "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : 0.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 22,
        "blockhash" : "00f7715590cc142ebb8865242b5cfc84832483d776a4b4c2b286bce11199d210",
        "blockindex" : 1,
        "blocktime" : 1541597810,
        "txid" : "65f8b3971f3451a171dd549b3a6a8617a531b38897775d1d4f73c95af3a1c310",
        "valid" : true,
        "time" : 1541597789,
        "timereceived" : 1541597789
    },
    {
        "addresses" : {
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg" : 1000.00000000,
            "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : -1000.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 11,
        "blockhash" : "000c12eb8303332f75e1c18a550c3fc5cadeed8abaee0ed21da2a6dc609234e6",
        "blockindex" : 1,
        "blocktime" : 1541601283,
        "txid" : "e97c40c50a14e5ba2d0d303c8915c53505849f2663caca2817987e9044d382f4",
        "valid" : true,
        "time" : 1541601269,
        "timereceived" : 1541601269,
        "comment" : "Donation",
        "to" : "Mr.Palmer"
    }
]

```

en Nodo 2:

```sh
devel1@VBXLFD272:~$ multichain-cli DemoChain listassettransactions GBP false
{"method":"listassettransactions","params":["GBP",false],"id":"70660830-1541603113","chain_name":"DemoChain"}

[
    {
        "addresses" : {
            "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : 50000.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 77,
        "blockhash" : "00ac146c77db27c731856f3bd117ca33255928f1dc45c2293c5d1e53eacca866",
        "blockindex" : 1,
        "blocktime" : 1541582643,
        "txid" : "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a",
        "valid" : true,
        "time" : 1541582643,
        "timereceived" : 1541600044
    },
    {
        "addresses" : {
            "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" : 25000.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 55,
        "blockhash" : "000872cee4372756a538d353c3f23b707f220e901951e313e15a38ca01da3589",
        "blockindex" : 1,
        "blocktime" : 1541586127,
        "txid" : "3b117ce4a04585572d36cb231a0cf3cf81c041637ef63e9042f1777f38133f89",
        "valid" : true,
        "time" : 1541586127,
        "timereceived" : 1541600045
    },
    {
        "addresses" : {
            "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" : 15000.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 33,
        "blockhash" : "00341fe461262a3e671d8b13f8177eca8898184ae2df4b5d6cf1c2470fc56cd7",
        "blockindex" : 1,
        "blocktime" : 1541588274,
        "txid" : "464196be7d676a0d236ba6eb9dc7298803eb9183204605e6a16bb3bca1f8ec29",
        "valid" : true,
        "time" : 1541588274,
        "timereceived" : 1541600045
    },
    {
        "addresses" : {
            "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : 0.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 22,
        "blockhash" : "00f7715590cc142ebb8865242b5cfc84832483d776a4b4c2b286bce11199d210",
        "blockindex" : 1,
        "blocktime" : 1541597810,
        "txid" : "65f8b3971f3451a171dd549b3a6a8617a531b38897775d1d4f73c95af3a1c310",
        "valid" : true,
        "time" : 1541597810,
        "timereceived" : 1541600045
    },
    {
        "addresses" : {
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg" : 1000.00000000,
            "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : -1000.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 11,
        "blockhash" : "000c12eb8303332f75e1c18a550c3fc5cadeed8abaee0ed21da2a6dc609234e6",
        "blockindex" : 1,
        "blocktime" : 1541601283,
        "txid" : "e97c40c50a14e5ba2d0d303c8915c53505849f2663caca2817987e9044d382f4",
        "valid" : true,
        "time" : 1541601269,
        "timereceived" : 1541601269
    }
]

```
Se observa el mismo histórico de transacciones en ambos nodos.

**SIN EMBARGO** Vamos a observar los balances en ambos nodos:

![Imagen36e](images/Imagen36e.png)

en nodo 1:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain getmultibalances "*" GBP
{"method":"getmultibalances","params":["*","GBP"],"id":"86223256-1541601894","chain_name":"DemoChain"}

{
    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 40000.00000000
        }
    ],
    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 49000.00000000
        }
    ],
    "total" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 89000.00000000
        }
    ]
}
```

> **UNICAMENTE** se observan los balances de las direcciones existentes en el wallet del `nodo 1`

en nodo 2:
```sh
devel1@VBXLFD272:~$ multichain-cli DemoChain getmultibalances "*" GBP
{"method":"getmultibalances","params":["*","GBP"],"id":"71404154-1541603286","chain_name":"DemoChain"}

{
    "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 1000.00000000
        }
    ],
    "total" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 1000.00000000
        }
    ]
}

```
> **UNICAMENTE** se observan los balances de las direcciones existentes en el wallet del `nodo 2`

Vamos a probar a utilizar `importaddress` *(Adds an address or script (in hex) that can be watched as if it were in your wallet but cannot be used to spend )* en ambos nodos y ver que ocurre:

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain help importaddress
{"method":"help","params":["importaddress"],"id":"70613192-1541604160","chain_name":"DemoChain"}

importaddress address(es) ( "label" rescan )

Adds an address or script (in hex) that can be watched as if it were in your wallet but cannot be used to spend.

Arguments:
1. "address(es)"                    (string, required) The addresses, comma delimited
 or
1. address(es)                      (array, optional) A json array of addresses 
2. "label"                          (string, optional, default="") An optional label
3. rescan                           (boolean or integer, optional, default=true) Rescan the wallet for transactions. 
If integer rescan from block, if negative - from the end.

Note: This call can take minutes to complete if rescan is true.

Result:

Examples:

Import an address with rescan
> multichain-cli DemoChain importaddress "1M72Sfpbz1BPpXFHz9m3CdqATR44Jvaydd"

Import using a label without rescan
> multichain-cli DemoChain importaddress "1M72Sfpbz1BPpXFHz9m3CdqATR44Jvaydd" "testing" false

As a JSON-RPC call
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "importaddress", "params": ["1M72Sfpbz1BPpXFHz9m3CdqATR44Jvaydd", "testing", false] }' -H 'content-type: text/plain;' http://127.0.0.1:7440
```

En nodo 1:
```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain importaddress "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg" "Admin of Node 2" true
{"method":"importaddress","params":["1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg","Admin of Node 2",true],"id":"97782837-1541604548","chain_name":"DemoChain"}

devel1@VBXLFD271:~$ multichain-cli DemoChain listaddresses "*" true
{"method":"listaddresses","params":["*",true],"id":"53976908-1541604653","chain_name":"DemoChain"}

[
    {
        "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
        "ismine" : true,
        "iswatchonly" : false,
        "isscript" : false,
        "pubkey" : "033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8",
        "iscompressed" : true,
        "account" : "",
        "synchronized" : true
    },
    {
        "address" : "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT",
        "ismine" : true,
        "iswatchonly" : false,
        "isscript" : false,
        "pubkey" : "03c19ed76e5fdfaed0554d582cf09320ba8a32a698d27a1fc8113936fea2348e9f",
        "iscompressed" : true,
        "account" : "",
        "synchronized" : true
    },
    {
        "address" : "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3",
        "ismine" : true,
        "iswatchonly" : false,
        "isscript" : false,
        "pubkey" : "030b57a7bdc3fa4714717fa4eeebd067051a4728b1ac5dbf6a6ac4cdfd55a4459f",
        "iscompressed" : true,
        "account" : "",
        "synchronized" : true
    },
    {
        "address" : "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg",
        "ismine" : false,
        "iswatchonly" : true,
        "isscript" : false,
        "account" : "Admin of Node 2",
        "synchronized" : true
    }
]

```
> NOTA: obsérvese el parámetro `"iswatchonly" : true,` para la dirección `"address" : "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"` importada del Nodo 2.

![Imagen38c](images/Imagen38c.png)

En nodo 2:

```sh
devel1@VBXLFD272:~$ multichain-cli DemoChain importaddress "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" "Demo user 01 from Node 1" true
{"method":"importaddress","params":["18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT","Demo user 01 from Node 1",true],"id":"41128218-1541605446","chain_name":"DemoChain"}

devel1@VBXLFD272:~$ multichain-cli DemoChain importaddress "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" "Demo user 02 from Node 1" true
{"method":"importaddress","params":["15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3","Demo user 02 from Node 1",true],"id":"91598044-1541605468","chain_name":"DemoChain"}

devel1@VBXLFD272:~$ multichain-cli DemoChain listaddresses "*" true
{"method":"listaddresses","params":["*",true],"id":"99209681-1541605484","chain_name":"DemoChain"}

[
    {
        "address" : "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg",
        "ismine" : true,
        "iswatchonly" : false,
        "isscript" : false,
        "pubkey" : "02f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773dd",
        "iscompressed" : true,
        "account" : "",
        "synchronized" : true
    },
    {
        "address" : "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT",
        "ismine" : false,
        "iswatchonly" : true,
        "isscript" : false,
        "account" : "Demo user 01 from Node 1",
        "synchronized" : true
    },
    {
        "address" : "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3",
        "ismine" : false,
        "iswatchonly" : true,
        "isscript" : false,
        "account" : "Demo user 02 from Node 1",
        "synchronized" : true
    }
]

```

> NOTA: obsérvese el parámetro `"iswatchonly" : true,` para las direcciones`"address" : "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"` y `"address" : "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3"` importadas del Nodo 1.

![Imagen38d](images/Imagen38d.png)

Vamos a observar nuevamente los balances en ambos nodos:

En nodo 1: con el parámetro `includeWatchonly` a `false`

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain getmultibalances "*" GBP 0 false
{"method":"getmultibalances","params":["*","GBP",0,false],"id":"77807123-1541607382","chain_name":"DemoChain"}

{
    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 40000.00000000
        }
    ],
    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 49000.00000000
        }
    ],
    "total" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 89000.00000000
        }
    ]
}
```

Y ahora en nodo 1: con el parámetro `includeWatchonly` a `true`

```sh
devel1@VBXLFD271:~$ multichain-cli DemoChain getmultibalances "*" GBP 0 true
{"method":"getmultibalances","params":["*","GBP",0,true],"id":"81659197-1541607441","chain_name":"DemoChain"}

{
    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 40000.00000000
        }
    ],
    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 49000.00000000
        }
    ],
    "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 1000.00000000
        }
    ],
    "total" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 90000.00000000
        }
    ]

```

Y AHORA en el nodo 2 con el parámetro `includeWatchonly` primero a `false` y luego a `true`

```sh
devel1@VBXLFD272:~$ multichain-cli DemoChain getmultibalances "*" GBP 0 false
{"method":"getmultibalances","params":["*","GBP",0,false],"id":"81033715-1541607617","chain_name":"DemoChain"}

{
    "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 1000.00000000
        }
    ],
    "total" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 1000.00000000
        }
    ]
}
devel1@VBXLFD272:~$ multichain-cli DemoChain getmultibalances "*" GBP 0 true
{"method":"getmultibalances","params":["*","GBP",0,true],"id":"49494437-1541607624","chain_name":"DemoChain"}

{
    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 40000.00000000
        }
    ],
    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 49000.00000000
        }
    ],
    "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 1000.00000000
        }
    ],
    "total" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 90000.00000000
        }
    ]
}

```

### 2) Using the chain’s burn address, which has no corresponding private key, to “burn” units of an asset by rendering them unspendable. The address can be obtained using `getinfo`, and any node can import it using `importaddress` to track the asset quantities burned.


# Atomic exchange transactions
## How to safely swap assets between counterparties

Any MultiChain transaction can have multiple inputs and outputs, and each one can relate to a different address on the blockchain. This enables a single transaction to perform an asset exchange between two or more parties, for example sending a dollar-denominated asset from Alice to Bob, while simultaneously sending a Euro-denominated asset from Bob to Alice. Because the exchange takes place in a single transaction, it comes with a guarantee of atomicity, meaning that all of the asset transfers take place simultaneously, or none take place at all. In the finance world, this type of transaction is termed `delivery-versus-payment`, or DvP for short.

## Offers to Exchange

MultiChain provides a number of APIs which make it easy to perform these exchanges. One party begins by using `preparelockunspent(from)` and `createrawexchange` to create an `offer of exchange`, in which they specify the asset and quantity they are offering, and the asset and quantity they request in return. 

This offer is represented as a `partial transaction`, with one input and one output, signed by the offering party. Unlike regular signatures which lock down the entire set of transaction inputs and outputs, an exchange offer uses a special signature type which allows other inputs and outputs to be added, so long as the original ones stay intact (the technical name is `SIGHASH_SINGLE|SIGHASH_ANYONE_CAN_PAY`).

The partial transaction representing an offer can then be sent to a specific counterparty, or distributed for anyone to review and accept. This communication can take place on the blockchain, for example using a stream, or off-chain using any method desired (even email!) Another participant receiving the offer can review it using `decoderawexchange` and then decide whether to accept it. If so, they call `preparelockunspent(from)` and `completerawexchange` to add their own input and output to the transaction, offering the requested asset and quantity and requesting the asset and quantity offered. The final transaction will then be balanced and can be broadcast to the network using `sendrawtransaction`.

## more complex exchange transactions

The same mechanism can also be used to create more complex exchange transactions, **in which multiple assets are offered or requested, and more than two blockchain participants are involved**. Instead of calling `completerawexchange`, a participant can use `appendrawexchange` to partially meet an offer, creating a new larger partial transaction that represents a new offer of exchange. 

This new transaction can then be passed on to additional parties, who can check it with `decoderawexchange` and add their own inputs and outputs, and so on. A transaction can only be broadcast to the network (using `sendrawtransaction`) once it is balanced, meaning that the total quantities of assets in the inputs equals the total in the outputs.

MultiChain also provides the `disablerawtransaction API` to disable an offer after it has been distributed. This works so long as nobody has yet accepted the offer by extending it into a balanced transaction and broadcasting that transaction to the network. **An offer is disabled by spending the assets used in one of the offer’s inputs, sending them back to their source**. At this point the offer becomes useless, because one of its inputs refers to a previously spent transaction output, which the blockchain’s double-spend rules prevent from being spent again.

## TUTORIAL (Offers)

In this tutorial, we will focus on exchanges of two different assets between two or three counterparties. The tutorial requires two servers running MultiChain 1.0 beta 2 or later, both of which are connected to the same blockchain, with no native currency or other unusual parameters.

### Step 1: Issuing the assets
Let’s begin by creating the two assets to be used in this tutorial. On the first server, let’s find an address that can create assets:

```sh
DemoChain: listpermissions issue     
{"method":"listpermissions","params":["issue"],"id":"73485869-1541664651","chain_name":"DemoChain"}

[
    {
        "address" : "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT",
        "for" : null,
        "type" : "issue",
        "startblock" : 0,
        "endblock" : 4294967295
    },
    {
        "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
        "for" : null,
        "type" : "issue",
        "startblock" : 0,
        "endblock" : 4294967295
    }
]
DemoChain: listaddresses
{"method":"listaddresses","params":[],"id":"22536507-1541664669","chain_name":"DemoChain"}

[
    {
        "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
        "ismine" : true
    },
    {
        "address" : "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT",
        "ismine" : true
    },
    {
        "address" : "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3",
        "ismine" : true
    },
    {
        "address" : "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg",
        "ismine" : false
    }
]

```

An address is suitable if it appears in the output of the first command, and also in the second command together with "ismine" : true.

Ejemplo: `"1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"`

Now let’s find an address belonging to the other node. On the second server (Nodo 2):

```sh
DemoChain: listaddresses
{"method":"listaddresses","params":[],"id":"69987868-1541664850","chain_name":"DemoChain"}

[
    {
        "address" : "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg",
        "ismine" : true
    },
    {
        "address" : "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT",
        "ismine" : false
    },
    {
        "address" : "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3",
        "ismine" : false
    }
]
```

Enter any address for which `"ismine" : true` is shown

Ejemplo: `"1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"`

Now let’s issue the assets to these two addresses. Back on the first server (Nodo 1):

```sh
DemoChain: issue 1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt USD 2000 0.01
{"method":"issue","params":["1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt","USD",2000,0.01000000],"id":"32273509-1541666081","chain_name":"DemoChain"}

c01ab8282b32adc7133375501fe099d02c589326ebfede45aadba8531a9ff58c

```

![Imagen40a](images/Imagen40a.png)

![Imagen40b](images/Imagen40b.png)

![Imagen40c](images/Imagen40c.png)

> NOTA: **ADVIERTASE** que al no haber utilizado `issuefrom 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg  ... ` se ha tomado como input la dirección `18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT` utilizada en el tutorial anterior

```sh
DemoChain: listassets USD true 
{"method":"listassets","params":["USD",true],"id":"87190341-1541667168","chain_name":"DemoChain"}

[
    {
        "name" : "USD",
        "issuetxid" : "c01ab8282b32adc7133375501fe099d02c589326ebfede45aadba8531a9ff58c",
        "assetref" : "294-266-6848",
        "multiple" : 100,
        "units" : 0.01000000,
        "open" : false,
        "details" : {
        },
        "issueqty" : 2000.00000000,
        "issueraw" : 200000,
        "subscribed" : false,
        "issues" : [
            {
                "txid" : "c01ab8282b32adc7133375501fe099d02c589326ebfede45aadba8531a9ff58c",
                "qty" : 2000.00000000,
                "raw" : 200000,
                "details" : {
                },
                "issuers" : [
                    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"
                ]
            }
        ]
    }
]
```

> **OBSERVESE** que figura como `issuer` --> `"issuers" : [    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT"]`

```sh
DemoChain: gettotalbalances      
{"method":"gettotalbalances","params":[],"id":"47772301-1541667729","chain_name":"DemoChain"}

[
    {
        "name" : "GBP",
        "assetref" : "217-267-25009",
        "qty" : 89000.00000000
    },
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 775.00000000
    },
    {
        "name" : "USD",
        "assetref" : "294-266-6848",
        "qty" : 2000.00000000
    }
]
```

```sh
DemoChain: subscribe "USD"
{"method":"subscribe","params":["USD"],"id":"78251742-1541667783","chain_name":"DemoChain"}

DemoChain: listassettransactions USD 
{"method":"listassettransactions","params":["USD"],"id":"43169185-1541667899","chain_name":"DemoChain"}

[
    {
        "addresses" : {
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt" : 2000.00000000
        },
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 11,
        "blockhash" : "00e152696f111a6a7c9077bcecfc18587db97f581b6b4d37043a8aab1218db67",
        "blockindex" : 1,
        "blocktime" : 1541666091,
        "txid" : "c01ab8282b32adc7133375501fe099d02c589326ebfede45aadba8531a9ff58c",
        "valid" : true,
        "time" : 1541666081,
        "timereceived" : 1541666081
    }
]

```



> NOTA: para visualizar el estado del asset en "Multichain Explorer" se usa la url `http://localhost:2750/MultiChain%20DemoChain/assetref/294-266-6848` donde La referencia del asset ( `"assetref" : "294-266-6848",` ) se obtiene por ejemplo como información de respuesta de los comandos `listassets USD true` o `gettotalbalances`

![Imagen40d](images/Imagen40d.png)

![Imagen40e](images/Imagen40e.png)


Now let’s issue another asset to the second node’s address, after granting it the necessary permissions. Still on the first server:

```sh
DemoChain: grant 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg receive,send
{"method":"grant","params":["1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg","receive,send"],"id":"98185593-1541668743","chain_name":"DemoChain"}

6956db1a32cc909a48120541b10823a2c5869b472bae261668c07a0ca74ae1dd
```

```sh
DemoChain: issuefrom 1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg JPY 50000 1
{"method":"issuefrom","params":["1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt","1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg","JPY",50000,1],"id":"45979881-1541668967","chain_name":"DemoChain"}

70f97f9506bde139d0c17b2cbe0e8a697b77f080187e89ba7cf8b7bc27169ca2
```

![Imagen41a](images/Imagen41a.png)

![Imagen41b](images/Imagen41b.png)

![Imagen41c](images/Imagen41c.png)

Now let’s check the assets are visible. On both servers:

En nodo 1:
```sh
DemoChain: listassets      
{"method":"listassets","params":[],"id":"96770339-1541677865","chain_name":"DemoChain"}

[
    {
        "name" : "asset1",
        "issuetxid" : "259c3624dd8fe7c366dcf9e8ec7c2b9d5da95c5af2e3242a5291cdf9576f816c",
        "assetref" : "167-266-39973",
        "multiple" : 100,
        "units" : 0.01000000,
        "open" : false,
        "details" : {
        },
        "issueqty" : 1000.00000000,
        "issueraw" : 100000,
        "subscribed" : false
    },
    {
        "name" : "GBP",
        "issuetxid" : "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a",
        "assetref" : "217-267-25009",
        "multiple" : 100,
        "units" : 0.01000000,
        "open" : true,
        "details" : {
            "origin" : "uk",
            "stage" : "01",
            "purpose" : "parts prepayment"
        },
        "issueqty" : 90000.00000000,
        "issueraw" : 9000000,
        "subscribed" : true,
        "synchronized" : true,
        "transactions" : 5,
        "confirmed" : 5
    },
    {
        "name" : "USD",
        "issuetxid" : "c01ab8282b32adc7133375501fe099d02c589326ebfede45aadba8531a9ff58c",
        "assetref" : "294-266-6848",
        "multiple" : 100,
        "units" : 0.01000000,
        "open" : false,
        "details" : {
        },
        "issueqty" : 2000.00000000,
        "issueraw" : 200000,
        "subscribed" : true,
        "synchronized" : true,
        "transactions" : 1,
        "confirmed" : 1
    },
    {
        "name" : "JPY",
        "issuetxid" : "70f97f9506bde139d0c17b2cbe0e8a697b77f080187e89ba7cf8b7bc27169ca2",
        "assetref" : "316-266-63856",
        "multiple" : 1,
        "units" : 1.00000000,
        "open" : false,
        "details" : {
        },
        "issueqty" : 50000.00000000,
        "issueraw" : 50000,
        "subscribed" : false
    }
]

```

En nodo 2:
```sh
DemoChain: listassets
{"method":"listassets","params":[],"id":"83987858-1541677961","chain_name":"DemoChain"}

[
    {
        "name" : "asset1",
        "issuetxid" : "259c3624dd8fe7c366dcf9e8ec7c2b9d5da95c5af2e3242a5291cdf9576f816c",
        "assetref" : "167-266-39973",
        "multiple" : 100,
        "units" : 0.01000000,
        "open" : false,
        "details" : {
        },
        "issueqty" : 1000.00000000,
        "issueraw" : 100000,
        "subscribed" : false
    },
    {
        "name" : "GBP",
        "issuetxid" : "b1610f6a82dab22a440b116257ef83e1bd9565946ad47c9261ca13dd2f36024a",
        "assetref" : "217-267-25009",
        "multiple" : 100,
        "units" : 0.01000000,
        "open" : true,
        "details" : {
            "origin" : "uk",
            "stage" : "01",
            "purpose" : "parts prepayment"
        },
        "issueqty" : 90000.00000000,
        "issueraw" : 9000000,
        "subscribed" : true,
        "synchronized" : true,
        "transactions" : 5,
        "confirmed" : 5
    },
    {
        "name" : "USD",
        "issuetxid" : "c01ab8282b32adc7133375501fe099d02c589326ebfede45aadba8531a9ff58c",
        "assetref" : "294-266-6848",
        "multiple" : 100,
        "units" : 0.01000000,
        "open" : false,
        "details" : {
        },
        "issueqty" : 2000.00000000,
        "issueraw" : 200000,
        "subscribed" : false
    },
    {
        "name" : "JPY",
        "issuetxid" : "70f97f9506bde139d0c17b2cbe0e8a697b77f080187e89ba7cf8b7bc27169ca2",
        "assetref" : "316-266-63856",
        "multiple" : 1,
        "units" : 1.00000000,
        "open" : false,
        "details" : {
        },
        "issueqty" : 50000.00000000,
        "issueraw" : 50000,
        "subscribed" : false
    }
]
```

En [Multichain Explorer (recordar "assetref" : "316-266-63856") ](http://localhost:2750/MultiChain%20DemoChain/assetref/316-266-63856)

![Imagen41d](images/Imagen41d.png)

![Imagen41e](images/Imagen41e.png)


Both servers should show the `USD` asset issued with `2000 units(dollars)`, each divisible into 100 sub-units (cents), and the `JPY` asset with `50000 units (yen)` that cannot be sub-divided. Now let’s check each server’s balance:

En nodo 1 (Recuérdese que con anterioridad ya se hizo `multichain-cli DemoChain importaddress "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg" "Admin of Node 2" true`):

```sh
DemoChain: gettotalbalances 0
{"method":"gettotalbalances","params":[0],"id":"82519422-1541678533","chain_name":"DemoChain"}

[
    {
        "name" : "GBP",
        "assetref" : "217-267-25009",
        "qty" : 89000.00000000
    },
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 775.00000000
    },
    {
        "name" : "USD",
        "assetref" : "294-266-6848",
        "qty" : 2000.00000000
    }
]

DemoChain: subscribe "JPY"
{"method":"subscribe","params":["JPY"],"id":"12912671-1541678589","chain_name":"DemoChain"}

DemoChain: gettotalbalances 0
{"method":"gettotalbalances","params":[0],"id":"30568094-1541678593","chain_name":"DemoChain"}

[
    {
        "name" : "GBP",
        "assetref" : "217-267-25009",
        "qty" : 89000.00000000
    },
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 775.00000000
    },
    {
        "name" : "USD",
        "assetref" : "294-266-6848",
        "qty" : 2000.00000000
    }
]
```

> NOTA el asset `JPY` sigue sin aparecer. Es necesario realizar la invocación con el parámetro `includeWatchonly` a `true`: 

```sh
DemoChain: gettotalbalances 0 true
{"method":"gettotalbalances","params":[0,true],"id":"89247586-1541678869","chain_name":"DemoChain"}

[
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 1000.00000000
    },
    {
        "name" : "GBP",
        "assetref" : "217-267-25009",
        "qty" : 90000.00000000
    },
    {
        "name" : "JPY",
        "assetref" : "316-266-63856",
        "qty" : 50000.00000000
    },
    {
        "name" : "USD",
        "assetref" : "294-266-6848",
        "qty" : 2000.00000000
    }
]

``` 

En nodo 2 (Recuérdese que con anterioridad ya se hizo `multichain-cli DemoChain importaddress "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" "Demo user 01 from Node 1" true` pero hará falta igualmente realizar `multichain-cli DemoChain importaddress "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt" "Admin User from Node 1" true`): 

```sh
DemoChain: gettotalbalances 0 true
{"method":"gettotalbalances","params":[0,true],"id":"90643455-1541679399","chain_name":"DemoChain"}

[
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 225.00000000
    },
    {
        "name" : "GBP",
        "assetref" : "217-267-25009",
        "qty" : 90000.00000000
    },
    {
        "name" : "JPY",
        "assetref" : "316-266-63856",
        "qty" : 50000.00000000
    }
]

DemoChain: importaddress "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt" "Admin User from Node 1" true                         
{"method":"importaddress","params":["1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt","Admin User from Node 1",true],"id":"47128775-1541679432","chain_name":"DemoChain"}

DemoChain: gettotalbalances 0 true                                                                                      
{"method":"gettotalbalances","params":[0,true],"id":"30956349-1541679485","chain_name":"DemoChain"}

[
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 1000.00000000
    },
    {
        "name" : "GBP",
        "assetref" : "217-267-25009",
        "qty" : 90000.00000000
    },
    {
        "name" : "JPY",
        "assetref" : "316-266-63856",
        "qty" : 50000.00000000
    },
    {
        "name" : "USD",
        "assetref" : "294-266-6848",
        "qty" : 2000.00000000
    }
]
```

## Simple atomic exchange

Now we’ll perform a simple atomic exchange, in which 100 dollars belonging to the first node are exchanged for 10500 yen belonging to the second. 

On the second server (Nodo 2), let’s create a locked transaction output containing 10500 yen:

En nodo 2:

```sh
DemoChain: preparelockunspentfrom 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg '{"JPY":10500}'
{"method":"preparelockunspentfrom","params":["1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg",{"JPY":10500}],"id":"62345244-1541680000","chain_name":"DemoChain"}

{
    "txid" : "6f57087c00cb55b79feb1afc89879daf540218d0b90d07c41f7214a8e3f485ef",
    "vout" : 0
}

DemoChain: listlockunspent
{"method":"listlockunspent","params":[],"id":"80465636-1541686486","chain_name":"DemoChain"}

[
    {
        "txid" : "6f57087c00cb55b79feb1afc89879daf540218d0b90d07c41f7214a8e3f485ef",
        "vout" : 0
    }
]


```

![Imagen42a](images/Imagen42a.png)

![Imagen42b](images/Imagen42b.png)

![Imagen42c](images/Imagen42c.png)

Comprobamos saldos en Nodo 2. Primero con el parámetro `includeLocked (bool, optional, default=false) Also take locked outputs into account` a `false` (default) y luego a `true`


```sh
DemoChain: gettotalbalances 0 true
{"method":"gettotalbalances","params":[0,true],"id":"92648389-1541680385","chain_name":"DemoChain"}

[
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 1000.00000000
    },
    {
        "name" : "GBP",
        "assetref" : "217-267-25009",
        "qty" : 90000.00000000
    },
    {
        "name" : "JPY",
        "assetref" : "316-266-63856",
        "qty" : 39500.00000000
    },
    {
        "name" : "USD",
        "assetref" : "294-266-6848",
        "qty" : 2000.00000000
    }
]

DemoChain: gettotalbalances 0 true true
{"method":"gettotalbalances","params":[0,true,true],"id":"83440636-1541680392","chain_name":"DemoChain"}

[
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 1000.00000000
    },
    {
        "name" : "GBP",
        "assetref" : "217-267-25009",
        "qty" : 90000.00000000
    },
    {
        "name" : "JPY",
        "assetref" : "316-266-63856",
        "qty" : 50000.00000000
    },
    {
        "name" : "USD",
        "assetref" : "294-266-6848",
        "qty" : 2000.00000000
    }
]

```

Obsérvense los dos valores diferentes:

Considerando los importes "bloqueados" (10500 yen)
```
    {
        "name" : "JPY",
        "assetref" : "316-266-63856",
        "qty" : 39500.00000000
    },
```

Sin considerar los importes "bloqueados"
```
    {
        "name" : "JPY",
        "assetref" : "316-266-63856",
        "qty" : 50000.00000000
    },
```

![Imagen42d](images/Imagen42d.png)

Sin embargo, en Nodo 1 el bloqueo de fondos no se ha reflejado:
```
DemoChain: gettotalbalances 0 true true
{"method":"gettotalbalances","params":[0,true,true],"id":"82885592-1541680763","chain_name":"DemoChain"}

[
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 1000.00000000
    },
    {
        "name" : "GBP",
        "assetref" : "217-267-25009",
        "qty" : 90000.00000000
    },
    {
        "name" : "JPY",
        "assetref" : "316-266-63856",
        "qty" : 50000.00000000
    },
    {
        "name" : "USD",
        "assetref" : "294-266-6848",
        "qty" : 2000.00000000
    }
]
```

![Imagen42e](images/Imagen42e.png)

On the second server (Nodo 2), once the locked transaction has been created (containing `10500 yen`) now, because it is locked, this transaction output will be protected against spending unless explicitly spent or unlocked. Now we will use it to start the exchange transaction, specifying that we want `100 dollars` in exchange:

```sh
DemoChain: createrawexchange "6f57087c00cb55b79feb1afc89879daf540218d0b90d07c41f7214a8e3f485ef" 0 '{"USD":100}'          
{"method":"createrawexchange","params":["6f57087c00cb55b79feb1afc89879daf540218d0b90d07c41f7214a8e3f485ef",0,{"USD":100}],"id":"39632341-1541681259","chain_name":"DemoChain"}

0100000001ef85f4e3a814721fc4070db9d0180254af9d8789fc1aeb9fb755cb007c08576f000000006a47304402204dbbe83d5872dbcf988051854e9e3aabc19e0975d9ad9f35863ab5399cd398b2022006381d711e1906229f9a4f23bbba4acae52f93d8fdf7fbe965aea1ed4f709144832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddffffffff0100000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000

```

> NOTA: No se genera ninguna "transacción" con esta solicitud de "oferta" (la transacción última "6f57087c00cb55b79feb1afc89879daf540218d0b90d07c41f7214a8e3f485ef" es justamente la anterior `preparelockunspentfrom 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg '{"JPY":10500}'` )

![Imagen42a](images/Imagen42a.png) 

This will output a large hexadecimal blob of text that contains the raw transaction data representing the offer of exchange. Copy this blob to the clipboard, then run this command on the first server (Nodo 1):

```sh
DemoChain: decoderawexchange 0100000001ef85f4e3a814721fc4070db9d0180254af9d8789fc1aeb9fb755cb007c08576f000000006a47304402204dbbe83d5872dbcf988051854e9e3aabc19e0975d9ad9f35863ab5399cd398b2022006381d711e1906229f9a4f23bbba4acae52f93d8fdf7fbe965aea1ed4f709144832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddffffffff0100000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000
{"method":"decoderawexchange","params":["0100000001ef85f4e3a814721fc4070db9d0180254af9d8789fc1aeb9fb755cb007c08576f000000006a47304402204dbbe83d5872dbcf988051854e9e3aabc19e0975d9ad9f35863ab5399cd398b2022006381d711e1906229f9a4f23bbba4acae52f93d8fdf7fbe965aea1ed4f709144832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddffffffff0100000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000"],"id":"81133663-1541685098","chain_name":"DemoChain"}

{
    "offer" : {
        "amount" : 0.00000000,
        "assets" : [
            {
                "name" : "JPY",
                "assetref" : "316-266-63856",
                "qty" : 10500.00000000
            }
        ]
    },
    "ask" : {
        "amount" : 0.00000000,
        "assets" : [
            {
                "name" : "USD",
                "assetref" : "294-266-6848",
                "qty" : 100.00000000
            }
        ]
    },
    "requiredfee" : 0.00000000,
    "candisable" : false,
    "cancomplete" : true,
    "complete" : false
}

```
The output will show exactly what is represented by this exchange offer in the `offer` and `ask` sections. In addition, `cancomplete` should be `true` meaning that the first node has the assets required to complete the exchange.

Now create a locked transaction output containing 100 dollars, still on the first server (Nodo 1):

```sh
DemoChain: preparelockunspentfrom 1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt '{"USD":100}'
{"method":"preparelockunspentfrom","params":["1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",{"USD":100}],"id":"69628093-1541685274","chain_name":"DemoChain"}

{
    "txid" : "111cccac66043db048d0f7e488a9f275811d7c40430844dd2eb01f9821688f19",
    "vout" : 0
}

DemoChain: listlockunspent
{"method":"listlockunspent","params":[],"id":"78517187-1541686437","chain_name":"DemoChain"}

[
    {
        "txid" : "111cccac66043db048d0f7e488a9f275811d7c40430844dd2eb01f9821688f19",
        "vout" : 0
    }
]


```

![Imagen43a](images/Imagen43a.png) 

![Imagen43b](images/Imagen43b.png) 

![Imagen43c](images/Imagen43c.png) 


```sh
DemoChain: gettotalbalances 0 true false
{"method":"gettotalbalances","params":[0,true,false],"id":"31270302-1541685317","chain_name":"DemoChain"}

[
    {
        "name" : "USD",
        "assetref" : "294-266-6848",
        "qty" : 1900.00000000
    },
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 1000.00000000
    },
    {
        "name" : "GBP",
        "assetref" : "217-267-25009",
        "qty" : 90000.00000000
    },
    {
        "name" : "JPY",
        "assetref" : "316-266-63856",
        "qty" : 50000.00000000
    }
]
DemoChain: gettotalbalances 0 true true 
{"method":"gettotalbalances","params":[0,true,true],"id":"46382258-1541685322","chain_name":"DemoChain"}

[
    {
        "name" : "USD",
        "assetref" : "294-266-6848",
        "qty" : 2000.00000000
    },
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 1000.00000000
    },
    {
        "name" : "GBP",
        "assetref" : "217-267-25009",
        "qty" : 90000.00000000
    },
    {
        "name" : "JPY",
        "assetref" : "316-266-63856",
        "qty" : 50000.00000000
    }
]
```

En Nodo 2: veamos cómo se reflejan los saldos y observemos las diferencias:
```sh
DemoChain: gettotalbalances 0 true true 
{"method":"gettotalbalances","params":[0,true,true],"id":"36752542-1541685886","chain_name":"DemoChain"}

[
    {
        "name" : "USD",
        "assetref" : "294-266-6848",
        "qty" : 2000.00000000
    },
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 1000.00000000
    },
    {
        "name" : "GBP",
        "assetref" : "217-267-25009",
        "qty" : 90000.00000000
    },
    {
        "name" : "JPY",
        "assetref" : "316-266-63856",
        "qty" : 50000.00000000
    }
]
DemoChain: gettotalbalances 0 true false
{"method":"gettotalbalances","params":[0,true,false],"id":"59203390-1541685893","chain_name":"DemoChain"}

[
    {
        "name" : "USD",
        "assetref" : "294-266-6848",
        "qty" : 2000.00000000
    },
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 1000.00000000
    },
    {
        "name" : "GBP",
        "assetref" : "217-267-25009",
        "qty" : 90000.00000000
    },
    {
        "name" : "JPY",
        "assetref" : "316-266-63856",
        "qty" : 39500.00000000
    }
]

```

Como puede observarse dependiendo donde se "emitió" ("issue") el asset se refleja su saldo correctamente tanto si se consideran o nó  los importes "bloqueados":

![Imagen43d](images/Imagen43d.png) 

![Imagen43e](images/Imagen43e.png) 


Now we will add to the exchange transaction, in order to complete it, confirming that we accept 10500 yen in exchange:

```sh
DemoChain: appendrawexchange "0100000001ef85f4e3a814721fc4070db9d0180254af9d8789fc1aeb9fb755cb007c08576f000000006a47304402204dbbe83d5872dbcf988051854e9e3aabc19e0975d9ad9f35863ab5399cd398b2022006381d711e1906229f9a4f23bbba4acae52f93d8fdf7fbe965aea1ed4f709144832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddffffffff0100000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000" "111cccac66043db048d0f7e488a9f275811d7c40430844dd2eb01f9821688f19" 0 '{"JPY":10500}'
{"method":"appendrawexchange","params":["0100000001ef85f4e3a814721fc4070db9d0180254af9d8789fc1aeb9fb755cb007c08576f000000006a47304402204dbbe83d5872dbcf988051854e9e3aabc19e0975d9ad9f35863ab5399cd398b2022006381d711e1906229f9a4f23bbba4acae52f93d8fdf7fbe965aea1ed4f709144832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddffffffff0100000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000","111cccac66043db048d0f7e488a9f275811d7c40430844dd2eb01f9821688f19",0,{"JPY":10500}],"id":"94694289-1541688762","chain_name":"DemoChain"}

{
    "hex" : "0100000002ef85f4e3a814721fc4070db9d0180254af9d8789fc1aeb9fb755cb007c08576f000000006a47304402204dbbe83d5872dbcf988051854e9e3aabc19e0975d9ad9f35863ab5399cd398b2022006381d711e1906229f9a4f23bbba4acae52f93d8fdf7fbe965aea1ed4f709144832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddffffffff198f6821981fb02edd440843407c1d8175f2a988e4f7d048b03d0466accc1c11000000006b483045022100940ec5fb506f367dc853d9ec06d32d9a7731b5bddff3c4763d01c4f18b2dda500220769ce85446c853e24b142bd79334d223f277634bdb8e5c5f758cc251d2668b528321033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff0200000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000000000003776a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff97004290000000000007500000000",
    "complete" : true
}
```

The output should contain an even longer hexadecimal blob of text, alongside another field complete whose value is true. This means that the transaction is fully signed and ready for broadcast and confirmation. (We could also have used completerawexchange here, but we’ll get to that later on.) Copy the longer blob of hexadecimal and run: `sendrawtransaction [paste-longer-hex-blob]`

```sh
DemoChain: sendrawtransaction "0100000002ef85f4e3a814721fc4070db9d0180254af9d8789fc1aeb9fb755cb007c08576f000000006a47304402204dbbe83d5872dbcf988051854e9e3aabc19e0975d9ad9f35863ab5399cd398b2022006381d711e1906229f9a4f23bbba4acae52f93d8fdf7fbe965aea1ed4f709144832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddffffffff198f6821981fb02edd440843407c1d8175f2a988e4f7d048b03d0466accc1c11000000006b483045022100940ec5fb506f367dc853d9ec06d32d9a7731b5bddff3c4763d01c4f18b2dda500220769ce85446c853e24b142bd79334d223f277634bdb8e5c5f758cc251d2668b528321033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff0200000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000000000003776a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff97004290000000000007500000000"
{"method":"sendrawtransaction","params":["0100000002ef85f4e3a814721fc4070db9d0180254af9d8789fc1aeb9fb755cb007c08576f000000006a47304402204dbbe83d5872dbcf988051854e9e3aabc19e0975d9ad9f35863ab5399cd398b2022006381d711e1906229f9a4f23bbba4acae52f93d8fdf7fbe965aea1ed4f709144832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddffffffff198f6821981fb02edd440843407c1d8175f2a988e4f7d048b03d0466accc1c11000000006b483045022100940ec5fb506f367dc853d9ec06d32d9a7731b5bddff3c4763d01c4f18b2dda500220769ce85446c853e24b142bd79334d223f277634bdb8e5c5f758cc251d2668b528321033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff0200000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000000000003776a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff97004290000000000007500000000"],"id":"62977769-1541688936","chain_name":"DemoChain"}

dd2b39ed59532c27cdad72d7d349cc36501dcca09eb079c272378091c2dd3450
```

![Imagen44a](images/Imagen44a.png)

![Imagen44b](images/Imagen44b.png)

![Imagen44c](images/Imagen44c.png)

You can check the exchange was successful by running this command on both servers:

En nodo 1:
```sh
DemoChain: gettotalbalances 0        
{"method":"gettotalbalances","params":[0],"id":"22196304-1541689352","chain_name":"DemoChain"}

[
    {
        "name" : "USD",
        "assetref" : "294-266-6848",
        "qty" : 1900.00000000
    },
    {
        "name" : "GBP",
        "assetref" : "217-267-25009",
        "qty" : 89000.00000000
    },
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 775.00000000
    },
    {
        "name" : "JPY",
        "assetref" : "316-266-63856",
        "qty" : 10500.00000000
    }
]

```

![Imagen44d](images/Imagen44d.png)

En nodo 2:
```sh
DemoChain: gettotalbalances 0     
{"method":"gettotalbalances","params":[0],"id":"96819379-1541689325","chain_name":"DemoChain"}

[
    {
        "name" : "asset1",
        "assetref" : "167-266-39973",
        "qty" : 225.00000000
    },
    {
        "name" : "JPY",
        "assetref" : "316-266-63856",
        "qty" : 39500.00000000
    },
    {
        "name" : "USD",
        "assetref" : "294-266-6848",
        "qty" : 100.00000000
    },
    {
        "name" : "GBP",
        "assetref" : "217-267-25009",
        "qty" : 1000.00000000
    }
]
```

![Imagen44e](images/Imagen44e.png)

The first server should have 1900 dollars and 10500 yen. The second server should have 100 dollars and 39500 yen.

The exchange of assets was performed atomically in a single transaction, which you can view on both servers using: `listwallettransactions 1`

```sh
DemoChain: help listwallettransactions  
{"method":"help","params":["listwallettransactions"],"id":"87704404-1541693497","chain_name":"DemoChain"}

listwallettransactions ( count skip includeWatchonly verbose )

Lists information about the <count> most recent transactions in this node’s wallet.

Arguments:
1. count                            (numeric, optional, default=10) The number of transactions to return
2. skip                             (numeric, optional, default=0) The number of transactions to skip
3. includeWatchonly                 (bool, optional, default=false) Include transactions to watchonly addresses (see 'importaddress')
4. verbose                          (bool, optional, default=false) If true, returns detailed array of inputs and outputs and raw hex of transactions

Result:
[
  {
    "balance": {...},               (object)  Changes in wallet balance. 
    {
      "amount": x.xxx,              (numeric) The amount in native currency. Negative value means amount was send by the wallet, positive - received
      "assets": {...},              (object)  Changes in asset amounts. 
    }
    "myaddresses": [...],           (array)   Array of wallet addresses involved in transaction   
    "addresses": [...],             (array)   Array of counterparty addresses  involved in transaction  
    "permissions": [...],           (array)   Changes in permissions 
    "issue": {...},                 (object)  Issue details  
    "data" : "metadata",            (array)   Hexadecimal representation of metadata appended to the transaction
    "confirmations": n,             (numeric) The number of confirmations for the transaction. Available for 'send' and 
                                              'receive' category of transactions.
    "blockhash": "hashvalue",       (string)   The block hash containing the transaction. Available for 'send' and 'receive'
                                               category of transactions.
    "blockindex": n,                (numeric)  The block index containing the transaction. Available for 'send' and 'receive'
                                               category of transactions.
    "txid": "transactionid",        (string) The transaction id. Available for 'send' and 'receive' category of transactions.
    "time": xxx,                    (numeric)  The transaction time in seconds since epoch (midnight Jan 1 1970 GMT).
    "timereceived": xxx,            (numeric)  The time received in seconds since epoch (midnight Jan 1 1970 GMT). Available 
                                               for 'send' and 'receive' category of transactions.
    "comment": "...",               (string) If a comment is associated with the transaction.
    "vin": [...],                   (array)  If verbose=true. Array of input details
    "vout": [...],                  (array)  If verbose=true. Array of output details
    "hex" : "data"                  (string) If verbose=true. Raw data for transaction
  }
]

Examples:

List the most recent 10 transactions in the systems
> multichain-cli DemoChain listwallettransactions 

List transactions 100 to 120 
> multichain-cli DemoChain listwallettransactions 20 100

As a json rpc call
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "listwallettransactions", "params": [20, 100] }' -H 'content-type: text/plain;' http://127.0.0.1:7440



```

En Nodo 1:

```sh
DemoChain: listwallettransactions 1
{"method":"listwallettransactions","params":[1],"id":"87431422-1541693590","chain_name":"DemoChain"}

[
    {
        "balance" : {
            "amount" : 0.00000000,
            "assets" : [
                {
                    "name" : "USD",
                    "assetref" : "294-266-6848",
                    "qty" : -100.00000000
                },
                {
                    "name" : "JPY",
                    "assetref" : "316-266-63856",
                    "qty" : 10500.00000000
                }
            ]
        },
        "myaddresses" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "addresses" : [
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
        ],
        "permissions" : [
        ],
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 11,
        "blockhash" : "00aff63166264946c5fecc12613d9e4a7b475cbc03ed90626acea49b74a6f447",
        "blockindex" : 1,
        "blocktime" : 1541688956,
        "txid" : "dd2b39ed59532c27cdad72d7d349cc36501dcca09eb079c272378091c2dd3450",
        "valid" : true,
        "time" : 1541688936,
        "timereceived" : 1541688936
    }
]


```

En nodo 2:

```sh
DemoChain: listwallettransactions 1
{"method":"listwallettransactions","params":[1],"id":"17845122-1541693829","chain_name":"DemoChain"}

[
    {
        "balance" : {
            "amount" : 0.00000000,
            "assets" : [
                {
                    "name" : "JPY",
                    "assetref" : "316-266-63856",
                    "qty" : -10500.00000000
                },
                {
                    "name" : "USD",
                    "assetref" : "294-266-6848",
                    "qty" : 100.00000000
                }
            ]
        },
        "myaddresses" : [
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
        ],
        "addresses" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "permissions" : [
        ],
        "items" : [
        ],
        "data" : [
        ],
        "confirmations" : 11,
        "blockhash" : "00aff63166264946c5fecc12613d9e4a7b475cbc03ed90626acea49b74a6f447",
        "blockindex" : 1,
        "blocktime" : 1541688956,
        "txid" : "dd2b39ed59532c27cdad72d7d349cc36501dcca09eb079c272378091c2dd3450",
        "valid" : true,
        "time" : 1541688936,
        "timereceived" : 1541688936
    }
]
```

# Three-way exchange with metadata


## Now we’ll perform a more complex exchange between three different addresses, two belonging to the first node and one to the second. 

We will also add some metadata to the exchange transaction. Let’s begin by creating a new address on the first server (Nodo 1):

```sh
DemoChain: getnewaddress
{"method":"getnewaddress","params":[],"id":"76207908-1541855804","chain_name":"DemoChain"}

1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE
```
Let’s grant this address the necessary permissions, still on the first server:

```sh
DemoChain: grant 1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE send,receive
{"method":"grant","params":["1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE","send,receive"],"id":"83310617-1541855879","chain_name":"DemoChain"}

f8e493925c9b56e33824f9e99ab8f68950f3e98367dc39f648d041316a3109b0

```

Veamos quien dispone de USD en este nodo:
```sh
DemoChain: getmultibalances "*" USD 0 false true 
{"method":"getmultibalances","params":["*","USD",0,false,true],"id":"60203551-1541855996","chain_name":"DemoChain"}

{
    "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt" : [
        {
            "name" : "USD",
            "assetref" : "294-266-6848",
            "qty" : 1900.00000000
        }
    ],
    "total" : [
        {
            "name" : "USD",
            "assetref" : "294-266-6848",
            "qty" : 1900.00000000
        }
    ]
}
```

And now let’s send it some of the dollars owned by this node’s other address:

```sh
DemoChain: help sendassetfrom
{"method":"help","params":["sendassetfrom"],"id":"55540602-1541858442","chain_name":"DemoChain"}

sendassetfrom "from-address" "to-address" "asset-identifier" asset-qty ( native-amount "comment" "comment-to" )

Send an asset amount using specific address. 

Arguments:
1. "from-address"                   (string, required) Address to send from. 
2. "to-address"                     (string, required) The address to send to.
3. "asset-identifier"               (string, required) Asset identifier - one of the following: issue txid, asset reference, asset name.
4. asset-qty                        (numeric, required) Asset quantity to send. eg 0.1
5. native-amount                    (numeric, optional) native currency amount to send. eg 0.1, Default: minimum-per-output.
6. "comment"                        (string, optional) A comment used to store what the transaction is for. 
    This is not part of the transaction, just kept in your wallet.
7. "comment-to"                     (string, optional) A comment to store the name of the person or organization 
to which you're sending the transaction. This is not part of the 
transaction, just kept in your wallet.

Result:
"transactionid"                     (string) The transaction id.

Examples:
> multichain-cli DemoChain sendassetfrom "1M72Sfpbz1BPpXFHz9m3CdqATR44Jvaydd" "1M72Sfpbz1BPpXFHz9m3CdqATR44Jvaydd" 0.1 12345-6789-1234 100
> multichain-cli DemoChain sendassetfrom "1M72Sfpbz1BPpXFHz9m3CdqATR44Jvaydd" "1M72Sfpbz1BPpXFHz9m3CdqATR44Jvaydd" 0.1 12345-6789-1234 100 "donation" "seans outpost"
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "sendassetfrom", "params": ["1M72Sfpbz1BPpXFHz9m3CdqATR44Jvaydd", "1M72Sfpbz1BPpXFHz9m3CdqATR44Jvaydd", 0.1, 12345-6789-1234, 100, "donation", "seans outpost"] }' -H 'content-type: text/plain;' http://127.0.0.1:7440


DemoChain: sendassetfrom 1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt 1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE USD 300 0 "donation" "demo outpost"
{"method":"sendassetfrom","params":["1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt","1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE","USD",300,0,"donation","demo outpost"],"id":"17192034-1541858856","chain_name":"DemoChain"}

2516be7c8fbb649118899eaa6ae26e82e7d120d403b003d1b56c596c25c52d31

```

![Imagen45a](images/Imagen45a.png)

![Imagen45b](images/Imagen45b.png)

![Imagen45c](images/Imagen45c.png)

![Imagen45d](images/Imagen45d.png)

![Imagen45e](images/Imagen45e.png)

A transaction ID should be displayed, and the balance for all addresses can be seen:

```sh
DemoChain: getmultibalances
{"method":"getmultibalances","params":[],"id":"11774960-1541863492","chain_name":"DemoChain"}

{
    "1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE" : [
        {
            "name" : "USD",
            "assetref" : "294-266-6848",
            "qty" : 300.00000000
        }
    ],
    "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt" : [
        {
            "name" : "USD",
            "assetref" : "294-266-6848",
            "qty" : 1600.00000000
        },
        {
            "name" : "JPY",
            "assetref" : "316-266-63856",
            "qty" : 10500.00000000
        },
        {
            "name" : "asset1",
            "assetref" : "167-266-39973",
            "qty" : 775.00000000
        }
    ],
    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 40000.00000000
        }
    ],
    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 49000.00000000
        }
    ],
    "total" : [
        {
            "name" : "USD",
            "assetref" : "294-266-6848",
            "qty" : 1900.00000000
        },
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 89000.00000000
        },
        {
            "name" : "JPY",
            "assetref" : "316-266-63856",
            "qty" : 10500.00000000
        },
        {
            "name" : "asset1",
            "assetref" : "167-266-39973",
            "qty" : 775.00000000
        }
    ]
}
``` 

![Imagen45f](images/Imagen45f.png)



Now let’s create a new exchange transaction, similar to the first one. On the second server (Nodo 2):

```sh
DemoChain: preparelockunspentfrom 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg '{"JPY":10500}'

{"method":"preparelockunspentfrom","params":["1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg",{"JPY":10500}],"id":"28103207-1541865282","chain_name":"DemoChain"}

{
    "txid" : "2fbbad25eacc13d9123109d5de0a4764d0c852dcfd26e721ff489c9e1054b453",
    "vout" : 0
}

```

![Imagen46a](images/Imagen46a.png)

![Imagen46b](images/Imagen46b.png)

![Imagen46c](images/Imagen46c.png)

As before, we start building the exchange transaction, specifying that we want 100 dollars in exchange for these 10500 yen ( seguimos en Nodo 2):

```sh
DemoChain: createrawexchange 2fbbad25eacc13d9123109d5de0a4764d0c852dcfd26e721ff489c9e1054b453 0 '{"USD":100}'
{"method":"createrawexchange","params":["2fbbad25eacc13d9123109d5de0a4764d0c852dcfd26e721ff489c9e1054b453",0,{"USD":100}],"id":"52848131-1541865843","chain_name":"DemoChain"}

010000000153b454109e9c48ff21e726fddc52c8d064470aded5093112d913ccea25adbb2f000000006b483045022100e0f0d51a40fbce1eaba99057573d4b0c48c810d5d7eadbe40f6a0d4cfbda2b250220265ea7c8d58b42af49f404ffbf373125089d127a3a78e0533b913adc11c49d88832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddffffffff0100000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000

```

Copy the hexadecimal blob shown on the second server to some temporary place, then switch to the first server:

```sh
DemoChain: preparelockunspentfrom 1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt '{"USD":60}'
{"method":"preparelockunspentfrom","params":["1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",{"USD":60}],"id":"87015067-1541866286","chain_name":"DemoChain"}

{
    "txid" : "8cc44b963e9971a21e07c22d41efd8a0ef71f54cfccf4957d15bab8f1fa522f2",
    "vout" : 0
}

```


![Imagen47a](images/Imagen47a.png)

![Imagen47b](images/Imagen47b.png)

And now we’ll add this offer of 60 dollars to the exchange transaction, request 6300 yen in exchange (pro rata as per the original offer):

```sh
DemoChain: appendrawexchange 010000000153b454109e9c48ff21e726fddc52c8d064470aded5093112d913ccea25adbb2f000000006b483045022100e0f0d51a40fbce1eaba99057573d4b0c48c810d5d7eadbe40f6a0d4cfbda2b250220265ea7c8d58b42af49f404ffbf373125089d127a3a78e0533b913adc11c49d88832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddffffffff0100000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000 8cc44b963e9971a21e07c22d41efd8a0ef71f54cfccf4957d15bab8f1fa522f2 0 '{"JPY":6300}'
{"method":"appendrawexchange","params":["010000000153b454109e9c48ff21e726fddc52c8d064470aded5093112d913ccea25adbb2f000000006b483045022100e0f0d51a40fbce1eaba99057573d4b0c48c810d5d7eadbe40f6a0d4cfbda2b250220265ea7c8d58b42af49f404ffbf373125089d127a3a78e0533b913adc11c49d88832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddffffffff0100000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000","8cc44b963e9971a21e07c22d41efd8a0ef71f54cfccf4957d15bab8f1fa522f2",0,{"JPY":6300}],"id":"77476553-1541866749","chain_name":"DemoChain"}

{
    "hex" : "010000000253b454109e9c48ff21e726fddc52c8d064470aded5093112d913ccea25adbb2f000000006b483045022100e0f0d51a40fbce1eaba99057573d4b0c48c810d5d7eadbe40f6a0d4cfbda2b250220265ea7c8d58b42af49f404ffbf373125089d127a3a78e0533b913adc11c49d88832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddfffffffff222a51f8fab5bd15749cffc4cf571efa0d8ef412dc2071ea271993e964bc48c000000006a47304402206dccd4dd2dd00be50ec843e0974664bfb3aed2c998df1e8dc1d55fc4c84dbb9c02206077017ba2e92ad78c90a61ac1cc3ba13b887de685ec16a709946d0436f4cfa38321033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff0200000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000000000003776a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff9709c180000000000007500000000",
    "complete" : false
}

```

The output should contain a longer hexadecimal blob, alongside complete : false, meaning that the exchange is not yet balanced. Copy this longer blob to the clipboard, and let’s try sending it:

```sh
DemoChain: sendrawtransaction 010000000253b454109e9c48ff21e726fddc52c8d064470aded5093112d913ccea25adbb2f000000006b483045022100e0f0d51a40fbce1eaba99057573d4b0c48c810d5d7eadbe40f6a0d4cfbda2b250220265ea7c8d58b42af49f404ffbf373125089d127a3a78e0533b913adc11c49d88832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddfffffffff222a51f8fab5bd15749cffc4cf571efa0d8ef412dc2071ea271993e964bc48c000000006a47304402206dccd4dd2dd00be50ec843e0974664bfb3aed2c998df1e8dc1d55fc4c84dbb9c02206077017ba2e92ad78c90a61ac1cc3ba13b887de685ec16a709946d0436f4cfa38321033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff0200000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000000000003776a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff9709c180000000000007500000000
{"method":"sendrawtransaction","params":["010000000253b454109e9c48ff21e726fddc52c8d064470aded5093112d913ccea25adbb2f000000006b483045022100e0f0d51a40fbce1eaba99057573d4b0c48c810d5d7eadbe40f6a0d4cfbda2b250220265ea7c8d58b42af49f404ffbf373125089d127a3a78e0533b913adc11c49d88832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddfffffffff222a51f8fab5bd15749cffc4cf571efa0d8ef412dc2071ea271993e964bc48c000000006a47304402206dccd4dd2dd00be50ec843e0974664bfb3aed2c998df1e8dc1d55fc4c84dbb9c02206077017ba2e92ad78c90a61ac1cc3ba13b887de685ec16a709946d0436f4cfa38321033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff0200000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000000000003776a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff9709c180000000000007500000000"],"id":"79586783-1541866950","chain_name":"DemoChain"}

error code: -26
error message:
64: Asset transfer script rejected - mismatch in input/output quantities

```
An error should be displayed regarding a mismatch between the transaction’s input and output quantities. So let’s see which assets are still being offered and requested in this larger transaction:

```sh
DemoChain: decoderawexchange 010000000253b454109e9c48ff21e726fddc52c8d064470aded5093112d913ccea25adbb2f000000006b483045022100e0f0d51a40fbce1eaba99057573d4b0c48c810d5d7eadbe40f6a0d4cfbda2b250220265ea7c8d58b42af49f404ffbf373125089d127a3a78e0533b913adc11c49d88832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddfffffffff222a51f8fab5bd15749cffc4cf571efa0d8ef412dc2071ea271993e964bc48c000000006a47304402206dccd4dd2dd00be50ec843e0974664bfb3aed2c998df1e8dc1d55fc4c84dbb9c02206077017ba2e92ad78c90a61ac1cc3ba13b887de685ec16a709946d0436f4cfa38321033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff0200000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000000000003776a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff9709c180000000000007500000000
{"method":"decoderawexchange","params":["010000000253b454109e9c48ff21e726fddc52c8d064470aded5093112d913ccea25adbb2f000000006b483045022100e0f0d51a40fbce1eaba99057573d4b0c48c810d5d7eadbe40f6a0d4cfbda2b250220265ea7c8d58b42af49f404ffbf373125089d127a3a78e0533b913adc11c49d88832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddfffffffff222a51f8fab5bd15749cffc4cf571efa0d8ef412dc2071ea271993e964bc48c000000006a47304402206dccd4dd2dd00be50ec843e0974664bfb3aed2c998df1e8dc1d55fc4c84dbb9c02206077017ba2e92ad78c90a61ac1cc3ba13b887de685ec16a709946d0436f4cfa38321033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff0200000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000000000003776a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff9709c180000000000007500000000"],"id":"94060315-1541867093","chain_name":"DemoChain"}

{
    "offer" : {
        "amount" : 0.00000000,
        "assets" : [
            {
                "name" : "JPY",
                "assetref" : "316-266-63856",
                "qty" : 4200.00000000
            }
        ]
    },
    "ask" : {
        "amount" : 0.00000000,
        "assets" : [
            {
                "name" : "USD",
                "assetref" : "294-266-6848",
                "qty" : 40.00000000
            }
        ]
    },
    "requiredfee" : 0.00000000,
    "candisable" : true,
    "cancomplete" : true,
    "complete" : false
}
```

This should show that there are still a further 4200 yen on offer, and a further 40 dollars being requested. For a more detailed breakdown:

```sh
DemoChain: decoderawexchange 010000000253b454109e9c48ff21e726fddc52c8d064470aded5093112d913ccea25adbb2f000000006b483045022100e0f0d51a40fbce1eaba99057573d4b0c48c810d5d7eadbe40f6a0d4cfbda2b250220265ea7c8d58b42af49f404ffbf373125089d127a3a78e0533b913adc11c49d88832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddfffffffff222a51f8fab5bd15749cffc4cf571efa0d8ef412dc2071ea271993e964bc48c000000006a47304402206dccd4dd2dd00be50ec843e0974664bfb3aed2c998df1e8dc1d55fc4c84dbb9c02206077017ba2e92ad78c90a61ac1cc3ba13b887de685ec16a709946d0436f4cfa38321033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff0200000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000000000003776a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff9709c180000000000007500000000 true
{"method":"decoderawexchange","params":["010000000253b454109e9c48ff21e726fddc52c8d064470aded5093112d913ccea25adbb2f000000006b483045022100e0f0d51a40fbce1eaba99057573d4b0c48c810d5d7eadbe40f6a0d4cfbda2b250220265ea7c8d58b42af49f404ffbf373125089d127a3a78e0533b913adc11c49d88832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddfffffffff222a51f8fab5bd15749cffc4cf571efa0d8ef412dc2071ea271993e964bc48c000000006a47304402206dccd4dd2dd00be50ec843e0974664bfb3aed2c998df1e8dc1d55fc4c84dbb9c02206077017ba2e92ad78c90a61ac1cc3ba13b887de685ec16a709946d0436f4cfa38321033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff0200000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000000000003776a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff9709c180000000000007500000000",true],"id":"90198242-1541867216","chain_name":"DemoChain"}

{
    "offer" : {
        "amount" : 0.00000000,
        "assets" : [
            {
                "name" : "JPY",
                "assetref" : "316-266-63856",
                "qty" : 4200.00000000
            }
        ]
    },
    "ask" : {
        "amount" : 0.00000000,
        "assets" : [
            {
                "name" : "USD",
                "assetref" : "294-266-6848",
                "qty" : 40.00000000
            }
        ]
    },
    "requiredfee" : 0.00000000,
    "candisable" : true,
    "cancomplete" : true,
    "complete" : false,
    "exchanges" : [
        {
            "offer" : {
                "amount" : 0.00000000,
                "assets" : [
                    {
                        "name" : "JPY",
                        "assetref" : "316-266-63856",
                        "qty" : 10500.00000000
                    }
                ],
                "address" : "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg",
                "txid" : "2fbbad25eacc13d9123109d5de0a4764d0c852dcfd26e721ff489c9e1054b453",
                "vout" : 0
            },
            "ask" : {
                "amount" : 0.00000000,
                "assets" : [
                    {
                        "name" : "USD",
                        "assetref" : "294-266-6848",
                        "qty" : 100.00000000
                    }
                ],
                "address" : "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
            }
        },
        {
            "offer" : {
                "amount" : 0.00000000,
                "assets" : [
                    {
                        "name" : "USD",
                        "assetref" : "294-266-6848",
                        "qty" : 60.00000000
                    }
                ],
                "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",
                "txid" : "8cc44b963e9971a21e07c22d41efd8a0ef71f54cfccf4957d15bab8f1fa522f2",
                "vout" : 0
            },
            "ask" : {
                "amount" : 0.00000000,
                "assets" : [
                    {
                        "name" : "JPY",
                        "assetref" : "316-266-63856",
                        "qty" : 6300.00000000
                    }
                ],
                "address" : "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
            }
        }
    ]
}

```

The `exchanges` field shows all of the individual `offer` and `ask` stages in the exchange transaction so far, alongside the `address` involved. Now let’s complete the exchange using this node’s other address:

```sh
DemoChain: preparelockunspentfrom 1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE '{"USD":40}'
{"method":"preparelockunspentfrom","params":["1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE",{"USD":40}],"id":"99623155-1541867320","chain_name":"DemoChain"}

{
    "txid" : "269aea6b98f900dbcfefdad4b188852724a145eac220784566ddf7a5ba48587e",
    "vout" : 0
}
```

![Imagen48a](images/Imagen48a.png)

![Imagen48b](images/Imagen48b.png)

We use a different API here, to ensure that no further stages can be added, and to include some metadata (signed by the last party only):

```sh
DemoChain: completerawexchange 010000000253b454109e9c48ff21e726fddc52c8d064470aded5093112d913ccea25adbb2f000000006b483045022100e0f0d51a40fbce1eaba99057573d4b0c48c810d5d7eadbe40f6a0d4cfbda2b250220265ea7c8d58b42af49f404ffbf373125089d127a3a78e0533b913adc11c49d88832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddfffffffff222a51f8fab5bd15749cffc4cf571efa0d8ef412dc2071ea271993e964bc48c000000006a47304402206dccd4dd2dd00be50ec843e0974664bfb3aed2c998df1e8dc1d55fc4c84dbb9c02206077017ba2e92ad78c90a61ac1cc3ba13b887de685ec16a709946d0436f4cfa38321033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff0200000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000000000003776a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff9709c180000000000007500000000 269aea6b98f900dbcfefdad4b188852724a145eac220784566ddf7a5ba48587e 0 '{"JPY":4200}' "476f65732074687265652077617973"
{"method":"completerawexchange","params":["010000000253b454109e9c48ff21e726fddc52c8d064470aded5093112d913ccea25adbb2f000000006b483045022100e0f0d51a40fbce1eaba99057573d4b0c48c810d5d7eadbe40f6a0d4cfbda2b250220265ea7c8d58b42af49f404ffbf373125089d127a3a78e0533b913adc11c49d88832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddfffffffff222a51f8fab5bd15749cffc4cf571efa0d8ef412dc2071ea271993e964bc48c000000006a47304402206dccd4dd2dd00be50ec843e0974664bfb3aed2c998df1e8dc1d55fc4c84dbb9c02206077017ba2e92ad78c90a61ac1cc3ba13b887de685ec16a709946d0436f4cfa38321033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff0200000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000000000003776a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff9709c180000000000007500000000","269aea6b98f900dbcfefdad4b188852724a145eac220784566ddf7a5ba48587e",0,{"JPY":4200},"476f65732074687265652077617973"],"id":"19293443-1541868043","chain_name":"DemoChain"}

010000000353b454109e9c48ff21e726fddc52c8d064470aded5093112d913ccea25adbb2f000000006b483045022100e0f0d51a40fbce1eaba99057573d4b0c48c810d5d7eadbe40f6a0d4cfbda2b250220265ea7c8d58b42af49f404ffbf373125089d127a3a78e0533b913adc11c49d88832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddfffffffff222a51f8fab5bd15749cffc4cf571efa0d8ef412dc2071ea271993e964bc48c000000006a47304402206dccd4dd2dd00be50ec843e0974664bfb3aed2c998df1e8dc1d55fc4c84dbb9c02206077017ba2e92ad78c90a61ac1cc3ba13b887de685ec16a709946d0436f4cfa38321033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff7e5848baa5f7dd66457820c2ea45a124278588b1d4daefcfdb00f9986bea9a26000000006a47304402203396b43ae67aad660e6ab4380e54ae4fe87a569af7f780d59a5b5bd7d04e594b02203e91f4dfc24a8b8277bbd3e116c59f26c47192314ead7d4ac992da56a18fd838012102c1d13970937268160ce0d88989e04f0776b36e142858b23e2f5c56505e2411e1ffffffff0400000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000000000003776a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff9709c180000000000007500000000000000003776a914ddc3c15a91124060fe3f292d5a7d65af17c53d3688ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff9706810000000000000750000000000000000116a0f476f6573207468726565207761797300000000

```

This should output the longest hexadecimal blob yet, which we can finally broadcast for confirmation:

```sh
DemoChain: sendrawtransaction 010000000353b454109e9c48ff21e726fddc52c8d064470aded5093112d913ccea25adbb2f000000006b483045022100e0f0d51a40fbce1eaba99057573d4b0c48c810d5d7eadbe40f6a0d4cfbda2b250220265ea7c8d58b42af49f404ffbf373125089d127a3a78e0533b913adc11c49d88832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddfffffffff222a51f8fab5bd15749cffc4cf571efa0d8ef412dc2071ea271993e964bc48c000000006a47304402206dccd4dd2dd00be50ec843e0974664bfb3aed2c998df1e8dc1d55fc4c84dbb9c02206077017ba2e92ad78c90a61ac1cc3ba13b887de685ec16a709946d0436f4cfa38321033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff7e5848baa5f7dd66457820c2ea45a124278588b1d4daefcfdb00f9986bea9a26000000006a47304402203396b43ae67aad660e6ab4380e54ae4fe87a569af7f780d59a5b5bd7d04e594b02203e91f4dfc24a8b8277bbd3e116c59f26c47192314ead7d4ac992da56a18fd838012102c1d13970937268160ce0d88989e04f0776b36e142858b23e2f5c56505e2411e1ffffffff0400000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000000000003776a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff9709c180000000000007500000000000000003776a914ddc3c15a91124060fe3f292d5a7d65af17c53d3688ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff9706810000000000000750000000000000000116a0f476f6573207468726565207761797300000000
{"method":"sendrawtransaction","params":["010000000353b454109e9c48ff21e726fddc52c8d064470aded5093112d913ccea25adbb2f000000006b483045022100e0f0d51a40fbce1eaba99057573d4b0c48c810d5d7eadbe40f6a0d4cfbda2b250220265ea7c8d58b42af49f404ffbf373125089d127a3a78e0533b913adc11c49d88832102f2ebc41915660d6f45dbbf96587f351ed9f46a58e8f71718816994248a0773ddfffffffff222a51f8fab5bd15749cffc4cf571efa0d8ef412dc2071ea271993e964bc48c000000006a47304402206dccd4dd2dd00be50ec843e0974664bfb3aed2c998df1e8dc1d55fc4c84dbb9c02206077017ba2e92ad78c90a61ac1cc3ba13b887de685ec16a709946d0436f4cfa38321033988a800c3c3b99e06fea653a27c1638027d1482dd0db70c8992f1c6369f43c8ffffffff7e5848baa5f7dd66457820c2ea45a124278588b1d4daefcfdb00f9986bea9a26000000006a47304402203396b43ae67aad660e6ab4380e54ae4fe87a569af7f780d59a5b5bd7d04e594b02203e91f4dfc24a8b8277bbd3e116c59f26c47192314ead7d4ac992da56a18fd838012102c1d13970937268160ce0d88989e04f0776b36e142858b23e2f5c56505e2411e1ffffffff0400000000000000003776a914ad9011a02cc6b7ad4a2eb01c46e297f4dc854d0488ac1c73706b71d099e01f50753313c7ad322b28b81ac010270000000000007500000000000000003776a914d9072b1912e87ed2ce281356ea00728825a5229188ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff9709c180000000000007500000000000000003776a914ddc3c15a91124060fe3f292d5a7d65af17c53d3688ac1c73706b71698a0ebe2c7bc1d039e1bd06957ff9706810000000000000750000000000000000116a0f476f6573207468726565207761797300000000"],"id":"25210853-1541868167","chain_name":"DemoChain"}

f560b758390a671038b5ad341fcc6efed0adae0be87b00b758252357ba97e0cf
```

![Imagen49a](images/Imagen49a.png)

![Imagen49b](images/Imagen49b.png)

![Imagen49c](images/Imagen49c.png)


![Imagen49d](images/Imagen49d.png)

Now let’s see how this transaction looks to both nodes. First, from the global perspective on both servers:

Nodo 1:
```sh
DemoChain: listwallettransactions 1
{"method":"listwallettransactions","params":[1],"id":"34237478-1541868525","chain_name":"DemoChain"}

[
    {
        "balance" : {
            "amount" : 0.00000000,
            "assets" : [
                {
                    "name" : "USD",
                    "assetref" : "294-266-6848",
                    "qty" : -100.00000000
                },
                {
                    "name" : "JPY",
                    "assetref" : "316-266-63856",
                    "qty" : 10500.00000000
                }
            ]
        },
        "myaddresses" : [
            "1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE",
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "addresses" : [
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
        ],
        "permissions" : [
        ],
        "items" : [
        ],
        "data" : [
            "476f65732074687265652077617973"
        ],
        "confirmations" : 11,
        "blockhash" : "001e711735397079146a7f2ca5c34e76656ca241d8c0533c63dde832ebb3c05d",
        "blockindex" : 1,
        "blocktime" : 1541868180,
        "txid" : "f560b758390a671038b5ad341fcc6efed0adae0be87b00b758252357ba97e0cf",
        "valid" : true,
        "time" : 1541868167,
        "timereceived" : 1541868167
    }
]

```

Nodo 2:
```sh
DemoChain: listwallettransactions 1
{"method":"listwallettransactions","params":[1],"id":"39060869-1541868596","chain_name":"DemoChain"}

[
    {
        "balance" : {
            "amount" : 0.00000000,
            "assets" : [
                {
                    "name" : "JPY",
                    "assetref" : "316-266-63856",
                    "qty" : -10500.00000000
                },
                {
                    "name" : "USD",
                    "assetref" : "294-266-6848",
                    "qty" : 100.00000000
                }
            ]
        },
        "myaddresses" : [
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
        ],
        "addresses" : [
            "1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE",
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "permissions" : [
        ],
        "items" : [
        ],
        "data" : [
            "476f65732074687265652077617973"
        ],
        "confirmations" : 11,
        "blockhash" : "001e711735397079146a7f2ca5c34e76656ca241d8c0533c63dde832ebb3c05d",
        "blockindex" : 1,
        "blocktime" : 1541868180,
        "txid" : "f560b758390a671038b5ad341fcc6efed0adae0be87b00b758252357ba97e0cf",
        "valid" : true,
        "time" : 1541868167,
        "timereceived" : 1541868167
    }
]

```

Note how the metadata is shown in the data field. Then on the first server, let’s see how it looks from the perspective of each address:

```sh
DemoChain: listaddresstransactions 1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt 1
{"method":"listaddresstransactions","params":["1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt",1],"id":"37152936-1541868683","chain_name":"DemoChain"}

[
    {
        "balance" : {
            "amount" : 0.00000000,
            "assets" : [
                {
                    "name" : "USD",
                    "assetref" : "294-266-6848",
                    "qty" : -60.00000000
                },
                {
                    "name" : "JPY",
                    "assetref" : "316-266-63856",
                    "qty" : 6300.00000000
                }
            ]
        },
        "myaddresses" : [
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "addresses" : [
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg",
            "1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE"
        ],
        "permissions" : [
        ],
        "items" : [
        ],
        "data" : [
            "476f65732074687265652077617973"
        ],
        "confirmations" : 11,
        "blockhash" : "001e711735397079146a7f2ca5c34e76656ca241d8c0533c63dde832ebb3c05d",
        "blockindex" : 1,
        "blocktime" : 1541868180,
        "txid" : "f560b758390a671038b5ad341fcc6efed0adae0be87b00b758252357ba97e0cf",
        "valid" : true,
        "time" : 1541868167,
        "timereceived" : 1541868167
    }
]
DemoChain: listaddresstransactions 1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE 1
{"method":"listaddresstransactions","params":["1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE",1],"id":"96054835-1541868702","chain_name":"DemoChain"}

[
    {
        "balance" : {
            "amount" : 0.00000000,
            "assets" : [
                {
                    "name" : "USD",
                    "assetref" : "294-266-6848",
                    "qty" : -40.00000000
                },
                {
                    "name" : "JPY",
                    "assetref" : "316-266-63856",
                    "qty" : 4200.00000000
                }
            ]
        },
        "myaddresses" : [
            "1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE"
        ],
        "addresses" : [
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg",
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "permissions" : [
        ],
        "items" : [
        ],
        "data" : [
            "476f65732074687265652077617973"
        ],
        "confirmations" : 11,
        "blockhash" : "001e711735397079146a7f2ca5c34e76656ca241d8c0533c63dde832ebb3c05d",
        "blockindex" : 1,
        "blocktime" : 1541868180,
        "txid" : "f560b758390a671038b5ad341fcc6efed0adae0be87b00b758252357ba97e0cf",
        "valid" : true,
        "time" : 1541868167,
        "timereceived" : 1541868167
    }
]

```

On Second server (Nodo 2):

```sh
DemoChain: listaddresstransactions 1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg 1
{"method":"listaddresstransactions","params":["1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg",1],"id":"67842267-1541928746","chain_name":"DemoChain"}

[
    {
        "balance" : {
            "amount" : 0.00000000,
            "assets" : [
                {
                    "name" : "JPY",
                    "assetref" : "316-266-63856",
                    "qty" : -10500.00000000
                },
                {
                    "name" : "USD",
                    "assetref" : "294-266-6848",
                    "qty" : 100.00000000
                }
            ]
        },
        "myaddresses" : [
            "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
        ],
        "addresses" : [
            "1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE",
            "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
        ],
        "permissions" : [
        ],
        "items" : [
        ],
        "data" : [
            "476f65732074687265652077617973"
        ],
        "confirmations" : 11,
        "blockhash" : "001e711735397079146a7f2ca5c34e76656ca241d8c0533c63dde832ebb3c05d",
        "blockindex" : 1,
        "blocktime" : 1541868180,
        "txid" : "f560b758390a671038b5ad341fcc6efed0adae0be87b00b758252357ba97e0cf",
        "valid" : true,
        "time" : 1541868167,
        "timereceived" : 1541868167
    }
]
```


Notice how in each case, the balance, myaddresses and addresses fields change, to show the transaction from each perspective.

Vamos a ver los balances en ambos nodos:

Nodo 1:
```sh
DemoChain: getmultibalances
{"method":"getmultibalances","params":[],"id":"30335881-1541868761","chain_name":"DemoChain"}

{
    "1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE" : [
        {
            "name" : "USD",
            "assetref" : "294-266-6848",
            "qty" : 260.00000000
        },
        {
            "name" : "JPY",
            "assetref" : "316-266-63856",
            "qty" : 4200.00000000
        }
    ],
    "15fzSoXtzqCVLJ92fVVT6yx5XuKQqBuQvEP1s3" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 40000.00000000
        }
    ],
    "18vsvGs4YD8NeMTdnPJA3azfoQewotnAvE7EBT" : [
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 49000.00000000
        }
    ],
    "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt" : [
        {
            "name" : "USD",
            "assetref" : "294-266-6848",
            "qty" : 1540.00000000
        },
        {
            "name" : "JPY",
            "assetref" : "316-266-63856",
            "qty" : 16800.00000000
        },
        {
            "name" : "asset1",
            "assetref" : "167-266-39973",
            "qty" : 775.00000000
        }
    ],
    "total" : [
        {
            "name" : "USD",
            "assetref" : "294-266-6848",
            "qty" : 1800.00000000
        },
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 89000.00000000
        },
        {
            "name" : "JPY",
            "assetref" : "316-266-63856",
            "qty" : 21000.00000000
        },
        {
            "name" : "asset1",
            "assetref" : "167-266-39973",
            "qty" : 775.00000000
        }
    ]
}
```

Nodo 2:
```sh
DemoChain: getmultibalances
{"method":"getmultibalances","params":[],"id":"41882185-1541868838","chain_name":"DemoChain"}

{
    "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg" : [
        {
            "name" : "asset1",
            "assetref" : "167-266-39973",
            "qty" : 225.00000000
        },
        {
            "name" : "JPY",
            "assetref" : "316-266-63856",
            "qty" : 29000.00000000
        },
        {
            "name" : "USD",
            "assetref" : "294-266-6848",
            "qty" : 200.00000000
        },
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 1000.00000000
        }
    ],
    "total" : [
        {
            "name" : "asset1",
            "assetref" : "167-266-39973",
            "qty" : 225.00000000
        },
        {
            "name" : "JPY",
            "assetref" : "316-266-63856",
            "qty" : 29000.00000000
        },
        {
            "name" : "USD",
            "assetref" : "294-266-6848",
            "qty" : 200.00000000
        },
        {
            "name" : "GBP",
            "assetref" : "217-267-25009",
            "qty" : 1000.00000000
        }
    ]
}

```
En Nodo 1: Partíamos de este estado de Balance
![Imagen45f](images/Imagen45f.png)

> Nota: fijarse exclusivamente en las direcciones `"1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"` y `"1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE"`

En Nodo 1: Ahora tenemos este estado de Balance
![Imagen49e](images/Imagen49e.png)

En Nodo 2: Partíamos de este estado de Balance
![Imagen45f](images/Imagen45f.png)

> Nota: fijarse exclusivamente en la dirección `"1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"` 

Nota: importamos la dirección `1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE` en Nodo 2:
```sh 
DemoChain: importaddress   1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE "" true
{"method":"importaddress","params":["1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE","",true],"id":"74709410-1541928420","chain_name":"DemoChain"}

```

En Nodo 2: Ahora tenemos este estado de Balance
![Imagen49f](images/Imagen49f.png)

Resumen de la operación efectuada:

En Nodo 1:
* "1WLH5fhAqmJDAnSmdP2o5VwbxK7h3Uouf39qHt"
	* Tenía 1600 USD y 10500 JPY
	* Vende 60 USD
	* Recibe 6300 JPY a cambio 
	* Ahora tiene 1540 USD y 16800 JPY

* "1WyQf5vqy3hGqrzZKAopEuDnyu9ZgvhNVbkMfE"
	* Tenía 300 USD y 0 JPY
	* Vende 40 USD
	* Recibe 4200 JPY a cambio 
	* Ahora tiene 260 USD y 4200 JPY

En Nodo 2: 
* "1QTZ9pGzuj4uTNYBkSYD3vjPvv1sTFwWw18gAg"
	* Tenía 100 USD y 39500 JPY
	* Recibe 100 USD
	* Vende 10500 JPY a cambio
	* Ahora tiene 200 USD y 29000 JPY
