<%@ page contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>���°���</title>
</head>
<body>
<%
	
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String phone = request.getParameter("phoneNum");
	String email = request.getParameter("email");
	String secretNum = request.getParameter("secretNum");
	String birthday = request.getParameter("birthday");
	String address = request.getParameter("address");
	String job = request.getParameter("job");

	


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
		

		String sql = "INSERT INTO ���ݰ��� values('�ӽð�', ?, ?, ?, ?, '0', 0, 'NO', '0')";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		pstmt.setString(3, email);
		pstmt.setString(4, secretNum);
		
		pstmt.executeUpdate();

%>
	<p>���°����� �ʿ��� �������� �Է����ּ���.</p>
	

	<form name="form2" method="post" action="account1.jsp">
		<p>���ݰ������� : <input type="text" name="type"></p>
		<p>�����ܰ� : <input type="text" name="money"></p>
		<p><input type="submit" name="submit" value="Ȯ��"></p>
	</form>
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