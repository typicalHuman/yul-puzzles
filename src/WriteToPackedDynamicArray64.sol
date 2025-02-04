// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;
import {console} from "forge-std/console.sol";
contract WriteToPackedDynamicArray64 {
    uint64[] public writeHere;

    function main(
        uint64 v1,
        uint64 v2,
        uint64 v3,
        uint64 v4,
        uint64 v5
    ) external {
        assembly {
            // your code here
            // write the code to store v1, v2, v3, v4, and v5 in the `writeHere` array in sequential order.
            // Hint: `writeHere` is a dynamic array, so you will need to access its length and use `mstore` or `sstore`
            // appropriately to push new values into the array.
            sstore(0, 5)
            mstore(0x00, 0x00)
            let ptr := keccak256(0x00, 0x20)

            mstore(0x20, v4)
            mstore(0x20, or(shl(64, mload(0x20)), v3))
            mstore(0x20, or(shl(64, mload(0x20)), v2))
            mstore(0x20, or(shl(64, mload(0x20)), v1))
            mstore(0x40, v5)
            mstore(0x40, shr(192, mload(0x40)))
            sstore(ptr, mload(0x20))
            sstore(add(ptr, 1), mload(0x40))
        }
    }
}
