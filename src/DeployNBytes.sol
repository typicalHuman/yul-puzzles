// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract DeployNBytes {
    function main(uint256 size) external returns (address) {
        
        assembly {
            // your code here
            // create a contract that is size bytes long
            // hint: you will need to generalize the init code of DeployOneByte
            // hint: use mstore8 to target a single byte
            // hint: because we only care about the size, you can simply return that region
            //       of memory and not care about what is inside it
            mstore(
                0x80,
                0x6001600c60003960016000f30000000000000000000000000000000000000000
            ) // 13 bytes
            mstore8(add(0x80, 8), size)
            let addr := create(0x00, 0x80, 13)
            mstore(0xA0, addr)
            return(0xA0, 0x20)
        }
    }
}
