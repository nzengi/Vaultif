// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InsuranceFund {
    uint256 public totalFunds;

    function depositInsurance() external payable {
        totalFunds += msg.value;
    }

    function payoutInsurance(address payable to, uint256 amount) external {
        require(totalFunds >= amount, "Insufficient funds");
        totalFunds -= amount;
        to.transfer(amount);
    }
}
