<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*,java.util.* "
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
<div id="no" style="display:inline-block; visibility:visible;" onclick="with_add()">
<img src="image/no.png" width="20px" height="20px">
</div>
<div id="yes" style="display:none; visibility:none;" onclick="with_add()">
<img src="image/yes.png" width="20px" height="20px"> 
</div>
<script type="text/javascript">
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
</body>
</html>