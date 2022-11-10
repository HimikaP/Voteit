// SPDX-License-Identifier: MIT
pragma solidity >=0.4.20;

contract Election {

    struct candidate{
        uint id; 
        string name;
        uint voteCount;
    }

    //can be used to look up candidates using their ids
    mapping(uint=>candidate) public candidates;

    uint public candidatesCount;
    
function addCandidate (string memory _name) private {
        candidatesCount ++; // increment no. of candidates

        //storing the data in id-struct mapping
        candidates[candidatesCount] = candidate(candidatesCount, _name, 0);
    }

    // to keep track of accounts that have voted
    mapping(address =>bool ) public voters;

     function vote (uint _candidateId) public {
   
        require(!voters[msg.sender]);
  
        require(_candidateId > 0 && _candidateId <= candidatesCount);
    
        voters[msg.sender] = true; // to ensure that that particular address has voted in the voters mapping

        candidates[_candidateId].voteCount ++;
    }

constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
       
    }

    }
