<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/board/inquiryBoardDetail.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="boardname-area">
        <h1>1 : 1 문의</h1>
    </div>
    <div class="title-date">
        <div>제목 : 문의내용</div>
        <div>신청일 : 2024.02.22</div>
    </div>
    <div class="nick-hak">
        <div>신청인 : 유저일</div>
        <div>학과 : 경영학과</div>
    </div>
    <div class="content-area">
        <div>asd</div>
    </div>
    <div class="file-area">
        <div>첨부 파일 :</div>
        <div>첨부된 파일이 없습니다.</div>
    </div>
    <div class="update-delete-btn">
        <button type="">수정</button>
        <button>삭제</button>
    </div>

    <div class="reply-area">
        <h1>답변</h1>
    </div>
    <div class="reply-nick">
        <div>답변자 : 관리자</div>
        <div>답변일 : 2024.02.23</div>
    </div>
    <div class="reply-title">
        <div>제목 : [RE]문의내용</div>
    </div>
    <div class="reply-content">
        <div>
            asdasdasdsadasdsad
        </div>
    </div>

    <form>
        <div class="reply-write">
            <textarea placeholder="답변을 작성해주세요.">
    
            </textarea>
            <button >답변작성</button>
        </div>
    </form>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>