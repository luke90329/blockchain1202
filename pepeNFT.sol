// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract pepeNFT is ERC721URIStorage {
    uint256 private _currentTokenId = 1;
    string private baseURI = "https://blockchainnft-da014.web.app/";
    mapping(address => bool) private minted;

    constructor() ERC721("Pepe", "PEPE") {}

    function mintPepe() public returns (uint256) {
        require(_currentTokenId <= 35, "Exceed mint limit");
        require(!minted[msg.sender], "Already have a pepe");
        uint256 tokenId = _currentTokenId++;
        _mint(msg.sender, tokenId);
        _setTokenURI(
            tokenId,
            string.concat(baseURI, Strings.toString(tokenId), ".json")
        );
        minted[msg.sender] = true;

        return tokenId;
    }
}
