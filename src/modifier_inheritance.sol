// SPDX-Lincense-Identfier: MIT
pragma solidity ^0.8.30;
import {enums} from "./enums.sol";
contract Tmodifier is enums { 
    
    error Zero_AddressError();
    address public ola;
    // modifier: is a peice of reuseable code/ logic that runs before afunction logic runs
    modifier zeroAddrChecker(address _checkee) {
        if (ola == address(0)) {
            revert Zero_AddressError();
        }
        _;
    }
    function _modifier() public zeroAddrChecker(ola) {
        // logic
        if (ola == address(0)) {
            revert Zero_AddressError();
        }
    }


    // inheritance: a functionality that takes an imported code, functions and valirbles inside your current derived code base

    function getThegetOrder() zeroAddrChecker(ola) public view returns(order) {
        return getOrder();
    }
}