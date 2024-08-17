// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract AssetManager {
    using SafeERC20 for IERC20;

    address public principalAsset;

    constructor(address _principalAsset) {
        principalAsset = _principalAsset;
    }

    function getAssetBalance() public view returns (uint256) {
        return IERC20(principalAsset).balanceOf(address(this));
    }

    function transferAsset(address to, uint256 amount) external {
        IERC20(principalAsset).safeTransfer(to, amount);
    }

    function acceptAsset(address from, uint256 amount) external {
        IERC20(principalAsset).safeTransferFrom(from, address(this), amount);
    }
}
