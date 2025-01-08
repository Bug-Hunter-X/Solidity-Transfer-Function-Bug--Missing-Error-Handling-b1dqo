```solidity
function transfer(address to, uint amount) public {
  require(balanceOf[msg.sender] >= amount, "Insufficient balance");
  balanceOf[msg.sender] -= amount;
  balanceOf[to] += amount;
  emit Transfer(msg.sender, to, amount);
}

//This function has a bug, it does not check if the transfer is successful. 
//If the transfer fails (due to some reason), the balance of the sender is deducted but the balance of the receiver is not incremented. 
//This leads to a loss of funds.
```