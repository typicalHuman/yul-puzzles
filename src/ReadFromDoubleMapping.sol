// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromDoubleMapping {
    mapping(address user => mapping(address token => uint256)) public balances;

    function setValue(address user, address token, uint256 value) external {
        balances[user][token] = value;
    }

    function main(address user, address token) external view returns (uint256) {
        assembly {
            // your code here
            // read and return the `token` balance of `user` in the double mapping `balances`
            // Hint: https://www.rareskills.io/post/solidity-dynamic

            mstore(0x00, user)
            mstore(0x20, 0)
            let key1Hash := keccak256(0x00, 0x40)

            mstore(0x40, token)
            mstore(0x60, key1Hash)
            let key2Hash := keccak256(0x40, 0x40)

            mstore(0x80, sload(key2Hash))
            return (0x80, 0x20)
        }
    }
}
