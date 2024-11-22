// SPDX-License-Identifier: MIT


import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

      // function withdraw() public {}

    function getPrice() internal view returns (uint256){
        // You need the address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // you need the abi

        AggregatorV3Interface priceFeed = getAggregatorInterface();
        (,int256 price,,,) = priceFeed.latestRoundData();

        return uint256 (price * 1e10);

    }

    function getConversionRate(uint256 ethAmount) internal view returns (uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

        return ethAmountInUsd;

    }

    function getVersion() internal view returns (uint256){
        return getAggregatorInterface().version();
    }


    function getAggregatorInterface() internal pure returns (AggregatorV3Interface){
        return AggregatorV3Interface(0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF);
    }


}