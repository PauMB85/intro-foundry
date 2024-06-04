//SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/Eventos.sol";

contract EventosTest is Test {
    Eventos public eventos;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    function setUp() external {
        eventos = new Eventos();
    }

    function test1Evento() external {
        // 1. Indica a Foundry que datos comprobar
        vm.expectEmit(true, true, false, true);
        // 2. Emite el evento esperado
        emit Transfer(address(this), address(123), 200);

        // 3. Llama a la función que debería emitir el evento
        eventos.transfer(address(this), address(123), 200);
    }

    function test1EventoSolo1Indice() external {
        // 1. Indica a Foundry que datos comprobar
        vm.expectEmit(false, false, false, true);
        // 2. Emite el evento esperado
        emit Transfer(address(this), address(123), 300);

        // 3. Llama a la función que debería emitir el evento
        eventos.transfer(address(1), address(23), 300);
    }

    function testMultiEmit() external {
        address[] memory to = new address[](2);
        to[0] = address(123);
        to[1] = address(456);

        uint256[] memory amount = new uint256[](2);
        amount[0] = 10;
        amount[1] = 20;

        for (uint256 i = 0; i < to.length; i++) {
            // 1. indica a foundry que datos comprobar
            vm.expectEmit(true, true, false, true);

            // 2. Emite el evento experado
            emit Transfer(address(this), to[i], amount[i]);
        }

        eventos.transferMany(address(this), to, amount);
    }
}
