contract Reputation {
    
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

    // Contribute to the user reputation with id $(userId).
    function contribute(uint256 userId) {
        var user = users[userId];
        user.contributed += msg.value;
        user.contributions[user.num_contributions] =
                      RepContribution(msg.sender, msg.value, now);
        user.num_contributions++;
    }
	
	    // Negate the user reputation with id $(userId).
    function negate(uint256 userId) {
        var user = users[userId];
        user.contributed -= msg.value;
        user.contributions[user.num_contributions] =
                      RepContribution(msg.sender, -msg.value, now);
        user.num_contributions++;
    }
	
	//Reputation determination algorithm - very simple as is
	function repModifier(uint256 userId, uint256 threshold) returns (uint256 rep) {
		var user= users[userId];
		if (user.contributed >= threshold){
			rep = user.contributed / 10;
		} else {
			rep=1;
		}
		
	}
	
	//Check that user is not giving reputation to themselves
	function checkIntegrity(uint256 sender, uint256 reciever) returns (bool reached)
	{
		reached=true;
		
		if (sender == reciever) {
			reached == false;
		}
		
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
	
    // Return the amount contributed to the campaign with id $(campaignId) by
    // the sender of the transaction.
    function getRepAmount(uint userId) returns (uint amount)
    {
        amount = users[userId].contributed;
    }


}

contract RepToken {
	mapping(address => uint[]) public reputationHistory;
	
}

contract CoinTransfer {
	
	
	struct Coin {
		address owner;
		address recipient;
		uint256 value;
	}
	
	function createCoin(uint256 amount) {
		// Create a new coin with no recipient
		// Coin c = Coin(msg.sender, 0, amount);
	}
	
	function acceptPayment(address ServiceProvider, uint256 amount) {
		// Perform validation on client-side
		// Transfer amount to Service Provider
		ServiceProvider.send(amount);
		
	}
	
	
}