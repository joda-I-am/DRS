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
		bool signed; // A flag to see whether the consumer has signed this ticket
	}
	
	// Creates a new unsigned ticket
	function createTicket(address provider, address consumer, uint256 tid) {
		//if (msg.value < 1) throw; // Tickets cost 1 ether [to pay for future gas costs]
		
		// Create the ticket
		services[msg.sender][tid] = Ticket(provider, consumer, false);
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
