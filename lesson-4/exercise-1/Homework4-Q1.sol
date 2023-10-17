// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Store {
    struct payments {
        bool valid;
        uint8 paymentType;
        bool checked;
        address sender;
        address receiver;
        uint256 amount;
        uint256 initialAmount;
        uint256 finalAmount;
    }

    address admin;
    address admin2;
    bool flag1;
    bool flag2;
    bool flag3;
    uint8 index;
    uint256 public number;
    mapping(address => uint256) balances;
    payments[8] topPayments;

    constructor() {}

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}
