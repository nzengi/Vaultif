// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./YieldManager.sol";
import "./AssetManager.sol";
import "./DAOManager.sol";
import "./InsuranceFund.sol";
import "./NotificationSystem.sol";

contract Erc20Vault is ERC20("VaultDefi", "VLD"), ReentrancyGuard, Ownable {
    using SafeERC20 for IERC20;

    uint256 public totalPoints;
    uint256 public totalPointsUsed;
    uint256 public lastUpdatedAt;
    address public principalAsset;

    YieldManager public yieldManager;
    AssetManager public assetManager;
    DAOManager public daoManager;
    InsuranceFund public insuranceFund;
    NotificationSystem public notificationSystem;

    mapping(address => uint256) public lastClaimBlock;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);
    event YieldClaimed(address indexed user, uint256 amount);

    constructor(
        address _principalAsset,
        address _yieldAsset,
        address _daoToken
    ) {
        require(_principalAsset != address(0), "Invalid principal asset address");

        principalAsset = _principalAsset;
        yieldManager = new YieldManager(_yieldAsset);
        assetManager = new AssetManager(_principalAsset);
        daoManager = new DAOManager(_daoToken);
        insuranceFund = new InsuranceFund();
        notificationSystem = new NotificationSystem();
        lastUpdatedAt = block.number;
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Amount must be greater than zero");
        _claimYield(msg.sender);
        assetManager.acceptAsset(msg.sender, amount);
        _mint(msg.sender, amount);
        emit Deposited(msg.sender, amount);  // Event emitted after deposit
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(amount > 0, "Amount must be greater than zero");
        _claimYield(msg.sender);
        assetManager.transferAsset(msg.sender, amount);
        _burn(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);  // Event emitted after withdrawal
    }

    function getClaimablePoints(address account) public view returns (uint256) {
        if (lastClaimBlock[account] == 0) {
            return 0;
        }
        return balanceOf(account) * (block.number - lastClaimBlock[account]);
    }

    function claimYield() external nonReentrant {
        _claimYield(msg.sender);
    }

    function _claimYield(address account) internal {
        require(block.number > lastClaimBlock[account], "Cannot claim in the same block as deposit");

        uint256 claimablePoints = getClaimablePoints(account);
        uint256 availableYield = yieldManager.getAvailableYield();

        uint256 claimableYield = (totalPoints - totalPointsUsed) == 0
            ? 0
            : (claimablePoints * availableYield) / (totalPoints - totalPointsUsed);

        totalPointsUsed += claimablePoints;
        lastClaimBlock[account] = block.number;
        lastUpdatedAt = block.number;

        if (claimableYield > 0) {
            yieldManager.distributeYield(account, claimableYield);
            emit YieldClaimed(account, claimableYield);  // Event emitted after yield claim
        }
    }

    function notifyUser(string memory message) external {
        notificationSystem.sendNotification(msg.sender, message);
    }

    function getAvailableYield() public view returns (uint256) {
        return yieldManager.getAvailableYield();
    }

    // Admin-only functions
    function setYieldAsset(address newYieldAsset) external onlyOwner {
        yieldManager.setYieldAsset(newYieldAsset);
    }
}
