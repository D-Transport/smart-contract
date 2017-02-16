const DTransport = artifacts.require('./DTransport.sol');

contract('DTransport', (accounts) => {
  it('should set admin the first account', () => DTransport.deployed().then(instance => instance.admin.call()).then((admin) => {
    assert.equal(admin, accounts[0], 'admin contract is not the account 1');
  }));
});
