# Erc20Vault - DeFi Yield Vault Platform

**Erc20Vault** is a decentralized finance (DeFi) yield vault platform that allows users to deposit assets and earn yield. The platform provides a secure and flexible environment for managing various asset pools while giving users the ability to participate in platform governance through a DAO integration.

## Table of Contents

1. [Features](#features)
2. [Installation](#installation)
3. [Usage](#usage)
4. [Architecture](#architecture)
5. [Security](#security)

## Features

- **Yield Pools:** Multiple yield pools for different ERC20 assets, allowing users to deposit and earn returns across various assets.
- **Auto-Compounding:** Users can opt for automatic reinvestment of their earned yield, leveraging the power of compound interest.
- **DAO Integration:** Decentralized governance system where users can vote on platform decisions by holding governance tokens.
- **Insurance Fund:** User deposits are protected by an insurance fund, which compensates users in the event of a security breach.
- **Notification System:** Users receive notifications regarding key events, such as when they are eligible to claim their yield.
- **Security and Auditing:** The platform is thoroughly audited and secured against potential threats.

## Installation

### Prerequisites

- Node.js (>= v14.x.x)
- Hardhat (development framework)
- OpenZeppelin Libraries
- An Ethereum test network (e.g., Rinkeby, Goerli)

### Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/Erc20Vault.git
   cd Erc20Vault
   ```
2. **Install dependencies:**
   ```bash
   npm install
   ```
3. **Start the development environment:**
   ```bash
   npx hardhat node
   ```
4. **Deploy the smart contracts:**
    ```bash
   npx hardhat run scripts/deploy.js --network rinkeby
   ```
5. **Start the frontend (optional):**
    ```bash
   npm start
   ```


