0x0000000000000000000000000000000000000000000000000000000000000000


0x00000000000000000000000000000000000000000000000000000000

---

Static types (like uint256, address, bool): Directly after the selector, no offset.
Dynamic types (like string, bytes, arrays): Need an offset to point to where the data starts.

IF THIS IS PARAMETER - IT DOESN'T INCLUDE OFFSET, for array pointer starts with length!!!

---

To get array item from storage:

keccak256(array_slot_position) + index

To get mapping item:

keccak256(abi.encode(key, mapping_slot_position))


---

Solidity panic error is 0x4e487b71, to revert with some error code:

```solidity
mstore(0x00, 0x4e487b7100000000000000000000000000000000000000000000000000000000)
mstore(0x04, 0x32)
revert(0x00, 0x24)
```
