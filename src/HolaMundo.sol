// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract HolaMundo {
    string private mensaje;

    constructor() {
        mensaje = "Hola Mundo desde Foundry";
    }

    function getMensaje() public view returns (string memory) {
        return mensaje;
    }

    function actualizarMensaje(string memory _nuevoMensaje) public {
        mensaje = _nuevoMensaje;
    }
}
