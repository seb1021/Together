<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
    <%@page import="java.util.*" %>
    <%@page import="javax.servlet.*" %>
	<%@page import="com.oreilly.servlet.MultipartRequest"%>
    <%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
    <%@page import="java.text.*" %>
    <%//게시물 저장
    request.setCharacterEncoding("UTF-8");
	Connection conn= null;
	PreparedStatement pstmt= null;
	ResultSet rs =null;
	String Contents=null;
	String Title=null;
	
	
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd hh::mm");
	String Time = formatter.format(new java.util.Date());

	
	Contents = request.getParameter("Contents");
    Title = request.getParameter("Title");
    
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sns","root","5245");
		
		//게시글을 DB에 저장하는 부분
		pstmt = conn.prepareStatement("INSERT INTO post(email,Title,Contents,Time) VALUES(?,?,?,?)");
		System.out.println((String)session.getAttribute("username"));
		pstmt.setString(1,(String)session.getAttribute("username"));
		pstmt.setString(2,Title);
		pstmt.setString(3,Contents);
		pstmt.setString(4,Time);
		pstmt.executeUpdate();
		
		out.print("<script>alert('게시글 작성 완료!')</script>");
		response.sendRedirect("Post.jsp");
		
	}
	catch(Exception e){
		e.printStackTrace();
	}
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>