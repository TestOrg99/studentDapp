pragma solidity 0.4.24;

//import "zeppelin-solidity/contracts/ownership/Ownable.sol";
//import "zeppelin-solidity/contracts/math/SafeMath.sol";


contract SimpleStorage  {

  // using SafeMath for uint;

   event NewStudent(uint studentId, string name);

 // string ipfsHash;
 struct Student {
    string  name;
    uint32 BlockChainProgress;
    uint32 EthereumProgress;
    uint32 BitcoinProgress;
    uint32 studentTokens;
    string certificateHash;
  }

Student[] public students;

mapping (uint => address) public studentAddress;
mapping (address => uint) studentCount;

  string  public name = "Happy Token";
  string  public symbol = "Happy";
  string  public standard = "Happy Token v1.0";
  string  public admin;
  string  public thirdParty;
  uint256 public totalSupply;
  uint256 public tokenPrice = 100;
  

  function SimpleStorage (uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }


function createStudent(string _name)  {
    uint id = students.push(Student(_name, 0,0, 0,0,' ')) - 1;
    studentAddress[id] = msg.sender;
    studentCount[msg.sender]++;
    NewStudent(id, _name);

  }


 function levelUpBlockChainProgress(uint _studentId) external payable returns (bool) {

  
    if(students[_studentId].BlockChainProgress!=100){
    students[_studentId].BlockChainProgress=students[_studentId].BlockChainProgress+25;
    if(students[_studentId].BlockChainProgress==100){
      students[_studentId].studentTokens++;
      return true;
    }
    else
    {
   return false;
      
    }
  }
  
  }

  function checkProgress(uint _studentId,uint32 _BlockChainProgress) returns (bool)
  {
      students[_studentId].BlockChainProgress=_BlockChainProgress;

     if(students[_studentId].BlockChainProgress==100){
      
      return true;

  }
}

   function levelUpEthereumProgress(uint _studentId) external payable {
     if(students[_studentId].EthereumProgress!=100){
    students[_studentId].EthereumProgress=students[_studentId].EthereumProgress+25;
    if(students[_studentId].EthereumProgress==100){
      students[_studentId].studentTokens++;

    }
  }
 }

   function levelUpBitcoinProgress(uint _studentId) external payable {
    if(students[_studentId].BitcoinProgress!=100){
    students[_studentId].BitcoinProgress=students[_studentId].BitcoinProgress+25;
    if(students[_studentId].BitcoinProgress==100){
      students[_studentId].studentTokens++;
    }
  }
}

  function set(string x,uint _studentId) public {
    students[_studentId].certificateHash = x;
  }

  function get(uint _studentId) public view returns (string) {
    return students[_studentId].certificateHash;
  }

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    /*event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );*/

    mapping(address => uint256) public balanceOf;
    //mapping(address => mapping(address => uint256)) public allowance;

    

    function transfer(address _to, uint256 _value) public returns (bool success) {
         
          require(balanceOf[msg.sender] >= _value);

          balanceOf[msg.sender] -= _value;
          balanceOf[_to] += _value;

          Transfer(msg.sender, _to, _value);
          
       return true;



    }

   

 


}
