/*
Reputation Contract
v 1.0

by Samuel Colbran
*/

contract Reputation {
	uint256 public tid = 0;
	mapping (address => mapping (uint256 => Ticket)) public services;

	struct Ticket {
		address provider;
		address consumer;
		bool signed; 		// A flag to see whether the consumer has signed this ticket
		int8 rating;		// Optional to represent satisfaction (eg +1 is positive, -1 is negative). Meaning is dependant on service. 
		string description; // Optional to describe the reason that this rating was given. 
	}
	
	// Creates a new unsigned ticket
	function createTicket(address provider, address consumer, uint256 tid) {
		//if (msg.value < 1) throw; // Tickets cost 1 ether [to pay for future gas costs]
		
		// Create the ticket
		services[msg.sender][tid] = Ticket(provider, consumer, false, 0, "");
	}
	
	// Signs a ticket
	function signTicket(address service, uint256 token, int8 rating, string description) {
		Ticket ticket = services[service][token];
		if (ticket.consumer != msg.sender) throw; // The consumer must sign the ticket
		if (ticket.signed) throw;
		ticket.signed = true;
		ticket.rating = rating;
		ticket.description = description;
	}	
}
