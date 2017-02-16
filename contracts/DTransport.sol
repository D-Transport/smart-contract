pragma solidity ^0.4.4;

/**
 * @title D-Transport
 * @author Victor Le <https://github.com/Coac>
 * @author Mathieu Porcel <https://github.com/mathieu-porcel>
 */
contract DTransport {

	struct ValidationTerminal {
		uint id;
		uint location;
	}

	struct Validation {
		uint id;
		uint location;
		uint time;
		uint vote;
		uint crypted1;
		uint crypted2;
		uint rndHash;
	}

	address public admin;

	Validation[] public validations;

	mapping(address => ValidationTerminal) public terminals;

	function DTransport() {
		admin = msg.sender;
	}

	function validate(address terminal) {

	}

	function inspect() {

	}
}
