// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title MixFinex OG
/// @notice NFT collection of 420 MixFinex OG tokens. Mint with ETH; proceeds to treasury. Safe for mainnet.

import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/v4.9.6/contracts/token/ERC721/ERC721.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/v4.9.6/contracts/access/Ownable.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/v4.9.6/contracts/security/ReentrancyGuard.sol";

contract MixFinexOG is ERC721, Ownable, ReentrancyGuard {

    event Minted(address indexed to, uint256 indexed tokenId, uint256 paidWei);
    event BaseURIUpdated(string previousURI, string newURI);
    event MintPriceUpdated(uint256 previousWei, uint256 newWei);
    event TreasuryUpdated(address indexed previousTreasury, address indexed newTreasury);
    event PublicMintToggled(bool enabled);

    error MOG_ZeroAddress();
    error MOG_ZeroAmount();
    error MOG_MintDisabled();
    error MOG_InsufficientValue();
    error MOG_MaxSupplyReached();
    error MOG_InvalidTokenId();
    error MOG_TransferFailed();

    uint256 public constant MOG_MAX_SUPPLY = 420;
    uint256 public constant MOG_MINT_SALT = 0x9F2e4A7c1B5d8E0f3a6C9b2D5e8F1a4c7B0d3E6;

    address public immutable deployTreasury;
