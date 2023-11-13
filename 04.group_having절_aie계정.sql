/*
    <GROUP BY절>
    그룹기준을 제시할 수 있는 구문 (여러 그룹기준별로 여러 그룹으로 묶을 수 있음)
    여러개의 값들을 하나의 그룹으로 묶어서 처리할 목적으로 사용
*/
SELECT SUM(SALARY)
FROM EMPLOYEE; -- 전체 사원을 하나의 그룹으로 묶어서 촐함을 구함

-- 각 붓4ㅓ멸 총 급여합 조회
SELECT DEPT_CODE,SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 각 부서별 급여합계와 사원의 수 조회 
SELECT DEPT_CODE,SUM(SALARY),COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;
--ORDER BY DEPT_CODE; -- 오름차순

-- 각 직급별 사원수, 급여의 합계 조회, 직급별 내림차순으로 정렬
SELECT JOB_CODE,SUM(SALARY),COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE;

-- 각 직급별 총 사원수, 보너스를 받은 사원수, 급여합, 평균 급여, 최저급여, 최고급여 조회(직급별 오름차순 정렬)
SELECT JOB_CODE,COUNT(*),COUNT(BONUS),SUM(SALARY),ROUND(AVG(SALARY)),MIN(SALARY),MAX(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY 4; -- 컬럼의 번호

-- GROUP BY절에 함수식도 기술 가능
-- 여성별, 남성별의 사원의 수
SELECT DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여','3','남','4','여'),COUNT(*)
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO,8,1);

-- 부서코드, 직급코드 별 사원수, 급여 합
SELECT DEPT_CODE,JOB_CODE,COUNT(*),SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE
ORDER BY 1;

-------------------------------------------------------------------------------
/*
    <HAVING절>
    그룹에 대한 조건을 제시할 때 사용되는 구문(주로 그룹함수식을 가지고 조건을 제시할 때 사용)
*/
-- 각 부서별 편균 급여 조회(부서코드, 평균급여)
SELECT DEPT_CODE,CEIL(AVG(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 각 부서별 평균 급여가 300만원 이상인 부서만 조회
/*
SELECT DEPT_CODE,CEIL(AVG(SALARY))
FROM EMPLOYEE
WHERE AVG(SALARY) >= 3000000
GROUP BY DEPT_CODE;
오류 : 그룹함수에서 조건 제시시 WHERE절에서는 안됨
*/

SELECT DEPT_CODE,CEIL(AVG(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY) >= 3000000;

----------------------<SELECT문 순서>-------------------------------------------
/*
    SELECT
    FROM
    WHERE
    GROUP BY
    HAVING
    ORDER BY
*/


--------------------<실습문제>--------------------------------------------------

-- 1. 직급별 총 급여액(단, 직급별 급여합이 1000만원 이상인 직급만 조회)- 직급코드, 급여합

SELECT JOB_CODE,SUM(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING SUM(SALARY)>=10000000;

--2. 부서별 보너스를 받는 사원이 없는 부서만 부서코드 조회 - 부서코드

