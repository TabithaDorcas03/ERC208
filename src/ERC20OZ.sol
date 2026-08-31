// SPDX-Lincense-Identfier: MIT
pragma solidity ^0.8.30;
import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
contract ERC20OZ is ERC20 {
    
    // inheritance: it is used for calling all functions from an imported contract to yours.

    //use the is keyword
    // set name in the constructor
    // // call the symbol 
    // call mint function(set totalsuply for us)
    // call burn
    // call decimal
    string public T_name;
    string public T_symbol;
    constructor (string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        T_name = _name;
        T_symbol = _symbol;
    }

    function mint() public {
        // name();
    }

    function burn() public {

    }

    function decimal() public{

    }
}