// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromMapping {
    mapping(uint256 index => uint256) readMe;

    function setValue(uint256 index, uint256 value) external {
        readMe[index] = value;
    }

    function main(uint256 index) external view returns (uint256) {
        assembly {
            // your code here
            // read the value at the `index` in the mapping `readMe`
            // and return it
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }
}
