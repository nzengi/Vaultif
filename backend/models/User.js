const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  walletAddress: { type: String, required: true },
  balance: { type: Number, default: 0 },
  yieldEarned: { type: Number, default: 0 },
  lastClaimedBlock: { type: Number, default: 0 },
});

module.exports = mongoose.model("User", userSchema);
