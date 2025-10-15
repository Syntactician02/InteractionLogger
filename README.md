# 🧾 Interaction Logger Smart Contract

A simple Solidity smart contract that logs user interactions with blockchain **timestamps** and the **user’s address**.  
It’s lightweight, easy to deploy, and perfect for learning how data logging works on Ethereum.

---

## 📍 Deployed Contract

**Network:** Remix Local VM / Testnet / Ethereum  
**Contract Address:** `0xACe5E51066800099cEdD494F993E5A9472c26E61`

> You can use this address to verify or interact with the deployed contract if it’s on a live testnet.

---

## 📜 Overview

The **InteractionLogger** contract allows users to store interactions permanently on-chain.  
Each interaction includes:
- The **user’s wallet address**
- A **custom message**
- The **timestamp** when the interaction occurred

This is great for activity logs, event tracking, or transparency records on blockchain.

---

## ⚙️ Features

✅ Log interactions with your Ethereum address  
✅ Store timestamps directly on-chain (`block.timestamp`)  
✅ Retrieve the total number of interactions logged  
✅ Fetch specific interactions by index  
✅ No imports, no constructor, and easy to deploy

---

## 🧠 Smart Contract Code

File: `InteractionLogger.sol`

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract InteractionLogger {
    struct Interaction {
        address user;
        string message;
        uint timestamp;
    }

    Interaction[] public interactions;

    // Log an interaction
    function logInteraction(string memory message) public {
        interactions.push(Interaction({
            user: msg.sender,
            message: message,
            timestamp: block.timestamp
        }));
    }

    // Get total number of interactions
    function getInteractionCount() public view returns (uint) {
        return interactions.length;
    }

    // Get a specific interaction by index
    function getInteraction(uint index) public view returns (address, string memory, uint) {
        require(index < interactions.length, "Invalid index");
        Interaction memory i = interactions[index];
        return (i.user, i.message, i.timestamp);
    }
}
