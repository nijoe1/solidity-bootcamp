// Level 0 - Return 255
// Use the interface below to write a smart contract. Your contract should contain a function called solution that returns a uint8. In this case the function body logic is very simply as the answer is always 255.

// interface Isolution {
//     function solution() external pure returns (uint8);
// }

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Level_0 {
    function solution() external pure returns (uint8) {
        assembly {
            mstore(0x80, 255)
            return(0x80, 32)
        }
    }
}
