/*

This is a contract for my example decentralised "Junkyard" trading service where users can sell stuff to others. 
As the system is decentralised, being scammed is a real posibility. To mitigate this risk, the Junkyard integrates with the reputation system to assign a level of trust to users. 

by Samuel Colbran

*/

contract Reputation {
	uint256 public tid = 0;
	mapping (address => mapping (uint256 => Ticket)) public services;
	
	function Reputation() {
		
	}
	
	struct Ticket {
		address provider;
		address consumer;
		uint256 tid; // Transaction id (service should know what it means)
		bool signed; // A flag to see whether the consumer has signed this ticket
	}
	
	// Creates a new unsigned ticket
	function createTicket(address provider, address consumer, uint256 tid) returns (uint256 token) {
		//if (msg.value < 1) throw; // Tickets cost 1 ether [to pay for future gas costs]
		
		// Create the ticket
		services[msg.sender][tid] = Ticket(provider, consumer, tid, false);
		tid++;
		return tid - 1;
	}
	
	// Signs a ticket
	function signTicket(address service, uint256 token) {
		Ticket ticket = services[service][token];
		if (ticket.consumer != msg.sender) throw; // The consumer must sign the ticket
		if (ticket.signed) throw;
		ticket.signed = true;

		// Refund the consumer
	}
	
}

contract Junkyard {
	Reputation reputation;
	
	uint256 public jid = 0;
	mapping (uint256 => Junk) public yard;
	
	function Junkyard(address addr) {
		reputation = Reputation(addr);
	}
	
	// Junk is an abstract representation of an item
	struct Junk {
		address owner;
		string description;
		uint256 price;
		bool sold;
	}

	function createJunk(string description, uint256 price) returns (uint256) {
		yard[jid] = Junk(msg.sender, description, price, false);
		jid++;
		return jid - 1;
	}
	
	function buy(uint256 id) returns (uint256 token) {
		Junk junk = yard[id];
		if (junk.sold == true) throw; 			// You can't buy this item!
		if (msg.sender == junk.owner) throw; 	// You can't buy your own item!
		if (msg.value < junk.price) throw; 		// This item costs more!
		
		// transaction fee (5%)
		uint256 fee = 1;
		uint256 payment = msg.value - fee;
		
		// this item is now sold
		junk.sold = true;
		
		// pay the current owner
		junk.owner.send(payment);
		
		// generate reputation token using the transaction fee to cover any gas costs
		token = reputation.createTicket(junk.owner, msg.sender, id);
		
		// transfer ownership
		junk.owner = msg.sender;
	}
}

