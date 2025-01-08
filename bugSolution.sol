```solidity
function transfer(address to, uint amount) public returns (bool success) {
  require(balanceOf[msg.sender] >= amount, "Insufficient balance");
  balanceOf[msg.sender] -= amount;
  //Use the safeTransfer function to handle potential errors 
  success = safeTransfer(to, amount); // Assume safeTransfer function exists and handles errors appropriately. 
  emit Transfer(msg.sender, to, amount);
  return success;
}

function safeTransfer(address to, uint value) internal returns (bool) {
    (bool success, bytes memory data) = to.call{value: value}(new bytes(0));
    return success && data.length == 0;
}

```