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
                      -C channel.n2 -n marblesNoPDC -c '{"Args":["initMarble","marble2","red","22","bob"]}'
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n2 -n marblesNoPDC -c '{"Args":["initMarble","marble3","yellow","33","tina"]}'
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n2 -n marblesNoPDC -c '{"Args":["initMarble","marble4","pink","44","henry"]}'
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n2 -n marblesNoPDC -c '{"Args":["initMarble","marble5","white","55","peggy"]}'

#wait 2 second for block to be created
sleep 2
pressAnyKey

echo "Querying org1 ledger about created marbles from 1 to 5" 
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble1"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble2"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble3"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble4"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble5"]}'
#


peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n2 -n marblesNoPDC -c '{"Args":["initMarble","marble6","black","66","dorothy"]}'
#wait 2 second for block to be created
sleep 2

peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n2 -n marblesNoPDC -c '{"Args":["initMarble","marble7","green","77","jack"]}'
#wait 2 second for block to be created
sleep 2

peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com \
                      --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
	                  --peerAddresses localhost:7051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
	                  --peerAddresses localhost:9051 --tlsRootCertFiles ${HOME}/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
                      -C channel.n2 -n marblesNoPDC -c '{"Args":["initMarble","marble8","gray","88","jessica"]}'
#wait 2 second for block to be created
sleep 2
pressAnyKey

echo "Querying org1 ledger about created marbles from 1 to 8" 
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble1"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble2"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble3"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble4"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble5"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble6"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble7"]}'
peer chaincode query -C channel.n2 -n marblesNoPDC -c '{"Args":["readMarble","marble8"]}'


cd $PWD

