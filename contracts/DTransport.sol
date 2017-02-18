pragma solidity ^0.4.4;

/**
 * @title D-Transport
 * @author Victor Le <https://github.com/Coac>
 * @author Mathieu Porcel <https://github.com/mathieu-porcel>
 */
contract DTransport {

	struct Company {
		string name;
	}

	struct ValidationTerminal {
		uint location;
		address company;
	}

	struct Validation {
		uint date;
		address terminal;
	}

	struct Authorization {
		uint expiration;
		address terminal;
	}

	struct User {
		//mapping (uint => Authorization) authorizations;
		//Permission permission;
		address WIP;
	}

	address public admin;
	mapping(address => ValidationTerminal) public terminals;
	mapping(address => Company) public companies;
	mapping(address => User) public users;

	function DTransport() {
		admin = msg.sender;
	}

	function validate(address terminal) {

	}

	function inspect() {

	}
}
