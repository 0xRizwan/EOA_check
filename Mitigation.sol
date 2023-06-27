// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract BaseTargetContract {

    bool public attackSuccess = false;

    modifier onlyEOA() {
        require (msg.sender == tx.origin, "only EOA can access");
        _;
    }

    function attack() public onlyEOA{
          attackSuccess = true;
    }
}

contract AttackContract {

    BaseTargetContract target = BaseTargetContract(0xcD6a42782d230D7c13A74ddec5dD140e55499Df9);

    constructor(){
        target.attack();
    }
}