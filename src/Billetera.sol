// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract Billetera {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function retirar(uint cantidad) external {
        require(
            msg.sender == owner,
            "Solo el owner puede realizar esta operacion"
        );

        payable(msg.sender).transfer(cantidad);
    }

    function setOwner(address _owner) external {
        require(
            msg.sender == owner,
            "Solo el owner puede realizar esta operacion"
        );

        owner = payable(_owner);
    }
}
