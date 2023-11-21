--SAMPLE계정에서 테이블생성 불라: 권한 부여를 안해서
--1.3의 권한 부여전에는 실행하면 오류, 권한 부여 후에는 생성가능
CREATE TABLE TEST(
    ID VARCHAR2(30),
    NAME VARCHAR2(20)
);
-- 1.4의 권한부여 전과 후비교
INSERT INTO TEST VALUES('user01','홍길동');
-- 2.1의 권한 부여전과 후 비교
SELECT * FROM AIE.EMPLOYEE;

--2.2 권한 부여 후
SELECT * FROM AIE.DEPARTMENT;  
INSERT INTO AIE.DEPARTMENT VALUES('D0','관리부','L2');
COMMIT;     