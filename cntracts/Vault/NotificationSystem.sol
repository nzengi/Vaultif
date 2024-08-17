// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NotificationSystem {
    event NotificationSent(address to, string message);

    function sendNotification(address to, string memory message) external {
        emit NotificationSent(to, message);
    }
}
