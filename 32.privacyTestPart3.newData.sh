MYHOME=$PWD
. env.sh

cd
cd fabric-samples/test-network
#initialize marble with data stored in PDC
setEnv4Org1

export MARBLE=$(echo -n "{\"name\":\"marble_newData_1\",\"color\":\"newColor_1\",\"size\":1,\"owner\":\"newOwner_1\",\"price\":1}" | base64 | tr -d \\n)
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n1 -n private -c '{"Args":["InitMarble"]}' --transient "{\"marble\":\"$MARBLE\"}" 

#wait 2 second for block to be created
sleep 2
export MARBLE=$(echo -n "{\"name\":\"marble_newData_2\",\"color\":\"newColor_2\",\"size\":2,\"owner\":\"newOwner_2\",\"price\":2}" | base64 | tr -d \\n)
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n1 -n private -c '{"Args":["InitMarble"]}' --transient "{\"marble\":\"$MARBLE\"}" 

#wait 2 second for block to be created
sleep 2
export MARBLE=$(echo -n "{\"name\":\"marble_newData_3\",\"color\":\"newColor_3\",\"size\":3,\"owner\":\"newOwner_3\",\"price\":3}" | base64 | tr -d \\n)
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n1 -n private -c '{"Args":["InitMarble"]}' --transient "{\"marble\":\"$MARBLE\"}" 

#wait 2 second for block to be created
sleep 2
pressAnyKey

echo "Querying org1 ledger about created marbles from 1 to 9 with new owners" 

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
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarble","marble9"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarblePrivateDetails","marble9"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarble","marble_newData_1"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarblePrivateDetails","marble_newData_1"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarble","marble_newData_2"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarblePrivateDetails","marble_newData_2"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarble","marble_newData_3"]}'
peer chaincode query -C channel.n1 -n private -c '{"Args":["ReadMarblePrivateDetails","marble_newData_3"]}'


cd $PWD



