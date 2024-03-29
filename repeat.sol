// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract StringAndBytes {
    string a;

    function setString(string memory _a) public {
        a = _a;
    }

    function getString() public view returns(string memory) {
        return a;
    }

    function stringToBytes() public view returns(bytes memory){
        return bytes(a);
    }

    function stringToBytes2() public view returns(bytes1, bytes1, bytes1) {
        return (bytes(a)[0], bytes(a)[1], bytes(a)[2]);
    }

    function bytesToString(bytes memory _a) public pure returns(string memory) {
        return string(_a);
    }

    function bytesToString2(string memory _a) public pure returns(bytes1) {
        bytes memory _b; // bytes형 변수 _b 선언 
        _b = bytes(_a); // _b에 _a의 bytes 형변환 정보 대입
        return _b[0];
    }

    function bytesToString3(string memory _a) public pure returns(string memory) {
        bytes memory _b = new bytes(1);
        _b[0] = bytes(_a)[0];
        return string(_b);
    }

    function bytesToString4(string memory _a, uint _n) public pure returns(string memory) {
        bytes memory _b = new bytes(1);
        _b[0] = bytes(_a)[_n-1]; /*[나중에] 조건문 배운 후에 다시 돌아오기, 글자 수에 맞게*/
        return string(_b);
    }

    function bytesToString5(string memory _a) public pure returns(string memory) {
        bytes memory _b = new bytes(1);
        _b[0] = bytes(_a)[0];
        return string(_b);
    }
}



/*
실습가이드
1. 1 -> push, 2 -> push, 3 -> push, 4 -> push
2. getLength 해보기 -> 4 확인
3. getNumber -> 1,2,3,4 각각 해보기 -> 각각 1,2,3,4 확인
4. pop 해보기
5. getLength 해보기 -> 3확인
6. getNumber -> 1,2,3,4 각각 해보기 -> 각각 1,2,3, 오류 확인
7. deleteNum -> 2 해보기
8. getNumber -> 2 해보기 -> 0 확인
9. changeNum -> 2,5 해보기
10. getNumber -> 2 해보기 -> 5 확인 
*/

contract Array_u {
    // array = 같은 자료형들이 들어있는 집합
    uint[] numbers; // 자료형 [] array 이름

    // 1. 넣기
    function push(uint _a) public {
        numbers.push(_a); // 배열이름.push(변수)
    }

    // 2. 빼기
    function pop() public {
        numbers.pop(); // 배열이름.pop(), 맨뒤의 숫자를 날림
    }

    // 3. 보기
    function getNumber(uint _n) public view returns(uint) {
        return numbers[_n-1]; // 배열이름[_n번째]
    }

    // 4. 길이
    function getLength() public view returns(uint) {
        return numbers.length; //배열이름.길이
    }

    // 5. 바꾸기
    function changeNum(uint _k, uint _z) public {
        numbers[_k-1] = _z; //배열이름[_k번째] = _z -> _k번째를 _z로 바꿔
    }

    // 6. delete 
    function deleteNum(uint _n) public {
        delete numbers[_n-1]; // delete 배열이름[_n번째] = _n번째 숫자를 없애줘
    }

    //7. 전체 array 반환
    function returnArray() public view returns(uint[] memory) {
        return numbers;
    }
}

contract Array_s {
    // array = 같은 자료형들이 들어있는 집합
    string[] letters; // 자료형 [] array 이름

    // 1. 넣기
    function push(string memory _a) public {
        letters.push(_a); // 배열이름.push(변수)
    }

    // 2. 빼기
    function pop() public {
        letters.pop(); // 배열이름.pop(), 맨뒤의 문자를 날림
    }

    // 3. 보기
    function getLetter(uint _n) public view returns(string memory) {
        return letters[_n-1]; // 배열이름[_n번째]
    }

    // 4. 길이
    function getLength() public view returns(uint) {
        return letters.length; //배열이름.길이
    }

    // 5. 바꾸기
    function changeLet(uint _k, string memory _z) public {
        letters[_k-1] = _z; //배열이름[_k번째] = _z -> _k번째를 _z로 바꿔
    }

    // 6. delete 
    function deleteLet(uint _n) public {
        delete letters[_n-1]; // delete 배열이름[_n번째] = _n번째 문자를 없애줘
    }

    //7. 전체 array 반환
    function returnArray() public view returns(string[] memory) {
        return letters;
    }
}


contract Struct {
    struct Student {
        string name;
        string gender;
        uint number;
        uint birthday;
    } 
    /* 구조체 선언 
    struct 구조체명 {
        .../
        .../
        ...
    }
    */

    Student A; // Student형 변수 A
    Student[] students; //Student형 변수들의 array students

    function setStudentA(string memory _name, string memory _gender, uint _number, uint _birth) public {
        A = Student(_name, _gender, _number, _birth);
    }

    function getStudentA() public view returns(Student memory) {
        return A;
    }

    function pushStudent(string memory _name, string memory _gender, uint _number, uint _birth) public {
        students.push(Student(_name, _gender, _number, _birth)); // 배열명.push(구조체명(구조체 정보들))
    }

    function popStudent() public {
        students.pop();
    }

    function getLength() public view returns(uint) {
        return students.length;
    }

    function getStudent(uint _n) public view returns(Student memory) {
        return students[_n-1];
    }

    function getStudents() public view returns(Student[] memory) {
        return students;
    }
}


contract note {
    struct Student {
        string name;
        string gender;
        uint number;
        uint birth;
    }

    Student A;
    Student [] students;

    struct party {
        string party;
        uint attendances;
    }

    function setA(string memory _a, string memory _b, uint _c, uint _d) public {
        A = Student(_a, _b, _c, _d);
    }

    function getA() public view returns(Student memory) {
        return A;
    }

    function pushStudent(string memory _name, string memory _gender, uint _number, uint _birth) public {

    }
}

contract note2 {
    uint[] a;
    function pushA(uint _a) public {
        a.push(_a);
    }

    string[] b;
    function pushB(string memory _b) public {
        b.push(_b);
    }

    struct Student {
        string name;
        string gender;
        uint number;
        uint birth;
    }

    Student[] students;

    function pushStudents(string memory _name, string memory _gender, uint _number, uint _birth) public {
        students.push(Student(_name, _gender, _number, _birth));
    }

    // function getStudents() public view returns(students memory) {
    //     return students;
    // }
}

contract note3 {
    struct party {
        string title;
        string name;
        uint date;
    }

    party A;
    party[] parties;

    function setA(string memory _title, string memory _name, uint _date) public {
        A = party(_title, _name, _date);
    }

    function pushParties(string memory _title, string memory _name, uint _date) public {
        parties.push(party(_title, _name, _date));
    }
}

