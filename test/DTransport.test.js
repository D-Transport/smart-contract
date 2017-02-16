var DTransport = artifacts.require("./DTransport.sol");

contract('DTransport', function(accounts) {
  it("should set admin the first account", function() {
    return DTransport.deployed().then(function(instance) {
      return instance.admin.call();
    }).then(function(admin) {
      assert.equal(admin, accounts[0], "admin contract is not the account 1");
    });
  });
});
