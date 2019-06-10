<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*,java.util.ArrayList "
    pageEncoding="UTF-8"%>
    <html>
    <head><script type="text/javascript">
<%
   	Connection conn = null;//db연동
    PreparedStatement pstmt = null;//동적쿼리문
    ResultSet rs  = null;//결과가저장될 변수
    java.sql.Statement st = null;//정적인 쿼리문
    String sql;//쿼리문장
    String jdbc_driver = "com.mysql.jdbc.Driver";
    String jdbc_url = "jdbc:mysql://localhost/sns";
    String action = request.getParameter("action");
    try{
          Class.forName(jdbc_driver);
          conn = DriverManager.getConnection(jdbc_url, "root", "5245");
          st = conn.createStatement();//객체생성
         
       }
       catch(Exception e)
         {
            System.out.println(e);
       }
    if(action.equals("store_schedule")){
        String day=request.getParameter("day");
        String title=request.getParameter("title");
		String contents=request.getParameter("contents");
	    //jsp에 자바코드를 사용할때  
	    sql = "insert into schedule values ('"+day+"','"+title+"','"+contents+"')";    
	    try{
	    	st.executeUpdate(sql);
	    }
	    catch(SQLException e){
	    	e.printStackTrace();
	    }
	   	finally{
	   		st.close();
	   		conn.close();
	   	}
    }
    else if(action.equals("load_schedule")){
    	String year=request.getParameter("year");
    	String month=request.getParameter("month");
    	sql="select * from schedule where day like '"+year+month+"%'";
    	ArrayList<String[]> schedule_list = new ArrayList<String[]>();
    	try{
    		rs = st.executeQuery(sql);
    		while(rs.next()) {
                String[] term_list = new String[3];
                term_list[0] = rs.getString("day");
                term_list[1] = rs.getString("title");
                term_list[2] = rs.getString("contents");
                schedule_list.add(term_list);
             }
            request.setAttribute("schedule_list",  schedule_list);//서버에 list를 올려줌
			pageContext.forward("calendar.jsp?year='"+year+"'&month='"+month+"'");
    	}
    	 catch(SQLException e){
 	    	e.printStackTrace();
 	    }
	   	finally{
	   		st.close();
	   		conn.close();
	   	}
    }
    else if(action.equals("del_schedule")){
    	String date=request.getParameter("date");
    	sql="delete from schedule where day ='"+date+"'";
    	 try{
 	    	st.executeUpdate(sql);
 	    }
 	    catch(SQLException e){
 	    	e.printStackTrace();
 	    }
 	   	finally{
 	   		st.close();
 	   		conn.close();
 	   	}
    }
%>  
</script>
</head><body>
</body></html>