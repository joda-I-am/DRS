/*
Generated by Mix
Mon May 23 20:49:20 2016 GMT+1000
*/

var Junkyard = {
	"abi": "[{\"constant\":true,\"inputs\":[],\"name\":\"jid\",\"outputs\":[{\"name\":\"\",\"type\":\"uint256\"}],\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"description\",\"type\":\"string\"},{\"name\":\"price\",\"type\":\"uint256\"}],\"name\":\"createJunk\",\"outputs\":[{\"name\":\"\",\"type\":\"uint256\"}],\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"uint256\"}],\"name\":\"yard\",\"outputs\":[{\"name\":\"owner\",\"type\":\"address\"},{\"name\":\"description\",\"type\":\"string\"},{\"name\":\"price\",\"type\":\"uint256\"},{\"name\":\"sold\",\"type\":\"bool\"}],\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"id\",\"type\":\"uint256\"}],\"name\":\"buy\",\"outputs\":[{\"name\":\"token\",\"type\":\"uint256\"}],\"type\":\"function\"},{\"inputs\":[{\"name\":\"addr\",\"type\":\"address\"}],\"type\":\"constructor\"}]",
	"codeHex": "0x606060405260006001600050556040516020806106a6833981016040528080519060200190919050505b80600060006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908302179055505b50610642806100646000396000f360606040526000357c0100000000000000000000000000000000000000000000000000000000900480635509dd311461005a5780638af2e0551461007d578063a9f40712146100f0578063d96a094a146101c957610058565b005b6100676004805050610452565b6040518082815260200191505060405180910390f35b6100da6004808035906020019082018035906020019191908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509090919080359060200190919050506104c0565b6040518082815260200191505060405180910390f35b610106600480803590602001909190505061045b565b604051808573ffffffffffffffffffffffffffffffffffffffff168152602001806020018481526020018381526020018281038252858181546001816001161561010002031660029004815260200191508054600181600116156101000203166002900480156101b75780601f1061018c576101008083540402835291602001916101b7565b820191906000526020600020905b81548152906001019060200180831161019a57829003601f168201915b50509550505050505060405180910390f35b6101df60048080359060200190919050506101f5565b6040518082815260200191505060405180910390f35b600060006000600060026000506000868152602001908152602001600020600050925060018360030160009054906101000a900460ff16141561023757610002565b8260000160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff16141561029457610002565b82600201600050543410156102a857610002565b60019150813403905060018360030160006101000a81548160ff021916908302179055508260000160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16600082604051809050600060405180830381858888f1935050505050600060009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16638ac370fe8460000160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff163388604051847c0100000000000000000000000000000000000000000000000000000000028152600401808473ffffffffffffffffffffffffffffffffffffffff1681526020018373ffffffffffffffffffffffffffffffffffffffff16815260200182815260200193505050506020604051808303816000876161da5a03f115610002575050506040518051906020015093508350338360000160006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908302179055505b505050919050565b60016000505481565b60026000506020528060005260406000206000915090508060000160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff169080600101600050908060020160005054908060030160009054906101000a900460ff16905084565b6000608060405190810160405280338152602001848152602001838152602001600081526020015060026000506000600160005054815260200190815260200160002060005060008201518160000160006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908302179055506020820151816001016000509080519060200190828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f1061058c57805160ff19168380011785556105bd565b828001600101855582156105bd579182015b828111156105bc57825182600050559160200191906001019061059e565b5b5090506105e891906105ca565b808211156105e457600081815060009055506001016105ca565b5090565b50506040820151816002016000505560608201518160030160006101000a81548160ff021916908302179055509050506001600081815054809291906001019190505550600160016000505403905061063c565b9291505056",
	"name": "Junkyard"
}

var Reputation = {
	"abi": "[{\"constant\":true,\"inputs\":[],\"name\":\"tid\",\"outputs\":[{\"name\":\"\",\"type\":\"uint256\"}],\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"provider\",\"type\":\"address\"},{\"name\":\"consumer\",\"type\":\"address\"},{\"name\":\"tid\",\"type\":\"uint256\"}],\"name\":\"createTicket\",\"outputs\":[{\"name\":\"token\",\"type\":\"uint256\"}],\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"},{\"name\":\"\",\"type\":\"uint256\"}],\"name\":\"services\",\"outputs\":[{\"name\":\"provider\",\"type\":\"address\"},{\"name\":\"consumer\",\"type\":\"address\"},{\"name\":\"tid\",\"type\":\"uint256\"},{\"name\":\"signed\",\"type\":\"bool\"}],\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"service\",\"type\":\"address\"},{\"name\":\"token\",\"type\":\"uint256\"}],\"name\":\"signTicket\",\"outputs\":[],\"type\":\"function\"},{\"inputs\":[],\"type\":\"constructor\"}]",
	"codeHex": "0x606060405260006000600050555b5b6103e58061001c6000396000f360606040526000357c010000000000000000000000000000000000000000000000000000000090048063843712311461005a5780638ac370fe1461007d578063c134f17e146100bb578063c4af0fcf1461013157610058565b005b61006760048050506103dc565b6040518082815260200191505060405180910390f35b6100a560048080359060200190919080359060200190919080359060200190919050506102c7565b6040518082815260200191505060405180910390f35b6100da6004808035906020019091908035906020019091905050610234565b604051808573ffffffffffffffffffffffffffffffffffffffff1681526020018473ffffffffffffffffffffffffffffffffffffffff16815260200183815260200182815260200194505050505060405180910390f35b6101506004808035906020019091908035906020019091905050610152565b005b6000600160005060008473ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600050600083815260200190815260200160002060005090503373ffffffffffffffffffffffffffffffffffffffff168160010160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff161415156101f757610002565b8060030160009054906101000a900460ff161561021357610002565b60018160030160006101000a81548160ff021916908302179055505b505050565b6001600050602052816000526040600020600050602052806000526040600020600091509150508060000160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff16908060010160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff16908060020160005054908060030160009054906101000a900460ff16905084565b60006080604051908101604052808581526020018481526020018381526020016000815260200150600160005060003373ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600050600084815260200190815260200160002060005060008201518160000160006101000a81548173ffffffffffffffffffffffffffffffffffffffff0219169083021790555060208201518160010160006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908302179055506040820151816002016000505560608201518160030160006101000a81548160ff0219169083021790555090505081806001019250506001820390506103d5565b9392505050565b6000600050548156",
	"name": "Reputation"
}

