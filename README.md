# Solidity Smart Contract: Sales Funnel Conversion Rates by Stage with Profit Splitting

> This ethereum/solidity smart contract allows to calculate the conversion of each stage of a sales funnel, performing a final profitability calculation with revenue splitting between you and an affiliate, based on the parameters introduced such as:

- initial audience
- conversion rates by stage (3 stages).
- sale value (Life-Time Value or price tag)
- affiliate fee

## Other details

## REMIX WORKSPACE

Remix default workspace is present when:
i. Remix loads for the very first time
ii. A new workspace is created with 'Default' template
iii. There are no files existing in the File Explorer

This workspace contains 3 directories:

1. 'contracts': Holds three contracts with increasing levels of complexity.
2. 'scripts': Contains four typescript files to deploy a contract. It is explained below.
3. 'tests': Contains one Solidity test file for 'Ballot' contract & one JS test file for 'Storage' contract.

#### Scripts

The 'scripts' folder has typescript files which help to deploy contracts using 'web3.js' and 'ethers.js' libraries.

#### Tests

In the 'tests' folder there is a script containing Mocha-Chai unit tests for 'Storage' contract.

To run a script, right click on file name in the file explorer and click 'Run'. Remember, Solidity file must already be compiled.
Output from script will appear in remix terminal.

Please note, require/import is supported in a limited manner for Remix supported modules.
For now, modules supported by Remix are ethers, web3, swarmgw, chai, multihashes, remix and hardhat only for hardhat.ethers object/plugin.
For unsupported modules, an error like this will be thrown: '<module_name> module require is not supported by Remix IDE' will be shown.
