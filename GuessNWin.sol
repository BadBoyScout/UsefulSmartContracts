// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract GuessNWin {

    receive() external payable {}
    fallback() external payable {}

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

    address[] private participants;

    function EnterContest() public payable {

        require(msg.value >= 0.1 ether,"Failed to provide entry fee!");

        participants.push(msg.sender);

        if ( participants.length >= 3 ) {
            payable(participants[0]).transfer(address(this).balance);
        }

    }
}
