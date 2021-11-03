MYHOME=$PWD
. env.sh
cd
cd fabric-samples/test-network
#initialize marble without PDC
setEnv4Org1
echo "Install smart contracts"
peer lifecycle chaincode install ./private.tar.gz
peer lifecycle chaincode install ./marblesNoPDC.tar.gz

echo "Check installes chain codes"
peer lifecycle chaincode queryinstalled

cd $PWD


