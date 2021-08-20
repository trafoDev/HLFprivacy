
MYHOME=$PWD

echo "Copy blockchain data from peers - START"

rm -f -r ./blockchainData
mkdir -p ./blockchainData

docker cp peer0.org1.example.com:/var/hyperledger/production/ ./blockchainData/peer0.org1.example.com
docker cp peer0.org2.example.com:/var/hyperledger/production/ ./blockchainData/peer0.org2.example.com
docker cp orderer.example.com:/var/hyperledger/production/ ./blockchainData/orderer.example.com

echo "Copy blockchain data from peers - END"
cd $MYHOME
