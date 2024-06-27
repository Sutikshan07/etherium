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
