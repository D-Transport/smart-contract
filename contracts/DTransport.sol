pragma solidity ^0.4.4;

/**
 * @title D-Transport
 * @author Victor Le <https://github.com/Coac>
 * @author Mathieu Porcel
 */
contract DTransport {

	struct Validation {
		uint id;
		uint location;
		uint time;
		uint vote;
		uint crypted1;
		uint crypted2;
		uint rndHash;
	}

	Validation[] public validations;

	function validate() {

	}

	function inspect() {

	}
}
