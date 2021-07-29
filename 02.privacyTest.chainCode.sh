MYHOME=$PWD
. env.sh
cd
cd fabric-samples/test-network
#initialize marble without PDC
setEnv4Org1
echo "Create marble1 object using marblesNoPDC chaincode installed on channel.n2 channel"
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n2 -n marblesNoPDC -c '{"Args":["initMarble","marble1","blue","135","jerry"]}'

#wait 2 second for block to be created
sleep 2
echo "Marble >>marble1<< has been created"
pressAnyKey

echo "Querying org1 ledger about marble1" 
setEnv4Org1
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble1"]}'
#
echo "Querying org2 ledger about marble1" 
setEnv4Org2
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble1"]}'
pressAnyKey

setEnv4Org1
echo "Create marble1 once more object using marblesNoPDC chaincode installed on channel.n2 channel"
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n2 -n marblesNoPDC -c '{"Args":["initMarble","marble1","blue","135","jerry"]}'

#wait 2 second for block to be created
sleep 2

cd $PWD

