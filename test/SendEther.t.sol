//SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/SendEther.sol";

contract SendEtherTest is Test {
    SendEther public sendEther;

    function setUp() public {
        sendEther = new SendEther();
    }

    function testEthBalance() public view {
        console.log("ETH Balance", address(this).balance);
    }

    function _send(uint256 _amount) internal {
        (bool ok, ) = address(sendEther).call{value: _amount}("");
        require(ok, "send ETH fail");
    }

    function testSendEther() public {
        /*deal(address(1), 100);
        assertEq(address(1).balance, 100);
        vm.prank(address(1));
        _send(25);*/

        // hoax
        hoax(address(1), 30);
        assertEq(address(1).balance, 30);
        _send(30);
        assertEq(address(sendEther).balance, 30);
    }
}
