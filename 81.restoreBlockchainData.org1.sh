
MYHOME=$PWD

echo "Copy blockchain data from peers - START"

docker cp ./blockchainData/peer0.org1.example.com/chaincodes peer0.org1.example.com:/var/hyperledger/production/
docker cp ./blockchainData/peer0.org1.example.com/ledgersData peer0.org1.example.com:/var/hyperledger/production/
docker cp ./blockchainData/peer0.org1.example.com/transientstore peer0.org1.example.com:/var/hyperledger/production/

echo "Copy blockchain data from peers - END"
cd $MYHOME
