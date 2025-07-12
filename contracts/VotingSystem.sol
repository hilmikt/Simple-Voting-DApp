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

    // @dev Event fired when someone casts a vote
    event Voted(address voter, uint candidateId);

    /// @notice Vote for a candidate by ID
    /// @param _candidateId ID of the candidate in the mapping
    function vote(uint _candidateId) public {
        require(!votingEnded, "Voting has ended");
        require(!hasVoted[msg.sender], "You have already voted");
        require(_candidateId < candidatesCount, "Invalid candidate");

        candidates[_candidateId].voteCount++;
        hasVoted[msg.sender] = true;

        emit Voted(msg.sender, _candidateId);
    }

    // @dev Event fired when the admin ends the election
    event VotingEnded();

    /// @notice Ends the voting session (admin only)
    function endVoting() public onlyOwner {
        require(!votingEnded, "Voting already ended");
        votingEnded = true;
        emit VotingEnded();
    }

    /// @notice Returns candidate details
    /// @param _id ID of the candidate
    /// @return name Candidate name
    /// @return voteCount Total votes received
    function getCandidate(uint _id) public view returns (string memory, uint) {
        require(_id < candidatesCount, "Invalid candidate ID");
        Candidate memory c = candidates[_id];
        return (c.name, c.voteCount);
    }

}
