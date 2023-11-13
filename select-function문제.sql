-------------------------------- function문제 -----------------------------------

-- 1. 영어영문학과(학과코드 002) 학생들의 학번과 이름, 입학 년도를 입학 년도가 빠른 순으로
-- 표시하는 SQL문자을 작성하시오, (단, 헤더는 "학번", "이름", "입학년도"가 표시되도록한다.
SELECT STUDENT_NO "학번", STUDENT_NAME "이름", ENTRANCE_DATE "입학년도"
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '002';

--2. 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 한 명 있다고 한다. 그 교수의
-- 이름과 주민번호를 화면에 출력하는 SQL 문장을 작성해 보자. (* 이때 올바르게 작성한 SQL
-- 문자의 결과 값이 예상과 다르게 나올 수 있다. 원인이 무엇인지 생각해볼 것)
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE LENGTH(PROFESSOR_NAME) != 3;

--3. 춘 기술대학교의 남자 교수들의 이름과 나이를 출력하는 SQL 문장을 작성하시오. 
--단 이때 나이가 적은 사람에서 많은 사람 순으로 화면에 출력되도록 만드시오. 
--(단, 교수 중 2000년 이후 출생자는 없으며 출력 헤더는 "교수이름, "나이"로 한다. 나이는 
--'만'으로 계산한다.)
--SELECT PROFESSOR_NAME 교수이름,
--EXTRACT(YEAR FROM SYSDATE-('19'||SUBSTR(PROFESSOR_SSN,1,2),'YYYYMMDD')/12)나이
--FROM TB_PROFESSOR
--WHERE SUBSTR(PROFESSOR_SSN, 8,1) = '1'
--ORDER BY 2;

--4. 교수들의 이름 중 성을 제외한 이름만 출력하는 SQL문장을 작성하시오. 출력 헤더는 "이름"
-- 이 찍히도록한다.(성이 2자인 경우의 교수는 없다고 가정하시오)
SELECT SUBSTR(PROFESSOR_NAME, 2) 이름
FROM TB_PROFESSOR
ORDER BY 1;

-- 5. 춘 기술대학교의 재수생 입학자를 구하려고 한다. 어떻게 찾아낼 것인가? 이때, 
--19살에 입학하면 재수를 하지 않은 것으로 간주한다.
SELECT STUDENT_NO,STUDENT_NAME
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) 입학년도;




-- 9. 학번이 A517178 인 한아름 학생의 학점 총 평점을 구하는 SQL문을 작성하시오. 단, 이때
-- 출력 화면의 헤더는 "평점" 이라고 찍히게 하고, 점수는 반올림하여 소수점 이하 한자리까지만
--표시한다.

SELECT ROUND(AVG(POINT),1)"평점"
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';

-- 10. 학과별 학생수를 구하여 "학과번호", "학생수(명)" 의 형태로 헤더를 만들어 결과값이 
--출력되도록 하시오.
SELECT COUNT(CAPACITY)
FROM TB_DEPARTMENT;