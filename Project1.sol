// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract errorhandleingMath {
    address public owner;
    uint256 public result;

    constructor() {
        owner = msg.sender;
        result = 0;
    }

    function add(uint256 a, uint256 b) public {
        require(a >= 0 && b >= 0, "Inputs must be non-negative");
        result = a + b;
    }
    function subtract(uint256 a, uint256 b) public {
        require(a >= b, "a must be greater than or equal to b");
        result = a - b;
    }

    function multiply(uint256 a, uint256 b) public {
        require(a >= 0 && b >= 0, "Inputs must be non-negative");
        result = a * b;
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
        if (msg.sender != owner) {
            revert("Only the owner can reset the result");
        }
        result = 0;
    }
}
