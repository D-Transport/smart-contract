const DTransport = artifacts.require("./DTransport.sol");

module.exports = function(deployer) {
  deployer.deploy(DTransport);
};
