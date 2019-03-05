<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link href="resources/css/home.css" rel="stylesheet" type="text/css">
<title>Home</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>

function check(){
	var id = document.getElementById("id");
	var password = document.getElementById("password");
	
	if(id.value.length < 3){
		alert('아이디를 3글자 이상 입력하세요.');
		return false;
	}
	
	if(password.value.length < 3){
		alert('비밀번호를 3글자 이상 입력하세요.');
		return false;
	}
	return true;
}
</script>
</head>
<body>

<div class="login">
    <h1>일 품 달</h1>
    <h3>Whisper to the moon</h3>
	<form action="login" method="post" onsubmit="return check()">
        <input type="text" name="id" placeholder="Username" id="id" required="required" />
        <input type="password" name="password" placeholder="Password" id="password" required="required" />
        <button type="submit" class="btn btn-primary btn-block btn-large">로그인</button>
    </form>
    <form action="join" method="get">
        <button type="submit" class="btn btn-primary btn-block btn-large">회원가입</button>
    </form>
    
</div>

</body>
</html>