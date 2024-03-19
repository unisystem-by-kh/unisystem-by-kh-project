-- 오라클 11G 이전 버전의 SQL 작성을 가능하게 하는 구문.
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;


-- C## : 일반 사용자(사용자 계정을 의미)

-- 계정 생성
--CREATE USER C##workbook IDENTIFIED BY workbook1234;
CREATE USER unisystem IDENTIFIED BY unisystem123;

-- 접속, 기본 객체 생성 권한
--GRANT CONNECT, RESOURCE TO C##workbook;
GRANT CONNECT, RESOURCE TO unisystem;

-- 객체(테이블 등)가 생성될 수 있는 공간 할당량 지정
ALTER USER unisystem DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;







-- UNI SYSTEM SQL --

-- 기존 테이블 삭제 (정리용)
DROP TABLE "MEMBER";
DROP TABLE "BOARD";
DROP TABLE "BOARD_IMG";
DROP TABLE "BOARD_LIKE";
DROP TABLE "BOARD_TYPE";
DROP TABLE "COMMENT";
DROP TABLE "DEPARTMENT";
DROP TABLE "CATEGORY";

-- 시퀀스 삭제 (정리용)
DROP SEQUENCE SEQ_MEMBER_NO;
DROP SEQUENCE SEQ_BOARD_CODE;
DROP SEQUENCE SEQ_BOARD_NO;
DROP SEQUENCE SEQ_COMMENT_NO;
DROP SEQUENCE SEQ_BOARD_IMG_NO;

-- 회원 테이블 생성
CREATE TABLE "MEMBER" (
   "MEMBER_NO"   VARCHAR2(12)      NOT NULL,
   "MEMBER_PW"   VARCHAR2(150)      NULL,
   "MEMBER_ADDR"   VARCHAR2(300)      NULL,
   "MEMBER_EMAIL"   VARCHAR2(50)      NULL,
   "MEMBER_PHONE"   CHAR(11)      NULL,
   "MEMBER_GEN"   CHAR(1)      NULL,
   "MEMBER_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "MEMBER_GRADE" NUMBER       NULL,
   "MEMBER_TERM" NUMBER       NULL,
   "MEMBER_STATUS"   CHAR(1)   DEFAULT 'N'    NOT NULL,
   "MEMBER_NAME" VARCHAR2(21) NOT NULL,
   "MEMBER_PROFILE"   VARCHAR2(300)      NULL,
   "MEMBER_SSN" VARCHAR2(30)     NOT NULL,

   "DEPARTMENT_NO"   NUMBER      NOT NULL
);

-- 회원 테이블 COMMENT
COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원 번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원 이메일';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원 비밀번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_NICKNAME" IS '회원 이름';

COMMENT ON COLUMN "MEMBER"."MEMBER_PHONE" IS '전화번호(- 없음)';

COMMENT ON COLUMN "MEMBER"."MEMBER_ADDR" IS '회원 주소';

COMMENT ON COLUMN "MEMBER"."MEMBER_GRADE" IS '학생은 회원 가입 시 1로 삽입';

COMMENT ON COLUMN "MEMBER"."MEMBER_TERM" IS '학생은 회원 가입 시 1로 삽입';

COMMENT ON COLUMN "MEMBER"."MEMBER_GEN" IS '회원 성별';

COMMENT ON COLUMN "MEMBER"."MEMBER_PROFILE" IS '프로필 이미지 저장 경로';

COMMENT ON COLUMN "MEMBER"."MEMBER_DATE" IS '회원 가입일';

COMMENT ON COLUMN "MEMBER"."MEMBER_STATUS" IS '회원 상태(Y:휴학중 / N:재학중 / P:졸업 / D:중퇴), 교수와 관리자는 N고정';

COMMENT ON COLUMN "MEMBER"."MEMBER_SSN" IS '회원 주민등록번호';

-- 회원 번호 프라이머리키 설정
ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
   "MEMBER_NO"
);

-- 회원 샘플 데이터 추가

-- 학생
INSERT INTO "MEMBER" (
    "MEMBER_NO",
    "MEMBER_PW",
    "MEMBER_NAME",
    "MEMBER_ADDR",
    "MEMBER_EMAIL",
    "MEMBER_PHONE",
    "MEMBER_GEN",
    "MEMBER_DATE",
    "MEMBER_GRADE",
    "MEMBER_TERM",
    "MEMBER_STATUS",
    "MEMBER_PROFILE",
    "MEMBER_SSN",
    "DEPARTMENT_NO"
)
VALUES(
    012412345,
    'pass01',
    '학생일',
    '주소 영역 ^^^ 상세주소 영역',
    'user01@naver.com',
    '01012341234',
    'M',
    SYSDATE,
    1,
    1,
    'N',
    NULL,
    '970221-1234567',
    1
);

-- 교수
INSERT INTO "MEMBER" (
    "MEMBER_NO",
    "MEMBER_PW",
    "MEMBER_NAME",
    "MEMBER_ADDR",
    "MEMBER_EMAIL",
    "MEMBER_PHONE",
    "MEMBER_GEN",
    "MEMBER_DATE",
    "MEMBER_GRADE",
    "MEMBER_STATUS",
    "MEMBER_PROFILE",
    "MEMBER_SSN",
    "DEPARTMENT_NO"
)
VALUES(
    022412345,
    'pass02',
    '교수일',
    '주소 영역 ^^^ 상세주소 영역',
    'professor01@naver.com',
    '01078947894',
    'M',
    SYSDATE,
    NULL,
    'N',
    NULL,
    '970221-2345678',
    2
);

-- 교직원
INSERT INTO "MEMBER" (
    "MEMBER_NO",
    "MEMBER_PW",
    "MEMBER_NAME",
    "MEMBER_ADDR",
    "MEMBER_EMAIL",
    "MEMBER_PHONE",
    "MEMBER_GEN",
    "MEMBER_DATE",
    "MEMBER_STATUS",
    "MEMBER_PROFILE",
    "MEMBER_SSN",
    "DEPARTMENT_NO"
)
VALUES(
    032412345,
    'pass03',
    '교직원일',
    '주소 영역 ^^^ 상세주소 영역',
    'admin01@naver.com',
    '01000000000',
    'M',
    SYSDATE,
    'N',
    NULL,
    '970221-3456789',
    3
);

COMMIT;


-- 카테고리
CREATE TABLE "CATEGORY" (
   "CATEGORY_NO"   NUMBER      NOT NULL,
   "CATEGORY_NAME"   VARCHAR2(30)      NOT NULL
);

COMMENT ON COLUMN "CATEGORY"."CATEGORY_NO" IS '카테고리 번호';

COMMENT ON COLUMN "CATEGORY"."CATEGORY_NAME" IS '카테고리 이름';

INSERT INTO CATEGORY VALUES(1,'공지사항' );
INSERT INTO CATEGORY VALUES(2,'학과공지' );
INSERT INTO CATEGORY VALUES(3,'자유게시판' );
INSERT INTO CATEGORY VALUES(4,'1:1문의' );
INSERT INTO CATEGORY VALUES(5,'자료실' );

-- 학과
CREATE TABLE "DEPARTMENT" (
   "DEPARTMENT_NO"   NUMBER      NOT NULL,
   "DEPARTMENT_NAME"   VARCHAR2(30)      NOT NULL,
   "DEPARTMENT_PRICE"   NUMBER   DEFAULT 100   NOT NULL
);

COMMENT ON COLUMN "DEPARTMENT"."DEPARTMENT_NO" IS '학과 코드';

COMMENT ON COLUMN "DEPARTMENT"."DEPARTMENT_NAME" IS '학과 이름';

COMMENT ON COLUMN "DEPARTMENT"."DEPARTMENT_PRICE" IS '학과 등록금';

CREATE SEQUENCE SEQ_DEPARTMENT_NO NOCACHE; -- 학과코드 시퀀스

INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'경영학과','4000000');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'경제학과','3900000');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'국어국문학과','3900000');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'영어영문학과','4700000');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'중어중문학과','4500000');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'법학과','5000000');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'행정학과','3600000');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'무역학과','4000000');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'미디어영상학과','4100000');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'컴퓨터과학과','4200000');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'보건환경학과','4200000');

-- 게시판
CREATE TABLE "BOARD" (
   "BOARD_NO"   NUMBER      NOT NULL,
   "BOARD_TITLE"   VARCHAR2(150)      NOT NULL,
   "BOARD_CONTENT"   VARCHAR2(4000)      NOT NULL,
   "BOARD_C_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "BOARD_U_DATE"   DATE      NULL,
   "BOARD_COUNT"   NUMBER   DEFAULT 0   NOT NULL,
   "BOARD_ST"   CHAR(1)   DEFAULT 'N'   NOT NULL,
   "MEMBER_NO"   VARCHAR2(11)      NOT NULL,
   "CATEGOTY_NO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시판 번호';

COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글 제목';

COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글 내용';

COMMENT ON COLUMN "BOARD"."BOARD_C_DATE" IS '게시글 작성 일자';

COMMENT ON COLUMN "BOARD"."BOARD_U_DATE" IS '게시글 수정일(마지막 수정일)';

COMMENT ON COLUMN "BOARD"."BOARD_COUNT" IS '게시글 조회수';

COMMENT ON COLUMN "BOARD"."BOARD_ST" IS '게시글 삭제 여부(N:비삭제 / Y:삭제 / D:공개)';

COMMENT ON COLUMN "BOARD"."MEMBER_NO" IS '학생:01- / 교수:02- / 관리자:03-';

COMMENT ON COLUMN "BOARD"."CATEGOTY_NO" IS '카테고리 번호';

CREATE SEQUENCE SEQ_BOARD_NO NOCACHE; -- 게시판 시퀀스

BEGIN
   FOR I IN 1..1500 LOOP
      INSERT INTO BOARD 
      VALUES( SEQ_BOARD_NO.NEXTVAL,
              SEQ_BOARD_NO.CURRVAL || '번째 게시글',
              SEQ_BOARD_NO.CURRVAL || '번째 게시글 내용 입니다.',
              DEFAULT, NULL, DEFAULT, DEFAULT, '01-2412345', 
              CEIL(DBMS_RANDOM.VALUE(0,4))
      );
   END LOOP;
END;


-- 댓글
CREATE TABLE "REPLY" (
   "REPLY_NO"   NUMBER      NOT NULL,
   "REPLY_CONTENT"   VARCHAR2(4000)      NOT NULL,
   "REPLY_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "REPLY_ST"   CHAR(1)   DEFAULT 'N'   NOT NULL,
   "BOARD_NO"   NUMBER      NOT NULL,
   "MEMBER_NO"   VARCHAR2(11)      NOT NULL
);

COMMENT ON COLUMN "REPLY"."REPLY_NO" IS '댓글 번호(시퀀스)';

COMMENT ON COLUMN "REPLY"."REPLY_CONTENT" IS '댓글 내용';

COMMENT ON COLUMN "REPLY"."REPLY_DATE" IS '댓글 작성 날짜';

COMMENT ON COLUMN "REPLY"."REPLY_ST" IS '댓글 삭제 여부(N:노출 / Y:삭제)';

COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '게시판 번호';

COMMENT ON COLUMN "REPLY"."MEMBER_NO" IS '학생:01- / 교수:02- / 관리자:03-';

CREATE SEQUENCE SEQ_REPLY_NO NOCACHE; -- 댓글 시퀀스

BEGIN
   FOR I IN 1..1000 LOOP
      INSERT INTO REPLY
      VALUES(SEQ_REPLY_NO.NEXTVAL, 
            SEQ_REPLY_NO.CURRVAL || '번째 댓글',
            DEFAULT, DEFAULT,
             CEIL(DBMS_RANDOM.VALUE(0,1500)),
             '01-2412345');
   END LOOP;
END;


-- 등록금
CREATE TABLE "PAY" (
   "PAY_CODE"   NUMBER      NOT NULL,
   "PAY_METHOD"   VARCHAR2(50)      NOT NULL,
   "PAY_ACOUNT"   VARCHAR2(50)      NOT NULL,
   "PAY_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "MEMBER_NO"   VARCHAR2(11)      NOT NULL
);

COMMENT ON COLUMN "PAY"."PAY_CODE" IS '결제번호(시퀀스)';

COMMENT ON COLUMN "PAY"."PAY_METHOD" IS '결제방법';

COMMENT ON COLUMN "PAY"."PAY_ACOUNT" IS '결제 금액';

COMMENT ON COLUMN "PAY"."PAY_DATE" IS '결제일';

COMMENT ON COLUMN "PAY"."MEMBER_NO" IS '학생:01- / 교수:02- / 관리자:03-';

-- 게시판 파일 카테고리
CREATE TABLE "BOARD_FILE_CATEGORY" (
   "BOARD_FILE_CATEGORY_NO"   NUMBER      NOT NULL,
   "BOARD_FILE_CATEGORY_NAME"   VARCHAR2(150)      NOT NULL
);

COMMENT ON COLUMN "BOARD_FILE_CATEGORY"."BOARD_FILE_CATEGORY_NO" IS '게시판용 파일 카테고리 번호';

COMMENT ON COLUMN "BOARD_FILE_CATEGORY"."BOARD_FILE_CATEGORY_NAME" IS '게시판용 파일 카테고리 이름';

INSERT INTO BOARD_FILE_CATEGORY VALUES(1,'이미지');
INSERT INTO BOARD_FILE_CATEGORY VALUES(2,'첨부파일');

COMMIT;