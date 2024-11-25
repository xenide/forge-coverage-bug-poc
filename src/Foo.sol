// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.25;

struct S {
    bytes16 a;
    bytes16 b;
}

contract Foo {
    mapping(uint256 => S) public map;

    function getMap(uint256 index) external view returns (S memory) {
        return map[index];
    }
}
