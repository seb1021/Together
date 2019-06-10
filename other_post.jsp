<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
    <%@page import="java.util.*" %>
    
    <%
    request.setCharacterEncoding("UTF-8");
   Connection conn= null;
   PreparedStatement pstmt= null;
   
   String[] sub_list = new String[2];
   String[] Title= new String[200];
   String[] Contents = new String[200];
   String[] Time = new String[200];
   String[] email2 = new String[200];

   String Useremail= (String)session.getAttribute("username");
   
   int i=0;
   try{
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sns","root","5245");

      pstmt = conn.prepareStatement("SELECT * FROM post WHERE NOT email='"+Useremail+"'");//테이블의 모든 데이터 가져오기
      //pstmt = conn.prepareStatement("SELECT * FROM post");
      ResultSet rs = pstmt.executeQuery();
      
      while(rs.next())
      {//게시글 데이터를 배열로 만들어서 저장
    	  email2[i]=rs.getString("email");
         Title[i]=rs.getString("Title");
         Contents[i]=rs.getString("Contents");
         Time[i]=rs.getString("Time");
         i++;
      }
      //request.setAttribute("Title",Title);
      //request.setAttribute("Contents",Contents);
      //request.setAttribute("Time",Time);
      //pageContext.forward("Post.jsp?");
      
   }
      catch(Exception e){
         e.printStackTrace();
      }
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>♥Together</title>
<style>
body {
            background-color: #eeeeee;
        }

        .h7 {
            font-size: 0.8rem;
        }

        .gedf-wrapper {
            margin-top: 0.97rem;
        }

        @media (min-width: 992px) {
            .gedf-main {
                padding-left: 4rem;
                padding-right: 4rem;
            }
            .gedf-card {
                margin-bottom: 2.77rem;
            }
        }

        /**Reset Bootstrap*/
        .dropdown-toggle::after {
            content: none;
            display: none;
        }
</style>
<script type="text/javascript" src="//code.jquery.com/jquery-3.1.0.min.js" charset="utf-8"></script>
<script>
var check = false
function with_add()
{
   if(!check)
    {      
        document.getElementById("no").style.display="none";
        document.getElementById("no").style.visibility="none";
        document.getElementById("yes").style.display="inline-block";
        document.getElementById("yes").style.visibility="visible";
        
        check = true;
    }
    else
    {
        document.getElementById("yes").style.display="none";
         document.getElementById("yes").style.visibility="none";
         document.getElementById("no").style.display="inline-block";
         document.getElementById("no").style.visibility="visible";
       
        check = false;
    }
}

</script>
</head>

<body>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
crossorigin="anonymous">
        
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> 
  
   <%
  
  request.setCharacterEncoding("UTF-8");

	String url = "jdbc:mysql://127.0.0.1:3306/sns";
	String uid = "root";
	String pwd = "5245";
	String driver = "com.mysql.jdbc.Driver";
	String email;
	String nickname =null;
	
	Connection connect = null;
	PreparedStatement pstmt2 = null;
	
	Class.forName(driver);
	connect = DriverManager.getConnection(url, "root", "5245");
	
	String query2 = "SELECT * from users";		
	 pstmt2 = connect.prepareStatement(query2);
	 ResultSet rs = pstmt2.executeQuery();
	 
	 while(rs.next()){
		 email = rs.getString("email");
		 if(email.equals(session.getAttribute("username")))
				break;
	 }
  %>
  
  <nav class="navbar navbar-expand-sm bg-light navbar-light">
  
  <ul class="navbar-nav" style="font-size: 1em">
    <li class="nav-item active" >
      <a class="nav-link" href="Post.jsp"><%=session.getAttribute("username")%>님 환영합니다. ♡</a>
    </li>
    
    <li class="nav-item">
      <a class="nav-link" href="logout.jsp">logout</a>
    </li>
    
    <li class="nav-item">
      <a class="nav-link" href="ShowProfile.jsp">내 프로필</a>
    </li>
    
  </ul>
</nav>     
<nav class="navbar navbar-light bg-white">
        <a href="Post.jsp" class="navbar-brand">Together♥</a>
        <form class="form-inline">
            <div class="input-group">
                <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
                <div class="input-group-append">
                    <button class="btn btn-outline-primary" type="button" id="button-addon2">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
        </form>
    </nav>

	<!-- 프로필 보여주는 부분 -->
    <div class="container-fluid gedf-wrapper" style="margin:20px;">
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <div class="h5">@<%=rs.getString("name") %></div>
                        <div class="h7 text-muted">Fullname : OhYeonJeong</div>
                        <div class="h7">Developer of web applications, JavaScript, PHP, Java, Python, Ruby, Java, Node.js,
                            etc.
                        </div>
                    </div>
                    <ul class="list-group list-group-flush">
                    <!-- 이 부분에 다이어리 관련 버튼 추가하면 될듯 -->
                        <li class="list-group-item"><a href="calendar.jsp"><button class="btn btn-primary">My Diary</button></a></li>
                        </ul>
                </div>
            </div>
           
            <div class="col-md-6 gedf-main">
			 	<input type="hidden" name="action" value="WriteAPost">
                <!---Post 시작 부분-->
                <!-- 상단 바 -->			
            </div>
        </div>

        <%for(int m=0; Title[m] != null; m++){ 
        %>
        	<div class="card gedf-card" style="margin-top:20px;">
                    <div class="card-header" style="display: float;">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2">
                                    <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
                                </div>
                                <div class="ml-2">
                                    <div class="h5 m-0" id="Name"><%=email2[m]%></div>
                                    <div class="h7 text-muted">Miracles Lee Cross</div>
                                </div>
                            </div>
                            <div style="margin-top: 20px; margin-left:0px;">
                                <div class="dropdown">
                                    <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-ellipsis-h"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                        <div class="h6 dropdown-header">Configuration</div>
                                        <a class="dropdown-item" href="#">Save</a>
                                        <a class="dropdown-item" href="#">Hide</a>
                                        <a class="dropdown-item" href="#">Report</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-body" style="margin-top: 20px; margin-left: 0px;">
                        <div class="text-muted h7 mb-2" style="margin-top:0px;" > <i class="fa fa-clock-o"></i> <%=Time[m] %></div>
                        <a class="card-link" href="#">
                            <h5 class="card-title" id="title"><%=Title[m] %></h5>
                        </a>

                        <p class="card-text" id="contents"><%=Contents[m] %>
                        </p>
                    </div>
                    <div class="card-footer">
                      <div id="no" style="display:inline-block; visibility:visible;" onclick="with_add()">
						<img src="image\heart1.png" width="20px" height="20px">
						</div>
						<div id="yes" style="display:none; visibility:none;" onclick="with_add()">
						<img src="image\heart2.png" width="20px" height="20px"> 
						</div>

                        
                    </div>
                </div>
        
        	
        <%	
        }%>
         </div>
        </body>
        </html>