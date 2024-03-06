ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- 계정 생성
CREATE USER unisystem IDENTIFIED BY "unisystem123";

-- 권한 부여
GRANT CONNECT, RESOURCE, CREATE VIEW TO unisystem;

-- 객체 생성 공간 할당
ALTER USER unisystem DEFAULT TABLESPACE SYSTEM
QUOTA UNLIMITED ON SYSTEM;

------------------------------------------------------------

