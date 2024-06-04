//SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

contract ConsoleTest is Test {
    function testLog() public {
        string memory hola = "Hola mundo!";
        console.log("Prueba de mi console", 333);
        console.log("Prueba de mi console", hola);
    }
}
