import "../Reputation.sol";
contract Coin {
	
	Reputation reputation;
    address minter;
    mapping (address => uint) balances;
	
    function Coin() {
        minter = msg.sender;
    }
    function mint(address owner, uint amount) {
        if (msg.sender != minter) return;
        balances[owner] += amount;
    }
	
	//uniId so that reputation can be tied to a specific transaction
	//will be based upon the user 	
    function send(address receiver, uint amount, uint uniId) {
        if (balances[msg.sender] < amount) return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
		reputation.createTicket(receiver,msg.sender,uniId);
    }
	
    function queryBalance(address addr) constant returns (uint balance) {
        return balances[addr];
    }
}

