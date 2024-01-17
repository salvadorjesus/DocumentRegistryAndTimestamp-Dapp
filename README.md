# Document Registry and Timestamp DApp
<img src="https://github.com/salvadorjesus/DocumentRegistryAndTimestamp-Dapp/assets/637125/affbe050-d8de-492c-9d41-34abaeb88b5e" alt="project image" width="512" />

This Solidity DApp enables users to register document hashes on the blockchain with associated timestamps. It serves as a reliable method for proving the existence and integrity of documents at specific points in time.

## Overview
The Document Registry and Timestamp DApp is a decentralized application built using Solidity for the Ethereum Virtuam Machine (EVM) compatible blockchains, plus an HTML/ JavaScript/ CSS web interface. It allows users to securely register document hashes along with relevant metadata, thereby establishing a tamper-proof record of the document's existence at a particular moment. The project combines the transparency and immutability of the blockchain with the cryptographic security of hashing algorithms to ensure the integrity and validity of the registered documents.

## Features
- Secure and transparent registration of document hashes on the Ethereum blockchain, with timestamp association for accurate recording of document existence and integrity verification.
- User-friendly interface for seamless interaction with the smart contract using Web3.
- No need of a trusted third party thank to the use of blockchain.

## Usage
### Registration
- Connect your Ethereum wallet to the DApp by clicking the "Connect Wallet" button.
- Upload a file; the DApp will automatically generate the hash of the document.
- Provide additional details such as the document name and description.
- Click the "Add Document" button to register the document on the blockchain.
### Document checking
- Connect your Ethereum wallet to the DApp by clicking the "Connect Wallet" button.
- Upload a file; the DApp will automatically generate the hash of the document.
- Click the “Search document" button to check who and when has registered the uploaded file on the blockchain.
### Check your documents
-	Click the “Get your documents” buttons to retrieve all your document registration.
## Links
### Web3 interface
[Live version of this app on my website](https://www.salvadorjesus.com/dapps/DocumentRegistry/index.html).
### Deployed and verified contract
-	Ethereum (not yet deployed).
-	[Goerli](https://goerli.etherscan.io/address/0x49be884e8c7b2513f5c6b9149ef6974a57258a97) (Ethereum test network).
-	[Sepolia](https://sepolia.etherscan.io/address/0x5F86634F81a8b815Fe48eD71a62D29654dcd0364#code) (Ethereum test network).
-	[Polygon](https://polygonscan.com/address/0x585d2a8688e4e84a283d7f02b5625c82f5cacb09).
-	[Polygon Mumbay](https://mumbai.polygonscan.com/address/0x5f86634f81a8b815fe48ed71a62d29654dcd0364) (Polygon test network).

## Running Tests
To run the tests for this contract you need a Foundry project set up. Please read the README.md file of the _Foundry tests_ folder for further details.

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.
