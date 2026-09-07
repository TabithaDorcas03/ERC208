// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract enums {
    // enum:a user-defined data type used to represent a fixed set of constant, named options
    bool isPopoolaTall = true; // true or false
    // enum: average, tall, short, dwarf, giant
    // <enum> <var name> {
    // <opt1>
    // <opt2>
    // <opt3>
    // }

    enum order {
        sharwarma, // 0
        pizza, // 1
        bread, // 2
        peanut //3
    }
    // error Election_Election_CannotDeleteCandidateNow(Candidate_Deletion_Fail_Reasonreason,  uint256 timeStamp);

    // block.timestamp
    enum status {
        electionClosed, // 0
        electionStarted, // 1
        electionCanceled // 2
    }
    order public s_currentOrder;
    uint256 height;

    function changeToSharwama(order _order, uint256 _heignt) public {
        s_currentOrder = order.sharwarma;

        s_currentOrder = _order;
    }

    function getOrder() public view returns (order) {
        return s_currentOrder;
    }
}

contract enum2 {
    // <enum> <var name> {
    // <opt1>
    // <opt2>
    // <opt3>
    // }
    enum ClassStatus {
        empty,
        full,
        just8OfUs,
        OfUs
    }

    ClassStatus public status;

    function changeClassStatus(ClassStatus _status) public {
        status = _status;
    }
}
