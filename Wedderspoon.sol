/* Wedderspoon
**************************************************
*Wedderspoon Is A Simpile BEP20 Fungible Token Themed After The Flavorful, Nourishing Superfood That Supports Whole Body Wellness.
*Tokenomics: NONE
*SLIPPAGE > 0%
**************************************************
*/
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "ERC20Burnable.sol";
contract ERC20PresetFixedSupply is ERC20Burnable {
    constructor(
        string memory name,
        string memory symbol,
        uint256 initialSupply,
        address owner
    ) ERC20(name, symbol) {
        _mint(owner, initialSupply);
    }
}