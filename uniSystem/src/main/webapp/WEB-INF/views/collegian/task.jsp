<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>시간표 조회</title>

<link rel="stylesheet" href="/resources/css/style-main.css">
<link rel="stylesheet"
	href="/resources/css/collegian/collegian-style.css">

<script src="https://kit.fontawesome.com/9cd918496e.js"
	crossorigin="anonymous"></script>

</head>
<body>


	<main>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<div class="main">
			<jsp:include page="/WEB-INF/views/common/collegian-nav.jsp" />

			<div class="stu-container">
            <div class="stu-header">
                <h2>과제물 제출 </h2>
            </div>

            <h4>📣 제출 파일은 .hwp .pdf 형식으로 제한합니다.</h4>

            <div class="stu-board">
                <table>
                    <tr>
                        <th>No.</th>
                        <th>학과명</th>
                        <th>학년</th>
                        <th>학기</th>
                        <th>과목명</th>
                        <th>분류</th>
                        <th>학점</th>
                        <th>담당교수</th>
                        <th>과제 확인</th>
                        <th>과제 제출</th>
                        <th>제출 기한</th>
                    </tr>

                    <tr>
                        <td>1</td>
                        <td>컴퓨터과학과</td>
                        <td>1학년</td>
                        <td>1학기</td>
                        <td>JAVA</td>
                        <td>전공</td>
                        <td>3</td>
                        <td>남궁성</td>
                        <td><a>확인</a></td>
                        <td><button>제출하기</button></td>
                        <td>2024-04-15</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>컴퓨터과학과</td>
                        <td>1학년</td>
                        <td>1학기</td>
                        <td>JAVA</td>
                        <td>전공</td>
                        <td>3</td>
                        <td>남궁성</td>
                        <td><a>확인</a></td>
                        <td><button>제출완료</button></td>
                        <td>2024-04-15</td>
                    </tr>
                    
                    
                </table>

            </div>
            <div class="task-notice">
                <h3>과제 제출 안내</h3>
                <pre><strong>👁‍🗨 반드시 제출한 과제물 파일을 열거나 다운로드하여 아래 사항들을 확인하시기 바랍니다.</strong>                    
    
    ✅ 제출한 과제물이 해당 교과목과 일치하는지 확인.

    ✅ 해당 교과목의 지정유형과 일치하는지 확인.

    ✅ 제출한 과제물이 정상적으로 업로드되어 올바르게 보여지는지 여부 확인.

    📂 제출한 과제물은 학기가 지난 후에 과제물 다운로드가 되지 않으므로 각자 보관하시기 바랍니다.


💥 <strong>유의사항</strong>

    🕐 접수기간 이외에는 제출이 불가하므로 기간 준수

     ✔  과제명 및 지시사항 등이 변동될 수 있으므로 수시로 공지사항 등 확인

    ❌ 상업사이트, 대리 작성, 학생간 및 생성형인공지능(ChatGPT 등) 사용 표절 등은 성적 무효처리 됨

                </pre>

            </div>
        </div>
			
	</main>



</body>


</html>