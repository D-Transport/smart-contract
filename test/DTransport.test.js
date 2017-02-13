var DTransport = artifacts.require("./DTransport.sol");

contract('DTransport', function(accounts) {
  it("should pass test WIP", function() {
    return DTransport.deployed().then(function(instance) {
      assert.equal(10000, 10000, "test WIP");
    });
  });
});
