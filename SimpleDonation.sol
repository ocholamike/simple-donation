// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleDonation {
    address public owner;
    uint public totalDonations;

    struct Donor {
        string name;
        uint totalAmount;
        uint donationCount;
    }

    mapping(address => Donor) public donors;

    event DonationReceived(address indexed donor, string name, uint amount);
    event FundsWithdrawn(address indexed receiver, uint amount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Access denied: only owner allowed");
        _;
    }


    function donate(string calldata _name) external payable {
        require(msg.value > 0, "Donation must be greater than zero");

        Donor storage donor = donors[msg.sender];
        donor.name = _name;
        donor.totalAmount += msg.value;
        donor.donationCount += 1;

        totalDonations += msg.value;

        emit DonationReceived(msg.sender, _name, msg.value);
    }

    function getContractBalance() external view returns (uint) {
        return address(this).balance;
    }

    function withdrawAllFunds() external onlyOwner {
        uint amount = address(this).balance;
        require(amount > 0, "No funds available to withdraw");

        payable(owner).transfer(amount);
        emit FundsWithdrawn(owner, amount);
    }

    function withdrawTo(address payable _to) external onlyOwner {
        require(_to != address(0), "Invalid address");
        uint amount = address(this).balance;
        require(amount > 0, "No funds to withdraw");

        _to.transfer(amount);
        emit FundsWithdrawn(_to, amount);
    }
}
