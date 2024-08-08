//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld {
address public arr;
address public owner;
  constructor() {
 owner = msg.sender;
  }

  
  modifier onlyOwner() {
 require(msg.sender == owner ||
 msg.sender == 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 );
 _;
 }
 
  struct Daten {
        
        string Hashwert;
       uint256 Transaktionsnummer;
       uint256 Zeitpunkt;
        address Nutzer;
    }

mapping (uint256=>Daten[]) public data;
function insert (uint256 _Transaktionsnummer, string memory _Hashwert) public onlyOwner {


    Daten memory myDaten;
    myDaten.Hashwert= _Hashwert;
    myDaten.Transaktionsnummer = _Transaktionsnummer;
    myDaten.Zeitpunkt = block.timestamp;
    myDaten.Nutzer = msg.sender;

    data[_Transaktionsnummer].push(myDaten);


}
function returnData (uint _productnr) public view returns (Daten[] memory) {
    return data[_productnr];
}
}

