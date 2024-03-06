<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UNI-SYSTEM</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/board/freeBoardList.css">
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="mainContainer">

            <!-- 검색창 게시글작성 영역 -->
            <div class="search-insertBtn-area">
                <!-- 검색창 -->
                <div class="search-area">
                    <form action="#" method="get" id="boardSearch" onsubmit="">
                        <input type="hidden" name="type" value="${param.type}">
                        <select name="key" id="search-key">
                            <option value="">검색 조건 선택</option>
                            <option value="t">제목</option>
                            <option value="c">내용</option>
                            <option value="tc">제목+내용</option>
                            <option value="w">작성자</option>
                        </select>
        
                        <input type="text" name="query" placeholder="검색어를 입력해주세요." id="search-query">
        
                        <button>검색</button>
                    </form>
                </div>

                <!-- 게시글작성 버튼 -->
                <div class="board-insert-area">
                    <div><button><a href="/board/freeBoardInsert" style="color: gray;">게시글 작성</a></button></div>
                </div>
                
            </div>


            <!-- 게시글 목록 노출 영역 -->
            <div>

                <div class="boardList-nav-area">
                    <div>No.</div>
                    <div>썸네일</div>
                    <div>제목</div>
                    <div>내용</div>
                    <div>작성자</div>
                    <div>작성일</div>
                    <div>조회수</div>
                    <div>댓글수</div>
                </div>
                
                <!-- 게시글 목록 영역 -->
                <div class="boardList">
                    

                    <!-- 각 게시글 각 하나 영역 -->
                    <div class="boardList-area">
                        <div>123456</div>
                        <div>
                            <a href="/board/freeBoardDetail">
                                <div><img src="https://gongu.copyright.or.kr/gongu/wrt/cmmn/wrtFileImageView.do?wrtSn=11288734&filePath=L2Rpc2sxL25ld2RhdGEvMjAxNS8wMi9DTFM2OS9OVVJJXzAwMV8wMjIwX251cmltZWRpYV8yMDE1MTIwMw==&thumbAt=Y&thumbSe=b_tbumb&wrtTy=10006" alt="#"></div>
                                <div>제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.</div>
                                <div>내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.</div>
                            </a>
                        </div>
                        <div>작성자</div>
                        <div>작성일</div>
                        <div>조회수</div>
                        <div>댓글수</div>
                    </div>
                    <div class="boardList-area">
                        <div>123456</div>
                        <div>
                            <a href="#">
                                <div><img src="https://gongu.copyright.or.kr/gongu/wrt/cmmn/wrtFileImageView.do?wrtSn=11288734&filePath=L2Rpc2sxL25ld2RhdGEvMjAxNS8wMi9DTFM2OS9OVVJJXzAwMV8wMjIwX251cmltZWRpYV8yMDE1MTIwMw==&thumbAt=Y&thumbSe=b_tbumb&wrtTy=10006" alt="#"></div>
                                <div>제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.</div>
                                <div>내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.</div>
                            </a>
                        </div>
                        <div>작성자</div>
                        <div>작성일</div>
                        <div>조회수</div>
                        <div>댓글수</div>
                    </div>
                    <div class="boardList-area">
                        <div>123456</div>
                        <div>
                            <a href="#">
                                <div><img src="https://gongu.copyright.or.kr/gongu/wrt/cmmn/wrtFileImageView.do?wrtSn=11288734&filePath=L2Rpc2sxL25ld2RhdGEvMjAxNS8wMi9DTFM2OS9OVVJJXzAwMV8wMjIwX251cmltZWRpYV8yMDE1MTIwMw==&thumbAt=Y&thumbSe=b_tbumb&wrtTy=10006" alt="#"></div>
                                <div>제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.</div>
                                <div>내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.</div>
                            </a>
                        </div>
                        <div>작성자</div>
                        <div>작성일</div>
                        <div>조회수</div>
                        <div>댓글수</div>
                    </div>
                    <div class="boardList-area">
                        <div>123456</div>
                        <div>
                            <a href="#">
                                <div><img src="https://gongu.copyright.or.kr/gongu/wrt/cmmn/wrtFileImageView.do?wrtSn=11288734&filePath=L2Rpc2sxL25ld2RhdGEvMjAxNS8wMi9DTFM2OS9OVVJJXzAwMV8wMjIwX251cmltZWRpYV8yMDE1MTIwMw==&thumbAt=Y&thumbSe=b_tbumb&wrtTy=10006" alt="#"></div>
                                <div>제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.</div>
                                <div>내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.</div>
                            </a>
                        </div>
                        <div>작성자</div>
                        <div>작성일</div>
                        <div>조회수</div>
                        <div>댓글수</div>
                    </div>
                    <div class="boardList-area">
                        <div>123456</div>
                        <div>
                            <a href="#">
                                <div><img src="https://gongu.copyright.or.kr/gongu/wrt/cmmn/wrtFileImageView.do?wrtSn=11288734&filePath=L2Rpc2sxL25ld2RhdGEvMjAxNS8wMi9DTFM2OS9OVVJJXzAwMV8wMjIwX251cmltZWRpYV8yMDE1MTIwMw==&thumbAt=Y&thumbSe=b_tbumb&wrtTy=10006" alt="#"></div>
                                <div>제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.</div>
                                <div>내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.</div>
                            </a>
                        </div>
                        <div>작성자</div>
                        <div>작성일</div>
                        <div>조회수</div>
                        <div>댓글수</div>
                    </div>


                    <!-- 페이지네이션 영역 -->
                    <div class="paginations-area">
                        <div>&lt;</div>
                        <div id="paginations">
                            <div class="active">1</div>
                            <div>2</div>
                            <div>3</div>
                            <div>4</div>
                            <div>5</div>
                        </div>
                        <div>&gt;</div>
                    </div>


                </div>

            </div>


        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/board/freeBoard/freeBoardList.js"></script>

</body>
</html>