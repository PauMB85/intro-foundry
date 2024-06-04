pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/Errores.sol";

contract BilleteraTest is Test {
    Errores public errores;

    function setUp() public {
        errores = new Errores();
    }

    function testRequire() public {
        vm.expectRevert("No Autorizado");
        errores.throwError();
    }

    function testCustomError() public {
        vm.expectRevert(Errores.NoAutorizado.selector);
        errores.throwCustomError();
    }
}
