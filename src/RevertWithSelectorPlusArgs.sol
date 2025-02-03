// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract RevertWithSelectorPlusArgs {
    error RevertData(uint256); // selector: 0xae412287

    function main(uint256 x) external pure {
        assembly {
            // your code here
            // revert custom error with x parameter
            // Hint: concatenate selector and x by storing them
            // adjacent to each other in memory
            // Static types (like uint256, address, bool): Directly after the selector, no offset.
            // Dynamic types (like string, bytes, arrays): Need an offset to point to where the data starts.
            mstore(
                0x00,
                0xae41228700000000000000000000000000000000000000000000000000000000
            ) // 4

            mstore(0x04, x) // 4 + 32

            revert(0x00, 0x24) // 36
        }
    }
}
