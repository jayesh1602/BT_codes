
//Bank account
pragma solidity ^0.8.8;

contract bank_account {
    mapping(address => uint256) private user_balance;
    mapping(address => bool) private is_user;

    function create_account() public {
        require(is_user[msg.sender] == false, "Account already exist");
        is_user[msg.sender] = true;
    }

    function deposit(uint256 amount) public {
        require(is_user[msg.sender], "User Account Not Found");
        user_balance[msg.sender] += amount;
    }

    function withdraw(uint256 amount) public {
        require(is_user[msg.sender], "User Account Not Found");
        require(user_balance[msg.sender] >= amount, "You don't have enough balance to withdraw");
        user_balance[msg.sender] -= amount;
    }

    function show_balance() public view returns (uint256) {
        require(is_user[msg.sender], "User Account Not Found");
        return (user_balance[msg.sender]);
    }
}




//Student

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract StudentData{
    struct Student{
        uint256 rollNumber;
        string name;
        string department;
    }

    Student[] student;

    function addStudent(uint256 _rollNumber, string memory _name, string memory _department) public {
        Student memory newStudent = Student({
            rollNumber : _rollNumber,
            name : _name,
            department : _department
        });
        student.push(newStudent);
    }
    function getStudent(uint256 _rollNumber) public view returns(string memory, string memory){
        for(uint256 i=0;i < student.length;i++){
            Student memory stud = student[i];
            if(stud.rollNumber == _rollNumber){
                return (stud.name,stud.department);
            }
        }
        return ("Name not Found","Department Not Found");
    }

    function getStudentCount() public view returns (uint256){
        return student.length;
    }
}