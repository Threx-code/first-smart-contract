// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;
import {SimpleStorage} from "./SimpleStorage.sol";

//  inheritance
contract AddFiveStorage is SimpleStorage {

    function sayHello() public pure returns (string memory) {
        return "Hello World";
    }


    // To override inherited functions
    function store(uint256 _newNumber) public override  {
        myFavouriteNumber = _newNumber + 10;
    }

}