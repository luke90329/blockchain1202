// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract GLDToken is ERC20 {
    uint constant _initialSupply = 100 * (10**18);
    constructor() ERC20("Gold", "GLD") {
        _mint(msg.sender, _initialSupply);
    }
}