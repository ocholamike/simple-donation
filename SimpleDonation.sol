// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleDonation {
    address public owner;
    uint public totalDonations;

    struct Donor {
        string name;
        uint amount;
    }

    mapping(address => Donor) public donors;

    event DonationReceived(address donor, string name, uint amount);
    event FundsWithdrawn(address owner, uint amount);

    constructor() {
        owner = msg.sender;
    }

    function donate(string memory _name) public payable {
        require(msg.value > 0, "Please send some Ether to donate");

        donors[msg.sender] = Donor(_name, msg.value);
        totalDonations += msg.value;

        emit DonationReceived(msg.sender, _name, msg.value);
    }

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdrawFunds() public {
        require(msg.sender == owner, "Only the onwer can withdraw");
        uint amount = address(this).balance;
        payable(owner).transfer(amount);
        emit FundsWithdrawn(owner, amount);
    }
 }
