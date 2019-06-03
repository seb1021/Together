<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
    
    <%
    	Connection conn= null;
    	PreparedStatement pstmt= null;
    	ResultSet rs =null;
    	
    	//form에서 데이터베이스에 저장할 값 받아오기
    	String Contents = request.getParameter("contents");
    	String Images = request.getParameter("images");
    	out.print(Contents);
    	out.print(Images);
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
    		
    		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sns","root","1220");
    		//게시글을 DB에 저장하는 부분
    		pstmt = conn.prepareStatement("INSERT INTO post(Contents,image_path) VALUES(?,?)");
    		pstmt.setString(1,Contents);
    		pstmt.setString(2,Images);
    		pstmt.executeUpdate();
    	}
    	catch(Exception e){
    		e.printStackTrace();
    	}
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

</body>
</html>