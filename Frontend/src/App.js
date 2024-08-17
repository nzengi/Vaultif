import React, { useState } from "react";
import { ethers } from "ethers";
import WalletConnect from "./components/WalletConnect";
import Dashboard from "./components/Dashboard";
import erc20VaultABI from "./contracts/Erc20Vault.json";

const contractAddress = "YOUR_CONTRACT_ADDRESS";

function App() {
  const [balance, setBalance] = useState(0);
  const [yieldEarned, setYieldEarned] = useState(0);

  const depositTokens = async (amount) => {
    if (window.ethereum) {
      const provider = new ethers.providers.Web3Provider(window.ethereum);
      const signer = provider.getSigner();
      const contract = new ethers.Contract(contractAddress, erc20VaultABI, signer);

      try {
        const tx = await contract.deposit(ethers.utils.parseUnits(amount, 18));
        await tx.wait();
        alert("Deposit successful!");
      } catch (error) {
        console.error("Deposit failed:", error);
      }
    } else {
      alert("Please install Metamask to use this feature.");
    }
  };

  return (
    <div className="App">
      <h1>Welcome to Erc20Vault</h1>
      <WalletConnect />
      <Dashboard balance={balance} yieldEarned={yieldEarned} />
      <button onClick={() => depositTokens("1")}>Deposit 1 PRPL Token</button>
    </div>
  );
}

export default App;
