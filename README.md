# Advanced Foundry Course - Patrick Collins [Cyfrin]
## Blockchain Developer, Smart Contract, & Solidity Career Path - Powered By AI - Beginner to Expert Course | Foundry Edition 2023

## My Opinion About the Course
I know that README's don't have this purpose, but I must say: </br>
This is, by far, the greatest course I've ever taken and I truly encourage you to take it too.

I finished in a week. Collins made me feel embarrassed in every single video but in a good way. I've just finished and still haven't practiced as I should, but I'm already feeling 1e18x better than I was before started it.

Trust me, I have a real beard. I can't lie to you. You can access [here](https://updraft.cyfrin.io/courses/advanced-foundry/).

#

### Table of Contents

<details>
<summary>
<a href="#lesson-10-foundry-erc20s">Lesson 10: Foundry ERC20s</a>
</summary>
<ol>
    <li><a href="#what-is-an-erc-what-is-an-eip">What is an ERC? What is an EIP?</a></li>
    <li><a href="#what-is-an-erc20">What is an ERC20?</a></li>
    <li><a href="#manually-creating-an-erc20-token">Manually Creating an ERC20 Token</a></li>
    <li><a href="#erc20-token---openzeppelin">ERC20 Token - Openzeppelin</a></li>
    <li><a href="#deploy-script">Deploy Script</a></li>
    <li><a href="#ai-tests">AI Tests</a></li>
</ol>
</details>
<details>
<summary>
<a href="#lesson-11-foundry-nfts--moodnft">Lesson 11: Foundry NFTs | MoodNFT</a>
</summary>
  <ol>
    <li><a href="#introduction-7">Introduction</a></li>
    <li><a href="#what-is-an-nft">What is an NFT?</a></li>
    <li><a href="#foundry-setup-1">Foundry Setup</a></li>
    <li><a href="#ipfs">IPFS</a></li>
    <li><a href="#using-ipfs">Using IPFS</a></li>
    <li><a href="#basic-nft-deploy-script">Basic NFT: Deploy Script</a></li>
    <li><a href="#basic-nft-tests">Basic NFT: Tests</a></li>
    <li><a href="#basic-nft-interactions">Basic NFT: Interactions</a></li>
    <li><a href="#basic-nft-testnet-demo">Basic NFT: Testnet Demo</a></li>
    <li><a href="#the-issue-with-ipfs--https-tokenuri-nfts">The issue with IPFS & HTTPS TokenURI NFTs</a></li>
    <li><a href="#what-is-an-svg">What is an SVG?</a></li>
    <li><a href="#svg-nft-introduction">SVG NFT: Introduction</a></li>
    <li><a href="#svg-nft-encoding-the-nft">SVG NFT: Encoding the NFT</a></li>
    <li><a href="#svg-nft-flipping-the-mood">SVG NFT: Flipping the mood</a></li>
    <li><a href="#svg-nft-deploy-script">SVG NFT: Deploy Script</a></li>
    <li><a href="#svg-nft-debugging-practice--some-notes">SVG NFT: Debugging practice & some notes</a></li>
    <li><a href="#svg-nft-anvil-demo">SVG NFT: Anvil Demo</a></li>
    <li><a href="#advanced-evm-opcodes-encoding-and-calling">Advanced: EVM Opcodes, Encoding, and Calling</a>
      <ul>
        <li><a href="#abiencode--abiencodepacked">abi.encode & abi.encodePacked</a></li>
        <li><a href="#introduction-to-encoding-function-calls-directly">Introduction to Encoding Function Calls Directly</a></li>
        <li><a href="#introduction-to-encoding-function-calls-recap">Introduction to Encoding Function Calls Recap</a></li>
        <li><a href="#encoding-function-calls-directly">Encoding Function Calls Directly</a></li>
      </ul>
    </li>
    <li><a href="#verifying-metamask-transactions">Verifying Metamask Transactions</a></li>
    <li><a href="#filecoin--arweave">Filecoin & Arweave</a></li>
</ol>
</details>

<details>
<summary>
<a href="#lesson-12-foundry-defi--stablecoin-the-pinnacle-project-get-here">Lesson 12: Foundry DeFi | Stablecoin (The PINNACLE PROJECT!! GET HERE!)</a>
</summary>
<ol>
    <li><a href="#what-is-defi">What is DeFi?</a></li>
    <li><a href="#code-walkthrough">Code Walkthrough</a></li>
    <li><a href="#what-is-a-stablecoin-but-actually">What is a stablecoin (But actually)</a></li>
    <li><a href="#decentralizedstablecoinsol">DecentralizedStableCoin.sol</a></li>
    <li><a href="#dscenginesol-setup">DSCEngine.sol Setup</a></li>
    <li><a href="#deposit-collateral">Deposit Collateral</a></li>
    <li><a href="#mint-dsc">Mint DSC</a>
      <ul>
        <li><a href="#getting-the-value-of-our-collateral">Getting the value of our collateral</a></li>
        <li><a href="#health-factor">Health Factor</a></li>
        <li><a href="#minting-the-dsc">Minting the DSC</a></li>
      </ul>
    </li>
    <li><a href="#testing-while-developing">Testing while developing</a>
      <ul>
        <li><a href="#deploy-script-1">Deploy Script</a></li>
        <li><a href="#tests-1">Tests</a></li>
      </ul>
    </li>
    <li><a href="#depositcollateralandmintdsc">depositCollateralAndMintDsc</a></li>
    <li><a href="#redeemcollateral">redeemCollateral</a></li>
    <li><a href="#liquidate">Liquidate</a>
      <ul>
        <li><a href="#setup-3">Setup</a></li>
        <li><a href="#refactoring">Refactoring</a></li>
      </ul>
    </li>
    <li><a href="#leveling-up-your-testing-skillz">Leveling up your testing skillz</a></li>
    <li><a href="#challenge-code-coverage-above-80-for-dscenginesol">Challenge: Code coverage above 80% for DSCEngine.sol</a></li>
    <li><a href="#fuzz-invariant-testing">Fuzz (Invariant) Testing</a></li>
    <li><a href="#open-based-fuzz-tests">Open-based Fuzz tests</a></li>
    <li><a href="#handler-based-fuzz-tests">Handler-based Fuzz tests</a>
      <ul>
        <li><a href="#revert_on_fail--true">revert_on_fail = true</a></li>
        <li><a href="#redeeming-collateral">Redeeming Collateral</a></li>
        <li><a href="#minting-dsc">Minting DSC</a></li>
        <li><a href="#debuggin-fuzz-tests">Debuggin Fuzz Tests</a></li>
        <li><a href="#challenge-find-out-why-mintdsc-is-never-being-called-on-our-handlersol">Challenge: Find out why `mintDsc` is never being called on our Handler.sol</a></li>
      </ul>
    </li>
    <li><a href="#price-feed-handling">Price Feed Handling</a></li>
    <li><a href="#oraclelib">OracleLib</a></li>
    <li><a href="#note-on-audit-preparedness">Note on audit preparedness</a></li>
    <li><a href="#recap-3">Recap</a></li>
    <li><a href="#lens-protocol">Lens Protocol</a></li>
      <ul>
        <li><a href="#more-defi-learnings">More DeFi Learnings:</a></li>
      </ul>
</ol>
</details>

<details>
<summary>
<a href="#lesson-13-foundry-upgrades">Lesson 13: Foundry Upgrades</a>
</summary>
<ol>
    <li><a href="#upgradable-smart-contracts-overview">Upgradable Smart Contracts Overview</a></li>
    <li><a href="#types-of-upgrades">Types of Upgrades</a></li>
    <li><a href="#delegatecall">Delegatecall</a></li>
    <li><a href="#small-proxy-example">Small Proxy Example</a></li>
    <li><a href="#universal-upgradable-smart-contract">Universal Upgradable Smart Contract</a>
      <ul>
        <li><a href="#setup-4">Setup</a></li>
        <li><a href="#initializer">Initializer</a></li>
        <li><a href="#deploy">Deploy</a></li>
        <li><a href="#upgradebox">UpgradeBox</a></li>
        <li><a href="#test--demo">Test / Demo</a></li>
      </ul>
    </li>
    <li><a href="#testnet-demo-1">Testnet Demo</a></li>
</ol>
</details>
<details>
<summary>
<a href="#lesson-14-foundry-dao--governance">Lesson 14: Foundry DAO / Governance</a>
</summary>
  <ol>
    <li><a href="#introduction-8">Introduction</a></li>
    <li><a href="#what-is-a-dao">What is a DAO?</a></li>
    <li><a href="#how-to-build-a-dao">How to build a DAO</a>
      <ul>
        <li><a href="#setup-5">Setup</a></li>
        <li><a href="#governance-token">Governance Token</a></li>
        <li><a href="#governor">Governor</a></li>
        <li><a href="#tests-2">Tests</a></li>
      </ul>
    </li>
    <li><a href="#wrap-up">Wrap up</a></li>
    <li><a href="#bonus-gas-optimization-tips">Bonus: Gas optimization tips</a></li>
  </ol>
</details>
<details>
<summary>
<a href="#lesson-15-smart-contract-security--auditing-for-developers">Lesson 15: Smart Contract Security & Auditing (For developers)</a>
</summary>
  <ol>
    <li><a href="#introduction-9">Introduction</a></li>
    <li><a href="#what-is-a-smart-contract-audit">What is a smart contract audit?</a></li>
    <li><a href="#tools">Tools</a>
      <ul>
        <li><a href="#manual-review">Manual Review</a></li>
        <li><a href="#static-analysis">Static Analysis</a></li>
        <li><a href="#dynamic-analysis">Dynamic Analysis</a></li>
        <li><a href="#formal-verification">Formal Verification</a></li>
        <li><a href="#symbolic-execution">Symbolic Execution</a></li>
        <li><a href="#fuzzing">Fuzzing</a></li>
        <li><a href="#formal-verification--symbolic-execution">Formal Verification (& Symbolic Execution)</a></li>
        <li><a href="#other-security-stuff">Other security stuff</a></li>
      </ul>
    </li>
    <li><a href="#what-does-the-process-of-manual-review-look-like">What does the process of manual review look like?</a></li>
    <li><a href="#formal-verification">Formal Verification</a></li>
    <li><a href="#closing-thoughts">Closing Thoughts</a></li>
  </ol>
</details>
