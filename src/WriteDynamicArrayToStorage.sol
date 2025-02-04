// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteDynamicArrayToStorage {
    uint256[] public writeHere;

    function main(uint256[] calldata x) external {
        assembly {
            // your code here
            // write the dynamic calldata array `x` to storage variable `writeHere`
            calldatacopy(0x00, 0x24, 0x20) // because calldata includes offset, so we have to skip: 1. 4 bytes of signature, 2. 32 bytes of offset
            let len := mload(0x00)
            sstore(0, len)
            mstore(0x20, 0x00)
            let arrPtr := keccak256(0x20, 0x20)
            for {
                let i := 0
            } lt(i, len) {
                i := add(i, 1)
            } {
                let addVal := mul(32, add(i, 1))
                let copyPtr := add(0x20, addVal)
                calldatacopy(copyPtr, add(addVal, 0x24), 0x20)
                sstore(add(arrPtr, i), mload(copyPtr))
            }
        }
    }
}
