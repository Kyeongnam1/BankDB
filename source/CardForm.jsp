<%@ page contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ī�� �����</title>
</head>
<body>
	<p>ī���û�� ���Ͻô� ID�� �Է����ּ���.</p>
	<form name="form4" method="post" action="Card.jsp">
		<p>�� �̸� : <input type="text" name="name"></p>
		<p>���ݰ���ID : <input type="text" name="id"></p>
		<p>�� �ֹι�ȣ : <input type="text" name="secretNum"></p>
		<p>ī�� �ѵ��ݾ� : <input type="text" name="maxMoney"></p>
		<p>ī�� ���� :<select name="items">
			<option value="�ſ�ī��">�ſ�ī��</option>
			<option value="üũī��">üũī��</option>	
		</select>
		</p>
		<p><input type="submit" name="Submit" value="��û�ϱ�"></p>
	</form>
</body>
</html>