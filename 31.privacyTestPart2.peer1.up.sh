MYHOME=$PWD
. env.sh

cd
cd fabric-samples/test-network

echo "Create peer1.org1.example.com"
docker-compose -f ../../HLFprivacy/config/docker-compose-test-peer.yaml -f ../../HLFprivacy/config/docker-compose-couch-peer1.yaml  up -d peer1.org1.example.com peer1couchdb0 
sleep 10
setEnv4Org1Peer1

echo "Join both channels"
peer channel join -b ./channel-artifacts/channel.n1.block
peer channel join -b ./channel-artifacts/channel.n2.block

echo "Install smart contracts"
peer lifecycle chaincode install ./private.tar.gz
peer lifecycle chaincode install ./marblesNoPDC.tar.gz

echo "Check installes chain codes"
peer lifecycle chaincode queryinstalled



cd $PWD



