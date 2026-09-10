// SPDX-Lincense-Identfier: MIT
pragma solidity ^0.8.30;
import {TCH8OZ} from "../src/TCH8OZ.sol";
import {Test} from "../lib/forge-std/src/Test.sol";
import {if_else} from "../src/if_else.sol";

contract TCH80ZTest is Test {
    // case1 the name of the contract is techcrush8
    // case2 the symbol of the contract is TCH8
    // mint an amount to the TCH08OZ contract and check that the amount is truly minted corrected
    // transfer tch8 from ola to ade and ade transfer to henry
    // transferFrom tch8
    // test burn
    // test that decimal iscorrect

    // declare contructor for test.. setUp
    // deploying a test suite for your contract
    string public name = "TECHCRUSH8"; // A
    string public symbol = "TCH8";
    uint256 public height = 100;
    TCH8OZ public newTCH08;
    if_else public newifOrElse;

    // actors
    // makeAddr we can create fake address to any string of our choice
    address public protocol = makeAddr("protocol");

    address public ade = makeAddr("ade");
    address public musa = makeAddr("musa");

    uint256 amountToMint = 1_000_000e18;

    function setUp() public {
        // 1. write a deployment logic
        // a. you need to create an instance for that contract.
        // b. deplyo with your `new` keyworld
        newTCH08 = new TCH8OZ(name, symbol, protocol); // deploys a contract for me
        newifOrElse = new if_else();
        // newTCH08.mint(protocol, 10000000000000e18);
    }

    // contract addess and function sig
    function testName() public {
        vm.prank(address(this));
        // A(2 * 2) == B(2*2)
        // assertEq is used to test that value of A is equals to the value of B
        string memory expectedName = "TECHCRUSH8"; // B
        // assertEq(newTCH08.name, expectedName);
        assertEq(newTCH08.name(), expectedName);
    }

    function testSymbol() public {
        string memory expectedSymbol = "TCH8";
        // assertEq(newTCH08.symbol, expectedSymbol);
        assertEq(newTCH08.symbol(), expectedSymbol);
    }

    function testDecimal() public {
        uint8 expectedDecimal = 6;
        assertEq(newTCH08.decimals(), expectedDecimal);
    }

    function testMint() public {
        // create an expected amount to mint

        uint256 expectedAmountToMint = 1_000_000e18;
        // mint to the TCH8OZ CONTRACT
        // vm.prank is a keyword that is used to behave like an msg.sender to proces the next tx
        vm.prank(protocol);
        newTCH08.mint(address(newTCH08),amountToMint);
        // GET THE AMOUNT OF TCH8OZ TOKEN from the TCH80Z contract
        uint256 balanceAfterMint = newTCH08.balanceOf(address(newTCH08));

        assertEq(balanceAfterMint, expectedAmountToMint);
    }

    // assignment: complete the last 3 functions
    function testTransfer() public {
        vm.startPrank(protocol);
        newTCH08.mint(protocol,amountToMint);
        // when ever you are using .transfer you dont need to identifiy the from.. msg.sender is the from 
        // tansfer(to, amount)
        newTCH08.transfer(ade, 1000);
        vm.stopPrank();

    }

   function testTransferFrom() public {
       vm.startPrank(protocol);

      // Mint tokens to protocol
       newTCH08.mint(protocol, amountToMint);

      // Approve Ade to spend 1000 tokens
      newTCH08.approve(ade, 1000);

      vm.stopPrank();

      // Ade transfers 1000 tokens from protocol to Musa
      vm.prank(ade);
      newTCH08.transferFrom(protocol, musa, 1000);

      // Check that Musa received the tokens
      assertEq(newTCH08.balanceOf(musa), 1000);
    }


   function testBurn() public {
     vm.startPrank(protocol);

     // Mint tokens
        newTCH08.mint(protocol, amountToMint);

     // Check the contract balance before burning
        uint256 balanceBeforeBurn = newTCH08.balanceOf(address(newTCH08));

     // Burn 1000 tokens
        newTCH08.burn(1000);

     // Check the contract balance after burning
         uint256 balanceAfterBurn = newTCH08.balanceOf(address(newTCH08));

     // The balance should decrease by 1000
         assertEq(balanceAfterBurn, balanceBeforeBurn - 1000);

        vm.stopPrank();
    }
}

// forge test --match-test testTransfer -vvvvvvvvv
