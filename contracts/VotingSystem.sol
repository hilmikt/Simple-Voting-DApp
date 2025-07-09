// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Simple Voting System
/// @author Hilmi KT
/// @notice This contract allows decentralized voting with admin-controlled setup

contract VotingSystem {
    // @dev Address of contract deployer (admin)
    address public owner;

    // @dev Flag to check if voting has ended
    bool public votingEnded;

    // @dev Total number of candidates added
    uint public candidatesCount;

    // @dev Set contract deployer as owner
    constructor() {
        owner = msg.sender;
    }

    // @dev Restrict access to only the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

}