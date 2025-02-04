/**
 * This migration script is responsible for deploying the EnergyTrading smart contract.
 * The EnergyTrading contract is the core of the decentralized energy trading platform,
 * facilitating secure and transparent peer-to-peer transactions on the blockchain.
 */

// Import the compiled EnergyTrading contract artifact
const EnergyTrading = artifacts.require("EnergyTrading");

module.exports = async function (deployer) {
  /**
   * Deploying the EnergyTrading smart contract to the blockchain using the deployer object.
   * The deployment process ensures that the contract's bytecode is deployed and accessible
   * through its unique contract address.
   */
  await deployer.deploy(EnergyTrading);

  // Fetch the deployed contract instance for verification or further interaction
  const deployedContract = await EnergyTrading.deployed();

  console.log("Step 2: EnergyTrading smart contract deployed successfully.");
  console.log(`Contract Address: ${deployedContract.address}`);
  console.log(
    "Note: Use this contract address in your IoT integration and ZK-SNARK implementations."
  );
};
