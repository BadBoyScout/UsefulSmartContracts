// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NftCubes is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("Nft Cubes", "CUBES") {
        for (uint256 i=0; i<5; i++) {
        _safeMint(0xE07594b5C7E6676BaEBD3F20C36dd39852961526, _tokenIdCounter.current());
        _tokenIdCounter.increment();
        }
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://gateway.pinata.cloud/ipfs/QmPKBWtUo8ZKsyijvtMtquHAjQ8BBj6coeo6b88LX2nBhN/";
    }

    function totalSupply() public view virtual returns (uint256) {
        return _tokenIdCounter.current()-1;
    }
}
