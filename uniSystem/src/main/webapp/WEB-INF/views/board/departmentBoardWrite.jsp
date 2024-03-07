<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/board/departmentBoardWrite.css">
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <form action="#" id="writeForm">
            <div class="depart-top">
                <h1>학과 공지</h1>
            </div>
            <div class="depart-title-write">
                <div>제목 : </div>
                <div><input type="text" placeholder="제목을 입력하세요." name="departTitle"></div>
            </div>
            <div class="depart-file-area">
                <div>
                    학과 : 
                </div>
                <div>
                    <select value="depart">
                        <option value="" selected disabled hidden>전체</option>
                        <option value="1">경영학과</option>
                        <option value="2">경제학과</option>
                        <option value="3">건축학과</option>
                    </select>
                </div>
                <div>
                    첨부파일 : 
                </div>
                <div>
                    <input type="file" name="departFile">
                </div>
            </div>
            <div class="image-area">
                <input type="image" name="departImage">
            </div>
            <div class="depart-content-area">
                <textarea name="departContent"></textarea>
            </div>
            <div class="email-shoot">
                <div>이메일 발송여부 :</div>
                <div>
                    발송 <input  type="radio" name="shoot" value="shoot">
                    미발송 <input  type="radio" name="shoot" value="shoot">
                </div>
            </div>
            <div class="departButton">
                <button>등록하기</button>
                <button>취소</button>
            </div>
    
        </form>
        

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
</body>
</html>