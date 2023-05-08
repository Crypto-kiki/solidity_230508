// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Address {
    // address는 20bytes임
    address a;

    // address의 this는 해당 컨트렉트 주소임.
    function getAddress() public view returns(address) {
        return address(this);
    }

    // 지갑주소를 보려면 msg.sender
    function getMyAddress() public view returns(address) {
        return address(msg.sender);
    }

    function getMyBalance() public view returns(uint) {
        return address(msg.sender).balance;
    }
    // getMyBalance()하면 account의 잔고랑 받아온 (msg.sender).balance와 약간의 차이가 남.

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }


    // bytes20과 bytes20 _a는 다름. 자리수는 같지만 형이 다름. 아래 함수에서는 address _a를 받아서 가능.
    function setA(address _a) public {
        a = _a;
    }

    // function setA(bytes20 _a) public {
    //     a = _a;
    // }  얘는 형이 달라서 안됨.

    function setA2(bytes20 _a) public {
        a = address(_a);
    }  // 얘는 address로 감싸서 address 형으로 만들었기 때문에 address형인 a에 값을 넣을 수 있음.

    function getA2() public view returns(bytes20) {
        return bytes20(a);
    }


    uint b;

    // 상태변수 변화 -> 가스비 소모 o
    function changeB() public {
        b = b + 5;
    }

    // pure 함수 ->  가스비 소모 x
    function add(uint _a, uint _b) public pure returns(uint) {
        return _a + _b;
    }

    // pure와 같은 역할이지만 일반 함수임.
    // 아래 함수는 가능한데 경고메세지 뜸. pure로 가스비 소모 안해도 되는데 pure 안써서 가스비 발생함.
    function add2(uint _a, uint _b) public returns(uint) {
        return _a + _b;
    }

    function getA() public view returns(address) {
        return a;
        // 결과값 : 0x0000000000000000000000000000000000000000   address는 20bytes. bytes 초기값은 0x...로 표현됨
    }

}