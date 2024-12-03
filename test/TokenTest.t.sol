// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployToken} from "script/DeployToken.s.sol";
import {Token} from "src/Token.sol";

contract TokenTest is Test {
    Token public token;
    DeployToken public deployer;
    address public user1 = makeAddr("user1");
    address public user2 = makeAddr("user2");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployToken();
        token = deployer.run();
        vm.prank(msg.sender);
        token.transfer(user1, STARTING_BALANCE);
    }

    function testDeployment() public {
        assertEq(token.totalSupply(), deployer.INITIAL_SUPPLY());
    }

    function testUser1Balance() public {
        assertEq(token.balanceOf(user1), STARTING_BALANCE);
    }

    function testTransfer() public {
        uint256 transferAmount = 10 ether;
        vm.prank(user1);
        token.transfer(user2, transferAmount);
        assertEq(token.balanceOf(user1), STARTING_BALANCE - transferAmount);
        assertEq(token.balanceOf(user2), transferAmount);
    }

    function testAllowance() public {
        uint256 allowanceAmount = 50 ether;
        vm.prank(user1);
        token.approve(user2, allowanceAmount);
        assertEq(token.allowance(user1, user2), allowanceAmount);
    }

    function testTransferFrom() public {
        uint256 allowanceAmount = 50 ether;
        uint256 transferAmount = 20 ether;
        vm.prank(user1);
        token.approve(user2, allowanceAmount);
        vm.prank(user2);
        token.transferFrom(user1, user2, transferAmount);
        assertEq(token.balanceOf(user1), STARTING_BALANCE - transferAmount);
        assertEq(token.balanceOf(user2), transferAmount);
        assertEq(token.allowance(user1, user2), allowanceAmount - transferAmount);
    }

    function testFailTransferMoreThanBalance() public {
        uint256 transferAmount = 200 ether;
        vm.prank(user1);
        token.transfer(user2, transferAmount);
    }

    function testFailTransferFromWithoutAllowance() public {
        uint256 transferAmount = 10 ether;
        vm.prank(user2);
        token.transferFrom(user1, user2, transferAmount);
    }

    function testFailTransferFromMoreThanAllowance() public {
        uint256 allowanceAmount = 50 ether;
        uint256 transferAmount = 60 ether;
        vm.prank(user1);
        token.approve(user2, allowanceAmount);
        vm.prank(user2);
        token.transferFrom(user1, user2, transferAmount);
    }

    function testApproveZeroAddress() public {
        vm.prank(user1);
        vm.expectRevert();
        token.approve(address(0), 100 ether);
    }

    function testTransferZeroTokens() public {
        vm.prank(user1);
        token.transfer(user2, 0);
        assertEq(token.balanceOf(user1), STARTING_BALANCE);
        assertEq(token.balanceOf(user2), 0);
    }
}
