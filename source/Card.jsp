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
	<p>�Ϸ�</p>
	<%	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String secretNum= request.getParameter("secretNum");
	int maxMoney = Integer.parseInt(request.getParameter("maxMoney"));
	String items= request.getParameter("items");
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}catch(ClassNotFoundException cnfe){
		cnfe.printStackTrace();
		System.out.println("����̹� �ε� ����");
	}
	try{
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String userId = "class_a";
		String userPass = "practice";

		conn = DriverManager.getConnection(jdbcUrl, userId, userPass);
		
		String sql = "UPDATE ���ݰ��� SET ī���û���� = 'YES' WHERE ���ݰ���ID=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
	
		pstmt.executeUpdate();
				
%>
	<jsp:forward page="Card2.jsp"/>
<%
	}catch(SQLException e){
		e.printStackTrace();
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(SQLException sqle) {}
		}
		if(conn != null) {
			try {
				conn.close();
			}catch(SQLException sqle) {}
		}
	}
%>
</body>
</html>