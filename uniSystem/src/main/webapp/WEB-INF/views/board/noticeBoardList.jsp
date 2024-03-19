<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="boardList" value="${map.boardList}"/>

<c:forEach var="boardType" items="${boardTypeList}">
    <c:if test="${boardType.BOARD_CODE == boardCode}">
        <c:set var="boardName" value="${boardType.BOARD_NAME}"/>
    </c:if>
</c:forEach>


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

     <c:if test="${!empty param.key}">
            <c:set var="sp" value="&key=${param.key}&query=${param.query}"/>
     </c:if>

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
                
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="/board/${boardCode}?cp=1${sp}">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="/board/${boardCode}?cp=${pagination.prevPage}${sp}">&lt;</a></li>

					
                    <!-- 특정 페이지로 이동 -->
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                        <c:choose>
                            <c:when test="${i == pagination.currentPage}">
                                <!-- 현재 보고있는 페이지 -->
                                <li><a class="current">${i}</a></li>

                            </c:when>

                            <c:otherwise>
                                <!-- 현재 페이지를 제외한 나머지 -->
                                <li><a href="/board/${boardCode}?cp=${i}${sp}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="/board/${boardCode}?cp=${pagination.nextPage}${sp}">&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="/board/${boardCode}?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>

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