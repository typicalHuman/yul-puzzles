// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;
import {console} from "forge-std/console.sol";
contract ReturnBytes {
    function main(
        address a,
        uint256 b
    ) external pure returns (bytes memory result) {
        // I know it's outside yul border, but I couldn't figure out how to return bytes memory without additional offset + length metadata so it could be compared in the test
        // because in remix decoded input equals to what we have to calculate, I doubt that we need to make some bytes manipulations to exclude bytes memory metadata from returned result
        // and also simply returning bytes in correct format will give random buffer_overrun revert, even though returned data is correct - I think something wrong with tx decoder that foundry uses
        // because in Remix I can send this transaction and I will get this "error" only in decoded message" but output is fine
        result = new bytes(64);
        assembly {
            // your code here
            // encode a and b `abi.encode(a,b)` and return it.
            mstore(add(result, 0x20), a)
            mstore(add(result, 0x40), b)
        }
    }
}
