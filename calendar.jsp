
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*,java.util.* "
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="schedule_list" scope="request" class="java.util.ArrayList" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Calendar</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
a{
   text-decoration: none;
}
.cal_top{
    text-align: center;
    font-size: 30px;
}
.cal{
    text-align: center;    
}
table.calendar{
    border: 1px solid black;
    display: inline-table;
    text-align: left;
}
table.calendar td{
    vertical-align: top;
    border: 1px solid skyblue;
    width: 100px;
}
</style>
</head>
<body>
<div style="display:inline-block; margin-left:25%; float:left">
    <div class="cal_top">
        <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
        <span id="cal_top_year"></span>.
        <span id="cal_top_month"></span>
        <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
    </div>
    <div id="cal_tab" class="cal">
    </div>
</div>
    <div id="detail" style=" display:inline-block; margin-top:20px; margin-left:1%;">
    </div>
    <br><br>
    <div id="add_schedule" style="margin-left:28%; display:none; visibility: hidden;">
    <form method=post action=sche_db.jsp target=if id=form1>
    	<h3>일정/일기 작성</h3>
    	<input type="hidden" name="action" value="store_schedule">
    	<input type="hidden" id="day" name="day" value="">
        <input type=text id=title name="title" placeholder=제목  size="50"><br><br>
        <textarea cols=100 id=contents name="contents" rows=10 placeholder=내용></textarea>
        <input type=button onclick="write_schedule()" value="작성">
    </form>

     <iframe name="if" style="width: 0px;height: 0px;border: 0px;"></iframe>
    </div>
    
<script type="text/javascript">
    
    var today = null;
    var year = null;
    var month = null;
    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
 
    $(document).ready(function() {
        dayCount = 0;
        today = new Date();

        year = <%= request.getParameter("year")%>;
        month = <%= request.getParameter("month")%>;
        if (year == null && month == null)
        {
        	year = today.getFullYear();
        	month = today.getMonth()+1;	
        	document.getElementById("year").value=year;
            document.getElementById("month").value=month;
            document.getElementById("form2").submit();
        }

        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        

        drawCalendar();
        $("#movePrevMonth").on("click", function(){movePrevMonth();});
        $("#moveNextMonth").on("click", function(){moveNextMonth();});
    });
    
    //calendar 그리기
    function drawCalendar(){

        var setTableHTML = "";
        setTableHTML+='<table class="calendar">';
        setTableHTML+='<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
        var d = 1;
        for(var i=0;i<6;i++){
            setTableHTML+='<tr height="100">';
            for(var j=0;j<7;j++){
                setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap" id="'+year+month+(d)+'" >';
                setTableHTML+='    <div class="cal-day" onclick=add_schedule("'+year+month+(d++)+'")></div>';
                setTableHTML+='</td>';
            }
            setTableHTML+='</tr>';
        }
        setTableHTML+='</table>';
        $("#cal_tab").html(setTableHTML);
        $tdDay = $("td div.cal-day")
        $tdSche = $("td div.cal-schedule")
        drawDays();
        <%
        	for(String[] term : (ArrayList<String[]>)schedule_list)
        	{
        		%>
                $('#<%=term[0]%>').append('<p style="background-color:skyblue;" onclick=detail("<%=term[0]%>")><%=term[1]%></p>');
                $('#detail').append('<p id="<%=term[0]%>_p" style="display:none; visibility: hidden;">제목:<%=term[1]%><br><br>내용:<%=term[2]%></p>');

        		<%
        	}
        %>
    }
    var check2 = false
    function detail(target)
    {
    	var target_num = target+"_p";
    	if(!check2)
        {      
            document.getElementById(target_num).style.display="inline-block";
            document.getElementById(target_num).style.visibility="visible";
            
            check2 = true;
        }
        else
        {
            document.getElementById(target_num).style.display="none";
            document.getElementById(target_num).style.visibility="none";
           
            check2 = false;
        }
    }
    var check = false;

    var target;
    function add_schedule(target_num)
    {
        if(!check)
        {      
            target = target_num; 
            document.getElementById("add_schedule").style.display="inline-block";
            document.getElementById("add_schedule").style.visibility="visible";
            check = true;
        }
        else
        {
            document.getElementById("add_schedule").style.display="none";
            document.getElementById("add_schedule").style.visibility="none";
            check = false;
        }
    }
    function write_schedule()
    {
        var title = document.getElementById("title").value;
        var contents = document.getElementById("contents").value;
        document.getElementById("day").value=target;
        $('#'+target).append('<p style="background-color:skyblue;">'+title+'</p>');
       
        check = false;
        document.getElementById("form1").submit();
        
        document.getElementById("title").value="";
        document.getElementById("contents").value="";
        document.getElementById("add_schedule").style.display="none";
        document.getElementById("add_schedule").style.visibility="none";
    }
    //calendar 날짜표시
    function drawDays(){
        $("#cal_top_year").text(year);
        $("#cal_top_month").text(month);
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            $tdDay.eq(i).text(++dayCount);
        }
        for(var i=0;i<42;i+=7){
            $tdDay.eq(i).css("color","red");
        }
        for(var i=6;i<42;i+=7){
            $tdDay.eq(i).css("color","blue");
        }
    }
 
    //calendar 월 이동
    function movePrevMonth(){
        month--;
        if(month<=0){
            month=12;
            year--;
        }
        getNewInfo();
        }
    
    function moveNextMonth(){
        month++;
        if(month>12){
            month=1;
            year++;
        }
        getNewInfo();
    }

    function getNewInfo(){
        document.getElementById("year").value=year;
        document.getElementById("month").value=month;
        document.getElementById("form2").submit();
        for(var i=0;i<42;i++){
            $tdDay.eq(i).text("");
        }
        dayCount=0;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        drawCalendar();
    }
</script>
<form action="sche_db.jsp" id="form2">
	<input type="hidden" name="action" value="load_schedule">
	<input type="hidden" name="year" id = year value=""> 
	<input type="hidden" id="month" name="month" value="">
</form>
</body>
</html>