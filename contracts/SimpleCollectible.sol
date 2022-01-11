// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleCollectible is ERC721, ERC721URIStorage, Ownable {
    uint256  public currentTokenId=0;
    string  public myName="test";

    constructor() ERC721("KevinNFT", "KEVIN") {}

    function setTokenURI(uint256 tokenId, string memory uri)
    public
    onlyOwner
    {
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, uri);
        currentTokenId = tokenId;
    }

    // The following functions are overrides required by Solidity.
    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
    public
    view
    override(ERC721, ERC721URIStorage)
    returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function buyTokens(string memory name1) public {
        myName = name1;
    }
}