MYHOME=$PWD
. env.sh

function createPeer1Org1() {
  export FABRIC_CA_CLIENT_HOME=${WRKDIR}/organizations/peerOrganizations/org1.example.com/
  #set -x

  echo "Registering peer1"
  fabric-ca-client register --caname ca-org1 --id.name peer1 --id.secret peer1pw --id.type peer --tls.certfiles ${WRKDIR}/organizations/fabric-ca/org1/tls-cert.pem
  
  echo "Generating the peer1 msp"
  fabric-ca-client enroll -u https://peer1:peer1pw@localhost:7054 --caname ca-org1 -M ${WRKDIR}/organizations/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/msp --csr.hosts peer1.org1.example.com --tls.certfiles ${WRKDIR}/organizations/fabric-ca/org1/tls-cert.pem

  cp ${WRKDIR}/organizations/peerOrganizations/org1.example.com/msp/config.yaml ${WRKDIR}/organizations/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/msp/config.yaml

  echo "Generating the peer1-tls certificates"
  fabric-ca-client enroll -u https://peer1:peer1pw@localhost:7054 --caname ca-org1 -M ${WRKDIR}/organizations/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls --enrollment.profile tls --csr.hosts peer1.org1.example.com --csr.hosts localhost --tls.certfiles ${WRKDIR}/organizations/fabric-ca/org1/tls-cert.pem

  cp ${WRKDIR}/organizations/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/tlscacerts/* ${WRKDIR}/organizations/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/ca.crt
  cp ${WRKDIR}/organizations/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/signcerts/* ${WRKDIR}/organizations/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/server.crt
  cp ${WRKDIR}/organizations/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/keystore/* ${WRKDIR}/organizations/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/server.key

  mkdir -p ${WRKDIR}/organizations/peerOrganizations/org1.example.com/msp/tlscacerts
  cp ${WRKDIR}/organizations/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/tlscacerts/* ${WRKDIR}/organizations/peerOrganizations/org1.example.com/msp/tlscacerts/ca.crt

  mkdir -p ${WRKDIR}/organizations/peerOrganizations/org1.example.com/tlsca
  cp ${WRKDIR}/organizations/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/tlscacerts/* ${WRKDIR}/organizations/peerOrganizations/org1.example.com/tlsca/tlsca.org1.example.com-cert.pem

  mkdir -p ${WRKDIR}/organizations/peerOrganizations/org1.example.com/ca
  cp ${WRKDIR}/organizations/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/msp/cacerts/* ${WRKDIR}/organizations/peerOrganizations/org1.example.com/ca/ca.org1.example.com-cert.pem

}

cd
cd fabric-samples/test-network
WRKDIR=$PWD

echo "Create crypto materials for peer1.org1.example.com"
createPeer1Org1

cd $PWD



