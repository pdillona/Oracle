/*
날짜: 2023/10/02
이름: 정영재
내용: 2장 데이터베이스 기본

*/

//테이블 생성 및 삭제

CREATE TABLE USER1 (
ID VARCHAR2(20),
NAME VARCHAR2(20),
HP CHAR(13),
AGE NUMBER
);


DROP TABLE USER1;


// 데이터 추가(insert)

INSERT INTO USER1 VALUES ('A101마미무메모무', '김유신', '010-1234-1111', 25);
//SQL 오류: ORA-12899: "SCOTT"."USER1"."ID" 열에 대한 값이 너무 큼(실제: 22, 최대값: 20)
//모까지 insert완료 무에서 value too large for column 에러
INSERT INTO USER1 VALUES ('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO USER1 VALUES ('A103', '장보고', '010-1234-3333', 32);
INSERT INTO USER1 (id, name, age) VALUES ('A104', '강감찬', 45); //순서대로 맵핑 방식인듯 하다.
INSERT INTO USER1 (id, name, hp) VALUES ('A105', '이순신', '010-1234-5555');


// 데이터 조회(SELECT)

SELECT * FROM USER1;
SELECT * FROM USER1 WHERE id='A101';
SELECT * FROM USER1 WHERE name='김춘추';
SELECT * FROM USER1 WHERE age > 30;
SELECT id, name, age FROM USER1;




//데이터 수정(UPDATE)

UPDATE User1 SET hp='010-1234-4444' WHERE id='A104';
UPDATE User1 SET age=51 WHERE id='A105';
UPDATE User1 SET id='A101', hp='010-1234-1001', age=27 WHERE id='C101';
UPDATE User1 SET id='C101', age=27 WHERE id='A101';

//데이터 삭제(DELETE)


DELETE FROM User1 WHERE id='A101';
DELETE FROM User1 WHERE id='A102' AND age=25;
DELETE FROM User1 WHERE age >= 30;
























