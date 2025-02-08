// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract PaymentSplitter {
    function main(address[] calldata recipients) external payable {
        assembly {
            // your code here
            // send the entire contract balance to the recipients
            // each recipient gets balance / recipients.length
            let valToSend := div(selfbalance(), recipients.length)
            for {
                let i := 0
            } lt(i, recipients.length) {
                i := add(i, 1)
            } {
                calldatacopy(0x00, add(0x24, mul(32, add(i, 1))), 0x20)
                if iszero(
                    call(gas(), mload(0x00), valToSend, 0x00, 0x00, 0x00, 0x00)
                ) {
                    revert(0x00, 0x00)
                }
            }
        }
    }
}
