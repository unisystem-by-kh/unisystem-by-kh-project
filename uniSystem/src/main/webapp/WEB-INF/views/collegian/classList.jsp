<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교과목 조회</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/collegian/collegian-style.css">
    
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
    
</head>
<body>
	

	 <main>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
	 
	 	<div class="main">
	 		<jsp:include page="/WEB-INF/views/common/collegian-nav.jsp" />
	        
	        <div class="stu-container">
	            <div class="stu-header">
	                <h2>교과목 조회</h2>
	            </div>
	
	            <div class="search-area">
	                <form action="">
	                    <select name="major" id="">
	                        <option value="">컴퓨터과학과</option>
	                        <option value="">전체</option>
	                    </select>
	                    <select name="grade" id="">
	                        <option value="">1학년</option>
	                        <option value="">2학년</option>
	                        <option value="">전체</option>
	                    </select>
	                    <select name="step" id="">
	                        <option value="">1학기</option>
	                        <option value="">2학기</option>
	                        <option value="">전체</option>
	                    </select>
	                    <select name="type" id="">
	                        <option value="">전체</option>
	                        <option value="">전공</option>
	                        <option value="">교양</option>
	                    </select>
	                    <label for="" class="query-label">
	                        <input type="text" name="query">
	                        <button type="submit"><img src="/resources/images/collegian/search.png" alt=""></button>
	                    </label>
	                </form>
	            </div>
	
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
	                    </tr>
	                    
	                </table>
            
                
            	</div>

	            <div class="pagination-area">
	                <div class="pagination">
	                    <a href="#">&laquo;</a>
	                    <a href="#">1</a>
	                    <a href="#" class="active">2</a>
	                    <a href="#">3</a>
	                    <a href="#">4</a>
	                    <a href="#">5</a>
	                    <a href="#">&raquo;</a>
                </div>
            </div>
        </div>
	 	
	 	</div>
	 	
	 	

        
    </main>



</body>


</html>