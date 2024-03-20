<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UNI-SYSTEM.FreeBoard</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/board/freeBoardDetail.css">
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="mainContainer">

            <div class="row1">
                <div><a href="/board/freeBoardList" style="color: crimson;">자유게시판</a></div>

                <div>
                    <div>분류 : 자유게시판</div>

                    <c:set var='boardCDate' value='${board.boardCDate}' />
                    <c:set var='boardUDate' value='${board.boardUDate}' />
                    <div>작성일 : <c:out value="${fn:substring(boardCDate, 0, 13)}"/></div>
                    <c:if test='${board.boardUDate != null}'>
                        <div>수정일 : <c:out value="${fn:substring(boardUDate, 0, 11)}"/></div>
                    </c:if>
                    
                    <div>작성자 : ${board.memberName}</div>
                    <div>조회수 : ${board.boardCount}</div>
                </div>
            </div>

            <div class="row2">${board.boardTitle}</div>

            <div class="row3">
                <div>
                    <img src="https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/02/a0002727/img/ko/a0002727_parts_5bea39afbf327.jpg?20201211115557&q=80&rw=686&rh=490" alt="#">
                    <div>
                        ${board.boardContent}
                    </div>
                </div>
            </div>

            <div class="row4">
                <div>
                    <button><a href="/board/freeBoardUpdate" id="updateBtn">수정</a></button>
                    <button>삭제</button>
                </div>
                <div>
                    <button>목록</button>
                </div>
            </div>

            <div class="row5">댓글 <span> [${board.replyCount}]</span></div>

            <div class="row6">
                <div><img src="https://mblogthumb-phinf.pstatic.net/MjAyMDExMDFfMTIx/MDAxNjA0MjI5MTA4NzI3.yzCwf1e6qzFEThrElCICUzSLLlwmWPZBt2h_o4BCWccg.JeNepf4eBECV-hiBNC0mkeyRRpA8dh79Hf9fscBFadUg.JPEG.gambasg/%EC%9C%A0%ED%8A%9C%EB%B8%8C_%EA%B8%B0%EB%B3%B8%ED%94%84%EB%A1%9C%ED%95%84_BG.jpg?type=w400" alt="#"></div>
                <div><textarea name="#" id="#" cols="150" rows="3" placeholder="댓글을 입력해주세요."></textarea></div>
                <div><button>작성</button></div>
            </div>

            <div class="row7">
                <div>프로필</div>
                <div>작성자</div>
                <div>작성일</div>
                <div>댓글 내용</div>
                <div>번호</div>
            </div>

            <div class="row8-area">

                <c:forEach items="${board.replyList}" var="reply">
                
                    <div class="row8">
                        <div class="btn-profile-area">
                            <!-- 로그인하면 본인 댓글 작성에 한에서 노출 -->
                            <div class="btnArea">
                                <button id='updateBtn'>수정</button>
                                <button id='deleteBtn'>삭제</button>
                            </div>
                            <div class="profileImg-reply"><img src="https://mblogthumb-phinf.pstatic.net/MjAyMDExMDFfMTIx/MDAxNjA0MjI5MTA4NzI3.yzCwf1e6qzFEThrElCICUzSLLlwmWPZBt2h_o4BCWccg.JeNepf4eBECV-hiBNC0mkeyRRpA8dh79Hf9fscBFadUg.JPEG.gambasg/%EC%9C%A0%ED%8A%9C%EB%B8%8C_%EA%B8%B0%EB%B3%B8%ED%94%84%EB%A1%9C%ED%95%84_BG.jpg?type=w400" alt="#" class="imgProfile"></div>
                        </div>
                        <div class="replyMemberName">${reply.memberName}</div>

                        <c:set var='replyDate' value='${reply.replyDate}' />
                        <div class='replyDate'><c:out value="${fn:substring(replyDate, 0, 15)}"/></div>

                        <div class='replyContnet'>${reply.replyContent}</div>
                        <%-- 댓글 번호를 할지? 회원 아이디를 넣어줄지? --%>
                        <div class='replyNo'>${reply.replyNo}</div>
                    </div>
                
                </c:forEach>


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

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script>
        const boardNo = "${board.boardNo}";
        // console.log(boardNo);

        const loginMemberNo = "${board.memberNo}";
        // console.log(loginMemberNo);

        const categoryNo = "${categoryNo}";
    </script>

    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/board/freeBoard/freeBoardDetail.js"></script>

</body>
</html>