// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NateToken is ERC20 {        
    constructor () ERC20("Nate Token", "NAT") {    
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
    }
}