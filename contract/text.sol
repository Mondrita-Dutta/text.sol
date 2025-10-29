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

