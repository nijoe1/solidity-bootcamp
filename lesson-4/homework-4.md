# Homework-4

#### 1 - Optimizing Storage:

A - Take <a href="https://gist.github.com/extropyCoder/6e9b5d5497b8ead54590e72382cdca24">this contract</a>. Use the <a href="https://github.com/naddison36/sol2uml">sol2uml</a> tool to find out how many storage slots it is using.

B - By re ordering the variables, can you reduce the number of storage slots needed?

Answer:

To generate Storage Usage report:

```shell
$ cd exercise-1
$ yarn
$ sol2uml storage -f png -c Store ./Homework4-Q1.sol
```

```
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
}
```

- Before optimization:
  ![Store-before-optimization](https://github.com/UrbanWill/expert-solidity-bootcamp/assets/47801291/c2cf6821-f7e5-4a2f-8242-30c97bbd9bbb)

- After optimization:
  ![Store](https://github.com/UrbanWill/expert-solidity-bootcamp/assets/47801291/6339a952-de0a-4de2-a228-e94b18f09348)

### 2 - Foundry introduction:

A - Install Foundry. First run the command below to get `foundryup` , the Foundry toolchain installer:

```shell
$ curl -L https://foundry.paradigm.xyz | bash
```

If you do not want to use the redirect, feel free to manually download the foundryup installation script from <a href="https://raw.githubusercontent.com/foundry-rs/foundry/master/foundryup/install">here</a>.

B - Create a project and run the tests supplied to familiarize yourself with Foundry:

- Use forge init <project_name> for the default
  template
  or
- Use this <a href="https://github.com/PaulRBerg/foundry-template">template</a>

C - Run the tests supplied to familiarize yourself with
Foundry

Answer:
Done in `exercise-2-to-3` folder.

### 3 - Try out the Solidity Template or the Foundry Template

A - Start a new project using the Solidity Template.

B - Make a fork of mainnet from the command line (you may need to setup an Infura or Alchemy account).

C - Query the mainnet using the command line to retrieve a
property such as latest block number.

Answer:
Add `ETH_RPC_URL` to .env

```shell
$ cd exercise-2-to-3
$ source .env
$ forge test --fork-url $ETH_RPC_URL --match-test testGetLatestBlockNumber -vv
```

### 4 - Is this valid solidity?

```
contract MyCon {
    function a(
        function(
        function(
          function(
            function(
              function(
                function(
                  function(
                    function(
                      function() external pure
                    ) external pure
                  ) external pure
                ) external pure
              ) external pure
            ) external pure
          ) external pure
        ) external pure
        ) external pure
    ) external pure {}
}
```

Answer: No. There's a distinction between nested functions and passing functions as arguments in Solidity:

Passing Functions as Arguments:

This is a legitimate and supported feature in Solidity.
You can pass a function as an argument to another function, and the called function can execute the provided function with specific arguments.
It's a way to make your code more flexible and dynamic by allowing different functions to be executed depending on the context.
Nested Functions:

The code you initially provided with deeply nested functions is not valid in Solidity.
Nested functions refer to defining one function inside another function within the same contract, which Solidity does not support. Each function must be defined separately within the contract.
In your original example, you attempted to define functions within function arguments, which is not a supported or valid practice in Solidity. The key difference is that passing functions as arguments allows you to reuse and execute different functions dynamically, while nested functions within arguments do not serve the same purpose and are not allowed.

Eg of a function being passed to another function as argument:

```
    function processFunction(function(uint256) external pure returns (uint256) func, uint256 input)
        external
        pure
        returns (uint256)
    {
        // Call the function passed as an argument
        return func(input);
    }
}
```
