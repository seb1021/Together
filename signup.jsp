<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	
	request.setCharacterEncoding("UTF-8");
		String url = "jdbc:mysql://127.0.0.1:3306/sns";
		String uid = "root";
		String pwd = "5245";
		String driver = "com.mysql.jdbc.Driver";
		String email = request.getParameter("Email");
		String password = request.getParameter("Password");
		String tel = request.getParameter("Tel");
		String name = request.getParameter("Name");
		
		Connection connect = null;
		PreparedStatement pstmt = null;
		
		try{
			
			Class.forName(driver);
			connect = DriverManager.getConnection(url, "root", "5245");
			if(connect != null){

				String query = "SELECT * from users";
				pstmt = connect.prepareStatement(query);
				ResultSet rs = pstmt.executeQuery();
				boolean foundUser = false;

				while( rs.next() ){
					String preEmail = rs.getString("email");
					if(email.equals(preEmail))
						foundUser = true;
						
				}

				if(foundUser){
					out.println("<script>alert('이미 등록되어있는 이메일입니다.')</script>");
					out.println("<script>window.location='login.html'</script>");
				}else {

					String query2 = "INSERT INTO users(email, password, name,tel) VALUES(?,?,?,?);";
					 pstmt = connect.prepareStatement(query2);

					 pstmt.setString(1, email);
					 pstmt.setString(2, password);
					 pstmt.setString(3, name);
					 pstmt.setString(4, tel);
					 pstmt.executeUpdate();
				%>	
					<center>
						out.println("<script>alert('회원가입 성공! 다시 로그인 해주세요♡)')</script>");
					out.println("<script>window.location='index.html'</script>");
					</center>

				<%
				}

				pstmt.close();
				connect.close();
				
			}else{
				out.println("Database cannot be connected!");
			}
		}catch(Exception e){
			
			out.println(e.getMessage()); 
			e.printStackTrace();
		}	
		
		
		
	%>
</body>
</html>