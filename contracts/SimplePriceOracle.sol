// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimplePriceOracle {
    address public oracleNode;
    uint256 public ethPriceInUSD;
    uint256 public lastUpdated;

    event PriceUpdated(uint256 newPrice, uint256 timestamp);

    modifier onlyOracle() {
        require(msg.sender == oracleNode, "Unauthorized: Caller is not the oracle");
        _;
    }

    constructor() {
        oracleNode = msg.sender;
    }

    function updatePrice(uint256 _newPrice) external onlyOracle {
        ethPriceInUSD = _newPrice;
        lastUpdated = block.timestamp;
        emit PriceUpdated(_newPrice, block.timestamp);
    }
}
