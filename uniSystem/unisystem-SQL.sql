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
    01-2478943,
    'pass01',
    '학생삼',
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
    10
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
    023412346,
    'pass02',
    '구혜선',
    '주소 영역 ^^^ 상세주소 영역',
    'professor01@naver.com',
    '01078947894',
    'M',
    SYSDATE,
    NULL,
    'N',
    NULL,
    '970221-2345678',
    10
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

-- 학과 번호 프라이머리키 설정
ALTER TABLE "DEPARTMENT" ADD CONSTRAINT "DEPARTMENT" PRIMARY KEY (
   "DEPARTMENT_NO"
);

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

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시판 번호';

COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글 제목';

COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글 내용';

COMMENT ON COLUMN "BOARD"."BOARD_C_DATE" IS '게시글 작성 일자';

COMMENT ON COLUMN "BOARD"."BOARD_U_DATE" IS '게시글 수정일(마지막 수정일)';

COMMENT ON COLUMN "BOARD"."BOARD_COUNT" IS '게시글 조회수';

COMMENT ON COLUMN "BOARD"."BOARD_ST" IS '게시글 삭제 여부(N:비삭제 / Y:삭제 / D:공개)';

COMMENT ON COLUMN "BOARD"."MEMBER_NO" IS '학생:01- / 교수:02- / 관리자:03-';

COMMENT ON COLUMN "BOARD"."CATEGORY_NO" IS '카테고리 번호';

CREATE SEQUENCE SEQ_BOARD_NO NOCACHE; -- 게시판 시퀀스

BEGIN
   FOR I IN 1..1500 LOOP
      INSERT INTO BOARD 
      VALUES( SEQ_BOARD_NO.NEXTVAL,
              SEQ_BOARD_NO.CURRVAL || '번째 게시글',
              SEQ_BOARD_NO.CURRVAL || '번째 게시글 내용 입니다.',
              DEFAULT, NULL, DEFAULT, DEFAULT, '01-2412345', 
              CEIL(DBMS_RANDOM.VALUE(0,5))
      );
   END LOOP;
END;

COMMIT;

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


-- 게시판 파일 테이블 생성 구문
CREATE TABLE "BOARD_FILE" (
   "BOARD_FILE_NO"   NUMBER      NOT NULL,
   "BOARD_FILE_PATH"   VARCHAR2(300)      NOT NULL,
   "BOARD_FILE_ORIGINAL"   VARCHAR2(300)      NOT NULL,
   "BOARD_FILE_RENAME"   VARCHAR2(300)      NOT NULL,
   "BOARD_FILE_CATEGORY_NO"   NUMBER      NOT NULL,
   "BOARD_NO"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "BOARD_FILE"."BOARD_FILE_NO" IS '게시판 파일 번호';

COMMENT ON COLUMN "BOARD_FILE"."BOARD_FILE_PATH" IS '게시판 파일 경로';

COMMENT ON COLUMN "BOARD_FILE"."BOARD_FILE_ORIGINAL" IS '게시판 파일 이름';

COMMENT ON COLUMN "BOARD_FILE"."BOARD_FILE_RENAME" IS '게시판 파일 변경명';

COMMENT ON COLUMN "BOARD_FILE"."BOARD_FILE_CATEGORY_NO" IS '게시판용 파일 카테고리 번호';

COMMENT ON COLUMN "BOARD_FILE"."BOARD_NO" IS '게시판 번호';

CREATE SEQUENCE SEQ_BOARD_FILE NOCACHE;





DROP TABLE "CLASS" CASCADE CONSTRAINTS;

CREATE TABLE "CLASS" (
   "CLASS_NO"   NUMBER      PRIMARY KEY,
   "CLASS_NM"   VARCHAR2(50)      NOT NULL,
   "CLASS_POINT"   NUMBER      NOT NULL,
   "CLASS_MAX"   NUMBER      NOT NULL,
   "CLASS_GRADE"   NUMBER      NOT NULL,
   "CLASS_TREM"   NUMBER      NOT NULL,
   "CLASS_DAY"   VARCHAR2(3)      NOT NULL,
   "CLASS_START"   NUMBER      NOT NULL,
   "CLASS_END"   NUMBER      NOT NULL,
   "DEPARTMENT_NO"   NUMBER      NOT NULL,
   "MEMBER_NO"   VARCHAR2(11)      NOT NULL
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

CREATE SEQUENCE SEQ_CLASS_NO NOCACHE;

ALTER TABLE "CLASS" ADD CONSTRAINT "FK_MEMBER_TO_CLASS_1" FOREIGN KEY (
   "MEMBER_NO"
)
REFERENCES "MEMBER" (
   "MEMBER_NO"
);

-- 학과에 PRIMARYKEY
ALTER TABLE "DEPARTMENT" ADD CONSTRAINT "PK_DEPARTMENT" PRIMARY KEY (
   "DEPARTMENT_NO"
);


ALTER TABLE "CLASS" ADD CONSTRAINT "FK_DEPARTMENT_TO_CLASS_1" FOREIGN KEY (
   "DEPARTMENT_NO"
)

REFERENCES "DEPARTMENT" (
   "DEPARTMENT_NO"
);
--                     과목번호, 과목명, 이수학점, 수강정원, 학년, 학기, 요일, 시작 교시, 종료 교시, 학과 코드, 교수
INSERT INTO CLASS  VALUES (SEQ_CLASS_NO.NEXTVAL, 'JAVA', 3, 30, 1, 1, '월', 1, 3, 10,'022412345');
INSERT INTO CLASS  VALUES (SEQ_CLASS_NO.NEXTVAL, 'HTML', 3, 20, 1, 1, '화', 2, 5, 10,'022412345');
INSERT INTO CLASS  VALUES (SEQ_CLASS_NO.NEXTVAL, '컴퓨터의이해', 2, 25, 1, 1, '수', 1, 3, 10, '022412345');
INSERT INTO CLASS  VALUES (SEQ_CLASS_NO.NEXTVAL, 'SERVLET', 3, 40, 1, 1, '목', 2, 5, 10, '022412345');
INSERT INTO CLASS  VALUES (SEQ_CLASS_NO.NEXTVAL, '사진의이해', 2, 10, 1, 1, '금', 1, 3, 10, '022412345');
INSERT INTO CLASS  VALUES (SEQ_CLASS_NO.NEXTVAL, 'REACT', 3, 10, 1, 1, '금', 1, 3, 10, '022412345');
INSERT INTO CLASS  VALUES (SEQ_CLASS_NO.NEXTVAL, '경영학개론', 3, 10, 1, 1, '금', 1, 3, 1, '022412345');

COMMIT;





--수강 테이블 SQL
CREATE TABLE "LECTURE" (
   "CLASS_NO"   NUMBER      NOT NULL,
   "MEMBER_NO"   VARCHAR2(11)      NOT NULL,
   "LECTURE_POINT"   NUMBER   DEFAULT -1   NOT NULL,
   "LECTURE_GRADE"   NUMBER      NOT NULL,
   "LECTURE_TERM"   NUMBER      NOT NULL
);

COMMENT ON COLUMN "LECTURE"."CLASS_NO" IS '과목번호(시퀀스)';

COMMENT ON COLUMN "LECTURE"."MEMBER_NO" IS '학생:01- / 교수:02- / 관리자:03-';

COMMENT ON COLUMN "LECTURE"."LECTURE_POINT" IS '수강한 학생 성적';

ALTER TABLE "LECTURE" ADD CONSTRAINT "PK_LECTURE" PRIMARY KEY (
   "CLASS_NO",
   "MEMBER_NO"
);

ALTER TABLE "LECTURE" ADD CONSTRAINT "FK_CLASS_TO_LECTURE_1" FOREIGN KEY (
   "CLASS_NO"
)
REFERENCES "CLASS" (
   "CLASS_NO"
);

ALTER TABLE "LECTURE" ADD CONSTRAINT "FK_MEMBER_TO_LECTURE_1" FOREIGN KEY (
   "MEMBER_NO"
)
REFERENCES "MEMBER" (
   "MEMBER_NO"
);

-- 과목 평가 테이블
DROP TABLE CLASS_LATE;

CREATE TABLE "CLASS_LATE" (
	"CLASS_LATE_NO"	NUMBER		NOT NULL,
	"CLASS_LATE_CONTENT"	VARCHAR(2000)		NOT NULL,
	"CLASS_LATE_LIKE"	NUMBER		NOT NULL,
	"CLASS_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	VARCHAR2(11)		NOT NULL
);

ALTER TABLE "CLASS_LATE" ADD CONSTRAINT "PK_CLASS_LATE" PRIMARY KEY (
	"CLASS_LATE_NO"
);

COMMENT ON COLUMN "CLASS_LATE"."CLASS_LATE_NO" IS '평가 번호(시퀀스)';

COMMENT ON COLUMN "CLASS_LATE"."CLASS_LATE_CONTENT" IS '평가 내용';

COMMENT ON COLUMN "CLASS_LATE"."CLASS_LATE_LIKE" IS '평가 만족도(5: 매우만족 / 1:매우불만족)';

COMMENT ON COLUMN "CLASS_LATE"."CLASS_NO" IS '과목번호(시퀀스)';

COMMENT ON COLUMN "CLASS_LATE"."MEMBER_NO" IS '학생:01-';

CREATE SEQUENCE SEQ_LATE_NO NOCACHE;

INSERT INTO CLASS_LATE 
VALUES (SEQ_LATE_NO.NEXTVAL , '강의가 실하네요.', 5, 5, 012412345);
