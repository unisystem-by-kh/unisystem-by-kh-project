<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${map.pagination}" />
<c:set var="boardList" value="${map.boardList}" />
<%-- <c:set var="categoryNo" value="${map.categoryNo}" /> --%>

<%-- 수정 예정 --%>
<%-- <c:forEach var="categoryNo" items="${categoryNo}">
    <c:if test="${categoryNo.CATEGORY_NO == categoryNo}">
        <c:set var="categoryName" value="${categoryNo.CATEGORY_NAME}" />
    </c:if>
</c:forEach> --%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UNI-SYSTEM.FreeBoard</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/board/freeBoardList.css">
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <%-- 검색을 진행한 경우 파라미터(key, query)를
             쿼리스트링 형태로 저장한 변수를 선언 --%>
        <c:if test="${!empty param.key}">
            <c:set var="sp" value="&key=${param.key}&query=${param.query}"/>
        </c:if>

        <div class="mainContainer">

            <%-- 추후 사용 예정 --%>
            <%-- <c:if test="${!empty param.key}" >
                <h3 style="margin:30px"> "${param.query}" 검색 결과 </h3>
            </c:if> --%>

            <!-- 검색창 게시글작성 영역 -->
            <div class="search-insertBtn-area">

                <!-- 검색창 -->
                <div class="search-area">
                    <form action="${categoryNo}" method="get" id="boardSearch" onsubmit="">
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
                    <div><button><a href="/board/${categoryNo}/insert" style="color: gray;">게시글 작성</a></button></div>
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

                        <c:if test="${empty boardList}">
                            <!-- 조회된 게시글 목록이 비어있거나 null인 경우 -->
                            <!-- 게시글 목록 조회 결과가 비어있다면 -->
                          <div>
                              <h2>게시글이 존재하지 않습니다.</h2>
                          </div>

                        </c:if>

                    <c:forEach var="board" items="${boardList}">

                        <div class="boardList-area">
                            <div>${board.boardNo}</div>
                            <div>
                                <a href="/board/${categoryNo}/${board.boardNo}?cp=${pagination.currentPage}${sp}">
                                    <!-- 썸네일이 있을 경우 -->
                                    <c:if test="${!empty board.fileList}">
                                        <div><img src="${board.fileList[0].boardFilePath}${board.fileList[0].boardFileRename}"></div>
                                    </c:if>
                                    <!-- 썸네일이 없을 경우 -->
                                    <c:if test="${empty board.fileList}">
                                        <div></div>
                                    </c:if>
                                    <div>${board.boardTitle}</div>
                                    <div>${board.boardContent}</div>
                                </a>
                            </div>

                            <div>${board.memberName}</div>
                            <div>${board.boardCDate}</div>
                            <div>${board.boardCount}</div>
                            <div>[ ${board.replyCount} ]</div>
                        </div>

                    </c:forEach>

                    <%-- <!-- 각 게시글 각 하나 영역 -->
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
                    </div> --%>

                    <!-- 페이지네이션 영역 -->
                    <div class="paginations-area">
                        <a href="/board/${categoryNo}?cp=${pagination.prevPage}${sp}"><div>&lt;</div></a>

                        <div id="paginations">
                            <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                                <a href="/board/${categoryNo}?cp=${i}${sp}"><div>${i}</div></a>
                            </c:forEach>
                        </div>

                        <!-- 다음 목록 시작 번호로 이동 -->
                        <a href="/board/${categoryNo}?cp=${pagination.nextPage}${sp}"><div>&gt;</div></a>
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