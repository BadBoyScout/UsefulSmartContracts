// SPDX-License-Identifier: GPL-3.0
// version 1/12/2023 : 12:06 AM

pragma solidity ^0.7.0;

// import "./token/ERC20/IERC20.sol";
// import "./access/Ownable.sol";
// import "./math/SafeMath.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.3-solc-0.7/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.3-solc-0.7/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.3-solc-0.7/contracts/math/SafeMath.sol";

contract CustomGameContract is Ownable {
    using SafeMath for uint256;

    receive() external payable {}

    address burnAddress = 0x000000000000000000000000000000000000dEaD;
    address private _designatedAddress;
    bool hasAssignedDesignatedAddress = false;

    // constructor(address designatedWallet) {
    //     _designatedWallet = designatedWallet;
    // }

    function depositNativeCoinToContract() external payable {}

    function setContractDesignatedWallet(address desiredDesignatedAddress)
        public
        onlyOwner
    {
        require(
            hasAssignedDesignatedAddress != true,
            "Designated Address has already been declared"
        );
        hasAssignedDesignatedAddress = true;
        _designatedAddress = desiredDesignatedAddress;
    }

    function getContractNativeTokenBalance()
        public
        view
        onlyOwner
        returns (uint256)
    {
        return address(this).balance;
    }

    function getContractTokenBalance(IERC20 token)
        public
        view
        returns (uint256)
    {
        return token.balanceOf(address(this));
    }

    function withdrawNativeCoin(
        address payable addressToWithdrawTo,
        uint256 amount
    ) public onlyOwner {
        addressToWithdrawTo.transfer(amount);
    }

    function withdrawToken(
        IERC20 token,
        address addressToWithdrawTo,
        uint256 amount
    ) public onlyOwner {
        require(token.transfer(addressToWithdrawTo, amount), "Transfer failed");
    }

    function getContractDesignatedAddress() public view returns (address) {
        return _designatedAddress;
    }
}
