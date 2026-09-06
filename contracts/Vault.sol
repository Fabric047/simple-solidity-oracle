// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./SimplePriceOracle.sol";

contract Vault {
    SimplePriceOracle public immutable oracle;

    constructor(address _oracleAddress) {
        oracle = SimplePriceOracle(_oracleAddress);
    }

    function canLiquidate(uint256 liquidationThresholdUSD) external view returns (bool) {
        uint256 currentPrice = oracle.ethPriceInUSD();
        return currentPrice < liquidationThresholdUSD;
    }
}
