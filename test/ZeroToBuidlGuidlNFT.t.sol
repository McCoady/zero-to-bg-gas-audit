// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import {Test, console2} from "forge-std/Test.sol";
import {ZeroToBuidlGuidlNFT} from "../src/ZeroToBuidlGuidlNFT.sol";
import {ZeroToBuidlGuidlNFTGassed} from "../src/ZeroToBuidlGuidlNFTGassed.sol";
import {ZeroToBuidlGuidlNFTMintInfo} from "../src/ZeroToBuidlGuidlNFTMintInfo.sol";

enum Theme {
    DARK,
    LIGHT
}

contract ZeroToBuidlGuidlNFTTest is Test {
    ZeroToBuidlGuidlNFT public nft;

    address public alice = makeAddr("alice");
    address public bob = makeAddr("bob");

    function setUp() public {
        nft = new ZeroToBuidlGuidlNFT(address(0));
        vm.deal(alice, 10 ether);
        vm.deal(bob, 10 ether);
    }

    function testMint() public {
        vm.startPrank(alice, alice);
        nft.mintNft{value: 0.1 ether}();
        assertEq(nft.ownerOf(0), alice);
        nft.mintNft{value: 0.1 ether}();
        vm.stopPrank();
        vm.startPrank(bob, bob);
        for (uint256 i; i < 10; ++i) {
            nft.mintNft{value: 0.1 ether}();
        }
    }

    function testThemeSwitch() public {
        vm.startPrank(alice,alice);
        nft.mintNft{value: 0.1 ether}();
        nft.switchTheme(0);
        nft.switchTheme(0);
        // uint256 theme = nft.getThemeInfo(0);
        // assertEq(theme, 1);
    }
}
