// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract ERC20Faucet {
    uint256 public amountAllowed = 100 * (10 ** 6); // Receive 100 units of tokens each time
    address public tokenContract;   // token contract address
    mapping(address => bool) public requestedAddress;   // Record the address where tokens have been collected

    event SendToken(address indexed Receiver, uint256 indexed Amount); 

    constructor(address _tokenContract) {
    tokenContract = _tokenContract; // set token contract
    }

    function requestTokens() external {
    require(requestedAddress[msg.sender] == false, "Can't Request Multiple Times!"); // Each address can only receive once
    IERC20 token = IERC20(tokenContract); // Create IERC20 contract object
    require(token.balanceOf(address(this)) >= amountAllowed, "Faucet Empty!"); // The faucet is empty

    token.transfer(msg.sender, amountAllowed); // transfer token
    requestedAddress[msg.sender] = true; // Record pickup address 
    
    emit SendToken(msg.sender, amountAllowed); // Release SendToken event
    }
}
