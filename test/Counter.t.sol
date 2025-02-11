// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console, stdError} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function test_Increment2() public {
        counter.increment();
        counter.increment();
        assertEq(counter.number(), 2);
    }

    function test_Decrement_Underflow() public {
        vm.expectRevert(stdError.arithmeticError);
        counter.decrement();
    }

    function test_Decrement() public {
        counter.increment();
        counter.increment();
        counter.decrement();
        assertEq(counter.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
