const DTransport = artifacts.require('./DTransport.sol');

contract('DTransport', (accounts) => {
  it('should set admin the first account', () => DTransport.deployed().then(instance => instance.admin.call()).then((admin) => {
    assert.equal(admin, accounts[0], 'admin contract is not the account 1');
  }));

  it('should add a company', () => {
    let instance;
    const accountOne = accounts[0];
    const accountTwo = accounts[1];
    return DTransport.deployed().then((inst) => {
      instance = inst;
      return instance.addCompany(accountTwo, 'companyName', { from: accountOne });
    }).then(() => instance.companies.call(accountTwo, { from: accountOne })).then((company) => {
      assert.equal(company[0], 'companyName', 'Company name is not equal as created');
    });
  });
});
