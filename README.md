# ERC20 Token Project

This project implements a simple ERC20 token using foundry for [cyfrin updraft](https://updraft.cyfrin.io/) course Advanced Foundry. 
It includes the following components:

1. **Token Contract**: Implements the ERC20 standard using OpenZeppelin's `ERC20` library.
2. **Deployment Script**: Deploys the token with an initial supply.
3. **Comprehensive Tests**: Validates the functionality and robustness of the ERC20 token.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Installation](#installation)
- [Usage](#usage)
- [Tests](#tests)
- [Acknowledgments](#acknowledgments)

---

## Project Overview

This project is a foundational implementation of an ERC20 token called `Token` with the symbol `TKN`. The token is initialized with a fixed supply upon deployment and adheres to the ERC20 standard.

### Features

- Basic ERC20 functionality: `transfer`, `approve`, `transferFrom`, and `allowance`.
- Comprehensive testing suite for both core functionality and edge cases.
- Modular design with a deployment script and test suite using Foundry.

---

## Installation

To set up and run the project, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/KMean/foundry-erc20.git
   cd fouudry-erc20
2. Install Dependencies: Ensure you have Foundry installed. If not, install it:
```bash
forge install
```
3. Compile the Contracts:
```bash
forge build
```
## Usage
### Deploying the Contract
The DeployToken script deploys the token with an initial supply of 1,000,000 tokens (adjustable in the script).

Run the deployment script:
```bash
forge script script/DeployToken.s.sol:DeployToken --rpc-url <RPC_URL> --private-key <PRIVATE_KEY> --broadcast
```

## Tests
The project includes a comprehensive test suite written with Foundry's forge-std library. The tests cover:

- Deployment correctness.
- Transfers and allowances.
- Edge cases (e.g., transferring to a zero address, transferring zero tokens).
- Failure cases (e.g., insufficient balance, insufficient allowance).

### Run Tests
To run the test suite:
```bash
forge test
```

## Acknowledgments
This project leverages:

- [OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts) Contracts for secure and modular ERC20 implementation.
- [Foundry](https://github.com/foundry-rs/foundry) for testing and deployment.

