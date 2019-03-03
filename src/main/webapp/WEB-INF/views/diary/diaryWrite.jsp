<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>diaryWrite</title>
<link rel="stylesheet" href="resources/css/main.css" />
<style>
p {text-align:center;}
.diaryTable {width:40%; height:40%; margin:auto;}
</style>
<script>
$(document).ready(function(){
	$('#writeBtn').on('click', diaryWrite);
});
//버튼 누르면 일기작성
function diaryWrite(){
	
	var 
	$.ajax({
		url:'diaryWrite',
		type:'post',
		data: $('#diaryForm').serialize(),
		success: function(){ alert('저장되었습니다.');},
		error: function(){ alert('저장 실패');}
	});
}
</script>
 </head>
<body><p>오늘 하루 어땠나요?</p>
<form id="diaryForm">
<table class="diaryTable">
	<tr>
		<td colspan="3">날짜</td>
		
		<td></td>
	</tr>
	<tr>
		<td colspan="3">제목</td>
		<td><input type="text" id="title" name="title"></td>
	</tr>
	<tr>
		<td colspan="3">날씨</td>
		<td><div name="weather"></div></td>
	</tr>
	<tr>
		<td colspan="3">기분</td>
		<td></td>
	</tr>
	
	<tr>
		<td colspan="3" >글내용</td>
		<td><textarea rows="8" cols="100" name="content"></textarea></td>
	</tr>
	<tr>
		<td colspan="3">사진</td>
		<td><input type="button" value="파일선택"></td>
	</tr>
</table>
</form>
<input type="button" value="작성" id="writeBtn">
</body>
</html>