pragma solidity ^0.4.4;

/**
 * @title D-Transport
 * @author Victor Le <https://github.com/Coac>
 * @author Mathieu Porcel <https://github.com/mathieu-porcel>
 */
contract DTransport {

	/**
	 * Transport company which provides validation terminal
	 */
	struct Company {
		uint creationDate;
		string name;
		string location;
	}

	/**
	 * Validation terminal used to validate "ticket"
	 */
	struct ValidationTerminal {
		uint creationDate;
		uint location;
		address company;
	}

	/**
	 * "Ticket" validation
	 */
	struct Validation {
		uint date;
		address terminal;
	}

	/**
	 * Authorization given by a terminal to a user to validate
	 */
	struct Authorization {
		uint expiration;
	}

	/**
	 * User who uses the transport service
	 */
	struct User {
		uint creationDate;
		uint validationCount;
		mapping (uint => Validation) validations;
		mapping (address => Authorization) authorizations;
	}

	/**
	 * Admin is the one who created the contract
	 * He is the only one able to add companies
	 * The admin can be changed in the future
	 */
	address public admin;

	modifier onlyAdmin() {
		if (msg.sender != admin) throw;
		_;
	}

	mapping(address => ValidationTerminal) public terminals;
	mapping(address => Company) public companies;
	mapping(address => User) public users;

	function DTransport() {
		admin = msg.sender;
	}


	/**
	 * @notice Add a transport company to the system
	 * @param company the company ethereum address
	 * @param name the company name
	 */
	function addCompany (address company, string name) onlyAdmin {
		companies[company] = Company({
				creationDate: now,
        name: name,
				location: 'location'
    });
	}

	/**
	 * @notice Add a terminal to the system
	 * @param terminal the terminal ethereum address
	 * @param location the terminal location
	 * @param company the company which own the terminal ethereum address
	 */
	function addTerminal (address terminal, uint location, address company) {
		terminals[terminal] = ValidationTerminal({
				creationDate: now,
        company: company,
				location: location
    });
	}

	/**
	 * @notice Used by an User to validate to a terminal
	 * @dev Checks if the the user is authorized then create the entry
	 * @param terminal the terminal ethereum address
	 */
	function validate(address terminal) {

	}

	/**
	 * @notice Used by an Terminal to give an User authorization to validate
	 * @param userAddr the user ethereum address
	 */
	function giveAuthorization (address userAddr) {
		users[userAddr].authorizations[msg.sender] = Authorization(now);
	}

	/**
	 * @notice Register as an User
	 */
	function register() {
		users[msg.sender] = User(now, 0);
	}

	/**
	 * @notice Get authorization date from user given by a terminal
	 * @param user the user ethereum address
	 * @param terminal the terminal ethereum address
	 * @return date
	 */
	function getAuthorizationDate(address user, address terminal) returns (uint) {
		return users[user].authorizations[terminal].expiration;
	}

}
