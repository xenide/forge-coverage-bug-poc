// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.25 <0.9.0;

import { Test } from "forge-std/src/Test.sol";
import { console2 } from "forge-std/src/console2.sol";

import { Foo } from "../src/Foo.sol";

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
}

/// @dev If this is your first time with Forge, read this tutorial in the Foundry Book:
/// https://book.getfoundry.sh/forge/writing-tests
contract FooTest is Test {
    Foo internal foo;

    /// @dev A function invoked before each test case is run.
    function setUp() public virtual {
        // Instantiate the contract-under-test.
        foo = new Foo();
    }

    function testStorageAccesses() external {
        vm.record();
        foo.getMap(2);

        (bytes32[] memory lReadAccesses,) = vm.accesses(address(foo));
        assertEq(lReadAccesses.length, 1, "wrong num of read accesses");
    }
}
