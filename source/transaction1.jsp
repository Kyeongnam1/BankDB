<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>거래</title>
</head>
<body>	
	<p>완료</p>
<%	
	String id1 = request.getParameter("id1");
	String id2 = request.getParameter("id2");
	int money = Integer.parseInt(request.getParameter("money"));
	String text = request.getParameter("text");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}catch(ClassNotFoundException cnfe){
		cnfe.printStackTrace();
		System.out.println("드라이버 로딩 실패");
	}
	try{
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String userId = "class_a";
		String userPass = "practice";

		conn = DriverManager.getConnection(jdbcUrl, userId, userPass);
		
		String sql = "UPDATE 예금계좌 SET 예금잔고=예금잔고+ ? WHERE 예금계좌ID= ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, money);
		pstmt.setString(2, id2);
	
		rs = pstmt.executeQuery();
				
%>
			
		<jsp:forward page="transaction2.jsp"/>

<%
	}catch(SQLException e){
		e.printStackTrace();

		if(rs != null) {
			try {
				rs.close();
			}catch(SQLException sqle) {} 
		}
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

	</table>

</body>
</html>