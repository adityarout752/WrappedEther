// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WrappedEther is ERC20 {

constructor() ERC20("WrappedEthers","WETH") {

}

function deposit() external payable {
    _mint(msg.sender,msg.value);
}

function withdraw(uint256 amount) external {
      require(balanceOf(msg.sender) >= amount, "Insufficient Balance");
    _burn(msg.sender,amount);
     payable(msg.sender).transfer(amount);

}
}