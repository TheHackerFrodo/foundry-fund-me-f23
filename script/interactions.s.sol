// SPDX-Licenese-Identifie: MIT

pragma solidity ^0.8.18;

import {Script, console} from "lib/forge-std/scripts";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundFundMe is script {
    function fundFundMe(address mostRecentlyDeployed) public{
        vm.startBroadcaast();
        FundMe(mostRecentlyDeployed).fund{value: SEND_VALUE}();
        vm.stopBroadcast();
        console.log("Funded FundMe with %s" SEND_VALUE);
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "FundeMe",
            block.chainid
            );
            fundFundMe(mostRecentlyDeployed);
    }
} 