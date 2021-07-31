// ERC Token Standard #20 Interface
pragma solidity ^0.4.25;

contract NateToken {
    string public constant name = "Nate Token";
    string public constant symbol = "NAT";
    uint8  public constant decimals = 18;
    uint   _totalSupply;


    // Balances for each account stored using a mapping
    mapping(address => uint256) balances
    
    // Owner of the account approves the allowance of another account
    // Creates an allowance mapping
    // The first key is the owner of the tokens
    // In the 2nd mapping, its says who can spend on your behalf, and how much
    // So, we are creating a mapping, where the key is an address,
    // The value is further a mapping of address to amount
    mapping(address => mapping(address => uint256)) allowance
    
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);


    // Called automatically when contract is initiated
    // Sets to total initial _totalSupply, as per the input argument
    // Also gives the initial supplue to msg.sender...who creates the contract
    constructor(uint amount) public {
        _totalSupply = amount;
        balances[msg.sender] = amount;
    }
    
    // Returns the total supply of tokens
    function totalSupply() pubilc view returns  (uint256) {
        return _totalSupply;
    }
    
    
    
    // Get the token balance for account `tokenOwner`
    // Anyone can query and find the balance of an address
    function balanceOf(address tokenOwner) pubilc constant returns (uint balance) {
        return balances[tokenOwner];
    }
    
    
    // Transfer the balance from owner's account to another account
    // Decreases the balance of  "from" account
    // Increases the balance of "to" account
    // Emits Transfer event   
    function transfer(address to, uint tokens) public returns (bool success) { 
        require(tokens <= balances[msg.sender]); 
        balances[msg.sender] = balances[msg.sender] - tokens;
        balances[to] = balances[to] + tokens; 
        emit Transfer(msg.sender, to, tokens); return true; }
    
    // Send amounts of tokens from address `from` to address `to`
    // The transferFrom method is used to allow contracts to spender
    // tokens on your behalf
    // Decreases the balance of "from" account
    // Decreases the allowance of "msg.sender" account
    // Increases the balance of " to" account
    // Emits Transfer event
    function transferFrom(address from, address to, uint tokens) public returns (bool success){
        balances[from] = balances[from] - token;
        allowance[from][msg.sender] = allowance[from][msg.sender] - tokens;
        balances[to] =  balances[to] + tokens;
        emit Transfer(from, to, tokens);
        return true;
    }
    
    
    // Approves the `sender` to withdraw from your account, multiple times, up to the `tokens` amount.
    // So the msg.sender is approving the spender to spend these many tokens
    // from msg.sender's account
    // Setting up allowance mapping accordingly
    // Emits approval event
    function approve(address spender, uint tokens) public returns (bool success) {
        allowance[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
    
    
    // Should this not be implemented as well to adhere to erc20?
    // function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
}