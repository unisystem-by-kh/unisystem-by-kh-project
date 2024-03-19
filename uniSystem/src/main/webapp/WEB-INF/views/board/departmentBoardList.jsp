<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/board/departmentBoardList.css">
</head>
<body>
	
	<main>
	
	    <jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	    <div class="depart-area">
	        <div>
	            <h1>학과 공지</h1>
	        </div>
	        <div>
	            <a href="/board/departmentBoardWrite">공지 등록</a>
	        </div>
	    </div>
	    <form>
	        <div class="select-search-area">
	            <div>
	                <select value="depart" >
	                    <option value="" selected disabled hidden>전체</option>
	                    <option value="1">경영학과</option>
	                    <option value="2">경제학과</option>
	                    <option value="3">건축학과</option>
	                </select>
	            </div>
	            <div>
	                <input type="search" placeholder="제목 검색">
	            </div>
	        </div>
	    </form>
	    <table class="depart-table">
	        <thead>
	            <tr>
	                <th>번호</th>
	                <th>제목</th>
	                <th>학과</th>
	                <th>작성일</th>
	                <th>조회수</th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td>2004</td>
	                <td><a href="/board/departmentBoardDetail">공지입니다.</a></td>
	                <td>경영학과</td>
	                <td>2024.02.22</td>
	                <td>20</td>
	            </tr>
	            <tr>
	                <td>2004</td>
	                <td><a href="/board/departmentBoardDetail">공지입니다.</a></td>
	                <td>경영학과</td>
	                <td>2024.02.22</td>
	                <td>20</td>
	            </tr>
	            <tr>
	                <td>2004</td>
	                <td><a href="/board/departmentBoardDetail">공지입니다.</a></td>
	                <td>경영학과</td>
	                <td>2024.02.22</td>
	                <td>20</td>
	            </tr>
	            <tr>
	                <td>2004</td>
	                <td><a href="/board/departmentBoardDetail">공지입니다.</a></td>
	                <td>경영학과</td>
	                <td>2024.02.22</td>
	                <td>20</td>
	            </tr>
	            <tr>
	                <td>2004</td>
	                <td><a href="/board/departmentBoardDetail">공지입니다.</a></td>
	                <td>경영학과</td>
	                <td>2024.02.22</td>
	                <td>20</td>
	            </tr>
	            <tr>
	                <td>2004</td>
	                <td><a href="/board/departmentBoardDetail">공지입니다.</a></td>
	                <td>경영학과</td>
	                <td>2024.02.22</td>
	                <td>20</td>
	            </tr>
	            <tr>
	                <td>2004</td>
	                <td><a href="/board/departmentBoardDetail">공지입니다.</a></td>
	                <td>경영학과</td>
	                <td>2024.02.22</td>
	                <td>20</td>
	            </tr>
	            <tr>
	                <td>2004</td>
	                <td><a href="/board/departmentBoardDetail">공지입니다.</a></td>
	                <td>경영학과</td>
	                <td>2024.02.22</td>
	                <td>20</td>
	            </tr>
	            <tr>
	                <td>2004</td>
	                <td><a href="/board/departmentBoardDetail">공지입니다.</a></td>
	                <td>경영학과</td>
	                <td>2024.02.22</td>
	                <td>20</td>
	            </tr>
	            <tr>
	                <td>2004</td>
	                <td><a href="/board/departmentBoardDetail">공지입니다.</a></td>
	                <td>경영학과</td>
	                <td>2024.02.22</td>
	                <td>20</td>
	            </tr>
	            <tr>
	                <td>2004</td>
	                <td><a href="/board/departmentBoardDetail">공지입니다.</a></td>
	                <td>경영학과</td>
	                <td>2024.02.22</td>
	                <td>20</td>
	            </tr>
	        </tbody>
	    </table>
	
	    <div class="pagi">
	        <ul>
	            <li>&lt;&lt;</li>
	            <li>&lt;</li>
	            <li id="current">1</li>
	            <li>2</li>
	            <li>3</li>
	            <li>4</li>
	            <li>5</li>
	            <li>&gt;</li>
	            <li>&gt;&gt;</li>
	        </ul>
	    </div>
	    
	
	    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</main>
</body>
</html>