// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVault {
    function deposit(uint256 amount) external;
    function withdraw(uint256 amount) external;
    function claimYield() external;
}
