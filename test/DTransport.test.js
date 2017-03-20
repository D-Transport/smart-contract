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
      assert.equal(company[1].toString(), 'companyName', 'Company name is not equal as created');
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

  it('should add a Terminal', () => {
    let instance;
    const adminAddress = accounts[0];
    const terminalAddress = accounts[1];
    const companyAddress = accounts[2];
    return DTransport.deployed().then((inst) => {
      instance = inst;
      return instance.addTerminal(terminalAddress, 12, companyAddress, { from: adminAddress });
    }).then(() => {
      return instance.terminals.call(terminalAddress, { from: adminAddress });
    }).then((terminal) => {
      assert.equal(terminal[1].toNumber(), 12, 'Location is not equal as created');
      assert.equal(terminal[2], companyAddress, 'Company address is not equal as created');
    });
  });

  it('should register an user', () => {
    let instance;
    const user = accounts[0];
    return DTransport.deployed().then((inst) => {
      instance = inst;
      return instance.register({ from: user });
    }).then(() => {
      return instance.users.call(user, { from: user });
    }).then((returnedUser) => {
      assert.isNotNull(returnedUser, 'Return user is null');
    });
  });

  it('should give authorization', () => {
    let instance;
    const user = accounts[0];
    const terminal = accounts[1];
    return DTransport.deployed().then((inst) => {
      instance = inst;
      return instance.register({ from: user });
    }).then(() => {
      return instance.giveAuthorization(user, { from: terminal });
    }).then(() => {
      return instance.getAuthorizationDate.call(user, terminal, { from: user });
    }).then((timestamp) => {
      assert.isNotNull(timestamp.toNumber(), 'timestamp is not null');
    });
  });
});
