// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnTupleOfString {
    function main() external pure returns (string memory, string memory) {
        assembly {
            // your code here
            // return the tuple of string: ("Hello", "RareSkills")
            // offset1, offset2, len1, str1, len2, str2
            mstore(0x00, 0x40)
            mstore(0x20, 0x80)
            mstore(0x40, 5)
            mstore(0x60, "Hello")
            mstore(0x80, 10)
            mstore(0xA0, "RareSkills")
            return (0x00, 0xC0)
        }
    }
}
