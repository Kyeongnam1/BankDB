<%@ page contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>���°���</title>
</head>
<body>

	<p>���࿡ ������ �� ����ߴ� ���� ������ �Է����ּ���.</p>
	<form name="form1" method="post" action="client1.jsp">
		<p>���̸� : <input type="text" name="name"></p>
		<p>���ֹι�ȣ : <input type="text" name="secretNum"></p>
		<p>����ȭ��ȣ : <input type="text" name="phoneNum"></p>
		<p>���̸��� : <input type="text" name="email"></p>
		<p>������ : <input type="text" name="birthday"></p>
		<p>���ּ� : <input type="text" name="address"></p>
		<p>������ : <input type="text" name="job"></p>
		<p><input type="submit" name="submit" value="Ȯ��"></p>
		
	</form>
		

</body>
</html>