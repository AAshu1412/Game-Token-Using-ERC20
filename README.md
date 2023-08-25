# PRIMO Game Token Contract

## Description

Welcome to the PRIMO Token Contract repository! This repository contains a Solidity smart contract that implements the PRIMO token using the ERC20 standard. PRIMO is an ERC20 token named "Primogems" with the symbol "PMG." The contract offers functionalities for daily rewards, mission rewards, and inventory items for enhancing gameplay.

## Getting Started

Visit the Remix website at https://remix.ethereum.org/ to access the IDE.

Create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., ottoToken.sol).

Copy and paste the provided Solidity code into the file.

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract PRIMO is ERC20("Primogems","PMG"){

    struct player{
        address playerAddress;
        uint playerDailyToken;
        uint playerMissonToken;
        uint playerTotalToken;
        uint playerLoginDay;
    }

    mapping (address=>player) internal mapPlayer;

    function dailyRedeem() public {
        require(mapPlayer[msg.sender].playerLoginDay!=(block.timestamp/86400),"You have collected today daily reward.");
        mapPlayer[msg.sender].playerDailyToken+=20;
        mapPlayer[msg.sender].playerTotalToken+=mapPlayer[msg.sender].playerDailyToken;
        mapPlayer[msg.sender].playerLoginDay=block.timestamp/86400;
    }

    function checkDailyToken() public view returns(uint){
        return mapPlayer[msg.sender].playerDailyToken;
    }

    function completeMissionReward(bool missionStatus) public{
        require(missionStatus==true,"Mission Failed");
        mapPlayer[msg.sender].playerMissonToken+=70;
        mapPlayer[msg.sender].playerTotalToken+=mapPlayer[msg.sender].playerMissonToken;
    }

    function  checkMissionRewardandNUmber() public view returns(uint,uint){
        return (mapPlayer[msg.sender].playerMissonToken,mapPlayer[msg.sender].playerMissonToken/70);
    }

    function checkTotalToken() public view returns(uint){
        return mapPlayer[msg.sender].playerTotalToken;
    }

    modifier enoughToken{
        require(mapPlayer[msg.sender].playerTotalToken>30,"Not Enough Balance");
        _;
    }

    function inventoryItem1_superSpeed() public enoughToken {
          mapPlayer[msg.sender].playerTotalToken-=30;
    }

    function inventoryItem2_superJump() public enoughToken{
          mapPlayer[msg.sender].playerTotalToken-=20;
    }

    function inventoryItem3_extraLife() public enoughToken{
          mapPlayer[msg.sender].playerTotalToken-=20;
    }

}


```
To compile the code, go to the "Solidity Compiler" tab in the sidebar. Ensure that the "Compiler" option is set to a version 0.8.10 and click the "Compile" button.

Switch to the "Deploy & Run Transactions" tab. Choose the desired Ethereum Virtual Machine (EVM) environment, such as Remix VM (Shanghai).

Deploy the contract by clicking the "Deploy" button. Once deployed, you can interact with the contract using the available functions.

View the contract's details in the "Deployed Contracts" section.

## Contract Details

- **Token Name:** Primogems (PMG)
- **Smart Contract:** PRIMO
- **Solidity Version:** 0.8.20
- **License:** MIT

### Features

1. **Daily Reward:** Users can claim a daily reward of 20 tokens, provided they haven't collected rewards on the same day.

2. **Mission Reward:** Users can earn mission rewards of 70 tokens when missions are successfully completed.

3. **Inventory Items:** Players can spend tokens to purchase inventory items that provide gameplay advantages.

4. **Gifting Tokens:** Users can gift PRIMO tokens to their friends using the ERC20 `transfer` function.

### Contract Structure

The contract features a `player` struct to store user-related data. It utilizes mappings to associate players with their specific data. The contract provides functions for claiming daily rewards, earning mission rewards, checking token balances, and purchasing inventory items.

## Usage

1. **Daily Reward:** Use the `dailyRedeem` function to claim daily rewards.

2. **Mission Reward:** Call the `completeMissionReward` function with `true` to receive mission rewards upon successful mission completion.

3. **Checking Balances:** Utilize functions like `checkDailyToken`, `checkMissionRewardandNUmber`, and `checkTotalToken` to inquire about different balance types.

4. **Purchasing Inventory Items:** Use the `inventoryItemX_` functions to purchase various inventory items. Ensure you possess enough tokens for the purchase.

5.  **Gifting Tokens:** To gift PRIMO tokens, use the standard ERC20 `transfer` function, specifying your friend's address and the amount of tokens you want to gift.

## Prerequisites

- Solidity compiler version 0.8.20
- OpenZeppelin library (ERC20)
- Deploy the contract to a suitable Ethereum network (Ropsten, Rinkeby, etc.)

## Contributing:
Contributions to this project are welcome. If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## Authors:
Ashutosh Mittal

[Donate ETH](your-ethereum-address)
