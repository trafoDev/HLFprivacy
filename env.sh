
export PATH=${HOME}/fabric-samples/bin:$PATH
export FABRIC_CFG_PATH=${HOME}/fabric-samples/config/

function echoEnv() {
# Environment variables for Org1
  echo $CORE_PEER_TLS_ENABLED
  echo $CORE_PEER_LOCALMSPID
  echo $CORE_PEER_TLS_ROOTCERT_FILE
  echo $CORE_PEER_MSPCONFIGPATH
  echo $CORE_PEER_ADDRESS
}

function clearEnv() {
# Environment variables for Org1
  export CORE_PEER_TLS_ENABLED=
  export CORE_PEER_LOCALMSPID=
  export CORE_PEER_TLS_ROOTCERT_FILE=
  export CORE_PEER_MSPCONFIGPATH=
  export CORE_PEER_ADDRESS=
}

function setEnv4Org1() {
# Environment variables for Org1
  export CORE_PEER_TLS_ENABLED=true
  export CORE_PEER_LOCALMSPID="Org1MSP"
  export CORE_PEER_TLS_ROOTCERT_FILE=${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
  export CORE_PEER_MSPCONFIGPATH=${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
  export CORE_PEER_ADDRESS=localhost:7051
  export PEER_ID=peer0.org1.example.com
}

function setEnv4Org2() {
# Environment variables for Org2
  export CORE_PEER_TLS_ENABLED=true
  export CORE_PEER_LOCALMSPID="Org2MSP"
  export CORE_PEER_TLS_ROOTCERT_FILE=${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt
  export CORE_PEER_MSPCONFIGPATH=${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp
  export CORE_PEER_ADDRESS=localhost:9051
  export PEER_ID=peer0.org2.example.com
}

function setEnv4Org3() {
# Environment variables for Org3
  export CORE_PEER_TLS_ENABLED=true
  export CORE_PEER_LOCALMSPID="Org3MSP"
  export CORE_PEER_TLS_ROOTCERT_FILE=${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt
  export CORE_PEER_MSPCONFIGPATH=${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp
  export CORE_PEER_ADDRESS=localhost:11051
  export PEER_ID=peer0.org3.example.com
}

function pressAnyKey() {
  echo -e "Press any key to continue...\n"; read -n1 -s -r -p "" key
}
###################################################################################################
