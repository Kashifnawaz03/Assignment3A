pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
 
contract myDemoToken is ERC20 {
    using SafeMath for uint;
    uint public cap;
    address public owner;
    mapping(address => uint) private accounts;
    constructor() ERC20("myDemoToken","MDT")public{
        owner = msg.sender;
        uint initialSupply  = 10000 * (10** uint(decimals()));
        cap = initialSupply.mul(2);
        _mint(msg.sender,initialSupply);
    }
   function buyToken()public payable{
        require(accounts[msg.sender] == 0, "Account already exist");
        require(msg.value > 0 && msg.sender != address(0), "Value should not be 0 or Invalid address");
        accounts[msg.sender] = msg.value;
        accounts[msg.sender] *= 5;
   }
   function TotalTokenGot()public view returns(uint){
        return accounts[msg.sender];
    }
    function adjustPrice(uint) public view{
        require(msg.sender == owner, "Only owner can adjust the price");
    }
}