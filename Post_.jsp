<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
    <%@page import="java.util.*" %>
    <%@page import="javax.servlet.*" %>
	<%@page import="com.oreilly.servlet.MultipartRequest"%>
    <%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
        
    <% 
    request.setCharacterEncoding("UTF-8");
	Connection conn= null;
	PreparedStatement pstmt= null;
	ResultSet rs =null;
	String Contents=null;
	String Images=null;
	String action=null;
	String savePath="C:\\Users\\오연정\\Desktop\\2019 3학년\\1학기\\전프";//업로드 한 파일을 저장할 디렉토리(절대경로)
	int sizeLimit = 100*1024*1024;//100메가까지
	
 	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8",new DefaultFileRenamePolicy());
		
	//html에서 form에 입력된 값 받아오기	
	Contents = multi.getParameter("Contents");
	Images = multi.getFilesystemName("Images");
    action = multi.getParameter("action");

	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sns","root","1220");
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	if(action.equals("WriteAPost")){//게시글 작성하기
		try{
    		
    		//게시글을 DB에 저장하는 부분
    		pstmt = conn.prepareStatement("INSERT INTO post(Contents,image_path) VALUES(?,?)");
    		pstmt.setString(1,Contents);
    		pstmt.setString(2,Images);
    		pstmt.executeUpdate();
    		
    		
    	}
    	catch(Exception e){
    		e.printStackTrace();
    	}
	}
	
	else if(action.equals("ShowAPost")){//내 게시글 띄우기
		try{
			pstmt = conn.prepareStatement("SELECT *FROM post");//테이블의 모든 데이터 가져오기
			ArrayList<String []> Post_List = new ArrayList<String[]>();//테이블의 모든 정보를 저장할 배열 생성
			rs = pstmt.executeQuery();
			
			while(rs.next()){//게시글 데이터를 배열로 만들어서 저장
				String[] list= new String[2];
				list[0] = rs.getString("Contents");
				list[1] = rs.getString("image_path");
				Post_List.add(list);
			}

			request.setAttribute("Post_List",Post_List);
			pageContext.forward("Post.jsp?");
    			
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
    	
    %>
    			