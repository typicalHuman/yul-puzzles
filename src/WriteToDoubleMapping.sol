// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToDoubleMapping {
    mapping(address user => mapping(address token => uint256 value)) public balances;

    function main(address user, address token, uint256 value) external {
        assembly {
            // your code here
            // set the `value` for a `user` and a `token`
            // Hint: https://www.rareskills.io/post/solidity-dynamic

            mstore(0x00, user)
            mstore(0x20, 0)
            let key1 := keccak256(0x00, 0x40)
            mstore(0x40, token)
            mstore(0x60, key1)
            let key2 := keccak256(0x40, 0x40)
            sstore(key2, value)
        }
    }
}
