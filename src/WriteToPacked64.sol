// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToPacked64 {
    uint64 public someValue1 = 7;
    uint64 public writeHere = 1;
    uint64 public someValue2 = 7;
    uint64 public someValue3 = 7;

    function main(uint256 v) external {
        assembly {
            // your code here
            // change the value of `writeHere` storage variable to `v`
            // be careful not to alter the value of `someValue` variable

            let slotVal := sload(0)
            let cleared := and(
                slotVal,
                0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF
            )
            // we moved zeros to the right to match them with v and then moved them back in return
            let shifted := shr(64, cleared)
            let updated := or(v, shifted)
            sstore(0, shl(64, updated))
        }
    }
}
