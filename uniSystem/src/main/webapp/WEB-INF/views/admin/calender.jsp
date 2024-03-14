<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학사 일정</title>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="/resources/css/style-main.css">
<!--     <link rel="stylesheet" href="/resources/css/admin/subjectList.css"> -->

</head>
<body>

    
    <main>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

    <h1>Calendar Page</h1>
    <!-- Add form elements to input event details -->
    <form id="eventForm">
        <label for="summary">Summary:</label>
        <input type="text" id="summary" name="summary" required><br><br>
        <label for="startDateTime">Start Date and Time:</label>
        <input type="datetime-local" id="startDateTime" name="startDateTime" required><br><br>
        <label for="endDateTime">End Date and Time:</label>
        <input type="datetime-local" id="endDateTime" name="endDateTime" required><br><br>
        <button type="submit">Create Event</button>
    </form>


    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </main>
    

    <script src="/resources/js/admin/calender.js"></script>
    <script src="/resources/js/header.js"></script>
    
</body>
</html>