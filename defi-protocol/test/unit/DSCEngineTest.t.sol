// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployDSC} from "../../script/DeployDSC.s.sol";
import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
import {DSCEngine} from "../../src/DSCEngine.sol";
import {HelperConfig} from "../../script/HelperConfig.s.sol";
import {ERC20Mock} from "@openzeppelin/contracts/mocks/token/ERC20Mock.sol";

contract DSCEngineTest is Test{
    DeployDSC deployer;
    DecentralizedStableCoin dsc;
    DSCEngine engine;
    HelperConfig config;
    address ethUsdPriceFeed;
    address wEth;
    address btcUsdPriceFeed;
    address wBtc;

    address public USER = makeAddr("user");
    uint256 public constant AMOUNT_COLLATERAL = 10 ether;
    uint256 public constant STARTING_ERC20_BALANCE = 10 ether;
    
    function setUp() public {
        deployer = new DeployDSC();
        (dsc, engine, config) = deployer.run();
        (ethUsdPriceFeed, btcUsdPriceFeed , wEth, wBtc,) = config.activNetworkConfig();

        ERC20Mock(wEth).mint(USER, STARTING_ERC20_BALANCE);
        ERC20Mock(wBtc).mint(USER, STARTING_ERC20_BALANCE);
    }

    ////////////////////
    //Constructor TEST 
    ////////////////////
    address[] public tokenAddresses;
    address[] public priceFeedAddresses;
    function testRevertsIfTokenLengthDoenstMatchPriceFeeds() public {
        tokenAddresses.push(wEth);
        priceFeedAddresses.push(ethUsdPriceFeed);
        priceFeedAddresses.push(btcUsdPriceFeed);

        vm.expectRevert(DSCEngine.DSCEngine__TokenAddressesAndPriceFeedAddressesMustBeSameLength.selector);
        new DSCEngine(tokenAddresses, priceFeedAddresses, address(dsc));
    }

    //////////////
    //PRICE TEST 
    //////////////
    function testGetUsdValue() public {
        uint256 ethAmount = 15e18;
        // 15e18 * 2000/ETH = 30,000e18;
        uint256 expectedUsd = 30000e18;
        uint256 actualUsd = engine.getUsdValue(wEth, ethAmount);
        assertEq(expectedUsd, actualUsd);
    }

    function testGetTokenAmountFromUsd() public {
        uint256 usdAmount = 100 ether;
        uint256 expectedWEth = 0.05 ether;
        uint256 actualWEth = engine.getTokenAmountFromUsd(wEth, usdAmount);
        assertEq(expectedWEth, actualWEth);
    }
    
    ////////////////////////////
    //HEALTH FACTOR TEST
    ///////////////////////////
    
    /////////////////////////////////////////////////////////////// 
    // function _revertIfHealthFactorIsBroken(address user) internal view {
    //     //1. Check health factor: do they have enough collateral
    //     //2. Revert if they don't have a good health factor
    //     uint256 userHealthFactor = _healthFactor(user);
    //     if(userHealthFactor < MIN_HEALTH_FACTOR){
    //         revert DSCEngine__BreaksHealthFactor(userHealthFactor);
    //     }
    // }
    ///////////////////////////////////////////////////////////////

    function testRevertIfHealFactorIsBroken() public {
        
    }
    
    ////////////////////////////
    //COLLATERAL VALUE TEST
    ///////////////////////////
    function testGetAccountCollateralValueWithZeroCollateral() public {

        uint256 actualValue = engine.getAccountCollateralValue(USER);
        uint256 expectedValue = 0;

        assertEq(actualValue, expectedValue);
    }

    function testGetTotalValueOfCollateralDeposited(address user) public depositedCollateral{
        uint256 totalValueInUsd = engine.getAccountCollateralValue(USER);
        uint256 expectedValue = 20_000e18;

        console.log(totalValueInUsd);
        console.log(AMOUNT_COLLATERAL);

        assertEq(totalValueInUsd, expectedValue);
    }

    ////////////////////////////
    //DEPOSIT COLLATERAL TEST
    ///////////////////////////

    function testRevertsIfCollateralZero() public {
        vm.startPrank(USER);
        ERC20Mock(wEth).approve(address(engine), AMOUNT_COLLATERAL);

        vm.expectRevert(DSCEngine.DSCEngine__NeedsMoreThanZero.selector);
        engine.depositCollateral(wEth,0);
        vm.stopPrank();
    }

    function testRevertsWithUnapprovedCollateral() public {
        ERC20Mock ranToken = new ERC20Mock();
        ranToken.mint(USER, STARTING_ERC20_BALANCE);
        vm.startPrank(USER);
        
        vm.expectRevert(DSCEngine.DSCEngine__NotAllowedToken.selector);
        engine.depositCollateral(address(ranToken), AMOUNT_COLLATERAL);

        vm.stopPrank();
    }

    modifier depositedCollateral() {
        vm.startPrank(USER);
        ERC20Mock(wEth).approve(address(engine), AMOUNT_COLLATERAL);
        engine.depositCollateral(wEth, AMOUNT_COLLATERAL);
        vm.stopPrank();
        _;
    }

    function testCanDepositCollateralAndGetAccountInfo() public depositedCollateral{
        (uint256 totalDscMinted, uint256 collateralValueInUsd) = engine.getAccountInformation(USER);

        uint256 expectedTotalDscMinted = 0;
        uint256 expectedDepositAmount = engine.getTokenAmountFromUsd(wEth, collateralValueInUsd);

        assertEq(totalDscMinted, expectedTotalDscMinted);
        assertEq(AMOUNT_COLLATERAL, expectedDepositAmount);
    }

    function testAccountCollateralValueDeposited() public depositedCollateral{
        uint256 totalCollateralValueInUsd = engine.getCollateralDeposited(USER);

        assertEq(totalCollateralValueInUsd, AMOUNT_COLLATERAL);
    }
}