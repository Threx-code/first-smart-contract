// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;


contract SimpleStorage {
    //  storage variable exist outside function and can be accessed
    uint256 public myFavouriteNumber;


    // arrays in solidity is similar to list in python
    uint256[] listOfNumbers;

    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    // This is to create a single person

    // Person public olu = Person({
    //     number: 7,
    //     name: "Oluwatosin"
    // });


    // To create arrays of Person
     Person[] public listOfPeople;

     // MAPPING
    mapping (string => uint256) public nameToFavouriteNumber;



    // calldata, memory: mean that the data is only going to exist for the duration of the function call
    //  calldata variable is a temporary variable that cannot be modified
    //  memory variable is a temporary variable that can be modified

    function addPerson(string memory _name, uint256 num) public {
        listOfPeople.push(
            Person({
                favouriteNumber: num,
                name: _name
            })
        );

        nameToFavouriteNumber[_name] = num;
    }


    function store(uint256 num) public {
        myFavouriteNumber = num;
    }

    // adding a getter function
    // When a function reads VIEW it means that we are only reading from the function and not sending any transaction
    //  View also means that we cannot modify anything in the function

    function retrieve() public view returns (uint256){
        return myFavouriteNumber;
    }
}

