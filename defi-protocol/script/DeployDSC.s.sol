// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DecentralizedStableCoin} from "../src/DecentralizedStableCoin.sol";
import {DSCEngine} from "../src/DSCEngine.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployDSC is Script{
    address[] public tokenAddresses;
    address[] public priceFeedAddresses;

    function run() external returns(DecentralizedStableCoin, DSCEngine, HelperConfig){
        HelperConfig config = new HelperConfig();

        (address wEthUsdPriceFeed, address wBtcPriceFeed, address wEth, address wBtc, uint256 deployerKey) = config.activNetworkConfig();

        tokenAddresses = [wEth, wBtc];
        priceFeedAddresses = [wEthUsdPriceFeed, wBtcPriceFeed];

        vm.startBroadcast(deployerKey);
        
        DecentralizedStableCoin dsc = new DecentralizedStableCoin(address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266));
        DSCEngine engine = new DSCEngine(tokenAddresses, priceFeedAddresses, address(dsc));

        dsc.transferOwnership(address(engine));

        vm.stopBroadcast();

        return (dsc, engine, config);
    }


}