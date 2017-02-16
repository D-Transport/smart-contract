const DTransport = artifacts.require('./DTransport.sol');

module.exports = function deploy(deployer) {
  deployer.deploy(DTransport);
};
