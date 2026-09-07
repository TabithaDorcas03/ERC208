// SPDX-Lincense-Identfier: MIT
pragma solidity ^0.8.30;

contract ERC20 {
    // we want to name out token TECHCRUSH8
    // we want to give a symbol TCH8
    // decimal:
    // stable coins: these are tokens that are pegged to a particular currency ex cNGN, usdt, usdc, dai etc it has the decimal of 6
    // altcoins: are tokens that do not stay constant based on any currency. shiba inu, meme coins, ETH. IT HAS THE DECIMAL OF 18

    address ade;
    uint256 height;
    bool isFat;
    string public T_name;
    string public T_symbol;
    uint8 public decimal = 18;

    uint256 public T_totalSupply = 1000e18;
    // key => value
    mapping(address => uint256 amountLeft) public T_balance;
    mapping(address => bool) freeze;

    // ade =>  1000
    // ola => 1888
    // alice => 3000

    // alice = alice  - 100 = 2900
    // ola + 100
    constructor(string memory _name, string memory _symbol) {
        T_name = _name;
        T_symbol = _symbol;
    }

    function setAde() public {
        ade = 0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f;
    }

    //
    function getAde() public view returns (address) {
        return ade;
    }

    function name() public view returns (string memory) {
        return T_name;
    }

    function symbol() public view returns (string memory) {
        return T_symbol;
    }

    function decimals() public view returns (uint8) {
        return decimal;
    }

    function totalSupply() public view returns (uint256) {
        return T_totalSupply;
    }

    function balanceOf(address _tokenOwner) public view returns (uint256) {
        return T_balance[_tokenOwner]; // 5 tokens
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        // does not need to be approved by the approved fucntion
        T_balance[msg.sender] = T_balance[msg.sender] - _value;
        // we are adding to new amount of ola
        T_balance[_to] = T_balance[_to] + _value;

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        // need to be approved by the approved fucntion
        // x = x -1
        //x = 4
        // sub from the prevous amout of alice
        T_balance[_from] = T_balance[_from] - _value;
        // we are adding to new amount of ola
        T_balance[_to] = T_balance[_to] + _value;

        return true;
    }

    function mint() public {}

    function burn() public {}

    function approve() public {}
}
