MYHOME=$PWD
. env.sh

docker-compose -f ./config/docker-compose-test-cli.yaml  down --volumes --remove-orphans

#remove directories
rm -rf blockchainData/
rm -rf ledgersBlocks/
rm -rf config/peer0.org1.volume/
rm -rf config/peer0.org2.volume/
rm -rf config/orderer.volume/

cd $PWD