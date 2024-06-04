//SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/Subasta.sol";

contract SubastaTest is Test {
    Subasta public subasta;
    uint256 private inicio;

    function setUp() public {
        subasta = new Subasta();
        inicio = block.timestamp;
    }

    function test_ofertaAntesDeTiempo() public {
        vm.expectRevert("No puede ofertar");
        subasta.oferta();
    }

    function testOfertaDespuesTiempo() public {
        vm.warp(inicio + 2 days);
        vm.expectRevert("No puede ofertar");
        subasta.oferta();
    }

    function testOfertaInicioTiempo() public {
        vm.warp(inicio + 1 days);
        subasta.oferta();
    }

    function testTimestamp() public {
        uint t = block.timestamp;

        // skip - incrementa current timestamp
        skip(100);
        assertEq(block.timestamp, t + 100);

        // rewind - decrementar current timestamp
        rewind(10);
        assertEq(block.timestamp, t + 90);
    }
}
