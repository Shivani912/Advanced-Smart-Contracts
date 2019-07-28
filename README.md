# Advanced-Smart-Contracts

This is an assignment for the Advanced SMart Contracts course. I have used contract upgradeability and signing and verification patterns. 

## Signing and Verification

The contract TranscriptVerification.sol handles the verification part. The signing part should be implemented off-chain with your own private key. Please use Signing.js for that. 

## Upgradeability

The Proxy.sol contract acts as the proxy contract that makes delegate call to Main.sol which implements the logic. State.sol holds the storage and InteractWithState.sol contains of getter and setter functions for the storage. When using the Proxy.sol for the first time, you will need to call the upgradeTo function to set the implementation. The deployed contract already has it set. When you need to upgrade the Main.sol contract, it is mandatory to inherit Main.sol in the upgraded contract and call the upgradeTo function of the Proxy.sol contract.

## Contracts

Main.sol : 0x775dd47a6e2fc78c61796bd3afcb358c68891cf8

Proxy.sol : 0x29e8e4ce1ce60b44b1807bd1463a27142f27dec7

## References

https://hackernoon.com/how-to-make-smart-contracts-upgradable-2612e771d5a2

https://medium.com/quillhash/how-to-write-upgradable-smart-contracts-in-solidity-d8f1b95a0e9a

https://solidity.readthedocs.io/en/v0.5.3/
