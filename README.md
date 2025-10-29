# 🗒️ Decentralized Note Storing System (XXX)

A simple **Solidity smart contract** that lets users store, update, and view personal notes directly on the blockchain — no centralized servers, no intermediaries.  
Perfect for beginners learning smart contract development and decentralized data storage!

---<img width="1881" height="1015" alt="Screenshot 2025-10-29 141509" src="https://github.com/user-attachments/assets/a6dcd67c-4f71-4423-8ab4-ba343b0756f5" />


## 🚀 Project Description

The **Decentralized Note Storing System** is a blockchain-based application that allows users to securely manage small pieces of text data (notes) in a transparent and immutable way.  
Each Ethereum or Celo wallet address can store **one note**, which can be updated anytime by the owner.

This project demonstrates core concepts of blockchain development:
- Smart contract functions  
- Data storage using mappings  
- Events and user interactions  
- Transparency and decentralization  

---

## 💡 What It Does

- Allows any blockchain user to **store** a note on-chain.  
- Users can **update** or **replace** their note at any time.  
- Other users can **view** publicly available notes.  
- Stores notes **forever** on the blockchain, ensuring transparency and immutability.  

---

## ✨ Features

✅ Store your note securely on the blockchain  
✅ Update or replace your note anytime  
✅ Retrieve your note instantly  
✅ Public access — anyone can view any address’s note  
✅ Emits an event whenever a note is updated  
✅ Simple, gas-efficient, and beginner-friendly  

---

## 🧩 Smart Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Decentralized Note Storage
/// @notice A simple contract where users can store and manage their own text notes on-chain
contract DecentralizedNotes {
    
    // Mapping from user address => their note
    mapping(address => string) private userNotes;

    // Event that is emitted whenever a user updates their note
    event NoteUpdated(address indexed user, string newNote);

    /// @notice Store or update your personal note
    /// @param _note The text of your note
    function setNote(string calldata _note) external {
        userNotes[msg.sender] = _note;
        emit NoteUpdated(msg.sender, _note);
    }

    /// @notice Retrieve your personal note
    /// @return The text of your stored note
    function getMyNote() external view returns (string memory) {
        return userNotes[msg.sender];
    }

    /// @notice View someone else's note (optional public access)
    /// @param _user The address of the note owner
    /// @return The stored note of that user
    function getNoteOf(address _user) external view returns (string memory) {
        return userNotes[_user];
    }
}
