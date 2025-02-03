// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract RevertWithError {
    function main() external pure {
        assembly {
            // revert the function with an error of type `Error(string)`
            // use "RevertRevert" as error message
            // Hint: The error type is a predefined four bytes. See https://www.rareskills.io/post/try-catch-solidity
            mstore(
                0x00,
                0x08c379a000000000000000000000000000000000000000000000000000000000
            ) // size = 4



            mstore(0x04, 0x20) // offset, 0x08c379a00000000000000000000000000000000000000000000000000000000000000020
                               // offset is 0x20, because 0x20+0x04 = 0x24 and we start writing data to it below
                               // size = 4 + 32                    



            mstore(0x24, 0x0c) // store string length, 0x08c379a00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000c
                               // size = 4 + 32 + 32
            
            mstore(0x44, "RevertRevert") // store string, 4 bytes for error + 32 bytes offset + 32 bytes length
                                         // to store 24 bytes, because 12 letters * 2 = 24
                                         //0x08c379a00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000c0x526576657274526576657274...000
                                         // size = 4 + 32 + 32 + 32 = 100 = 0x64

            revert(0x00, 0x64)
        }
    }
}
