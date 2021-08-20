MYHOME=$PWD
. env.sh

#clearing data from the second part of testing scenario
./19.privacyTestPart2.clearNetwork.sh

#clearing the network
cd
cd fabric-samples/test-network
#cleaning the network from previous tests
./network.sh down
cd addOrg3
./addOrg3.sh down

#cleaning the Blockchain Explorer
cd $MYHOME/explorer
./clean_explorer.sh

cd $PWD