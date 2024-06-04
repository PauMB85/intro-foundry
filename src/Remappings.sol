//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// usando solmate, se instala con forge install rari-capital/solmate
/*import "solmate/tokens/ERC20.sol";

contract ImportERC20 is ERC20("CoinTest", "CT", 18) {}*/

// instalndo openzeppelin --> npm install @openzeppelin/contracts
// creamos el fichero remappings para que sepa como se enlza el import

import "@openzeppelin/contracts/access/Ownable.sol";
contract TestOwnable is Ownable {
    constructor() Ownable(msg.sender) {}
}
