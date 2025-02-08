// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract EventWithComplexData {
    // EMIT ME!!!
    event MyEvent(address indexed emitter, address[] players, uint256[] scores);

    // ENCODED DATA LOOKS LIKE THIS
    // 0x00 - arr1 offset
    // 0x20 - arr2 offset
    // 0x40 - arr1 len

    //0x40 - arr2 offset - arr1 elements
    //arr2 offset + 32 - arr2 len
    // arr2 offset + 64 - arr2 elements

    // PARAMS START WITH LENGTH
    function main(
        address emitter,
        address[] memory players,
        uint256[] memory scores
    ) external {
        bytes32 signature = keccak256("MyEvent(address,address[],uint256[])");
        assembly {
            // your code here
            // emit the `MyEvent(address,address[],uint256[])` event
            // Hint: Use `log2` to emit the event with the hash as the topic0 and `emitter` as topic1, then the data

            let arrLen1 := mload(players)
            let arrLen2 := mload(scores)
            let arrOffset2 := add(0x60, mul(arrLen1, 32))
            mstore(0x00, 0x40) // because 0x20 (offset1) + 0x20 (offset2) = 0x40
            mstore(0x20, arrOffset2)
            mstore(0x40, arrLen1)
            for {
                let i := 0
            } lt(i, arrLen1) {
                i := add(i, 1)
            } {
                mstore(add(0x40, mul(32, add(i, 1))), mload(add(players, mul(32, add(i, 1)))))
            }
            mstore(arrOffset2, arrLen2)
            for {
                let i := 0
            } lt(i, arrLen2) {
                i := add(i, 1)
            } {
                mstore(
                    add(arrOffset2, mul(32, add(i, 1))),
                    mload(add(scores, mul(32, add(i, 1))))
                )
            }
            let size := add(add(arrOffset2, 0x20), mul(32, arrLen2))

            log2(0x00, size, signature, emitter)
        }
    }
}
