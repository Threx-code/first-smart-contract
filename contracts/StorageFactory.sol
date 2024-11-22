// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// import takes a Path, Package, GitHub
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public listOfSimpleStorage;
    // address[] public listOfSimpleStorageAddress;

    // This contract will be deploying another contract
    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorage.push(newSimpleStorageContract);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // To interact with the contract function you going to need
        //  address
        //  ABI: Application Binary Interface
        
        SimpleStorage mySimpleStorage = listOfSimpleStorage[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage mySimpleStorage = listOfSimpleStorage[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }

}
