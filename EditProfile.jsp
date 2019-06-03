<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EditProfile.jsp</title>
</head>
<body>
<%
		String url = "jdbc:mysql://127.0.0.1:3306/sns";
		String uid = "root";
		String pwd = "5245";
		String driver = "com.mysql.jdbc.Driver";
		String nickname = request.getParameter("nickname");
		/*String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		String website = request.getParameter("website");
		String introduction = request.getParameter("introduction");
		String picture = request.getParameter("picture");*/
		
		Connection connect = null;
		PreparedStatement pstmt = null;
		
		try{
			
			Class.forName(driver);
			connect = DriverManager.getConnection(url, "root", "5245");
			
			if(connect != null){

				String query2 = "Update INTO users(nickname,) VALUES(?);";
				 pstmt = connect.prepareStatement(query2);

				 pstmt.setString(1, nickname);
				/* pstmt.setString(2, gender);
				 pstmt.setString(3, birth);
				 pstmt.setString(4, website);
				 pstmt.setString(5, introduction);*/
				 pstmt.executeUpdate();
				
				} 

				pstmt.close();
				connect.close();
				
			
		}catch(Exception e){
			
			out.println(e.getMessage()); 
			e.printStackTrace();
		}	
		
		
		
	%>
</body>
</html>