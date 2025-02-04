/**
 * This migration script is the foundation for deploying the "Migrations" contract.
 * The "Migrations" contract tracks the progress of contract deployments on the blockchain.
 * This script is essential for managing and versioning multiple migrations, ensuring
 * that each migration step is executed in sequence and avoiding re-deployment of previously deployed contracts.
 */

// Importing the compiled "Migrations" contract artifact
const Migrations = artifacts.require("Migrations");

module.exports = function (deployer) {
  /**
   * Using the deployer object, we deploy the "Migrations" contract to the blockchain.
   * The deployer ensures that the deployment process is handled asynchronously,
   * tracking the state of the migration to prevent redundant operations in future steps.
   */
  deployer.deploy(Migrations);

  console.log("Step 1: Migrations contract deployed successfully.");
  console.log(
    "Note: The Migrations contract is a utility contract, ensuring all subsequent migrations are tracked properly."
  );
};
