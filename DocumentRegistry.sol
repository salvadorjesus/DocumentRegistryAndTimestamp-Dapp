// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title DocumentRegistry
 * @dev A contract to store and manage records of documents with associated timestamps.
 */
contract DocumentRegistry {

    /**
     * @dev Structure representing a document with its hash, name, description, user's address, and timestamp.
     */
    struct Document {
        bytes32 hash;
        string documentName;
        string description;
        address userAddress;
        uint timestamp;
    }

    /**
     * @dev Mapping to store documents using a key generated from the hash and the user's address.
     */
    mapping(bytes32 => Document) public documents;

    /**
     * @dev Event emitted when a new document is added.
     */
    event DocumentAdded(
        address indexed user,
        bytes32 indexed hash,
        string documentName,
        string description,
        uint timestamp
    );

    /**
     * @dev Function to add a document with its hash, name, and description.
     * @param _hash The hash of the document.
     * @param _documentName The name of the document.
     * @param _description The description of the document.
     */
    function addDocument(bytes32 _hash, string memory _documentName, string memory _description) public {
        bytes32 key = keccak256(abi.encodePacked(msg.sender, _hash));
        require(documents[key].userAddress != msg.sender, "Document already exists for this user");
        
        Document memory newDocument = Document({
            hash: _hash,
            documentName: _documentName,
            description: _description,
            userAddress: msg.sender,
            timestamp: block.timestamp
        });

        documents[key] = newDocument;

        emit DocumentAdded(msg.sender, newDocument.hash, newDocument.documentName, newDocument.description, newDocument.timestamp);
    }

    /**
     * @dev Function to get the timestamp of a specific document.
     * @param _hash The hash of the document used to look up in the mapping.
     * @return timestamp The timestamp of the document.
     */
    function getTimestamp(bytes32 _hash) public view returns (uint){
        bytes32 key = keccak256(abi.encodePacked(msg.sender, _hash));
        return documents[key].timestamp;
    }
}
