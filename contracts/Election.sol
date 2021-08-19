pragma solidity 0.5.16;

contract Election {
    string public candidate;

    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    mapping(uint256 => Candidate) public candidates;

    mapping(address => bool) public voters;

    uint256 public candidatesCount;

    constructor() public {
        addCandidate("Donald Trump");
        addCandidate("Narendra Modi");
    }

    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint256 _candidateId) public {
        require(!voters[msg.sender]);

        require(_candidateId > 0 && _candidateId <= candidatesCount);

        //vote
        voters[msg.sender] = true;

        candidates[_candidateId].voteCount++;
    }
}
