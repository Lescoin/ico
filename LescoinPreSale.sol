pragma solidity ^0.4.11;

import "./Lescoin.sol";

contract LescoinPreSale {
    address public beneficiary;
    address public coldWallet;
    uint public ethPrice;
    uint public bonus;
    uint public amountRaised;
    Lescoin public tokenReward;

    uint constant public price = 50;
    uint constant public minSaleAmount = 10000;

    function LescoinPreSale(
        address _beneficiary,
        address _coldWallet,
        uint _ethPrice,
        uint _bonus,   
        Lescoin _addressOfToken
    ) {
        beneficiary = _beneficiary;
        coldWallet =  _coldWallet;
        ethPrice = _ethPrice;
        bonus = _bonus;
        tokenReward = Lescoin(_addressOfToken);
    }

    function () payable {
        uint amount = msg.value;
        uint tokenAmount = amount * ethPrice / price / 1000000000000;
        if (tokenAmount < minSaleAmount) throw;
        amountRaised += amount;
        tokenReward.transfer(msg.sender, tokenAmount * (100 + bonus) / 100);
    }

    function WithdrawETH(uint _amount) {
        if (beneficiary != msg.sender) throw;
        coldWallet.transfer(_amount);
    }

    function WithdrawTokens(uint _amount) {
        if (beneficiary != msg.sender) throw;
        tokenReward.transfer(coldWallet, _amount);
    }

    function TransferTokens(address _to, uint _amount) {
        if (beneficiary != msg.sender) throw;
        tokenReward.transfer(_to, _amount);
    }

    function ChangeEthPrice(uint _ethPrice) {
        if (beneficiary != msg.sender) throw;
        ethPrice = _ethPrice;
    }

    function ChangeBonus(uint _bonus) {
        if (beneficiary != msg.sender) throw;
        bonus = _bonus;
    }
}