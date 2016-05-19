contract Reputation {
	//function Reputation() {
	//	//maxRep = 10;
	//	reputation[msg.sender] = 10;
	//}
	//function changeReputation(address instigator, address target, int256 _value) returns(bool //successful){
        // ratings[_key] will be 0 if it is not defined
	//	if (target == instigator) {
	//		return;
	//	}
	//	int256 currentSum = 0;
	//	if (reputation[target] + reputation[instigator] < 0) {
	//		reputation[target] = 0;
	//	} else {
	//		reputation[target] += reputation[instigator];
	//	}
    //}
    //mapping (address => int256) public reputation;
	//int256 maxRep;=
    
    uint nextUserId;
    mapping(uint256 => UserData) public users;
    
    struct UserData {
        address recipient;
        uint contributed;
        uint maxRep;
        uint deadline;
        uint num_contributions;
        mapping(uint => RepContribution) contributions;
    }
    
    struct RepContribution {
        address contributor;
        uint amount;
        uint time;
    }

    // Create a new user.
    function create(address recipient, uint256 goal, uint256 deadline) returns (uint id) {
        users[nextUserId] = UserData(recipient, 1, goal, deadline, 0);
        nextUserId ++;
        id = nextUserId;
    }

    // Contribute to the user with id $(userId).
    function contribute(uint256 userId) {
        var user = users[userId];
        //if (campaign.deadline == 0) // check for non-existing campaign
        //    return;
        user.contributed += msg.value;
        user.contributions[user.num_contributions] =
                      RepContribution(msg.sender, msg.value, now);
        user.num_contributions++;
		//if (amount % 1 ether != 0  ) {
    	//return;
		//}
    }

    // Check whether the threshold Rep of the User with id $(userId)
    function checkRepThreshold(uint256 userId) returns (bool reached)
    {
		reached=false;
		
        var user = users[userId];
		//if the user has reached the maximum threshold
        if ( user.contributed >= user.maxRep) {
            reached = true;
        }
		//if the user has reached 0 reputation
		if ( user.contributed <= 0) {
			reached = true;
		}
		
		
    }

    // Check whether the deadline of the campaign with id $(campaignId) has
    // passed. In that case, return the contributed money and delete the
    // campaign.
    //function checkExpired(uint campaignId) returns (bool expired)
    //{
    //    expired = false;
    //    var campaign = campaigns[campaignId];
    //    if (campaign.deadline > 0 && block.timestamp > campaign.deadline) {
            // pay out the contributors
    //        for (uint i = 0; i < campaign.num_contributors; i++) {
    //            send(campaign.contributions[i].contributor,
    //                 campaign.contributions[i].amount);
    //            delete campaign.contributions[i];
    //        }
    //        delete campaign;
    //        expired = true;
    //    }
    //}

    // Return the amount contributed to the campaign with id $(campaignId) by
    // the sender of the transaction.
    function getRepAmount(uint userId) returns (uint amount)
    {
        amount = users[userId].contributed;
    }


}