// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DAOManager {
    address public daoToken;

    constructor(address _daoToken) {
        daoToken = _daoToken;
    }

    // Yönetim ve oylama fonksiyonları burada yer alacak
}
