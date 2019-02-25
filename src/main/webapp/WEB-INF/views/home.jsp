<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link href="resources/css/home.css" rel="stylesheet" type="text/css">
<title>Home</title>
</head>
<body>

<div class="login">
    <h1>Login</h1>
    <form method="post">
        <input type="text" name="u" placeholder="Username" required="required" />
        <input type="password" name="p" placeholder="Password" required="required" />
        <button type="submit" class="btn btn-primary btn-block btn-large">Let me in.</button>
    </form>
</div>
<div><p><a></a></p></div>
<div><p><a href="weather"> 날씨 테스트 </a></p></div>
<div><p><a href="diaryList">다이어리 리스트</a></p></div>
</body>
</html>
