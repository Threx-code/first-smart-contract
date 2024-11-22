//  SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

// import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

import {PriceConverter} from "./PriceConverter.sol";


error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 5e18;
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    // we set it immuntable because we only use it one time
    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {

        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough Eth");
        address getSender = msg.sender;
        funders.push(getSender);
        addressToAmountFunded[getSender] += msg.value;
    }


    function withdraw() public onlyOwner{
    
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // To reset array
            funders = new address[](0);

            // withdrawal
            // there are 3 ways to send the fund which are
            // - transfer
            // send
            // call


            // // transfer implementation
            // payable(msg.sender).transfer(address(this).balance);

            // // send implementation
            // bool sendSuccess = payable(msg.sender).send(address(this).balance);
            // require(sendSuccess, "Send failed");

            // call implementation. This is the best implementation
            (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
            require(callSuccess, "Call failed");
    }


    modifier  onlyOwner() {
        //require(msg.sender == i_owner, "Authorization declined");
        if(msg.sender != i_owner){
            revert notOwner();
        }
        _;
    }

    receive() external payable {
        fund();
    }


    fallback() external payable {
        fund();
    }

}