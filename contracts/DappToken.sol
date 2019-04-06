pragma solidity ^0.4.23;

contract DappToken {

  uint public totalSupply;
  mapping (address => uint) public balanceOf;
  string public name="Dapp Token";
  string public symbol='Dapp';
  string public  standard="Dapp token v1.0";

  event Transfer(address indexed _from,address indexed _to,uint _value);

  event Approve(address indexed _from,address indexed _spender,uint _value);

mapping (address => mapping (address => uint)) public allowance;



  function DappToken(uint _initialSupply) public {

  balanceOf[msg.sender]=_initialSupply;
    totalSupply=_initialSupply;

  }

  function transfer(address _to,uint _value) public returns (bool success){

  require(balanceOf[msg.sender]>=_value);
  balanceOf[msg.sender]-=_value;
  balanceOf[_to]+=_value;

  emit Transfer(msg.sender,_to,_value);

  return true;



  }

   function approve(address _spender,uint _value) public returns(bool success){

allowance[msg.sender][_spender]=_value; 
   emit Approve(msg.sender,_spender,_value);
   return true; 


   }
   function transferForm(address  _from, address _to,uint _value)public returns (bool success){

    require(_value<=balanceOf[_from]);
    require(_value<=allowance[_from][msg.sender]);

    balanceOf[_to]+=_value;
    balanceOf[_from]-=_value;
    allowance[_from][msg.sender]-=_value;


    emit Transfer(_from,_to,_value);
    return true;
   }

   
}
