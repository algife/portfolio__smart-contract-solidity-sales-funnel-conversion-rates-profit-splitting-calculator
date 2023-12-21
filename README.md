# Solidity Smart Contract: Sales Funnel Conversion Rates by Stage with Profit Splitting

This ethereum/solidity smart contract allows to calculate the conversion of each stage of a sales funnel, performing a final profitability calculation with revenue splitting between you and an affiliate.

> It is a demo smart contract for the portfolio.

Some customizable parameters to make the calculation are:

- initial audience
- sale value (Life-Time Value or price tag)
- conversion rates by stage (3 stages) -- _scaled to 1000_
- affiliate fee -- _scaled to 1000_

Some numeric values are **scaled to 1000** to operate with them due to the fact that solidity doesn't supports fixed numeric types in this version.

## Showcase

![Loading...](https://github.com/algife/portfolio__smart-contract-solidity-sales-funnel-conversion-rates-profit-splitting-calculator/blob/main/showcase.gif)

## Workspace

> Developed using REMIX IDE.

This workspace contains the following directories:

1. 'contracts': Holds three contracts with increasing levels of complexity.
2. 'scripts': Contains typescript files to deploy contracts using 'web3.js' and 'ethers.js' libraries..
