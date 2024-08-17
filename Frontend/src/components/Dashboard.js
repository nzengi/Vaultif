import React from "react";

function Dashboard({ balance, yieldEarned }) {
  return (
    <div>
      <h2>Your Dashboard</h2>
      <p>Balance: {balance} PRPL</p>
      <p>Yield Earned: {yieldEarned} PRPL</p>
    </div>
  );
}

export default Dashboard;
