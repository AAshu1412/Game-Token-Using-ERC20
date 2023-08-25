# Game-Token-Using-ERC20

# PRIMO Token Contract

Welcome to the PRIMO Token Contract repository! This repository contains a Solidity smart contract that implements the PRIMO token using the ERC20 standard. PRIMO is an ERC20 token named "Primogems" with the symbol "PMG." The contract offers functionalities for daily rewards, mission rewards, and inventory items for enhancing gameplay.

## Contract Details

- **Token Name:** Primogems (PMG)
- **Smart Contract:** PRIMO
- **Solidity Version:** 0.8.20
- **License:** MIT

### Features

1. **Daily Reward:** Users can claim a daily reward of 20 tokens, provided they haven't collected rewards on the same day.

2. **Mission Reward:** Users can earn mission rewards of 70 tokens when missions are successfully completed.

3. **Inventory Items:** Players can spend tokens to purchase inventory items that provide gameplay advantages.

### Contract Structure

The contract features a `player` struct to store user-related data. It utilizes mappings to associate players with their specific data. The contract provides functions for claiming daily rewards, earning mission rewards, checking token balances, and purchasing inventory items.

## Usage

1. **Daily Reward:** Use the `dailyRedeem` function to claim daily rewards.

2. **Mission Reward:** Call the `completeMissionReward` function with `true` to receive mission rewards upon successful mission completion.

3. **Checking Balances:** Utilize functions like `checkDailyToken`, `checkMissionRewardandNUmber`, and `checkTotalToken` to inquire about different balance types.

4. **Purchasing Inventory Items:** Use the `inventoryItemX_` functions to purchase various inventory items. Ensure you possess enough tokens for the purchase.

## Prerequisites

- Solidity compiler version 0.8.20
- OpenZeppelin library (ERC20)
- Deploy the contract to a suitable Ethereum network (Ropsten, Rinkeby, etc.)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

For inquiries, improvements, or contributions, feel free to create an issue or submit a pull request.

[Donate ETH](your-ethereum-address)
