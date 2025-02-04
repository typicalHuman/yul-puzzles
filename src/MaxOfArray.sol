// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract MaxOfArray {
    function main(uint256[] memory arr) external pure returns (uint256) {
        assembly {
            // your code here
            // return the maximum value in the array
            // revert if array is empty

            // for dynamic types parameter is basically a pointer, that's why it works and we load length using arr
            let length := mload(arr)
            if eq(length, 0) {
                revert(0x00, 0x00)
            }

            mstore(0x00, 0x00)

            for {
                let i := 0
            } lt(i, length) {
                i := add(i, 1)
            } {
                let el := mload(add(arr, mul(32, add(i, 1))))
                if gt(el, mload(0x00)) {
                    mstore(0x00, el)
                }
            }
            return(0x00, 0x20)
        }
    }
}
