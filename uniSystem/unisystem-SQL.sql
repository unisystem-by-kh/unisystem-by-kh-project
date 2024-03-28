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
--------------------------------------------------------------------------------
-- 테이블 삭제
DROP TABLE "MEMBER";
DROP TABLE "DEPARTMENT";
DROP TABLE "BOARD";
DROP TABLE "CLASS";
DROP TABLE "CATEGORY";
DROP TABLE "CATAGORY";
DROP TABLE "FILEZIP";
DROP TABLE "MESSAGE";
DROP TABLE "CHATTING";
DROP TABLE "IMG";
DROP TABLE "FILEZIP_CATEGORY";
DROP TABLE "FILEZIP_CATAGORY";
DROP TABLE "FILEZIP";
DROP TABLE "TASK";
DROP TABLE "LECTURE";
DROP TABLE "REQUEST";
DROP TABLE "CLASS_LATE";
DROP TABLE "REPLY";
DROP TABLE "PAY";
DROP TABLE "BOARD_FILE";
DROP TABLE "BOARD_FILE_CATEGORY";
DROP TABLE "BOARD_FILE_CATAGORY";
DROP TABLE "CHATTING_JOIN";
--------------------------------------------------------------------------------
-- 시퀀스 삭제
DROP SEQUENCE SEQ_MEMBER_NO;
DROP SEQUENCE SEQ_DEPARTMENT_NO;
DROP SEQUENCE SEQ_BOARD_NO;
DROP SEQUENCE SEQ_CLASS_NO;
DROP SEQUENCE SEQ_CATEGORY_NO;
DROP SEQUENCE SEQ_CATAGORY_NO;
DROP SEQUENCE SEQ_FILE_NO;
DROP SEQUENCE SEQ_MESSAGE_NO;
DROP SEQUENCE SEQ_CHATTING_NO;
DROP SEQUENCE SEQ_LATE_NO;
DROP SEQUENCE SEQ_IMG_NO;
DROP SEQUENCE SEQ_FKIND_NO;
DROP SEQUENCE SEQ_TASK_NO;
DROP SEQUENCE SEQ_CLASS_LATE_NO;
DROP SEQUENCE SEQ_REPLY_NO;
DROP SEQUENCE SEQ_PAY_CODE;
DROP SEQUENCE SEQ_BOARD_FILE_NO;
DROP SEQUENCE SEQ_BOARD_FILE_CATEGORY_NO;
DROP SEQUENCE SEQ_BOARD_FILE_CATAGORY_NO;
DROP SEQUENCE SEQ_FILE_NO;
--------------------------------------------------------------------------------
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

   "DEPARTMENT_NO"   NUMBER      NULL
);
-- 회원 테이블 코멘트
COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원 이메일';
COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원 비밀번호';
COMMENT ON COLUMN "MEMBER"."MEMBER_NAME" IS '회원 이름';
COMMENT ON COLUMN "MEMBER"."MEMBER_PHONE" IS '전화번호(- 없음)';
COMMENT ON COLUMN "MEMBER"."MEMBER_ADDR" IS '회원 주소';
COMMENT ON COLUMN "MEMBER"."MEMBER_GRADE" IS '학생은 회원 가입 시 1로 삽입';
COMMENT ON COLUMN "MEMBER"."MEMBER_TERM" IS '학생은 회원 가입 시 1로 삽입';
COMMENT ON COLUMN "MEMBER"."MEMBER_GEN" IS '회원 성별';
COMMENT ON COLUMN "MEMBER"."MEMBER_PROFILE" IS '프로필 이미지 저장 경로';
COMMENT ON COLUMN "MEMBER"."MEMBER_DATE" IS '회원 가입일';
COMMENT ON COLUMN "MEMBER"."MEMBER_STATUS" IS '회원 상태(Y:휴학중 / N:재학중 / P:졸업 / D:중퇴), 교수와 관리자는 N고정';
COMMENT ON COLUMN "MEMBER"."MEMBER_SSN" IS '회원 주민등록번호';
COMMENT ON COLUMN "MEMBER"."DEPARTMENT_NO" IS '회원이 속한 학과 번호(코드)';
-- 회원 번호 프라이머리키 설정
ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
   "MEMBER_NO"
);
--------------------------------------------------------------------------------
-- 학생 샘플데이터
-- 1번학과 학생 샘플데이터 1
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
    '01-2412345',
    'pass01',
    '학생일',
    '주소 영역 ^^^ 상세주소 영역',
    'anycallshow@naver.com',
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
-- 2번학과 학생 샘플데이터 1
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
    '01-2412346',
    'pass06',
    '학생육번',
    '주소 영역 ^^^ 상세주소 영역',
    'example@naver.com',
    '01043214321',
    'F',
    SYSDATE,
    1,
    1,
    'N',
    NULL,
    '910516-1234567',
    2
);
-- 1번학과 학생 샘플데이터 2
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
    '01-2412347',
    'pass07',
    '학생칠번임',
    '주소 영역 ^^^ 상세주소 영역',
    'example@naver.com',
    '01043214321',
    'M',
    SYSDATE,
    1,
    1,
    'N',
    NULL,
    '201011-1234567',
    1
);
-- 1번학과 학생 샘플데이터 3
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
    '01-2412348',
    'pass08',
    '학생팔랑',
    '주소 영역 ^^^ 상세주소 영역',
    'example8@naver.com',
    '01043214321',
    'M',
    SYSDATE,
    1,
    1,
    'N',
    NULL,
    '021111-1234567',
    1
);
-- 2번학과 학생 샘플데이터 2
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
    '01-2412349',
    'pass09',
    '구구',
    '주소 영역 ^^^ 상세주소 영역',
    'example8@naver.com',
    '01043214321',
    'M',
    SYSDATE,
    1,
    1,
    'N',
    NULL,
    '001230-1234567',
    2
);
-- 3번학과 학생 샘플데이터 1
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
    '01-2412340',
    'pass00',
    '영',
    '주소 영역 ^^^ 상세주소 영역',
    'example10@naver.com',
    '01043214321',
    'M',
    SYSDATE,
    1,
    1,
    'N',
    NULL,
    '871230-1234567',
    3
);
--------------------------------------------------------------------------------
-- 교수 샘플데이터
-- 1번 학과 교수 샘플데이터 1
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
    '02-2412345',
    'pass02',
    '교수임당',
    '주소 영역 ^^^ 상세주소 영역',
    'professor01@naver.com',
    '01078947894',
    'M',
    SYSDATE,
    NULL,
    NULL,
    'N',
    NULL,
    '970221-2345678',
    1
);
-- 2번 학과 교수 샘플데이터 1
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
    '02-2422222',
    'pass022',
    '교수이번쓰',
    '주소 영역 ^^^ 상세주소 영역',
    'professor01@naver.com',
    '01078947894',
    'M',
    SYSDATE,
    NULL,
    NULL,
    'N',
    NULL,
    '670221-2345678',
    2
);
-- 교직원 샘플데이터
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
    '03-2412345',
    'pass03',
    '관리자에용',
    '주소 영역 ^^^ 상세주소 영역',
    'admin@naver.com',
    '01078947894',
    'M',
    SYSDATE,
    NULL,
    NULL,
    'N',
    NULL,
    '970221-2345654',
    1
);
-- 회원 중간 커밋
COMMIT;
--------------------------------------------------------------------------------
-- 게시판 카테고리
CREATE TABLE "CATEGORY" (
   "CATEGORY_NO"   NUMBER      NOT NULL,
   "CATEGORY_NAME"   VARCHAR2(30)      NOT NULL
);
-- 게시판 카테고리 코멘트
COMMENT ON COLUMN "CATEGORY"."CATEGORY_NO" IS '카테고리 번호';
COMMENT ON COLUMN "CATEGORY"."CATEGORY_NAME" IS '카테고리 이름';
-- 게시판 카테고리 데이터
INSERT INTO CATEGORY VALUES(1,'공지사항' );
INSERT INTO CATEGORY VALUES(2,'학과공지' );
INSERT INTO CATEGORY VALUES(3,'자유게시판' );
INSERT INTO CATEGORY VALUES(4,'1:1문의' );
INSERT INTO CATEGORY VALUES(5,'자료실' );
-- 게시판 카테고리 프라이머리키 설정
ALTER TABLE "CATEGORY" ADD CONSTRAINT "CATEGORY" PRIMARY KEY (
   "CATEGORY_NO"
);
-- 게시판 카테고리 중간 커밋
COMMIT;
--------------------------------------------------------------------------------
-- 학과
CREATE TABLE "DEPARTMENT" (
   "DEPARTMENT_NO"   NUMBER      NOT NULL,
   "DEPARTMENT_NAME"   VARCHAR2(30)      NOT NULL,
   "DEPARTMENT_PRICE"   NUMBER   DEFAULT 100   NOT NULL
);

COMMENT ON COLUMN "DEPARTMENT"."DEPARTMENT_NO" IS '학과 코드';
COMMENT ON COLUMN "DEPARTMENT"."DEPARTMENT_NAME" IS '학과 이름';
COMMENT ON COLUMN "DEPARTMENT"."DEPARTMENT_PRICE" IS '학과 등록금';
-- 학과 번호 시퀀스 생성
CREATE SEQUENCE SEQ_DEPARTMENT_NO NOCACHE;
-- 학과 데이터
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'공공데이터융합','400');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'경제학과','390');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'국어국문학과','390');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'영어영문학과','470');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'중어중문학과','450');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'법학과','500');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'행정학과','360');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'무역학과','400');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'미디어영상학과','410');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'컴퓨터과학과','420');
INSERT INTO DEPARTMENT VALUES(SEQ_DEPARTMENT_NO.NEXTVAL,'보건환경학과','420');
-- 학과 번호 프라이머리키 설정
ALTER TABLE "DEPARTMENT" ADD CONSTRAINT "DEPARTMENT" PRIMARY KEY (
   "DEPARTMENT_NO"
);
-- 학과 중간 커밋
COMMIT;
--------------------------------------------------------------------------------
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
   "CATEGORY_NO"   NUMBER      NOT NULL
);
-- 게시판 코멘트
COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시판 번호';
COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글 제목';
COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글 내용';
COMMENT ON COLUMN "BOARD"."BOARD_C_DATE" IS '게시글 작성 일자';
COMMENT ON COLUMN "BOARD"."BOARD_U_DATE" IS '게시글 수정일(마지막 수정일)';
COMMENT ON COLUMN "BOARD"."BOARD_COUNT" IS '게시글 조회수';
COMMENT ON COLUMN "BOARD"."BOARD_ST" IS '게시글 삭제 여부(N:비삭제 / Y:삭제 / D:공개)';
COMMENT ON COLUMN "BOARD"."MEMBER_NO" IS '학생:01- / 교수:02- / 관리자:03-';
COMMENT ON COLUMN "BOARD"."CATEGORY_NO" IS '카테고리 번호';
-- 게시판 시퀀스 생성
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE;
-- 게시판 프라이머리키 생성
ALTER TABLE "BOARD" ADD CONSTRAINT "BOARD" PRIMARY KEY (
   "BOARD_NO"
);
-- 게시판 샘플 데이터 생성
-- 관리자(03-2412345)가 작성한 공지사항 500개
BEGIN
   FOR I IN 1..500 LOOP
      INSERT INTO BOARD 
      VALUES( SEQ_BOARD_NO.NEXTVAL,
              SEQ_BOARD_NO.CURRVAL || '번째 게시글',
              SEQ_BOARD_NO.CURRVAL || '번째 게시글 내용 입니다.',
              DEFAULT, NULL, DEFAULT, DEFAULT, '03-2412345', 
              CEIL(DBMS_RANDOM.VALUE(0,1))
      );
   END LOOP;
END;
/
-- 교수(02-2412345)가 작성한 학과공지 500개
BEGIN
   FOR I IN 1..500 LOOP
      INSERT INTO BOARD 
      VALUES( SEQ_BOARD_NO.NEXTVAL,
              SEQ_BOARD_NO.CURRVAL || '번째 게시글',
              SEQ_BOARD_NO.CURRVAL || '번째 게시글 내용 입니다.',
              DEFAULT, NULL, DEFAULT, DEFAULT, '02-2412345', 
              CEIL(DBMS_RANDOM.VALUE(1,2))
      );
   END LOOP;
END;
/
-- 학생(01-2412345)이 작성한 자유게시판 500개
BEGIN
   FOR I IN 1..500 LOOP
      INSERT INTO BOARD 
      VALUES( SEQ_BOARD_NO.NEXTVAL,
              SEQ_BOARD_NO.CURRVAL || '번째 게시글',
              SEQ_BOARD_NO.CURRVAL || '번째 게시글 내용 입니다.',
              DEFAULT, NULL, DEFAULT, DEFAULT, '01-2412345', 
              CEIL(DBMS_RANDOM.VALUE(2,3))
      );
   END LOOP;
END;
/
-- 학생(01-2412345)이 작성한 1:1문의 500개
BEGIN
   FOR I IN 1..500 LOOP
      INSERT INTO BOARD 
      VALUES( SEQ_BOARD_NO.NEXTVAL,
              SEQ_BOARD_NO.CURRVAL || '번째 게시글',
              SEQ_BOARD_NO.CURRVAL || '번째 게시글 내용 입니다.',
              DEFAULT, NULL, DEFAULT, DEFAULT, '01-2412345', 
              CEIL(DBMS_RANDOM.VALUE(3,4))
      );
   END LOOP;
END;
/
-- 관리자(03-2412345)가 작성한 자료실 500개
BEGIN
   FOR I IN 1..500 LOOP
      INSERT INTO BOARD 
      VALUES( SEQ_BOARD_NO.NEXTVAL,
              SEQ_BOARD_NO.CURRVAL || '번째 게시글',
              SEQ_BOARD_NO.CURRVAL || '번째 게시글 내용 입니다.',
              DEFAULT, NULL, DEFAULT, DEFAULT, '03-2412345', 
              CEIL(DBMS_RANDOM.VALUE(4,5))
      );
   END LOOP;
END;
/
-- 게시판 중간 커밋
COMMIT;
--------------------------------------------------------------------------------
-- 댓글 테이블 생성
CREATE TABLE "REPLY" (
   "REPLY_NO"   NUMBER      NOT NULL,
   "REPLY_CONTENT"   VARCHAR2(4000)      NOT NULL,
   "REPLY_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "REPLY_ST"   CHAR(1)   DEFAULT 'N'   NOT NULL,
   "BOARD_NO"   NUMBER      NOT NULL,
   "MEMBER_NO"   VARCHAR2(11)      NOT NULL
);
-- 댓글 코멘트 생성
COMMENT ON COLUMN "REPLY"."REPLY_NO" IS '댓글 번호(시퀀스)';
COMMENT ON COLUMN "REPLY"."REPLY_CONTENT" IS '댓글 내용';
COMMENT ON COLUMN "REPLY"."REPLY_DATE" IS '댓글 작성 날짜';
COMMENT ON COLUMN "REPLY"."REPLY_ST" IS '댓글 삭제 여부(N:노출 / Y:삭제)';
COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '게시판 번호';
COMMENT ON COLUMN "REPLY"."MEMBER_NO" IS '학생:01- / 교수:02- / 관리자:03-';
-- 댓글번호 시퀀스 생성
CREATE SEQUENCE SEQ_REPLY_NO NOCACHE;
-- 댓글 프라이머리키 생성
ALTER TABLE "REPLY" ADD CONSTRAINT "REPLY" PRIMARY KEY (
   "REPLY_NO"
);
-- 댓글 샘플 데이터 생성 (관리자:03-2412345 가 생성함) 3000개의 댓글
BEGIN
   FOR I IN 1..2000 LOOP
      INSERT INTO REPLY
      VALUES(SEQ_REPLY_NO.NEXTVAL, 
            SEQ_REPLY_NO.CURRVAL || '번째 댓글',
            DEFAULT, DEFAULT,
             CEIL(DBMS_RANDOM.VALUE(0,2500)),
             '03-2412345');
   END LOOP;
END;
/
-- 댓글 중간 커밋
COMMIT;
--------------------------------------------------------------------------------
-- 등록금 테이블 생성
CREATE TABLE "PAY" (
   "PAY_CODE"   NUMBER      NOT NULL,
   "PAY_METHOD"   VARCHAR2(50)      NOT NULL,
   "PAY_ACOUNT"   VARCHAR2(50)      NOT NULL,
   "PAY_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "MEMBER_NO"   VARCHAR2(11)      NOT NULL
);
-- 등록금 코멘트 생성
COMMENT ON COLUMN "PAY"."PAY_CODE" IS '결제번호(시퀀스)';
COMMENT ON COLUMN "PAY"."PAY_METHOD" IS '결제방법';
COMMENT ON COLUMN "PAY"."PAY_ACOUNT" IS '결제 금액';
COMMENT ON COLUMN "PAY"."PAY_DATE" IS '결제일';
COMMENT ON COLUMN "PAY"."MEMBER_NO" IS '학생:01-';
-- 등록금 시퀀스 생성
CREATE SEQUENCE SEQ_PAY_CODE NOCACHE;
-- 등록금 프라이머리키 생성
ALTER TABLE "PAY" ADD CONSTRAINT "PAY" PRIMARY KEY (
   "PAY_CODE"
);
-- 등록금 중간 커밋
COMMIT;
--------------------------------------------------------------------------------
-- 게시판 파일 카테고리 테이블 생성
CREATE TABLE "BOARD_FILE_CATEGORY" (
   "BOARD_FILE_CATEGORY_NO"   NUMBER      NOT NULL,
   "BOARD_FILE_CATEGORY_NAME"   VARCHAR2(150)      NOT NULL
);
-- 게시판 파일 카테고리 코멘트
COMMENT ON COLUMN "BOARD_FILE_CATEGORY"."BOARD_FILE_CATEGORY_NO" IS '게시판용 파일 카테고리 번호(1:이미지 / 2:첨부파일)';
COMMENT ON COLUMN "BOARD_FILE_CATEGORY"."BOARD_FILE_CATEGORY_NAME" IS '게시판용 파일 카테고리 이름(이미지 / 첨부파일)';
-- 게시판 파일 카테고리 데이터
INSERT INTO BOARD_FILE_CATEGORY VALUES(1,'이미지');
INSERT INTO BOARD_FILE_CATEGORY VALUES(2,'첨부파일');
-- 게시판 파일 카테고리 프라이머리키 생성
ALTER TABLE "BOARD_FILE_CATEGORY" ADD CONSTRAINT "BOARD_FILE_CATEGORY" PRIMARY KEY (
   "BOARD_FILE_CATEGORY_NO"
);
-- 게시판 파일 카테고리 중간 커밋
COMMIT;
--------------------------------------------------------------------------------
-- 게시판 파일 테이블 생성
CREATE TABLE "BOARD_FILE" (
   "BOARD_FILE_NO"   NUMBER      NOT NULL,
   "BOARD_FILE_PATH"   VARCHAR2(300)      NOT NULL,
   "BOARD_FILE_ORIGINAL"   VARCHAR2(300)      NOT NULL,
   "BOARD_FILE_RENAME"   VARCHAR2(300)      NOT NULL,
   "BOARD_FILE_CATEGORY_NO"   NUMBER      NOT NULL,
   "BOARD_NO"   NUMBER      NOT NULL
);
-- 게시판 파일 코멘트
COMMENT ON COLUMN "BOARD_FILE"."BOARD_FILE_NO" IS '게시판 파일 번호';
COMMENT ON COLUMN "BOARD_FILE"."BOARD_FILE_PATH" IS '게시판 파일 경로';
COMMENT ON COLUMN "BOARD_FILE"."BOARD_FILE_ORIGINAL" IS '게시판 파일 이름';
COMMENT ON COLUMN "BOARD_FILE"."BOARD_FILE_RENAME" IS '게시판 파일 변경명';
COMMENT ON COLUMN "BOARD_FILE"."BOARD_FILE_CATEGORY_NO" IS '게시판용 파일 카테고리 번호';
COMMENT ON COLUMN "BOARD_FILE"."BOARD_NO" IS '게시판 번호';
-- 게시판 파일 시퀀스 생성
CREATE SEQUENCE SEQ_BOARD_FILE_NO NOCACHE;
-- 게시판 파일 프라이머리키 생성
ALTER TABLE "BOARD_FILE" ADD CONSTRAINT "BOARD_FILE" PRIMARY KEY (
   "BOARD_FILE_NO"
);
-- 게시판 파일 중간 커밋
COMMIT;
--------------------------------------------------------------------------------
-- 교과목 테이블 생성
CREATE TABLE "CLASS" (
   "CLASS_NO"   NUMBER      NOT NULL,
   "CLASS_NM"   VARCHAR2(50)      NOT NULL,
   "CLASS_POINT"   NUMBER      NOT NULL,
   "CLASS_MAX"   NUMBER      NOT NULL,
   "CLASS_GRADE"   NUMBER      NOT NULL,
   "CLASS_TERM"   NUMBER      NOT NULL,
   "CLASS_DAY"   VARCHAR2(3)      NOT NULL,
   "CLASS_START"   NUMBER      NOT NULL,
   "CLASS_END"   NUMBER      NOT NULL,
   "DEPARTMENT_NO"   NUMBER      NOT NULL,
   "MEMBER_NO"   VARCHAR2(11)      NOT NULL
);
-- 교과목 코멘트 생성
COMMENT ON COLUMN "CLASS"."CLASS_NO" IS '과목번호(시퀀스)';
COMMENT ON COLUMN "CLASS"."CLASS_NM" IS '과목명';
COMMENT ON COLUMN "CLASS"."CLASS_POINT" IS '과목학점(전공:3,교양:2)';
COMMENT ON COLUMN "CLASS"."CLASS_MAX" IS '수강정원';
COMMENT ON COLUMN "CLASS"."CLASS_GRADE" IS '과목 학년';
COMMENT ON COLUMN "CLASS"."CLASS_TERM" IS '과목 학기';
COMMENT ON COLUMN "CLASS"."CLASS_DAY" IS '과목요일(월,화,수,목,금)';
COMMENT ON COLUMN "CLASS"."CLASS_START" IS '과목 시작 시간';
COMMENT ON COLUMN "CLASS"."CLASS_END" IS '과목 종료 시간';
COMMENT ON COLUMN "CLASS"."DEPARTMENT_NO" IS '학과 코드';
COMMENT ON COLUMN "CLASS"."MEMBER_NO" IS '교수:02-';
-- 교과목 시퀀스 생성
CREATE SEQUENCE SEQ_CLASS_NO NOCACHE;
-- 교과목 프라이머리키 생성
ALTER TABLE "CLASS" ADD CONSTRAINT "CLASS" PRIMARY KEY (
   "CLASS_NO"
);

-- 교과목 중간 커밋
COMMIT;
--------------------------------------------------------------------------------
--수강 테이블 생성
CREATE TABLE "LECTURE" (
   "CLASS_NO"   NUMBER      NOT NULL,
   "MEMBER_NO"   VARCHAR2(11)      NOT NULL,
   "LECTURE_POINT"   NUMBER   DEFAULT -1   NOT NULL,
   "LECTURE_GRADE"   NUMBER      NOT NULL,
   "LECTURE_TERM"   NUMBER      NOT NULL
);
-- 수강 코멘트
COMMENT ON COLUMN "LECTURE"."CLASS_NO" IS '과목번호(시퀀스)';
COMMENT ON COLUMN "LECTURE"."MEMBER_NO" IS '학생:01- / 교수:02- / 관리자:03-';
COMMENT ON COLUMN "LECTURE"."LECTURE_POINT" IS '수강한 학생 성적';

-- 수강 샘플데이터(처리중)----------------------------------------------------------------
--INSERT INTO LECTURE VALUES(1,'01-2412345', DEFAULT, 1, 1); -- 1번과목 | 01-2412345학생 성적(?) 1학년 1학기
--INSERT INTO LECTURE VALUES(2,'01-2412345', DEFAULT, 1, 1); -- 2번과목 | 01-2412345학생 성적(?) 1학년 1학기
--INSERT INTO LECTURE VALUES(3,'01-2412345', DEFAULT, 1, 1); -- 3번과목 | 01-2412345학생 성적(?) 1학년 1학기
--INSERT INTO LECTURE VALUES(4,'01-2412345', DEFAULT, 1, 1); -- 4번과목 | 01-2412345학생 성적(?) 1학년 1학기
--INSERT INTO LECTURE VALUES(5,'01-2412345', DEFAULT, 1, 1); -- 5번과목 | 01-2412345학생 성적(?) 1학년 1학기
--
--INSERT INTO LECTURE VALUES(1,'01-2412346', DEFAULT, 1, 1); -- 1번과목 | 01-2412346학생 성적(?) 2학년 1학기

-- 수강 중간 커밋
COMMIT;
--------------------------------------------------------------------------------
-- 과목 평가 테이블 생성
CREATE TABLE "CLASS_LATE" (
	"CLASS_LATE_NO"	NUMBER		NOT NULL,
	"CLASS_LATE_CONTENT"	VARCHAR(2000)		NOT NULL,
	"CLASS_LATE_LIKE"	NUMBER		NOT NULL,
	"CLASS_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	VARCHAR2(11)		NOT NULL
);
-- 과목 평가 코멘트
COMMENT ON COLUMN "CLASS_LATE"."CLASS_LATE_NO" IS '평가 번호(시퀀스)';
COMMENT ON COLUMN "CLASS_LATE"."CLASS_LATE_CONTENT" IS '평가 내용';
COMMENT ON COLUMN "CLASS_LATE"."CLASS_LATE_LIKE" IS '평가 만족도(5: 매우만족 / 1:매우불만족)';
COMMENT ON COLUMN "CLASS_LATE"."CLASS_NO" IS '평가된 과목번호';
COMMENT ON COLUMN "CLASS_LATE"."MEMBER_NO" IS '학생:01-';
-- 과목 평가 시퀀스 생성
CREATE SEQUENCE SEQ_LATE_NO NOCACHE;
-- 과목 평가 프라이머리키
ALTER TABLE "CLASS_LATE" ADD CONSTRAINT "PK_CLASS_LATE" PRIMARY KEY ("CLASS_LATE_NO");
-- 과목 중간 커밋
COMMIT;
--------------------------------------------------------------------------------
-- 과제 테이블 생성
CREATE TABLE "TASK"(
   "TASK_NO"            NUMBER            NOT NULL,
   "TASK_ROUTE"         VARCHAR2(300)     NOT NULL,
   "TASK_DATE"          DATE DEFAULT       SYSDATE,
   "CLASS_NO"           NUMBER            NOT NULL,
   "MEMBER_NO"          VARCHAR2(11)      NOT NULL
);
-- 과제 프라이머리키 생성
ALTER TABLE "TASK" ADD CONSTRAINT "PK_TASK" PRIMARY KEY ("TASK_NO");
-- 과제 코멘트 생성
COMMENT ON COLUMN "TASK"."TASK_NO" IS '과제 번호(시퀀스)';
COMMENT ON COLUMN "TASK"."TASK_ROUTE" IS '과제물 경로(과제물 등록 시)';
COMMENT ON COLUMN "TASK"."TASK_DATE" IS '과제 일자(제출기한)';
COMMENT ON COLUMN "TASK"."CLASS_NO" IS '교과목 번호';
COMMENT ON COLUMN "TASK"."MEMBER_NO" IS '과제를 등록한 교수 번호(02-)';
-- 과제 시퀀스 생성
CREATE SEQUENCE SEQ_TASK_NO NOCACHE;
-- 과제 중간 커밋
COMMIT;
--------------------------------------------------------------------------------
-- 파일뭉치 카테고리 테이블 생성
CREATE TABLE "FILEZIP_CATEGORY" (
   "FKIND_NO"   NUMBER      NOT NULL,
   "FKIND_NAME"   VARCHAR2(20)      NOT NULL
);
-- 파일뭉치 카테고리 코멘트 생성
COMMENT ON COLUMN "FILEZIP_CATEGORY"."FKIND_NO" IS '파일 종류 번호';
COMMENT ON COLUMN "FILEZIP_CATEGORY"."FKIND_NAME" IS '파일 종류 이름(1.학생증 / 2.증명서A / 3.증명서B / 4.증명서C / 5.과제)';
-- 파일뭉치 카테고리 프라이머리키 생성
ALTER TABLE "FILEZIP_CATEGORY" ADD CONSTRAINT "PK_FKIND_NO" PRIMARY KEY ("FKIND_NO");
-- 파일뭉치 카테고리 데이터 생성
INSERT INTO FILEZIP_CATEGORY VALUES(1,'학생증');
INSERT INTO FILEZIP_CATEGORY VALUES(2,'증명서A');
INSERT INTO FILEZIP_CATEGORY VALUES(3,'증명서B');
INSERT INTO FILEZIP_CATEGORY VALUES(4,'증명서C');
INSERT INTO FILEZIP_CATEGORY VALUES(5,'과제');
-- 파일뭉치 카테고리 중간 커밋
COMMIT;
--------------------------------------------------------------------------------
-- 파일뭉치 테이블 생성
CREATE TABLE "FILEZIP" (
   "FILE_NO"   NUMBER      NOT NULL,
   "FILE_PATH"   VARCHAR2(300)      NOT NULL,
   "FILE_NAME"   VARCHAR2(30)      NOT NULL,
   "FILE_RENAME"   VARCHAR2(30)      NOT NULL,
   "FKIND_NO"   NUMBER      NOT NULL,
   "MEMBER_NO"   VARCHAR2(11)      NOT NULL,
   "CLASS_NO"    NUMBER            NOT NULL
);
-- 파일뭉치 코멘트 생성
COMMENT ON COLUMN "FILEZIP"."FILE_NO" IS '파일 번호(시퀀스)';
COMMENT ON COLUMN "FILEZIP"."FILE_PATH" IS '파일 경로';
COMMENT ON COLUMN "FILEZIP"."FILE_NAME" IS '파일 원본 이름';
COMMENT ON COLUMN "FILEZIP"."FILE_RENAME" IS '파일 변경 이름';
COMMENT ON COLUMN "FILEZIP"."FKIND_NO" IS '파일 종류 번호';
COMMENT ON COLUMN "FILEZIP"."MEMBER_NO" IS '학생:01- / 교수:02- / 관리자:03-';
COMMENT ON COLUMN "FILEZIP"."CLASS_NO" IS '교과목 번호';
-- 파일뭉치 시퀀스
CREATE SEQUENCE SEQ_FILE_NO NOCACHE;
-- 파일뭉치 프라이머리키 생성
ALTER TABLE "FILEZIP" ADD CONSTRAINT "PK_FILE_NO" PRIMARY KEY ("FILE_NO");
-- 파일뭉치 중간 커밋
COMMIT;
--------------------------------------------------------------------------------
-- 메세지 테이블
CREATE TABLE "MESSAGE" (
	"MESSAGE_NO"	NUMBER		NOT NULL,
	"MESSAGE_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"MESSAGE_SEND_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"CHATTING_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	VARCHAR2(11)		NOT NULL
);

CREATE SEQUENCE SEQ_MESSAGE_NO NOCACHE; -- 메세지 번호 시퀀스
ALTER TABLE "MESSAGE" ADD CONSTRAINT "PK_MESSAGE_NO" PRIMARY KEY ("MESSAGE_NO");

COMMENT ON COLUMN "MESSAGE"."MESSAGE_NO" IS '메세지 번호';
COMMENT ON COLUMN "MESSAGE"."MESSAGE_CONTENT" IS '메세지 내용';
COMMENT ON COLUMN "MESSAGE"."MESSAGE_SEND_DATE" IS '메세지 보낸 시간';
COMMENT ON COLUMN "MESSAGE"."CHATTING_NO" IS '채팅방 번호';
COMMENT ON COLUMN "MESSAGE"."MEMBER_NO" IS '학생:01-';

-- 채팅 테이블
CREATE TABLE "CHATTING" (
	"CHATTING_NO"	NUMBER		NOT NULL,
	"CHATTING_CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MEMBER_NO"	VARCHAR2(11)		NOT NULL
);

CREATE SEQUENCE SEQ_CHATTING_NO NOCACHE; -- 채팅방 번호 시퀀스
ALTER TABLE "CHATTING" ADD CONSTRAINT "PK_CHATTING_NO" PRIMARY KEY ("CHATTING_NO");

COMMENT ON COLUMN "CHATTING"."CHATTING_NO" IS '채팅방 번호';
COMMENT ON COLUMN "CHATTING"."CHATTING_CREATE_DATE" IS '채팅방 최초 생성일';
COMMENT ON COLUMN "CHATTING"."MEMBER_NO" IS '처음 채팅방을 만든 1인';
COMMIT;

---------------------- FOREIGN KEY 설정은 마지막에 처리 ---------------------------
-- 회원 테이블과 학과 테이블 간의 외래키 설정
ALTER TABLE "MEMBER" 
ADD CONSTRAINT "FK_DEPARTMENT_NO" 
FOREIGN KEY ("DEPARTMENT_NO") 
REFERENCES "DEPARTMENT" ("DEPARTMENT_NO");
-- 게시판 테이블과 회원 테이블 간의 외래키 설정
ALTER TABLE "BOARD" 
ADD CONSTRAINT "FK_MEMBER_NO" 
FOREIGN KEY ("MEMBER_NO") 
REFERENCES "MEMBER" ("MEMBER_NO");
-- 게시판 테이블과 카테고리 테이블 간의 외래키 설정
ALTER TABLE "BOARD" 
ADD CONSTRAINT "FK_CATEGORY_NO" 
FOREIGN KEY ("CATEGORY_NO") 
REFERENCES "CATEGORY" ("CATEGORY_NO");
-- 댓글 테이블과 게시판 테이블 간의 외래키 설정
ALTER TABLE "REPLY" 
ADD CONSTRAINT "FK_BOARD_NO" 
FOREIGN KEY ("BOARD_NO") 
REFERENCES "BOARD" ("BOARD_NO");
-- 댓글 테이블과 회원 테이블 간의 외래키 설정
ALTER TABLE "REPLY" 
ADD CONSTRAINT "FK_REPLY_MEMBER_NO" 
FOREIGN KEY ("MEMBER_NO") 
REFERENCES "MEMBER" ("MEMBER_NO");
-- 등록금 테이블과 회원 테이블 간의 외래키 설정
ALTER TABLE "PAY" 
ADD CONSTRAINT "FK_PAY_MEMBER_NO" 
FOREIGN KEY ("MEMBER_NO") 
REFERENCES "MEMBER" ("MEMBER_NO");
-- 게시판 파일과 게시판 파일 카테고리 간의 외래키 설정
ALTER TABLE "BOARD_FILE"
ADD CONSTRAINT "FK_BOARD_FILE_CATEGORY_NO" 
FOREIGN KEY ("BOARD_FILE_CATEGORY_NO") 
REFERENCES "CATEGORY" ("CATEGORY_NO");
-- 게시판 파일과 게시판 간의 외래키 설정
ALTER TABLE "BOARD_FILE"
ADD CONSTRAINT "FK_BOARD_NO_FILE" 
FOREIGN KEY ("BOARD_NO") 
REFERENCES "BOARD" ("BOARD_NO");
-- 교과목과 회원 테이블 간의 외래키 설정
ALTER TABLE "CLASS"
ADD CONSTRAINT "FK_MEMBER_NO_CLASS" 
FOREIGN KEY ("MEMBER_NO") 
REFERENCES "MEMBER" ("MEMBER_NO");
-- 교과목과 학과 테이블 간의 외래키 설정
ALTER TABLE "CLASS"
ADD CONSTRAINT "FK_DEPARTMENT_NO_CLASS" 
FOREIGN KEY ("DEPARTMENT_NO") 
REFERENCES "DEPARTMENT" ("DEPARTMENT_NO");
-- 수강과 교과목 테이블 간의 외래키 설정
ALTER TABLE "LECTURE" 
ADD CONSTRAINT "FK_CLASS_TO_LECTURE_1" 
FOREIGN KEY ("CLASS_NO")
REFERENCES "CLASS" ("CLASS_NO");
-- 수강과 회원 테이블 간의 외래키 설정
ALTER TABLE "LECTURE"
ADD CONSTRAINT "FK_MEMBER_TO_LECTURE_1" 
FOREIGN KEY ("MEMBER_NO")
REFERENCES "MEMBER" ("MEMBER_NO");
-- 과목평가와 교과목 테이블 간의 외래키 설정
ALTER TABLE "CLASS_LATE"
ADD CONSTRAINT "FK_CLASS_TO_CLASS_LATE" 
FOREIGN KEY ("CLASS_NO")
REFERENCES "CLASS" ("CLASS_NO");
-- 과목평가와 회원 테이블 간의 외래키 설정
ALTER TABLE "CLASS_LATE"
ADD CONSTRAINT "FK_CLASS_TO_MEMBER_NO" 
FOREIGN KEY ("MEMBER_NO")
REFERENCES "MEMBER" ("MEMBER_NO");
-- 과제와 교과목 테이블 간의 외래키 설정
ALTER TABLE "TASK" 
ADD CONSTRAINT "FK_CLASS_TO_TASK_1" 
FOREIGN KEY ("CLASS_NO")
REFERENCES "CLASS" ("CLASS_NO");
-- 과제와 회원 테이블 간의 외래키 설정
ALTER TABLE "TASK" 
ADD CONSTRAINT "FK_MEMBER_TO_TASK_1" 
FOREIGN KEY ("MEMBER_NO")
REFERENCES "MEMBER" ("MEMBER_NO");
-- 파일뭉치과 파일뭉치카테고리 간의 외래키 설정
ALTER TABLE "FILEZIP" 
ADD CONSTRAINT "FK_FILEZIP_CATEGORY_TO_FILEZIP_1" 
FOREIGN KEY ("FKIND_NO")
REFERENCES "FILEZIP_CATEGORY" ("FKIND_NO");
-- 파일뭉치와 회원 테이블 간의 외래키 설정
ALTER TABLE "FILEZIP" 
ADD CONSTRAINT "FK_MEMBER_TO_FILEZIP_1" 
FOREIGN KEY ("MEMBER_NO")
REFERENCES "MEMBER" ("MEMBER_NO");
-- 파일뭉치와 교과목 테이블 간의 외래키 설정
ALTER TABLE "FILEZIP" 
ADD CONSTRAINT "FK_CLASS_TO_FILEZIP_1" 
FOREIGN KEY ("CLASS_NO")
REFERENCES "CLASS" ("CLASS_NO");
-- 채팅과 멤버 테이블간의 외래키 설정
ALTER TABLE "CHATTING" 
ADD CONSTRAINT "FK_CHATTING_TO_MEMBER_1" 
FOREIGN KEY ("MEMBER_NO")
REFERENCES "MEMBER" ("MEMBER_NO");
-- 메세지와 채팅 테이블간의 외래키 설정
ALTER TABLE "MESSAGE" 
ADD CONSTRAINT "FK_MESSAGE_TO_MEMBER_1" 
FOREIGN KEY ("MEMBER_NO")
REFERENCES "MEMBER" ("MEMBER_NO");

ALTER TABLE "MESSAGE" 
ADD CONSTRAINT "FK_MESSAGE_TO_CHATTING_1" 
FOREIGN KEY ("CHATTING_NO")
REFERENCES "CHATTING" ("CHATTING_NO");

COMMIT;

------------------------------------------------------------샘플데이터-----------
-- 교과목 --
INSERT INTO "CLASS" VALUES(
    1,'JAVA', 3, 40, 1, 1, '월', 1, 2, 1, '02-2412345'
);
INSERT INTO "CLASS" VALUES(
    2,'HTML', 3, 35, 1, 1, '화', 3, 4, 1, '02-2412345'
);
INSERT INTO "CLASS" VALUES(
    3,'Spring', 3, 30, 1, 1, '월', 3, 4, 1, '02-2412345'
);
INSERT INTO "CLASS" VALUES(
    4,'CSS', 2, 36, 1, 1, '화', 1, 2, 1, '02-2412345'
);
INSERT INTO "CLASS" VALUES(
    5,'React', 3, 29, 1, 1, '월', 5, 8, 1, '02-2412345'
);

COMMIT;
---------------------- FOREIGN KEY 설정은 마지막에 처리 ---------------------------



--------------------- 아래는 이전에 작성된 SQL문 --------------
CREATE TABLE "MEMBER" (
	"MEMBER_NO"	VARCHAR2(11)		NOT NULL,
	"MEMBER_PW"	VARCHAR2(50)		NULL,
	"MEMBER_ADDR"	VARCHAR2(150)		NULL,
	"MEMBER_EMAIL"	VARCHAR2(50)		NULL,
	"MEMBER_PHONE"	CHAR(11)		NULL,
	"MEMBER_GEN"	CHAR(1)		NULL,
	"MEMBER_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MEMBER_GRADE"	NUMBER		NULL,
	"MEMBER_TERM"	NUMBER		NULL,
	"MEMBER_STATUS"	CHAR(1)	DEFAULT N	NOT NULL,
	"MEMBER_NAME"	VARCHAR2(20)		NOT NULL,
	"DEPARTMENT_NO"	NUMBER		NOT NULL,
	"MEMBER_SSN"	VARCHAR2(30)		NOT NULL,
	"MEMBER_PROFILE"	VARCHAR2(300)		NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '학생:01- / 교수:02- / 관리자:03-';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원 비밀번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_ADDR" IS '회원 주소';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원 이메일';

COMMENT ON COLUMN "MEMBER"."MEMBER_PHONE" IS '회원 전화번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_GEN" IS '회원 성별';

COMMENT ON COLUMN "MEMBER"."MEMBER_DATE" IS '회원 가입 일자';

COMMENT ON COLUMN "MEMBER"."MEMBER_GRADE" IS '학생은 회원 가입 시 1로 삽입';

COMMENT ON COLUMN "MEMBER"."MEMBER_TERM" IS '학생은 회원 가입 시 1로 삽입';

COMMENT ON COLUMN "MEMBER"."MEMBER_STATUS" IS '재적 상태(Y:휴학중 / N:재학중 / P:졸업 / D:중퇴), 교수와 관리자는 N고정';

COMMENT ON COLUMN "MEMBER"."MEMBER_NAME" IS '회원 이름';

COMMENT ON COLUMN "MEMBER"."DEPARTMENT_NO" IS '학과 코드';

COMMENT ON COLUMN "MEMBER"."MEMBER_SSN" IS '회원 생년월일';

COMMENT ON COLUMN "MEMBER"."MEMBER_PROFILE" IS '회원 프로필 이미지';

CREATE TABLE "DEPARTMENT" (
	"DEPARTMENT_NO"	NUMBER		NOT NULL,
	"DEPARTMENT_NAME"	VARCHAR2(30)		NOT NULL,
	"DEPARTMENT_PRICE"	NUMBER	DEFAULT 100	NOT NULL
);

COMMENT ON COLUMN "DEPARTMENT"."DEPARTMENT_NO" IS '학과 코드';

COMMENT ON COLUMN "DEPARTMENT"."DEPARTMENT_NAME" IS '학과 이름';

COMMENT ON COLUMN "DEPARTMENT"."DEPARTMENT_PRICE" IS '학과 등록금';

CREATE TABLE "BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(150)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"BOARD_C_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"BOARD_U_DATE"	DATE		NULL,
	"BOARD_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"BOARD_ST"	CHAR(1)	DEFAULT N	NOT NULL,
	"MEMBER_NO"	VARCHAR2(11)		NOT NULL,
	"CATEGOTY_NO"	NUMBER		NOT NULL
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

CREATE TABLE "CLASS" (
	"CLASS_NO"	NUMBER		NOT NULL,
	"CLASS_NM"	VARCHAR2(50)		NOT NULL,
	"CLASS_POINT"	NUMBER		NOT NULL,
	"CLASS_MAX"	NUMBER		NOT NULL,
	"CLASS_GRADE"	NUMBER		NOT NULL,
	"CLASS_TREM"	NUMBER		NOT NULL,
	"CLASS_DAY"	VARCHAR2(3)		NOT NULL,
	"CLASS_START"	NUMBER		NOT NULL,
	"CLASS_END"	NUMBER		NOT NULL,
	"DEPARTMENT_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	VARCHAR2(11)		NOT NULL
);

COMMENT ON COLUMN "CLASS"."CLASS_NO" IS '과목번호(시퀀스)';

COMMENT ON COLUMN "CLASS"."CLASS_NM" IS '과목명';

COMMENT ON COLUMN "CLASS"."CLASS_POINT" IS '과목학점(전공:3,교양:2)';

COMMENT ON COLUMN "CLASS"."CLASS_MAX" IS '수강정원';

COMMENT ON COLUMN "CLASS"."CLASS_GRADE" IS '과목 학년';

COMMENT ON COLUMN "CLASS"."CLASS_TREM" IS '과목 학기';

COMMENT ON COLUMN "CLASS"."CLASS_DAY" IS '과목요일(월,화,수,목,금)';

COMMENT ON COLUMN "CLASS"."CLASS_START" IS '과목 시작 시간';

COMMENT ON COLUMN "CLASS"."CLASS_END" IS '과목 종료 시간';

COMMENT ON COLUMN "CLASS"."DEPARTMENT_NO" IS '학과 코드';

COMMENT ON COLUMN "CLASS"."MEMBER_NO" IS '교수:02-';

CREATE TABLE "CATEGORY" (
	"CATEGORY_NO"	NUMBER		NOT NULL,
	"CATEGORY_NAME"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "CATEGORY"."CATEGORY_NO" IS '카테고리 번호';

COMMENT ON COLUMN "CATEGORY"."CATEGORY_NAME" IS '카테고리 이름';

CREATE TABLE "FILEZIP" (
	"FILE_NO"	NUMBER		NOT NULL,
	"FILE_PATH"	VARCHAR2(300)		NOT NULL,
	"FILE_NAME"	VARCHAR2(30)		NOT NULL,
	"FILE_RENAME"	VARCHAR2(30)		NOT NULL,
	"FKIND_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	VARCHAR2(11)		NULL,
	"TASK_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "FILEZIP"."FILE_NO" IS '파일 번호';

COMMENT ON COLUMN "FILEZIP"."FILE_PATH" IS '파일 경로';

COMMENT ON COLUMN "FILEZIP"."FILE_NAME" IS '파일 원본 이름';

COMMENT ON COLUMN "FILEZIP"."FILE_RENAME" IS '파일 변경 이름';

COMMENT ON COLUMN "FILEZIP"."FKIND_NO" IS '파일 종류 번호';

COMMENT ON COLUMN "FILEZIP"."MEMBER_NO" IS '학생:01-(증명서,  과제 제출)';

COMMENT ON COLUMN "FILEZIP"."TASK_NO" IS '과제 번호 (과제물일 경우 사용)';

CREATE TABLE "MESSAGE" (
	"MESSAGE_NO"	NUMBER		NOT NULL,
	"MESSAGE_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"MESSAGE_ST"	CHAR(1)	DEFAULT N	NOT NULL,
	"MESSAGE_SEND_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"CHATTING_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	VARCHAR2(11)		NOT NULL
);

COMMENT ON COLUMN "MESSAGE"."MESSAGE_NO" IS '메세지 번호';

COMMENT ON COLUMN "MESSAGE"."MESSAGE_CONTENT" IS '메세지 내용';

COMMENT ON COLUMN "MESSAGE"."MESSAGE_ST" IS '메세지 읽음 여부(Y:읽음 / N:안읽음)';

COMMENT ON COLUMN "MESSAGE"."MESSAGE_SEND_DATE" IS '메세지 보낸 시간';

COMMENT ON COLUMN "MESSAGE"."CHATTING_NO" IS '채팅방 번호';

COMMENT ON COLUMN "MESSAGE"."MEMBER_NO" IS '학생:01-';

CREATE TABLE "CHATTING" (
	"CHATTING_NO"	NUMBER		NOT NULL,
	"CHATTING_CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MEMBER_NO"	VARCHAR2(11)		NOT NULL
);

COMMENT ON COLUMN "CHATTING"."CHATTING_NO" IS '채팅방 번호';

COMMENT ON COLUMN "CHATTING"."CHATTING_CREATE_DATE" IS '채팅방 최초 생성일';

COMMENT ON COLUMN "CHATTING"."MEMBER_NO" IS '처음 채팅방을 만든 1인';

CREATE TABLE "IMG" (
	"IMG_NO"	NUMBER		NOT NULL,
	"IMG_PATH"	VARCHAR2(300)		NOT NULL,
	"IMG_NAME"	VARCHAR2(30)		NOT NULL,
	"IMG_RENAME"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "IMG"."IMG_NO" IS '이미지 번호';

COMMENT ON COLUMN "IMG"."IMG_PATH" IS '이미지 경로';

COMMENT ON COLUMN "IMG"."IMG_NAME" IS '이미지 원본 이름';

COMMENT ON COLUMN "IMG"."IMG_RENAME" IS '이미지 변경 이름';

CREATE TABLE "FILEZIP_CATAGORY" (
	"FKIND_NO"	NUMBER		NOT NULL,
	"FKIND_NAME"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "FILEZIP_CATAGORY"."FKIND_NO" IS '파일 종류 번호';

COMMENT ON COLUMN "FILEZIP_CATAGORY"."FKIND_NAME" IS '파일 종류 이름(1~5)';

CREATE TABLE "TASK" (
	"TASK_NO"	NUMBER		NOT NULL,
	"TASK_ROUTE"	VARCHAR2(300)		NOT NULL,
	"TASK_DATE"	DATE		NULL,
	"CLASS_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	VARCHAR2(11)		NOT NULL
);

COMMENT ON COLUMN "TASK"."TASK_NO" IS '과제 번호';

COMMENT ON COLUMN "TASK"."TASK_ROUTE" IS '과제물 경로(과제물 등록 시)';

COMMENT ON COLUMN "TASK"."TASK_DATE" IS '과제 일자';

COMMENT ON COLUMN "TASK"."CLASS_NO" IS '과목번호(시퀀스)';

COMMENT ON COLUMN "TASK"."MEMBER_NO" IS '교수:02- (과제물 등록자)';

CREATE TABLE "LECTURE" (
	"CLASS_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	VARCHAR2(11)		NOT NULL,
	"LECTURE_POINT"	NUMBER	DEFAULT -1	NOT NULL,
	"LECTURE_GRADE"	NUMBER		NOT NULL,
	"LECTURE_TERM"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "LECTURE"."CLASS_NO" IS '과목번호(시퀀스)';

COMMENT ON COLUMN "LECTURE"."MEMBER_NO" IS '학생:01- / 교수:02- / 관리자:03-';

COMMENT ON COLUMN "LECTURE"."LECTURE_POINT" IS '수강한 학생 성적';

CREATE TABLE "REQUEST" (
	"REQUEST_NO"	NUMBER		NOT NULL,
	"REQUEST_CONTENT"	VARCHAR2(2000)		NOT NULL,
	"REQUEST_REASON"	VARCHAR2(150)		NOT NULL,
	"MEMBER_NO"	VARCHAR2(11)		NOT NULL
);

COMMENT ON COLUMN "REQUEST"."REQUEST_NO" IS '학적 요청 번호(시퀀스)';

COMMENT ON COLUMN "REQUEST"."REQUEST_CONTENT" IS '학적 요청 내용(Y:휴학 / N:재학 / D:자퇴)';

COMMENT ON COLUMN "REQUEST"."REQUEST_REASON" IS '학적 요청 사유(글자수 한글 기준 50자)';

COMMENT ON COLUMN "REQUEST"."MEMBER_NO" IS '학생:01- / 교수:02- / 관리자:03-';

CREATE TABLE "CLASS_LATE" (
	"CLASS_LATE_NO"	NUMBER		NOT NULL,
	"CLASS_LATE_CONTENT"	VARCHAR(2000)		NOT NULL,
	"CLASS_LATE_LIKE"	NUMBER		NOT NULL,
	"CLASS_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	VARCHAR2(11)		NOT NULL
);

COMMENT ON COLUMN "CLASS_LATE"."CLASS_LATE_NO" IS '평가 번호(시퀀스)';

COMMENT ON COLUMN "CLASS_LATE"."CLASS_LATE_CONTENT" IS '평가 내용';

COMMENT ON COLUMN "CLASS_LATE"."CLASS_LATE_LIKE" IS '평가 만족도(5: 매우만족 / 1:매우불만족)';

COMMENT ON COLUMN "CLASS_LATE"."CLASS_NO" IS '과목번호(시퀀스)';

COMMENT ON COLUMN "CLASS_LATE"."MEMBER_NO" IS '학생:01- / 교수:02- / 관리자:03-';

CREATE TABLE "REPLY" (
	"REPLY_NO"	NUMBER		NOT NULL,
	"REPLY_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"REPLY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REPLY_ST"	CHAR(1)	DEFAULT N	NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	VARCHAR2(11)		NOT NULL
);

COMMENT ON COLUMN "REPLY"."REPLY_NO" IS '댓글 번호(시퀀스)';

COMMENT ON COLUMN "REPLY"."REPLY_CONTENT" IS '댓글 내용';

COMMENT ON COLUMN "REPLY"."REPLY_DATE" IS '댓글 작성 날짜';

COMMENT ON COLUMN "REPLY"."REPLY_ST" IS '댓글 삭제 여부(N:노출 / Y:삭제)';

COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '게시판 번호';

COMMENT ON COLUMN "REPLY"."MEMBER_NO" IS '학생:01- / 교수:02- / 관리자:03-';

CREATE TABLE "PAY" (
	"PAY_CODE"	NUMBER		NOT NULL,
	"PAY_METHOD"	VARCHAR2(50)		NOT NULL,
	"PAY_ACOUNT"	VARCHAR2(50)		NOT NULL,
	"PAY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MEMBER_NO"	VARCHAR2(11)		NOT NULL
);

COMMENT ON COLUMN "PAY"."PAY_CODE" IS '결제번호(시퀀스)';

COMMENT ON COLUMN "PAY"."PAY_METHOD" IS '결제방법';

COMMENT ON COLUMN "PAY"."PAY_ACOUNT" IS '결제 금액';

COMMENT ON COLUMN "PAY"."PAY_DATE" IS '결제일';

COMMENT ON COLUMN "PAY"."MEMBER_NO" IS '학생:01- / 교수:02- / 관리자:03-';

CREATE TABLE "BOARD_FILE" (
	"BOARD_FILE_NO"	NUMBER		NOT NULL,
	"BOARD_FILE_PATH"	VARCHAR2(300)		NOT NULL,
	"BOARD_FILE_ORIGINAL"	VARCHAR2(300)		NOT NULL,
	"BOARD_FILE_RENAME"	VARCHAR2(300)		NOT NULL,
	"BOARD_FILE_CATEGORY_NO"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD_FILE"."BOARD_FILE_NO" IS '게시판 파일 번호';

COMMENT ON COLUMN "BOARD_FILE"."BOARD_FILE_PATH" IS '게시판 파일 경로';

COMMENT ON COLUMN "BOARD_FILE"."BOARD_FILE_ORIGINAL" IS '게시판 파일 이름';

COMMENT ON COLUMN "BOARD_FILE"."BOARD_FILE_RENAME" IS '게시판 파일 변경명';

COMMENT ON COLUMN "BOARD_FILE"."BOARD_FILE_CATEGORY_NO" IS '게시판용 파일 카테고리 번호';

COMMENT ON COLUMN "BOARD_FILE"."BOARD_NO" IS '게시판 번호';

CREATE TABLE "BOARD_FILE_CATEGORY" (
	"BOARD_FILE_CATEGORY_NO"	NUMBER		NOT NULL,
	"BOARD_FILE_CATEGORY_NAME"	VARCHAR2(150)		NOT NULL
);

COMMENT ON COLUMN "BOARD_FILE_CATEGORY"."BOARD_FILE_CATEGORY_NO" IS '게시판용 파일 카테고리 번호';

COMMENT ON COLUMN "BOARD_FILE_CATEGORY"."BOARD_FILE_CATEGORY_NAME" IS '게시판용 파일 카테고리 이름';

CREATE TABLE "CHATTING_JOIN" (
	"MEMBER_NO"	VARCHAR2(11)		NOT NULL,
	"CHATTING_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "CHATTING_JOIN"."MEMBER_NO" IS '학생:01-';

COMMENT ON COLUMN "CHATTING_JOIN"."CHATTING_NO" IS '채팅방 번호';

