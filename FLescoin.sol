pragma solidity ^0.4.12;

import "./lib/BurnableToken.sol";
import "./lib/UpgradeableToken.sol";

contract FLescoin is BurnableToken, UpgradeableToken {

  string public name;
  string public symbol;
  uint public decimals;

  function FLescoin(address _owner)  UpgradeableToken(_owner) {
    name = "Lescoin Futures";
    symbol = "LSCF";
    totalSupply = 5000000000000;
    decimals = 8;

    // Allocate initial balance to the owner
    balances[_owner] = totalSupply;
  }
}