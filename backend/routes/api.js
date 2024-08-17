const express = require("express");
const router = express.Router();
const User = require("../models/User");

// Example route to get user data by wallet address
router.get("/user/:walletAddress", async (req, res) => {
  try {
    const user = await User.findOne({ walletAddress: req.params.walletAddress });
    if (!user) return res.status(404).json({ msg: "User not found" });
    res.json(user);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
