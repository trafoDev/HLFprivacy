MYHOME=$PWD
. env.sh

#cleaning the network from previous tests
./99.clearNetwork.sh

cd
cd fabric-samples/test-network
#cleaning the network from previous tests
#./network.sh down
#cd addOrg3
#./addOrg3.sh down
#cd .. 
#create a simple network (two orgs) with marbles chaincode with PCD enabled
./network.sh up createChannel -ca -s couchdb -c channel.n1
./network.sh deployCC -ccn private -ccp ../chaincode/marbles02_private/go/ \
                      -ccl go -ccep "AND('Org1MSP.peer','Org2MSP.peer')" \
                      -cccg ../chaincode/marbles02_private/collections_config.json -c channel.n1
#create a simple network (two orgs) with marbles chaincode - no PCD
./network.sh createChannel -c channel.n2
./network.sh deployCC -ccn private -ccp ../chaincode/marbles02/go/ \
                      -ccl go -ccep "AND('Org1MSP.peer','Org2MSP.peer')" \
                      -c channel.n2 -ccn marblesNoPDC

cd $PWD