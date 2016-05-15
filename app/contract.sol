contract Reputation {
	function Reputation() {
		//maxRep = 10;
		reputation[msg.sender] = 10;
	}
	function changeReputation(address instigator, address target, int256 _value) returns(bool successful){
        // ratings[_key] will be 0 if it is not defined
		if (target == instigator) {
			return;
		}
		int256 currentSum = 0;
		if (reputation[target] + reputation[instigator] < 0) {
			reputation[target] = 0;
		} else {
			reputation[target] += reputation[instigator];
		}
    }
    mapping (address => int256) public reputation;
	//int256 maxRep;
}