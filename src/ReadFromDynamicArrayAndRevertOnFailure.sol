// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromDynamicArrayAndRevertOnFailure {
    uint256[] readMe;

    function setValue(uint256[] calldata x) external {
        readMe = x;
    }

    function main(int256 index) external view returns (uint256) {
        assembly {
            // your code here
            // read the value at the `index` in the dynamic array `readMe`
            // and return it
            // Revert with Solidity panic on failure, use error code 0x32 (out-of-bounds or negative index)
            // Hint: https://www.rareskills.io/post/solidity-dynamic
            let len := sload(0)
            if or(slt(index, 0), gt(add(index, 1), len)) {
                mstore(0x00, 0x4e487b7100000000000000000000000000000000000000000000000000000000)
                mstore(0x04, 0x32)
                revert(0x00, 0x24)
            }
            mstore(0x00, 0x00)
            let pntr := keccak256(0x00, 0x20)
            mstore(0x20, sload(add(pntr, index)))
            return(0x20, 0x20)
        }
    }
}
