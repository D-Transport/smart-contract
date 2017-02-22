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
	}

	struct User {
		mapping (address => Authorization) authorizations;
		Validation[] validations;
		address addr; // Needed otherwise "Error: Internal type is not allowed for public state variables.""
	}

	address public admin;
	mapping(address => ValidationTerminal) public terminals;
	mapping(address => Company) public companies;
	mapping(address => User) public users;

	modifier onlyAdmin() {
		if (msg.sender != admin) throw;
		_;
	}

	function addTerminal (address terminal, uint location, address company) onlyAdmin {

	}

	function DTransport() {
		admin = msg.sender;
	}

	function validate(address terminal) {

	}

	function inspect() {

	}
}
