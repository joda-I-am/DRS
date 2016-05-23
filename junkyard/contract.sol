/*

This is a contract for my example decentralised "Junkyard" trading service where users can sell stuff to others. 
As the system is decentralised, being scammed is a real posibility. To mitigate this risk, the Junkyard integrates with the reputation system to assign a level of trust to users. 

by Samuel Colbran

*/


import "../Reputation.sol";
contract Junkyard {
	Reputation reputation;
	
	uint256 public jid = 0;
	mapping (uint256 => Junk) public yard;
	
	function Junkyard(address addr) {
		reputation = Reputation(addr);
	}
	
	// Junk is an abstract representation of an item
	struct Junk {
		uint256 jid;
		address owner;
		string description;
		uint256 price;
		bool sold;
	}

	function createJunk(string description, uint256 price) {
		yard[jid] = Junk(jid, msg.sender, description, price, false);
		jid++;
	}
	
	function buy(uint256 id){
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
		reputation.createTicket(junk.owner, msg.sender, id);
		
		// transfer ownership
		junk.owner = msg.sender;
	}
}

