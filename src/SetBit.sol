// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;
import {console} from "forge-std/console.sol";
contract SetBit {
    function main(uint256 x, uint8 i) external pure returns (uint256) {
        assembly {
            // your code here
            // set the i-th bit of x to 1, keeping every other bit the same
            // return the result
            mstore(0x00, or(shl(i, 1), x))
            return(0x00, 0x20)
        }
    }
}
