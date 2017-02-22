const DTransport = artifacts.require('./DTransport.sol');

contract('DTransport', (accounts) => {
  it('should set admin the first account', () => {
    return DTransport.deployed().then((instance) => {
      return instance.admin.call();
    }).then((admin) => {
      assert.equal(admin, accounts[0], 'admin contract is not the account 1');
    });
  });

  it('should add a company', () => {
    let instance;
    const accountOne = accounts[0];
    const accountTwo = accounts[1];
    return DTransport.deployed().then((inst) => {
      instance = inst;
      return instance.addCompany(accountTwo, 'companyName', { from: accountOne });
    }).then(() => {
      return instance.companies.call(accountTwo, { from: accountOne });
    }).then((company) => {
      assert.equal(company[0], 'companyName', 'Company name is not equal as created');
    });
  });

  it('should throw error when being not admin and adding a company', () => {
    const accountOne = accounts[0];
    const accountTwo = accounts[1];
    return DTransport.deployed().then((instance) => {
      return instance.addCompany(accountOne, 'companyName', { from: accountTwo });
    }).catch((e) => {
      assert.isDefined(e, 'transaction should have thrown');
    });
  });
});
