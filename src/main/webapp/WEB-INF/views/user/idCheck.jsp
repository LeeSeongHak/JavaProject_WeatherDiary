<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID Check</title>
<script>
function formCheck(){
	var id = document.getElementById('searchId');
	if(id.value.length < 3){
		alert('�˻��� ���̵� 3���� �̻� �Է��ϼ���.');
		return false;
	}
	return true;
}
function selectId(){
	//���� ������ â - ������
	var id = opener.document.getElementById('custid');
	id.value = '${searchId}';
	this.close();
}
</script>
</head>
<body>
	<h3>[ ID �ߺ� Ȯ�� ]</h3>
	<form action="idCheck" method="post" onsubmit="return formCheck()">
		�˻��� ID<input type="text" name="searchId" id="searchId" value="${searchId}">
		<input type="submit" value="�˻�">
	</form>
<br>
<c:if test="${search}">
	<c:if test="${searchResult == null}">
	<p>����� �� �ִ� ID�Դϴ�.</p>
	<p><a href="javascript:selectId()">����ϱ�</a></p>
	</c:if>
	
	<c:if test="${searchResult != null}">
	<p>�̹� ������� ID�Դϴ�.</p>
	</c:if>
</c:if>
</body>
</html>