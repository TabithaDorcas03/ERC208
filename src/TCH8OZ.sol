// SPDX-Lincense-Identfier: MIT
pragma solidity ^0.8.30;
import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
contract TCH8OZ is ERC20 {
    error onlyProtocolAddressError();
    // inheritance: it is used for calling all functions from an imported contract to yours.
    // TCH8
    //use the is keyword
    // set name in the constructor
    // // call the symbol 
    // call mint function(set totalsuply for us)
    // call burn
    // call decimal
    string public T_name;
    string public T_symbol;
    uint256 public T_totalSupply;
    address public protocol;

    modifier onlyProtocol() {
        if (msg.sender != protocol) {
            revert onlyProtocolAddressError();
        }
        _;
    }
    constructor (string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        T_name = _name;
        T_symbol = _symbol;
    }
    // we are taking 2 params, 1 is the account to mint to and the value
    // address(this)= is the current contract address you are writing or working or coding on
    function mint(uint256 amountToMint) public onlyProtocol {
        // ERC20._mint()
        _mint(address(this), amountToMint);
        // _mint(address(ola), 10000);
        T_totalSupply = T_totalSupply + amountToMint;
    }

    function burn(uint256 amountToBurn) public onlyProtocol {
        _burn(address(this), amountToBurn);

        T_totalSupply = T_totalSupply - amountToBurn;
    }
    // stable = 6 and altcoin 18
    function decimals() public view override returns (uint8) {
        return 6;
    }
}