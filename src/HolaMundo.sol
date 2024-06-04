// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

/**
El console solo está disponible para pruebas
 */

import "forge-std/console.sol";

contract HolaMundo {
    string private mensaje;

    constructor() {
        mensaje = "Hola Mundo desde Foundry";
    }

    function getMensaje() public view returns (string memory) {
        console.log("Devolvemos el mensaje");
        return mensaje;
    }

    function actualizarMensaje(string memory _nuevoMensaje) public {
        mensaje = _nuevoMensaje;
    }
}
