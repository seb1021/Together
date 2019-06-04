<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
			request.setCharacterEncoding("UTF-8");
			String url = "jdbc:mysql://127.0.0.1:3306/sns";
			String uid = "root";
			String pwd = "5245";
		 String driver = "com.mysql.jdbc.Driver";
		 String nickname = request.getParameter("nickname");
		 String gender = request.getParameter("gender");
		 String birth = request.getParameter("birth");
		 String website = request.getParameter("website");
		 String introduction = request.getParameter("comment");
		 String picture = request.getParameter("file");
		
		 Connection connect = null;
			PreparedStatement pstmt = null;
		out.println(session.getAttribute("username")+"님이 로그인하셨습니다.");
		out.println(nickname);
		out.println(gender);
		out.println(birth);
		out.println(website);
		out.println(introduction);
		out.println(picture);
		try{
			
			Class.forName(driver);
			connect = DriverManager.getConnection(url, "root", "5245");
			
			if(connect != null){

				 String query2 = "UPDATE users set nickname=?, gender=?, birth=?, website=?, introduction=?, picture=? where email=?";		
				 pstmt = connect.prepareStatement(query2);

				 pstmt.setString(1, nickname);
				 pstmt.setString(2, gender);
				 pstmt.setString(3, birth);
				 pstmt.setString(4, website);
				 pstmt.setString(5, introduction);
				 pstmt.setString(6, picture);
				 pstmt.setString(7,(String)session.getAttribute("username"));
				 pstmt.executeUpdate();
				
				 out.println("<script>alert('저장되었습니다.')</script>");
				 out.println("<script>window.location='ShowProfile.jsp'</script>");
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