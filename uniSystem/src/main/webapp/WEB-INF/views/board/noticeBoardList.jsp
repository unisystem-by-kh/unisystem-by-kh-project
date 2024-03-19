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
    <link rel="stylesheet" href="/resources/css/board/noticeBoardList.css">
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="container">
            <div class="announcement">
                <h2>공 지 사 항</h2>
            </div>

        <form action="${categoryNo}" method="get" id="boardSearch" >
            <div class="select">
                <div>
                <select name="noticea" id="searchKey">
                        <option value="x">구분</option>
                        <option value="y">학사 공지</option>
                        <option value="z">인사 공지</option>
                </select>
                
                    <select name="noticeb" id="titleKey">
                        <option value="t">제목</option>
                        <option value="c">내용</option>
                        <option value="tc">제목+내용</option>
                    </select>

                    <input type="text" name="noticec" id="searchQuery" placeholder="검색어를 입력하세요.">
                    <button>검색</button>
                </div>
            </div>
        </form>

        <div class="post">
            <table>
                <thead>
                    <tr>
                        <th>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</Pre></th>
                        <th>구  분</th>
                        <th>작성일</th>
                    </tr>
                </thead>

                <tbody>

                    <tr>
                        <th><a href="/board/noticeBoardDetail">2024학년도 정시모집 3차(최종) 총원합격자</a></th>
                        <th>인사 공지</th>
                        <th>2024. 02. 20</th>
                    </tr>

                    <tr>
                        <th>2024학년도 정시모집 3차(최종) 총원합격자 선발 현황</th>
                        <th>인사 공지</th>
                        <th>2024. 02. 20</th>
                    </tr>

                    <tr>
                        <th>2024학년도 정시모집 3차(최종) 총원합격자 선발 현황</th>
                        <th>학사지원팀</th>
                        <th>2024. 02. 20</th>
                    </tr>

                    <tr>
                        <th>2024학년도 정시모집 3차(최종) 총원합격자 선발 현황</th>
                        <th>학사지원팀</th>
                        <th>2024. 02. 20</th>
                    </tr>

                    <tr>
                        <th>2024학년도 정시모집 3차(최종) 총원합격자 선발 현황</th>
                        <th>학사지원팀</th>
                        <th>2024. 02. 20</th>
                    </tr>

                    <tr>
                        <th>2024학년도 정시모집 3차(최종) 총원합격자 선발 현황</th>
                        <th>학사지원팀</th>
                        <th>2024. 02. 20</th>
                    </tr>

                    <tr>
                        <th>2024학년도 정시모집 3차(최종) 총원합격자 선발 현황</th>
                        <th>학사지원팀</th>
                        <th>2024. 02. 20</th>
                    </tr>

                    <c:choose>
                            <c:when test="${empty boardList}">
                                <!-- 조회된 게시글 목록이 비어있거나 null인 경우 -->

                                <!-- 게시글 목록 조회 결과가 비어있다면 -->
                                <tr>
                                    <th colspan="6">게시글이 존재하지 않습니다.</th>
                                </tr>
                            </c:when>

                            <c:otherwise>
                                <!-- 게시글 목록 조회 결과가 있다면 -->
                                <c:forEach var="board" items="${boardList}">
                                    <tr>
                                        <td>${board.boardNo}</td>
                                        <td> 
                                        
                                            <a href="/board/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}${sp}">${board.boardTitle}</a>   
                                            [${board.commentCount}]                        
                                        </td>
                                        <td>${board.memberNickname}</td>
                                        <td>${board.boardCreateDate}</td>
                                    </tr>

                                </c:forEach>
                            </c:otherwise>
                        </c:choose>


                </tbody>

                
            </table>
            

        </div>

        <ul class="pagination">
            <li><a class="prev" href="/board/noticeBoardList?cp=1${sp}"><img src="/resources/images/board/prev.png" width='10' height='10'></a></li>
            <li><a class="pageno" href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a class="next" href="#"><img src="/resources/images/board/next.png" width='10' height='10'></a></li>

        </ul>
    <%-- 글쓰기 버튼 --%>
     <c:if test="${!empty loginMember}">
        <button id="writeBtn"><a href="/board/noticeBoardWrite">작   성</a></button>
     </c:if>






    </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/board/freeBoard/freeBoardUpdate.js"></script>

</body>
</html>