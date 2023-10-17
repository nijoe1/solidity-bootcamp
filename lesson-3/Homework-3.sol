// SPDX-License-Identifier: LIGMA
pragma solidity ^0.8.2;

contract Homework3 {
    mapping(address => uint256[]) s_addressToLuckyNumbers;

    /**
     * Events
     */

    event LuckyNumberSet(address indexed msgSender, uint256[] luckyNumbers);

    function setLuckyNumbers(uint256[] memory _luckyNumbers) public {
        s_addressToLuckyNumbers[msg.sender] = _luckyNumbers;
        emit LuckyNumberSet(msg.sender, _luckyNumbers);
    }

    function getLuckyNumbers() public view returns (uint256[] memory) {
        uint256[] memory luckyNumbers = s_addressToLuckyNumbers[msg.sender];

        return luckyNumbers;
    }
}
