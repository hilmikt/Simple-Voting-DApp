# 🗳️ Simple Voting Smart Contract

A decentralized voting system built in Solidity that allows users to vote once for registered candidates. Only the contract owner (admin) can register candidates and end the election. This project demonstrates key Solidity features such as mappings, structs, modifiers, access control, and event logging.

---

## 🚀 Features

- 🧑‍💼 Admin-only candidate registration
- 🗳️ One vote per wallet address
- 📊 Publicly viewable results
- 🔐 Voting ends only when admin calls end function
- 📢 Events emitted for all major actions (vote, add candidate, end voting)

---

## 🛠 Technologies Used

- Solidity `^0.8.20`
- Hardhat or Remix for deployment and testing
- Ethereum-compatible wallets (e.g., MetaMask)
- Testnet: Goerli, Sepolia, or any local Hardhat chain

---

## 📦 Contract Structure

### `struct Candidate`
Stores candidate name and vote count.

### `mapping(uint => Candidate) public candidates`
Stores all candidates by ID.

### `mapping(address => bool) public hasVoted`
Tracks whether a wallet address has voted.

### `function addCandidate(string memory _name)`
Admin-only. Adds a new candidate.

### `function vote(uint _candidateId)`
Allows any address to vote once.

### `function endVoting()`
Admin-only. Ends the voting session.

### `function getCandidate(uint _id) public view`
Returns candidate name and vote count.

---

## 📜 Events

- `CandidateAdded(string name, uint id)`
- `Voted(address voter, uint candidateId)`
- `VotingEnded()`

---

## 🧪 How to Test

1. Open [Remix IDE](https://remix.ethereum.org)
2. Paste contract into a new file (`VotingSystem.sol`)
3. Compile with Solidity `^0.8.20`
4. Deploy using "Injected Web3" (MetaMask connected to testnet)
5. Call `addCandidate()`, then use multiple addresses to call `vote()`
6. View results with `getCandidate()`

---

## 💡 Improvements You Can Add

- Add time-based auto-ending with `block.timestamp`
- Use `enum` for election states (e.g., Started, Ended)
- Add a frontend with React and Ethers.js or Wagmi

---

## 📜 License

MIT License

---

## 🧠 Author

**Hilmi KT**  
Blockchain Developer | Web3 Learner  
[LinkedIn](https://www.linkedin.com/in/hilmi-kt)
