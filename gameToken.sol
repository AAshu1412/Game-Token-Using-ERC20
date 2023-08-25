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

