# Foundry Lottery

A decentralized lottery smart contract built with Foundry, inspired by the Cyfrin Updrafts course. This project demonstrates how to create a secure and efficient lottery system on the Ethereum blockchain using Chainlink VRF for randomness.

---

## Features

- **Decentralized Lottery System**: Secure and transparent entry process.
- **Random Winner Selection**: Uses Chainlink VRF for unbiased randomness.
- **Automation**: Employs Chainlink Keepers for periodic upkeep and lottery resets.
- **Customizable**: Adjustable lottery parameters like entry fee and duration.

---

## Prerequisites

Before you begin, ensure you have the following installed:

- [Foundry](https://getfoundry.sh/)
- [Node.js](https://nodejs.org/) and npm
- A blockchain wallet (e.g., MetaMask)
- Access to a testnet like Sepolia or Polygon Amoy

---

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/KMean/foundry-lottery.git
   cd foundry-lottery
   ```

2. Install Dependencies
    ```bash
    forge install
    ```
3. Set up environment variables: Create a .env file with the following:
    ```env
    SEPOLIA_RPC_URL=your-rpc-url
    