/*
날짜: 2023/10/02
이름: 정영재
내용: 1장 데이터베이스와 DBMS개요

*/

-- 한줄주석
// 한줄주석
--여러줄 주석 /**/ 

-- 실습하기 1-1.데이터베이스 생성(사용자 생성)



-- 실습하기 1-2.number 자료형 실습
CREATE TABLE TYPE_TEST_NUMBER (
        //범위를 정하지 않아 데이터를 밀어넣긴 쉬우나 무결성에 문제가 생길 수 있음
        num1 NUMBER,
        //20라인 유효자리수 2로 지정했기에 정수만 가능 (2,0)과 같음 소수점 자리 0이라는 뜻
        num2 NUMBER(2),   
        num3 NUMBER(3,1),
        num4 NUMBER(4,2),
        num5 NUMBER(5,6)
    );

//num1 NUMBER
INSERT INTO type_test_number (num1) VALUES (1);
INSERT INTO type_test_number (num1) VALUES (123);
INSERT INTO type_test_number (num1) VALUES (123.74);
INSERT INTO type_test_number (num1) VALUES (123.12345);

//num2 NUMBER(2)
insert into TYPE_TEST_NUMBER (num2) values (12);
insert into TYPE_TEST_NUMBER (num2) values (123);
insert into TYPE_TEST_NUMBER (num2) values (1.2);
insert into TYPE_TEST_NUMBER (num2) values (1.23);
insert into TYPE_TEST_NUMBER (num2) values (12.34567);
insert into TYPE_TEST_NUMBER (num2) values (12.56789);
insert into TYPE_TEST_NUMBER (num2) values (123.56789);

//num3 NUMBER(3,1) 3,1는 총 세자리 숫자까지(정수, 소수합 3자리) 자르며 소수점 이하 한자리를 받는다는 의미
insert into TYPE_TEST_NUMBER (num3) values (12);
insert into TYPE_TEST_NUMBER (num3) values (123);
insert into TYPE_TEST_NUMBER (num3) values (12.1);
insert into TYPE_TEST_NUMBER (num3) values (12.1234);
insert into TYPE_TEST_NUMBER (num3) values (12.56789);
insert into TYPE_TEST_NUMBER (num3) values (123.56789);



-- 실습하기 1-3.문자형 자료형 실습
CREATE TABLE TYPE_TEST_CHAR (
 char1 CHAR(1),
 char2 CHAR(2),
 char3 CHAR(3),
 vchar1 VARCHAR2(1),
 vchar2 VARCHAR2(2),
 vchar3 VARCHAR2(3),
 nvchar1 NVARCHAR2(1),
 nvchar2 NVARCHAR2(2),
 nvchar3 NVARCHAR2(3)
);

//CHAR 크기를 1로 잡으면 1자를 받는게 아니라 1byte를 받는듯함.
insert into TYPE_TEST_CHAR (char1) values ('A');  //영어는 1byte
insert into TYPE_TEST_CHAR (char1) values ('가'); //한글은 3byte라서 못받음
// SQL 오류: ORA-12899: "SCOTT"."TYPE_TEST_CHAR"."CHAR1" 열에 대한 값이 너무 큼(실제: 3, 최대값: 1)
insert into TYPE_TEST_CHAR (char2) values ('가'); //마찬가지의 이유로 에러
//SQL 오류: ORA-12899: "SCOTT"."TYPE_TEST_CHAR"."CHAR2" 열에 대한 값이 너무 큼(실제: 3, 최대값: 2)
insert into TYPE_TEST_CHAR (char2) values ('abc'); //3byte라 에러
insert into TYPE_TEST_CHAR (char2) values ('ab'); //insert완료
insert into TYPE_TEST_CHAR (char3) values ('가'); //char(3)으로 잡았은 char3는 문제없이 insert완료
insert into TYPE_TEST_CHAR (char1) values ('%'); //특수문자 insert가능
insert into TYPE_TEST_CHAR (char1) values ('1'); //당연히 문자열로 표현된 숫자도 1byte


//VARCHAR2
insert into TYPE_TEST_CHAR (vchar1) values ('A');
insert into TYPE_TEST_CHAR (vchar1) values ('#'); //특수문자 insert가능
insert into TYPE_TEST_CHAR (vchar2) values ('AB');
insert into TYPE_TEST_CHAR (vchar3) values ('가');
insert into TYPE_TEST_CHAR (vchar1) values ('가'); //char와 마찬가지로 크기에 대한 에러가 뜸
//SQL 오류: ORA-12899: "SCOTT"."TYPE_TEST_CHAR"."VCHAR1" 열에 대한 값이 너무 큼(실제: 3, 최대값: 1)


//NVARCHAR2
insert into TYPE_TEST_CHAR (nvchar1) values ('A');
insert into TYPE_TEST_CHAR (nvchar1) values ('?'); //특수문자 insert가능 셋다 되는걸 보면 특수문자는 다 1byte인듯
insert into TYPE_TEST_CHAR (nvchar2) values ('AB');
insert into TYPE_TEST_CHAR (nvchar3) values ('가나다');
insert into TYPE_TEST_CHAR (nvchar1) values ('가'); // insert완료 nvchar는 모든 아시아권 문자를 1byte로 보기 때문에 문제없이 insert가능.



