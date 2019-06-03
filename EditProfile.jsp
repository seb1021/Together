<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="EditProfile.css" rel="stylesheet">
<link href="login.css" rel="stylesheet">
<script src="EditProfile.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" href="https://bootswatch.com/4/simplex/bootstrap.min.css"/>
<title>EditProfile.jsp</title>
</head>
<body>
<%
		String url = "jdbc:mysql://127.0.0.1:3306/sns";
		String uid = "root";
		String pwd = "5245";
		String driver = "com.mysql.jdbc.Driver";
		String email;
		String nickname =null;
		String gender = null;
		String birth = null;
		String website = null;
		String introduction = null;
		String picture= null;
		
		Connection connect = null;
		PreparedStatement pstmt = null;
		out.println(session.getAttribute("username")+"님이 로그인하셨습니다.");
		
		try{
			
			Class.forName(driver);
			connect = DriverManager.getConnection(url, "root", "5245");
			
			if(connect != null){

				String query2 = "SELECT * from users";		
				 pstmt = connect.prepareStatement(query2);
				 ResultSet rs = pstmt.executeQuery();
				 
				 while(rs.next()){
					 email = rs.getString("email");
					 if(email.equals(session.getAttribute("username")))
							break;
				 }
					nickname=rs.getString("nickname");
					gender=rs.getString("gender");
					birth=rs.getString("birth");
					website=rs.getString("website");
					introduction=rs.getString("introduction");
				

				} 

				pstmt.close();
				connect.close();
				
			
		}catch(Exception e){
			
			out.println(e.getMessage()); 
			e.printStackTrace();
		}	
		
		
		
	%>
	<script>
		document.getElementById("nickname").value = <%=nickname%>;	
		document.getElementById("gender").value = <%=gender%>;
		document.getElementById("birth").value = <%=birth%>;
		document.getElementById("website").value = <%=website%>;
		document.getElementById("comment").value = <%=introduction%>;
	</script>
<div align = "center" style="margin-bottom: 30px">
	<h1>Edit Your ProFile !</h1>
	
</div>
<div class="container">
  <div class="card"></div>
  <div class="card">
    <h1 class="title" style="border-left: 5px solid #ec2652;">Profile</h1>
<div class="container">
        <div class="row">
           
                            <div class="d-flex justify-content-start">
                                <div class="image-container">
                                    <img src="http://placehold.it/150x150" id="imgProfile" style="width: 150px; height: 150px" class="img-thumbnail" />
                                    <div class="middle">
                                        <input type="button" class="btn btn-secondary" id="btnChangePicture" value="Change" />
                                        <input type="file" style="display: none;" id="profilePicture" name="file" />
                                    </div>
                                </div>
                                <div class="userData ml-3">
                                    <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold"><a href="javascript:void(0);">Some Name</a></h2>
                                    <h6 class="d-block"><a href="javascript:void(0)">1,500</a> Video Uploads</h6>
                                    <h6 class="d-block"><a href="javascript:void(0)">300</a> Blog Posts</h6>
                                </div>
                                <div class="ml-auto">
                                    <input type="button" class="btn btn-primary d-none" id="btnDiscard" value="Discard Changes" />
                                </div>
                            </div>
                        </div>
						<br><br><br>
                        <div class="row">
                            <div class="col-12">
                                <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="true">Basic Info</a>
                                    </li>             
                                </ul>
                                <div class="tab-content ml-1" id="myTabContent">
                                    <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                        
										<form action="EditProfile.jsp" method="post">
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">닉네임</label>
                                            </div>
                                                 <div class="form-group"> 
												  <input type="text" class="form-control" id="nickname" name="nickname">
												</div>
                                  
                                        </div>
                                        <hr />

                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">성별</label>
                                            </div>
                                             <label class="radio-inline" style="margin-right: 12px"><input type="radio" name="gender" checked value="women">여자</label>
											<label class="radio-inline" style="margin-right: 12px"><input type="radio" name="gender" value="men">남자</label>
											<label class="radio-inline" style="margin-right: 12px"><input type="radio" name="gender" value="secret">비밀</label>
                                        </div>
                                        <hr />
                                        
                                        
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">생일</label>
                                            </div>
                                             <div class="form-group"> 
												  <input type="date" class="form-control" id="birth" name="birth">
												</div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">개인 웹사이트</label>
                                            </div>
                                             <div class="form-group"> 
												  <input type="text" class="form-control" id="website" name="website">
												</div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">소개</label>
                                            </div>
                                           <div class="form-group">
											  <textarea class="form-control" rows="5" cols="50" id="comment" name="comment"></textarea>
											</div>
                                        </div>
                                        <hr />
                                        <div class="button-container">
									       <button type="submit"><span>저장</span></button>
									      </div>
										</form>
                                    </div>
                                    <div class="tab-pane fade" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">
                                        Facebook, Google, Twitter Account that are connected to this account
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>

                </div>
            </div>
  

<%
		
		 driver = "com.mysql.jdbc.Driver";
		 nickname = request.getParameter("nickname");
		 gender = request.getParameter("gender");
		 birth = request.getParameter("birth");
		 website = request.getParameter("website");
		 introduction = request.getParameter("introduction");
		 picture = request.getParameter("picture");
		
		 connect = null;
		 pstmt = null;
		out.println(session.getAttribute("username")+"님이 로그인하셨습니다.");
		out.println(nickname);
		out.println(gender);
		out.println(birth);
		out.println(website);
		out.println(introduction);
		try{
			
			Class.forName(driver);
			connect = DriverManager.getConnection(url, "root", "5245");
			
			if(connect != null){

				String query2 = "UPDATE users set nickname=?, gender=?, birth=?, website=?, introduction=? where email=?";		
				 pstmt = connect.prepareStatement(query2);

				 pstmt.setString(1, nickname);
				
				 pstmt.setString(2, gender);
				 pstmt.setString(3, birth);
				 pstmt.setString(4, website);
				 pstmt.setString(5, introduction);
				 pstmt.setString(6,(String)session.getAttribute("username"));
				 pstmt.executeUpdate();
				
				 out.println("<script>alert('저장되었습니다.')</script>");
				 out.println("<script>window.location=ShowProfile.jsp'</script>");
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