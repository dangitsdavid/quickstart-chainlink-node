#!/bin/bash

case $chainNetwork in
  ETH-Mainnet )
    chain=1
    contractAddress=0x514910771af9ca656af840dff83e8264ecf986ca
    ;;
  Kovan-ETH-Testnet )
    chain=42
    contractAddress=0xa36085F69e2889c224210F603D836748e7dC0088
    ;;
  Rinkeby-ETH-Testnet )
    chain=4
    contractAddress=0x01BE23585060835E02B77ef475b0Cc51aA1e0709
    ;;
  xDai-Mainnet )
    chain=100
    contractAddress=0xE2e73A1c69ecF83F464EFCE6A5be353a37cA09b2
    ;;
  Heco-Mainnet )
    chain=128
    contractAddress=0x9e004545c59D359F6B7BFB06a26390b087717b42
    ;;
  BSC-Mainnet )
    chain=56
    contractAddress=0x404460c6a5ede2d891e8297795264fde62adbb75
    ;;
  Matic-Mainnet )
    chain=137
    contractAddress=0xb0897686c545045afc77cf20ec7a532e3120e0f1
    ;;
esac

printf "# Chainlink Environment file
ROOT=/chainlink
LOG_LEVEL=debug
ETH_CHAIN_ID=${chain}
LINK_CONTRACT_ADDRESS=${contractAddress}
ALLOW_ORIGINS=*
MINIMUM_CONTRACT_PAYMENT=1000000000000
DEFAULT_HTTP_ALLOW_UNRESTRICTED_NETWORK_ACCESS=true
JSON_CONSOLE=true
# Ethereum Mainnet Variables
MIN_OUTGOING_CONFIRMATIONS=2
MIN_INCOMING_CONFIRMATIONS=2
ETH_URL=${ethUrl}
# Database Values
DATABASE_URL=postgresql://${psqlUser}:${psqlPwd}@${psqlHostname}:${psqlPort}/${psqlDb}
DATABASE_TIMEOUT=0
# Settings for HTTPS (enable these or the ones below for http)
#CHAINLINK_TLS_PORT=6689
#SECURE_COOKIES=true
#TLS_CERT_PATH=/chainlink/tls/server.crt
#TLS_KEY_PATH=/chainlink/tls/server.key
# Setting for HTTP
CHAINLINK_TLS_PORT=0
SECURE_COOKIES=false
# Transaction Improvements
GAS_UPDATER_ENABLED=true
GAS_UPDATER_TRANSACTION_PERCENTILE=60
ETH_GAS_BUMP_THRESHOLD=9
ETH_GAS_BUMP_WEI=7000000000
ETH_BALANCE_MONITOR_BLOCK_DELAY=3
ENABLE_BULLETPROOF_TX_MANAGER=true" > /home/ec2-user/.chainlink/.env

echo "${apiUser}
${apiPwd}" > /home/ec2-user/.chainlink/.api

echo "${walletPwd}" > /home/ec2-user/.chainlink/.password

echo
echo -e "Created OCR environment variables succesfully"
echo