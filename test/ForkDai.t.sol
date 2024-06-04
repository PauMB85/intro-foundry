// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "./interfaces/IERC20.sol";

contract ForkDaiTest is Test {
    IERC20 public dai;

    function setUp() public {
        dai = IERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);
    }

    function testDeposit() public {
        address andrea = address(123);
        uint256 balanceInicial = dai.balanceOf(andrea);
        console.log("El balance inicial de andrea es: ", balanceInicial / 1e18);

        uint256 totalSupply = dai.totalSupply();
        console.log("Total supply es: ", totalSupply / 1e18);

        deal(address(dai), andrea, 1 * 1e18, true);

        uint256 balanceFinal = dai.balanceOf(andrea);
        console.log("El balance final de andrea es: ", balanceFinal / 1e18);

        uint256 totalSupplyFinal = dai.totalSupply();
        console.log("Total supply es: ", totalSupplyFinal / 1e18);
    }
}
