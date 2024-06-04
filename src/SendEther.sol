// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract SendEther {
    address payable public owner;

    event Deposit(address indexed account, uint256 amount);

    constructor() payable {
        owner = payable(msg.sender);
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

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
