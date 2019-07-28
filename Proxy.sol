pragma solidity ^0.5.0;

import "./State.sol";

contract Proxy is State {
    
    modifier onlyOwner() {
        require (msg.sender == owner);
        _;
    }
   
    constructor() public {
        owner = msg.sender;
    }
    
    function upgradeTo(address _newImplementation) 
        external onlyOwner 
    {
        require(implementation != _newImplementation);
        _setImplementation(_newImplementation);
    }
   
    function () payable external {
        address impl = implementation;
        require(impl != address(0));
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize())
            let result := delegatecall(gas, impl, ptr, calldatasize(), ptr, 32)
            
            switch result
            case 0 { revert(ptr, 32) }
            default { return(ptr, 32) }
        }
    }
    
    function _setImplementation(address _newImp) internal {
        implementation = _newImp;
    }
}
