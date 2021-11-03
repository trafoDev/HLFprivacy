MYHOME=$PWD
. env.sh

cd
cd fabric-samples/test-network
#initialize marble with data stored in PDC
setEnv4Org1
echo "Querying org1 ledger about created marbles from 1 to 8" 
echo 
echo "==================channel.n2==========================" 
echo 
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble1"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble2"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble3"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble4"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble5"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble6"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble7"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble8"]}'
echo 
echo "==================channel.n1==========================" 
echo 
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarble","marble1"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarblePrivateDetails","marble1"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarble","marble2"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarblePrivateDetails","marble2"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarble","marble3"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarblePrivateDetails","marble3"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarble","marble4"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarblePrivateDetails","marble4"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarble","marble5"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarblePrivateDetails","marble5"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarble","marble6"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarblePrivateDetails","marble6"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarble","marble7"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarblePrivateDetails","marble7"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarble","marble8"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarblePrivateDetails","marble8"]}'
echo 
echo "======================================================" 


cd $PWD



