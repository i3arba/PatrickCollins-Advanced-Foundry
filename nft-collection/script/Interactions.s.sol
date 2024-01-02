// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract MintBasicNFT is Script {
    string public constant stBernard =
        "ipfs://QmPh5YY9cEdVbGEUNCwqhRBXHQ2MGJdLCdGN5jcQLDLJMQ?filename=0-st-bernard.json";

    function run() external {
        mintNftOnContract(0x38683d894741451A71Ef0A6Ef9d68Fd36db91385);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNFT(contractAddress).mintNft(stBernard);
        vm.stopBroadcast();
    }
}
