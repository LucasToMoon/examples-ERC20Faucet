# Shell

Try running some of the following tasks:

```shell
npm i hardhat

npm install @nomiclabs/hardhat-etherscan \
@nomiclabs/hardhat-ethers \
@nomiclabs/hardhat-waffle \
dotenv

npm install @openzeppelin/contracts

npx hardhat

npx hardhat run scripts/deploy.js --network goerli

npx hardhat verify \
--contract "contracts/ERC20Faucet.sol:ERC20Faucet" \
--network goerli 0x271A57b322bC8c94938eD7eF4993a2918E579E50 "0x65aFADD39029741B3b8f0756952C74678c9cEC93"
```
