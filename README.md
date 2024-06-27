# Implementation of Error Handling Mechanism

This Solidity program demonstrates the basic syntax and functionality of the Solidity programming language.
## Description

The errorhandlingMath smart contract is a Solidity-based contract designed to perform basic arithmetic operations while demonstrating error handling techniques. It includes functions to add (add), subtract (subtract), multiply (multiply), divide (divide), and find the modulus (mod) of values, as well as reset the result to zero (reset).

The add function requires both input values to be non-negative, ensuring valid input with a require statement. The subtract function ensures that the first value is greater than or equal to the second value. The multiply function requires both inputs to be non-negative. The divide function prevents division by zero with a require statement. The mod function also prevents finding the modulus with zero using a require statement.

The reset function reverts the transaction if an attempt is made to reset the result by anyone other than the owner, showcasing the use of the revert statement to handle access control. The contract is a straightforward example of how to implement and manage state while incorporating Solidity's error handling mechanisms to ensure reliable and predictable behavior.
## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a.sol extension (e.g., Project1.sol). Copy and paste the following code into the file:

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandlingMath {
    address public owner;
    uint256 public result;

    constructor() {
        owner = msg.sender;
        result = 0;
    }

    function add(uint256 a, uint256 b) public {
        require(a >= 0 && b >= 0, "Inputs must be non-negative");
        result = a + b;
        assert(result >= a && result >= b); // Check for overflow
    }

    function subtract(uint256 a, uint256 b) public {
        require(a >= b, "a must be greater than or equal to b");
        result = a - b;
        assert(result <= a); // Check for underflow
    }

    function multiply(uint256 a, uint256 b) public {
        require(a >= 0 && b >= 0, "Inputs must be non-negative");
        result = a * b;
        assert(a == 0 || result / a == b); // Check for overflow
    }

    function divide(uint256 a, uint256 b) public {
        require(b > 0, "Cannot divide by zero");
        result = a / b;
    }

    function mod(uint256 a, uint256 b) public {
        require(b != 0, "Cannot find modulus with zero");
        result = a % b;
    }

    function reset() public {
        require(msg.sender == owner, "Only the owner can reset the result");
        result = 0;
    }
}

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "Compile Project1.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "Project1" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling all the functions. 

## Author


Sutikshan Mahajan  
[@Sutikshan Mahajan](https://sutikshanmahajan6932@gmail.com)
