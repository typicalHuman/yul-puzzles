// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;
import {console} from "forge-std/console.sol";
contract CreateSimpleCalldata {
    function main(
        bytes calldata deploymentBytecode
    ) external returns (address) {
        assembly {
            // your code here
            // create a contract using the deploymentBytecode
            // return the address of the contract
            // hint: use the `create` opcode
            // hint: use calldatacopy to copy the deploymentBytecode to memory
            // let callData := calldataload(0)
            // mstore(0x00, callData)
            let size := sub(calldatasize(), 0x44)
            calldatacopy(0x80, 0x44, size)
            let addr := create(0x00, 0x80, size)
            let ptr := add(0x80, size)
            mstore(ptr, addr)
            mstore(0x40, add(ptr, 0x20))
            return(ptr, 0x20)
        }
        //return address(0);
    }
}
