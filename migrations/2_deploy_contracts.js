const NateToken = artifacts.require("nateToken");

module.exports = function (deployer) {
  deployer.deploy(NateToken);
};

