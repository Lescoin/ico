pragma solidity ^0.4.12;

import "./lib/BurnableToken.sol";
import "./lib/UpgradeableToken.sol";

contract Lescoin is BurnableToken, UpgradeableToken {

  string public name;
  string public symbol;
  uint public decimals;

  function Lescoin(address _owner, address _init)  UpgradeableToken(_owner) {
    name = "Lescoin";
    symbol = "LSC";
    totalSupply = 200000000000000;
    decimals = 8;

    // Allocate initial balance to the init account
    balances[_init] = totalSupply;
  }
}