// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.30;

contract contructors {
    // contructor is a function that can be called only once and never again.. it is called during deployment
    // <constructor> () {
        // logic
    // }

    address owner;
    constructor(address _newOwner) {
        owner = _newOwner;
    }
}