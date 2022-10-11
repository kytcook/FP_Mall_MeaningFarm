--sys계정에서 실행할 것?
--
--실습 시나리오
--
--오라클 서버에 tomato계정을 만들고 비번은 tiger로 한다.
--tomato계정이 사용할 물리적인 공간을 만들어 준다.
--ts_tomato라는 테이블 스페이스 이름으로 오라클이 설치되어 있는 물리적인 위치를 확인한 후
--아래 DDL문을 sys계정에서 실행한다.

create tablespace ts_meaningfarm
datafile 'D:\app\kytcook\oradata\orcl11\meaningFarm.dbf' size 100M AUTOEXTEND 
ON NEXT 5M;


--아래는 위에서 생성한 테이블스페이스가 정상적으로 만들어 졌는지 확인하는 DML문이다.
--이것도 반드시 sys 계정에서 확인해야 한다.
select tablespace_name, file_name, autoextensible, increment_by
      ,maxbytes
  from dba_data_files
 where tablespace_name = 'ts_meaningfarm';

--tomato라는 계정을 만들고 비번은 tiger로 하며
--tomato계정이 바라보는 테이블 스페이스는 ts_tomato로 한다.
create user meaningFarm identified by tiger
default tablespace ts_meaningFarm;

----------------------------------------------------------
-- DCL - 권한부여

grant create session to meaningFarm  with admin option;

--테이블을 만드려는 권한을 토마토에게  준다.
grant create table to meaningFarm with admin option;

--뷰를 만드는 권한을 준다
grant create view to meaningFarm with admin option;

--테이블 스페이스에 대한 설정 
alter user meaningFarm quota unlimited on ts_meaningFarm;

--트리거를 만드는 권한부여
grant create trigger to meaningFarm;

-- 1일 증가하는 오브젝트 시퀀스?권한 부여
grant create sequence to meaningFarm;

--프로시저를 생성할 수 있는 권한 부여
GRANT CREATE PROCEDURE TO meaningFarm;

COMMIT;

-----테이블스페이스 삭제
DROP TABLESPACE ts_meaningFarm
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

-----유저데이터 삭제
drop user meaningfarm cascade;