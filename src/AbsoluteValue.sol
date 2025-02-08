// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract AbsoluteValue {
    function main(int256 x) external pure returns (uint256) {
        assembly {
            // your code here
            // return the absolute value of x
            // hint: use signed comparisons
            // hint: https://www.rareskills.io/post/signed-int-solidity
            let mask := sar(255, x)
            mstore(0x00, xor(add(x, mask), mask))
            return(0x00, 0x20)
        }
    }
}
