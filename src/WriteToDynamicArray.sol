// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToDynamicArray {
    uint256[] writeHere;

    function main(uint256[] memory x) external {
        assembly {
            // your code here
            // store the values in the DYNAMIC array `x` in the storage variable `writeHere`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
            let len := mload(x)
            sstore(0, len) // store length first 

            mstore(0x00, 0x00)
            let arrPtr := keccak256(0x00, 0x20)
            for {
                let i := 0
            } lt(i, len) {
                i := add(i, 1)
            } {
                sstore(add(arrPtr, i), mload(add(x, mul(32, add(i, 1)))))
            }
        }
    }

    function getter() external view returns (uint256[] memory) {
        return writeHere;
    }
}
