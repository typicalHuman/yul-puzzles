// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromDynamicArray {
    uint256[] readMe;

    function setValue(uint256[] calldata x) external {
        readMe = x;
    }

    function main(uint256 index) external view returns (uint256) {
        assembly {
            // your code here
            // read the value at the `index` in the dynamic array `readMe`
            // and return it
            // Assume `index` is <= to the length of readMe
            // Hint: https://www.rareskills.io/post/solidity-dynamic
            mstore(0x00, 0x00)
            // because in order to get elements in dynamic array we need to keccak slot where array is stored and then add index to it
            // this would be pointer for array element
            let arrPtr := keccak256(0x00, 0x20)
            mstore(0x20, sload(add(arrPtr, index)))
            return(0x20, 0x20)
        }
    }
}
