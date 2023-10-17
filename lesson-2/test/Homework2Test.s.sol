// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {DeployHomework2} from "../script/DeployHomework2.s.sol";
import {Homework2} from "../src/Homework2.sol";

contract HomeWork2Test is Test {
    /**
     * Events
     */

    event ItemRemoved(uint256 indexed itemRemoved, uint256 indexed itemIndex);

    Homework2 homework2;
    uint256 constant INITIAL_NUMBERS_LENGTH = 2;

    function setUp() external {
        DeployHomework2 deployer = new DeployHomework2();

        uint256[] memory luckyNumbers = new uint256[](INITIAL_NUMBERS_LENGTH);
        luckyNumbers[0] = 33;
        luckyNumbers[1] = 12;
        (homework2) = deployer.run(luckyNumbers);
    }

    /**
     * @dev helper modifier to fuzz numbers array
     * @param _numbers fuzzed uint256[] from foundry
     */

    modifier pupulateArr(uint256[] calldata _numbers) {
        vm.assume(_numbers.length > 1);
        homework2.setNumbers(_numbers);
        _;
    }

    function testConstructorNumbersWorks() public view {
        uint256 numbersLength = homework2.getNumbersLength();
        assert(numbersLength == INITIAL_NUMBERS_LENGTH);
    }

    function testSetNumbersCorrectlySetNumbers(uint256[] calldata _numbers) public pupulateArr(_numbers) {
        assert(homework2.getNumbersLength() == _numbers.length);
    }

    function testRemoveIndexAtReverts(uint256[] calldata _numbers) public pupulateArr(_numbers) {
        uint256 numbersLength = homework2.getNumbersLength();
        vm.expectRevert(Homework2.Homework2__IndexOutOfBounds.selector);
        homework2.removeIndexAt(numbersLength + 1);
    }

    function testRemoveIndexAtArrayLengthDecreases(uint256[] calldata _numbers, uint256 indexToRemove)
        public
        pupulateArr(_numbers)
    {
        vm.assume(indexToRemove < _numbers.length);
        uint256 numberLengthPrev = homework2.getNumbersLength();

        homework2.removeIndexAt(indexToRemove);

        uint256 numberLengthNext = homework2.getNumbersLength();
        assert(numberLengthNext == numberLengthPrev - 1);
    }

    function testRemoveIndexAtEmitsEvent(uint256[] calldata _numbers, uint256 indexToRemove)
        public
        pupulateArr(_numbers)
    {
        vm.assume(indexToRemove < _numbers.length);
        uint256 itemToBeRemoved = homework2.numbers(indexToRemove);

        vm.expectEmit(true, true, false, false, address(homework2));
        emit ItemRemoved(itemToBeRemoved, indexToRemove);
        homework2.removeIndexAt(indexToRemove);
    }

    function testRemoveItemRevertsWhenNotFound() public {
        uint256 itemToRemove = 23;
        vm.expectRevert(Homework2.Homework2__ItemNotFound.selector);
        homework2.removeItem(itemToRemove);
    }

    function testRemoveItemRemovesItemByValue(uint256[] calldata _numbers, uint256 indexToRemove)
        public
        pupulateArr(_numbers)
    {
        vm.assume(indexToRemove < _numbers.length);
        uint256 itemToRemove = homework2.numbers(indexToRemove);

        homework2.removeItem(itemToRemove);

        assert(homework2.getNumbersLength() == _numbers.length - 1);
    }
}
