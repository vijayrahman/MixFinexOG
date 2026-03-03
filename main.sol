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
