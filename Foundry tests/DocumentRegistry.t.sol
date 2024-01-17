// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import "Donable-Solidity/Donable.sol";
import "../src/DocumentRegistry.sol";

contract DocumentRegistryTest is Test {
//Events 
    event DocumentAdded(
        address indexed user,
        bytes32 indexed hash,
        string documentName,
        string description,
        uint timestamp
    );

//Properties
    DocumentRegistry documentRegistry;

    bytes32 Document1Hash = 0x1234567890123456789012345678901234567890123456789012345678901234;
    bytes32 Document2Hash = 0x2234567890123456789012345678901234567890123456789012345678901234;
    string document1Name = "Test Document";
    string description1 = "This is a test document.";

//Setup function
    function setUp() public {
        documentRegistry = new DocumentRegistry();
    }

//Test functions
    function test_AddDocument() public {
        uint256 value = 1 ether;

        // Check event emission
        vm.expectEmit(true, true, false, true);
        emit DocumentAdded(address(this), Document1Hash, document1Name, description1, 1);

        // Add Document
        documentRegistry.addDocument{value: value}(Document1Hash, document1Name, description1);

        // Recover document registy entry and check validity
        bytes32 key = keccak256(abi.encodePacked(address(this), Document1Hash));
        DocumentRegistry.Document memory document;

        (document.hash, document.documentName, document.description, document.userAddress, document.timestamp) = documentRegistry.documents(key);

        assertEq(document.hash, Document1Hash);
        assertEq(document.documentName, document1Name);
        assertEq(document.description, description1);
        assertEq(document.userAddress, address(this));
    }

    function test_GetTimestamp() public {
        documentRegistry.addDocument(Document1Hash, document1Name, description1);
        uint256 timestamp = documentRegistry.getTimestamp(Document1Hash);
        assertTrue(timestamp == 1);
    }

    function test_AddDocument_SameDocument_DifferentUser() public {
        documentRegistry.addDocument(Document1Hash, document1Name, description1);
        vm.prank(address(1));
        documentRegistry.addDocument(Document1Hash, document1Name, description1);
    }

    function test_AddDocument_DifferentDocument_SameUser() public {
        documentRegistry.addDocument(Document1Hash, document1Name, description1);
        documentRegistry.addDocument(Document2Hash, document1Name, description1);
    }
    
    function test_RevertWhen_AddDocument_SameDocument_SameUser() public {
        documentRegistry.addDocument(Document1Hash, document1Name, description1);
        vm.expectRevert();
        documentRegistry.addDocument(Document1Hash, document1Name, description1);
    }
}
