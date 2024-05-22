//SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/HolaMundo.sol";

contract HolaMundoTest is Test {
    HolaMundo public holaMundo;

    // el setUp se ejecuta antes de cada prueba
    function setUp() public {
        holaMundo = new HolaMundo();
    }

    function test_DefaultValue() public view {
        assertEq(holaMundo.getMensaje(), "Hola Mundo desde Foundry");
    }

    function test_AddNewMessage() public {
        holaMundo.actualizarMensaje("Hello World!");
        assertEq(holaMundo.getMensaje(), "Hello World!");
    }
}
