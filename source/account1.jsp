<%@ page contentType="text/html; charset=utf-8"
   pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>


<!DOCTYPE html>
<html>
<head>
   <title>���°���</title>
</head>
<body>   
   
   
<%   

   request.setCharacterEncoding("utf-8");
   //��¥ ��ü ���� �� String Ÿ������ �� ��ȯ�Ͽ� ������ �Ҵ�
   LocalDate now = LocalDate.now();
   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
   String formatedNow = now.format(formatter);
   
   String name = request.getParameter("name");
   String phone = request.getParameter("phone");
   String email = request.getParameter("email");
   String secretNum = request.getParameter("secretNum");
   
   String type = request.getParameter("type");
   int money = Integer.parseInt(request.getParameter("money"));
   
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
      
      //ACCOUNT_ID.NEXTVAL�� �������� �����ͺ��̽� ���� ����� ����
      String sql = "UPDATE ���ݰ��� SET ���ݰ���ID= ACCOUNT_ID.NEXTVAL, ���ݰ�������=?, �����ܰ�=?, ���ݰ�������=? WHERE ���ݰ���ID = '�ӽð�'";

        pstmt = conn.prepareStatement(sql);
        
        pstmt.setString(1, type);
        pstmt.setInt(2, money);
        pstmt.setString(3, formatedNow);


        pstmt.executeUpdate();

      
%>
      <p>�߰��Ǿ����ϴ�.</p>
      
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
