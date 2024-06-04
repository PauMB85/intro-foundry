//SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/Billetera.sol";

contract BilleteraTest is Test {
    Billetera public billetera;

    function setUp() public {
        billetera = new Billetera();
    }

    function test_setOwner() public {
        billetera.setOwner(address(1));
        assertEq(billetera.owner(), address(1));
    }

    function test_FailNotOwner() public {
        vm.prank(address(1));
        vm.expectRevert("Solo el owner puede realizar esta operacion");
        billetera.setOwner(address(1));
    }
}
