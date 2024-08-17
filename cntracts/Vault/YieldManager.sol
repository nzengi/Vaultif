// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract YieldManager {
    using SafeERC20 for IERC20;

    address public yieldAsset;

    constructor(address _yieldAsset) {
        yieldAsset = _yieldAsset;
    }

    function getAvailableYield() public view returns (uint256) {
        return IERC20(yieldAsset).balanceOf(address(this));
    }

    function distributeYield(address to, uint256 amount) external {
        IERC20(yieldAsset).safeTransfer(to, amount);
    }
}
