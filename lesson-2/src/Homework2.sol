// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Homework2 {
    /**
     * Custom Errors
     */

    error Homework2__IndexOutOfBounds();
    error Homework2__ItemNotFound();

    uint256[] public numbers;

    /**
     * Events
     */

    event ItemRemoved(uint256 indexed itemRemoved, uint256 indexed itemIndex);

    constructor(uint256[] memory luckyNumbers) {
        numbers = luckyNumbers;
    }

    /**
     *
     * @param _index index of item to be removed
     */
    function removeIndexAt(uint256 _index) public {
        uint256 numbersLength = getNumbersLength();
        if (_index > numbersLength) {
            revert Homework2__IndexOutOfBounds();
        }

        uint256 itemRemoved = numbers[_index];

        numbers[_index] = numbers[numbersLength - 1];
        numbers.pop();

        emit ItemRemoved(itemRemoved, _index);
    }

    /**
     *
     * @param _item value of the item to be removed
     */
    function removeItem(uint256 _item) external {
        (uint256 itemIndex) = findItemIndex(_item);
        removeIndexAt(itemIndex);
    }

    /**
     *
     * @param _item value of the item to be found
     */
    function findItemIndex(uint256 _item) internal view returns (uint256) {
        uint256 itemIndex = 0;
        uint256 numbersLength = getNumbersLength();
        bool isItemFound = false;

        for (uint256 i = 0; i < numbersLength; i++) {
            if (numbers[i] == _item) {
                isItemFound = true;
                itemIndex = i;
                break;
            }
        }

        if (!isItemFound) {
            revert Homework2__ItemNotFound();
        }

        return itemIndex;
    }

    /**
     * Setter functions
     */

    function setNumbers(uint256[] memory _numbers) external {
        numbers = _numbers;
    }

    /**
     * Getter functions
     */

    function getNumbersLength() public view returns (uint256) {
        uint256 numbersLength = numbers.length;
        return numbersLength;
    }
}
