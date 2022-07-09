import { ethers, run } from "hardhat";

async function main() {
  const Token = await ethers.getContractFactory("Token");
  const token = await Token.deploy(
    "LP Token",
    "LP",
    ethers.utils.parseEther("10000")
  );

  try {
    console.log("Verifying Token...");
    await run("verify:verify", {
      address: token.address,
      contract: "contracts/Token.sol:Token",
      constructorArguments: [token.address],
    });
  } catch (e: any) {
    console.error(e.message);
  }

  console.log("Token deployed to: ", token.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => {
    console.log("Deployed all contracts...");
    process.exit(0);
  })
  .catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
