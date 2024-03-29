<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="stu-nav">
            <ul>
                <li>수강
                    <ul>
                        <a href="/collegian/classList"><li>- 교과목 조회<img src="/resources/images/collegian/icons8-books-48.png" style="width: 25px;"></li></a>
                        <a href="/collegian/myClass"><li>- 수강 신청/변경<img src="/resources/images/collegian/icons8-myclass-68.png" style="width: 25px;"></li></a>
                        <a href="/collegian/schedule"><li>- 시간표 조회<img src="/resources/images/collegian/icons8-clock-50.png" style="width: 25px;"></li></a>
                        <a href="/collegian/task"><li>- 과제물 제출<img src="/resources/images/collegian/icons8-work-48.png" style="width: 25px;"></li></a>
                    </ul>
                </li>
                <li>증명서 발급
                    <ul>
                        <a href="/collegian/certificate/1"><li>- 학적 증명서<img src="/resources/images/collegian/icons8-card1-50.png" style="width: 25px;"></li></a>
                        <a href="/collegian/certificate/2"><li>- 성적 증명서<img src="/resources/images/collegian/icons8-card2-50.png" style="width: 25px;"></li></a>
                        <a href="/collegian/certificate/3"><li>- 등록금 납부 증명서<img src="/resources/images/collegian/icons8-card3-48.png" style="width: 25px;"></li></a>
                        <a href="/collegian/certificate/4"><li>- 학생증<img src="/resources/images/collegian/icons8-card4-80.png" style="width: 25px;"></li></a>
                    </ul>
                </li>
                <li>내 정보
                    <ul>
                        <a href="#"><li>- 개인 정보 수정<img src="/resources/images/collegian/icons8-man-32.png" style="width: 25px;"></li></a>
                        <a href="/collegian/change"><li>- 학적 변동 신청<img src="/resources/images/collegian/icons8-study-50.png" style="width: 25px;"></li></a>
                        <a href="/collegian/score"><li>- 학점 조회<img src="/resources/images/collegian/icons8-score-50.png" style="width: 25px;"></li></a>
                    </ul>
                </li>
            </ul>
        </div>
</body>

<script type="text/javascript">
/* 	
	
	const boardName = window.location.pathname.split('/').reverse()[0];

    if(boardName == 'classList'){
        navList[0].style.color='black';
    }

    if(boardName == 'myClass'){
        navList[1].style.color='black';
    }

    if(boardName == 'schedule'){
        navList[2].style.color='black';
    }

    if(boardName == 'task'){
        navList[3].style.color='black';
    } */
</script>
</html>