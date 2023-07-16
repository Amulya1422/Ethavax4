// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable {

    constructor() ERC20("Degen", "DGN") {}

    function MINT(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function BURN(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function TRANSFERTOKEN(address receiver, uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Degen tokens are not sufficient");
        _transfer(msg.sender, receiver, amount);
    }

    function REDEEMGIFT(uint256 item) external {
        uint256 amount;
        if (item == 1) {
            amount = 200;
        } else if (item == 2) {
            amount = 300;
        } else if (item == 3) {
            amount = 400;
        } else {
            revert("Invalid item");
        }
        require(amount > 0, "Invalid redeem amount");
        require(balanceOf(msg.sender) >= amount, "Insufficient Degen tokens to redeem");
        _burn(msg.sender, amount);
    }

    function showStore() external pure returns (string memory) {
        return "1.Gaming gun (200) 2. Gaming shirt (300) 3. Gaming spects (400) ";
    }
}
