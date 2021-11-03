MYHOME=$PWD
. env.sh

cd
cd fabric-samples/test-network
#initialize marble with data stored in PDC
setEnv4Org1
echo "Create marbles from 1 to 5 using private chaincode installed on channel.n1 channel"
export MARBLE=$(echo -n "{\"name\":\"marble2\",\"color\":\"red\",\"size\":22,\"owner\":\"bob\",\"price\":22}" | base64 | tr -d \\n)
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n1 -n private -c '{"Args":["InitMarble"]}' --transient "{\"marble\":\"$MARBLE\"}" 

export MARBLE=$(echo -n "{\"name\":\"marble3\",\"color\":\"yellow\",\"size\":33,\"owner\":\"tina\",\"price\":33}" | base64 | tr -d \\n)
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n1 -n private -c '{"Args":["InitMarble"]}' --transient "{\"marble\":\"$MARBLE\"}" 

export MARBLE=$(echo -n "{\"name\":\"marble4\",\"color\":\"pink\",\"size\":44,\"owner\":\"henry\",\"price\":44}" | base64 | tr -d \\n)
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n1 -n private -c '{"Args":["InitMarble"]}' --transient "{\"marble\":\"$MARBLE\"}" 

export MARBLE=$(echo -n "{\"name\":\"marble5\",\"color\":\"white\",\"size\":55,\"owner\":\"peggy\",\"price\":55}" | base64 | tr -d \\n)
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n1 -n private -c '{"Args":["InitMarble"]}' --transient "{\"marble\":\"$MARBLE\"}" 

export MARBLE_OWNER=$(echo -n "{\"name\":\"marble1\",\"owner\":\"james_bond_007\"}" | base64 | tr -d \\n)
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n1 -n private -c '{"Args":["TransferMarble"]}' --transient "{\"marble_owner\":\"$MARBLE_OWNER\"}" 

#wait 2 second for block to be created
sleep 2
pressAnyKey

echo "Querying org1 ledger about created marbles from 1 to 5" 
setEnv4Org1
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
#
echo "Create marble6 in a separate block"
export MARBLE=$(echo -n "{\"name\":\"marble6\",\"color\":\"black\",\"size\":66,\"owner\":\"dorothy\",\"price\":66}" | base64 | tr -d \\n)
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n1 -n private -c '{"Args":["InitMarble"]}' --transient "{\"marble\":\"$MARBLE\"}" 

#wait 2 second for block to be created
sleep 2

echo "Create marble7 in a separate block"
export MARBLE=$(echo -n "{\"name\":\"marble7\",\"color\":\"green\",\"size\":77,\"owner\":\"jack\",\"price\":77}" | base64 | tr -d \\n)
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n1 -n private -c '{"Args":["InitMarble"]}' --transient "{\"marble\":\"$MARBLE\"}" 

#wait 2 second for block to be created
sleep 2
echo "Create marble8 and delete marble5 in one block"
export MARBLE=$(echo -n "{\"name\":\"marble8\",\"color\":\"gray\",\"size\":88,\"owner\":\"jessica\",\"price\":88}" | base64 | tr -d \\n)
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n1 -n private -c '{"Args":["InitMarble"]}' --transient "{\"marble\":\"$MARBLE\"}" 
export MARBLE_DELETE=$(echo -n "{\"name\":\"marble5\"}" | base64 | tr -d \\n)
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n1 -n private -c '{"Args":["Delete"]}' --transient "{\"marble_delete\":\"$MARBLE_DELETE\"}"

#wait 2 second for block to be created
sleep 2
pressAnyKey

echo "Querying org1 ledger about created marbles from 1 to 8" 

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


cd $PWD



