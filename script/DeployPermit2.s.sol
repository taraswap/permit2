// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

import "forge-std/console2.sol";
import "forge-std/Script.sol";
import {Permit2} from "src/Permit2.sol";
import {CreateXScript} from "createx-forge/script/CreateXScript.sol";

bytes32 constant ORIGINAL_SALT = bytes32(uint256(0x0000000000000000000000000000000000000000d3af2663da51c10215000000));
address constant CREATEX_ADDRESS = 0xba5Ed099633D3B313e4D5F7bdc1305d3c28ba5Ed;

contract DeployPermit2 is Script, CreateXScript {
    function setUp() public {}

    function run() public returns (Permit2 permit2) {
        vm.startBroadcast();

        // Deploy using CreateX
        permit2 = Permit2(CreateX.deployCreate2(type(Permit2).creationCode));

        console2.log("Permit2 Deployed:", address(permit2));

        vm.stopBroadcast();
    }
}
