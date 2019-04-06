pragma solidity ^0.4.23;
import "./DappToken.sol"; 
contract DappTokenSale{
	
	address admin;
	DappToken public tokenContract;
	uint public tokenPrice;
	uint public tokenSold;

	event Sell(address _buyer,uint amount);

	function DappTokenSale(DappToken _tokenContract,uint _tokenPrice) public{
	admin=msg.sender;
	tokenContract=_tokenContract;
	tokenPrice=_tokenPrice;


	}
	function multiply(uint x,uint y) internal pure returns (uint z){

	require(y==0 || (z=x*y)/y==x); 

	}

	function buyTokens(uint _numberTokens) public payable{
	require(msg.value==multiply(_numberTokens ,tokenPrice));

	require(tokenContract.balanceOf(this)>=_numberTokens);

	require(tokenContract.transfer(msg.sender,_numberTokens));

	tokenSold+=_numberTokens;

	emit Sell(msg.sender,_numberTokens);
	}

	function endSale() public {
	require(msg.sender==admin);
	require(tokenContract.transfer(admin,tokenContract.balanceOf(this)));
	admin.transfer(address(this).balance);

	}
}