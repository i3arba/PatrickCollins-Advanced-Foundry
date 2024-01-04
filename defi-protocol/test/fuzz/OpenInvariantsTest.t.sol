// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.18;

// // Have our invariant aka properties

// // What are our invariants?

// // 1. The total supply of DSC should be less than the total value of collateral

// // 2. Getter view functions should never revert <- evergreen invariant

// import {Test} from "forge-std/Test.sol";
// import {StdInvariant} from "forge-std/StdInvariant.sol";
// import {DeployDSC} from "../../script/DeployDSC.s.sol";
// import {DSCEngine} from "../../src/DSCEngine.sol";
// import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
// import {HelperConfig} from "../../script/HelperConfig.s.sol";
// import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// contract OpenInvariantsTest is StdInvariant, Test{
//     DeployDSC deployer;
//     DSCEngine dsce;
//     DecentralizedStableCoin dsc;
//     HelperConfig config;
//     address wEth;
//     address wBtc;

//     function setUp() external{
//         deployer = new DeployDSC();
//         (dsc, dsce, config) = deployer.run();
//         (,, wEth, wBtc,) = config.activeNetworkConfig();
//         targetContract(address(dsce));
//     }

//     function invariant_protocolMustHaveMoreValueThanTotalSuply() public view{
//         //get the value of the all the collateral in the protocol
//         // compare it to all the debt(dsc)
//         uint256 totalSupply = dsc.totalSupply();
//         uint256 totalWEthDeposited = IERC20(wEth).balanceOf(address(dsce));
//         uint256 totalWBtcDeposited = IERC20(wBtc).balanceOf(address(dsce));

//         uint256 wEthValue = dsce.getUsdValue(wEth, totalWEthDeposited);
//         uint256 wBtcValue = dsce.getUsdValue(wBtc, totalWBtcDeposited);

//         assert(wEthValue + wBtcValue >= totalSupply);
//     }
// }