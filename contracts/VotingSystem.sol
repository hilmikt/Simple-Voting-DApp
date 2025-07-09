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

    // @dev Structure to hold candidate data
    struct Candidate {
        string name;
        uint voteCount;
    }

    // @dev Mapping from candidate ID to Candidate struct
    mapping(uint => Candidate) public candidates;

    // @dev Mapping to track whether an address has votes
    mapping(address => bool) public hasVoted;

    // @dev Event fired when new candidate is added
    event CandidateAdded(string name, uint id);

    /// @notice Add a candidate to the election (admin only)
    /// @param _name Name of the candidate
    function addCandidate(string memory _name) public onlyOwner {
        require(!votingEnded, "Voting has ended");

        candidates[candidatesCount] = Candidate(_name, 0);
        emit CandidateAdded(_name, candidatesCount);
        candidatesCount++;
    }

}