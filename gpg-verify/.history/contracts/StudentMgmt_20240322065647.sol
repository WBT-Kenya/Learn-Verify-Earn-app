
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentManagement {
    
    struct Student {
        uint256 studentId;
        string name;
        mapping(uint256 => bool) enrolledCourses;
        mapping(uint256 => bool) assessmentsPassed;
    }


    struct Course {
    uint256 courseId;
    string courseName;
    uint256 passMark; // Pass mark out of 100
    }
    
    
    mapping(uint256 => Student) public students;
    mapping(uint256 => Course) public courses;
    
    uint256 public lastStudentId;
    uint256 public lastCourseId;
    
    event StudentEnrolled(uint256 studentId, string name, uint256 courseId);
    event StudentAssessmentTaken(uint256 studentId, uint256 courseId, bool passed);
    
    constructor() {
        lastStudentId = 0;
        lastCourseId = 0;
    }
    
    
    function enrollStudent(string memory _name) external {
        lastStudentId++;
        Student storage newStudent = students[lastStudentId];
        newStudent.studentId = lastStudentId;
        newStudent.name = _name;
    }
    
    function createCourse(string memory _courseName, uint256 _passMark) external {
        lastCourseId++;
        courses[lastCourseId] = Course(lastCourseId, _courseName, _passMark);
    }

    function enrollStudentInCourse(uint256 _studentId, uint256 _courseId) external {
        require(students[_studentId].studentId != 0, "Student does not exist");
        require(courses[_courseId].courseId != 0, "Course does not exist");
        
        students[_studentId].enrolledCourses[_courseId] = true;
        emit StudentEnrolled(_studentId, students[_studentId].name, _courseId);
    }
    
    function takeAssessment(uint256 _studentId, uint256 _courseId, uint256 _assessmentId, uint256 _score) external {
        require(students[_studentId].studentId != 0, "Student does not exist");
        require(courses[_courseId].courseId != 0, "Course does not exist");
        require(_score >= 0 && _score <= 100, "Invalid score");
        
        if (_score >= courses[_courseId].passMark) {
            students[_studentId].assessmentsPassed[_assessmentId] = true;
            emit StudentAssessmentTaken(_studentId, _courseId, true);
        } else {
            students[_studentId].assessmentsPassed[_assessmentId] = false;
            emit StudentAssessmentTaken(_studentId, _courseId, false);
        }
        
        //  courses[_courseId].assessments[_assessmentId] = true;
    }
    
    function verifyAssessment(uint256 _studentId, uint256 _courseId, uint256 _assessmentId) external view returns (bool) {
        require(students[_studentId].studentId != 0, "Student does not exist");
        require(courses[_courseId].courseId != 0, "Course does not exist");
        
        return students[_studentId].assessmentsPassed[_assessmentId];
    }
}

contract ERC20 {
    mapping(address => uint256) balances;
    
    function _mint(address account, uint256 amount) internal {
        balances[account] += amount;
    }
    
    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(balances[sender] >= amount, "Insufficient balance");
        balances[sender] -= amount;
        balances[recipient] += amount;
    }
}