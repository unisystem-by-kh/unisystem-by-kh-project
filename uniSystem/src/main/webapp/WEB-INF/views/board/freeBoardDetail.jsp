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
                <div><a href="/board/3" style="color: crimson;">자유게시판 목록</a></div>

                <div>
                    <div>분류 : 자유게시판</div>

                    <c:set var='boardCDate' value='${board.boardCDate}' />
                    <c:set var='boardUDate' value='${board.boardUDate}' />
                    <div>작성일 : <c:out value="${fn:substring(boardCDate, 0, 13)}"/></div>
                    <c:if test='${board.boardUDate != null}'>
                        <div>수정일 : <c:out value="${fn:substring(boardUDate, 0, 13)}"/></div>
                    </c:if>
                    
                    <div>작성자 : ${board.memberName}</div>
                    <div>조회수 : ${board.boardCount}</div>
                </div>
            </div>

            <div class="row2">${board.boardTitle}</div>

            <div class="row3">
                <div>
                    <%-- 썸네일이 있을 경우 --%>
                    <c:if test="${!empty board.fileList}">
                        <c:set var="path" value="${board.fileList[0].boardFilePath}${board.fileList[0].boardFileRename}"/>
                        <img src="${path}">
                    </c:if>
                    <%-- 썸네일이 없을 경우 --%>
                    <c:if test="${empty board.fileList}">
                        <c:set var="path" value="#" />
                        <%-- <img src="${path}" alt="썸네일을 등록해주세요."> --%>
                        <img src='abc.jpg' onerror="this.style.display='none'" alt='썸네일을 넣어주세요.' />
                    </c:if>
                    <div>
                        ${board.boardContent}
                    </div>
                </div>
            </div>

            <div class="row4">
                <c:if test="${loginMember.memberNo == board.memberNo}" >
                    <div>
                        <button id="updateBtn">수정</button>
                        <button id="deleteBtn">삭제</button>
                    </div>
                </c:if>
                    <div>
                        <button>목록</button>
                    </div>
            </div>

            <div class="row5">한줄 댓글 <span></span></div>

            <div class="row6">
                <%-- 로그인한 회원의 프로필 이미지 넣기 --%>
                <div><img src="/resources/images/memberImage.jpg" alt="#"></div>
                <div><textarea id="replyContentInsert" cols="150" rows="3" placeholder="댓글을 입력해주세요." maxlength="100"></textarea></div>
                <div><button id="replyAdd">작성</button></div>
            </div>

            <div class="row7">
                <div>프로필</div>
                <div>작성자</div>
                <div>작성일</div>
                <div>댓글 내용</div>
                <div>번호</div>
            </div>
            <%-- ${board.replyList} 확인용 --%>
            <div class="row8-area">

                <c:forEach items="${board.replyList}" var="reply">
                
                    <div class="row8">
                        <div class="btn-profile-area">
                            <!-- 로그인하면 본인 댓글 작성에 한에서 노출 -->
                            <div class="btnArea">
                                <c:if test='${board.memberNo == reply.memberNo}'>
                                    <button id='updateBtn' onclick="showUpdateReply(${reply.replyNo}, this)" >수정</button>
                                    <button id='deleteBtn' onclick="deleteReply(${reply.replyNo})">삭제</button>
                                </c:if>
                            </div>
                            <div class="profileImg-reply"><img src="/resources/images/memberImage.jpg" alt="#" class="imgProfile"></div>
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
            <%-- <div class="paginations-area">
                <div>&lt;</div>
                <div id="paginations">
                    <div class="active">1</div>
                    <div>2</div>
                    <div>3</div>
                    <div>4</div>
                    <div>5</div>
                </div>
                <div>&gt;</div>
            </div> --%>



        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script>
        const boardNo = "${board.boardNo}";
        console.log(boardNo);

        // const loginMemberNo = "${board.memberNo}";
        console.log(loginMemberNo);

        const categoryNo = "${categoryNo}";
    </script>

    <script src="/resources/js/header.js"></script>
    <script src="/resources/js/board/freeBoard/freeBoardDetail.js"></script>

</body>
</html>