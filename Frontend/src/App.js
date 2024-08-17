import React, { useState } from "react";
import WalletConnect from "./components/WalletConnect";
import Dashboard from "./components/Dashboard";

function App() {
  const [balance, setBalance] = useState(0);
  const [yieldEarned, setYieldEarned] = useState(0);

  return (
    <div className="App">
      <h1>Welcome to Erc20Vault</h1>
      <WalletConnect />
      <Dashboard balance={balance} yieldEarned={yieldEarned} />
    </div>
  );
}

export default App;
