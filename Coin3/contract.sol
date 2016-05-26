import "../Reputation.sol";
contract SimpleCoin {
	
	Reputation reputation;
	
    address minter;
	/* 
	 * id of coin that is created. Doesn't fit with how sending
     * the coins works
	 */
	uint256 public uniId = 0;
    mapping (address => uint) public balances;
	mapping (uint256 => coinStruct) coins;
	
	// Create an ID for the service that the coin is sent for
	uint256 public serviceId = 0;
	
	function SimpleCoin(address addr) {
		// Accept the reputation contract
		reputation = Reputation(addr);
	}
	
	struct coinStruct {
		address minter;
		uint256 id;
		uint amount;
	}
	
	function Coin() {
		minter = msg.sender;
		coins[uniId] = coinStruct(msg.sender, uniId, 0);
    }
	
    function mint(address owner, uint amount) {
        if (msg.sender != coins[uniId].minter) return;
        balances[owner] += amount;
		coins[uniId].amount = amount;
		// Give it an ID upon minting
		uniId++;
    }
	
    function send(address receiver, uint amount, uint uniId) {
        // Checked on client side
		// if (balances[msg.sender] < amount) return;
        
		balances[msg.sender] -= amount;
        balances[receiver] += amount;
		// Create reputation ticket for sender to fill about service provider
		reputation.createTicket(receiver, msg.sender, serviceId);
		serviceId++;
	}
	
    function queryBalance(address addr) constant returns (uint balance) {
        return balances[addr];
    }
}
