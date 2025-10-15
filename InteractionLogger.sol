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
