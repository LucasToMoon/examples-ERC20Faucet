async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const weiAmount = (await deployer.getBalance()).toString();
  console.log("Account balance:", (await ethers.utils.formatEther(weiAmount)));

  const Faucet = await ethers.getContractFactory("ERC20Faucet");
  const faucet = await Faucet.deploy("0x65aFADD39029741B3b8f0756952C74678c9cEC93");

  console.log("Faucet address:", faucet.address);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
});
