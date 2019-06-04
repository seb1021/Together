<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*,java.util.* "
    pageEncoding="UTF-8"%>
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
<jsp:useBean id="Post_List" scope="request" class="java.util.ArrayList" />
<script type="text/javascript">
	var sel_file;
	
	$(document).ready(function(){
		$("#customFile").on("change",handleImgFileSelect);
	});
	
	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#img").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
</script>
</head>

<body>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
        crossorigin="anonymous">
        
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
        
<nav class="navbar navbar-light bg-white">
        <a href="Post.html" class="navbar-brand">Together♥</a>
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
    <div class="container-fluid gedf-wrapper">
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <div class="h5">@OhYeonJeong</div>
                        <div class="h7 text-muted">Fullname : OhYeonJeong</div>
                        <div class="h7">Developer of web applications, JavaScript, PHP, Java, Python, Ruby, Java, Node.js,
                            etc.
                        </div>
                    </div>
                    <ul class="list-group list-group-flush">
                    <!-- 이 부분에 다이어리 관련 버튼 추가하면 될듯 -->
                        <li class="list-group-item"><button class="btn btn-primary">My Diary</button></li>
                        </ul>
                </div>
            </div>
           
            <div class="col-md-6 gedf-main">
			 <form id="form1" method="POST" action="Post_.jsp" enctype="multipart/form-data">
			 	<input type="hidden" name="action" value="WriteAPost">
                <!---Post 시작 부분-->
                <!-- 상단 바 -->
                <div class="card gedf-card">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">게시글 작성</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="images-tab" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#images">이미지 첨부</a>
                            </li>
                        </ul>
                    </div>
                    
                    <div class="card-body">
                        <div class="tab-content" id="myTabContent">
                        <!-- 글을 작성하는 부분 -->
                            <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                                <div class="form-group">
                                    <label class="sr-only" for="message">post</label>
                                    <input type="text" class="form-control" name="Contents" id="message"  placeholder="무슨 생각을 하시나요? 생각을 공유하세요:)" required>
                                </div>
                            </div>
                            
                            <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                                <div class="form-group">
                                    <div class="custom-file">
                                        <input type="file" name="Images" class="custom-file-input" id="customFile" required>
                                        
                                        <!-- 이미지 파일 첨부하는 부분 -->
                                        <label class="custom-file-label" for="customFile">사진을 첨부하세요.</label>
                                        <br><br>
                                        <div style="font: Comic Sans MS; font-weight: bold;">Photo Preview</div>
                                        
                                        <!-- 이미지를 미리 보기하는 부분 -->
                                   		<div>
                                   		<br>
                                        <img id="img" style="width:50%; height:50%;"/>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="py-4"></div>
                            </div>
                            
                        </div>
                        <div class="btn-toolbar justify-content-between">
                            <div class="btn-group">
                                <button type="submit" class="btn btn-primary">공유</button>
                            </div>
                            <div class="btn-group">
                                <button id="btnGroupDrop1" type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                    <i class="fa fa-globe"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="btnGroupDrop1">
                                    <a class="dropdown-item" href="#"><i class="fa fa-globe"></i> Public</a>
                                    <a class="dropdown-item" href="#"><i class="fa fa-users"></i> Friends</a>
                                    <a class="dropdown-item" href="#"><i class="fa fa-user"></i> Just me</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
			</form>

				<form id="form2" method="POST" action="Post_.jsp" enctype="multipart/form-data" target=if>
					<input type="hidden" name="action" value="ShowAPost">
					
					<% for(String[] A : (ArrayList<String[]>)Post_List) {
					%>
						
						<div class="card gedf-card">
                    	<div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2">
                                    <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
                                </div>
                                <div class="ml-2">
                                    <div id="Name" class="h5 m-0">OhYeonJeong</div>
                                </div>
                            </div>
                            <div>
                                <div class="dropdown">
                                    <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Delete
                                    </button>
                                </div>
                            </div>
                        </div>
					<div class="card-body">
                        <p id="PostMessage"class="card-text"></p>
                        <p id="PostImage" class="card-text"></p>
                    </div>
                </div>
                </div>
                <%
					}
					
				%>
				</form>
				<iframe name="if" style="width: 0px;height: 0px;border: 0px;"></iframe>
            </div>
        </div>
        </div>
        <script type="text/javascript">
        	$(document).ready(function(){
        		document.getElementById("form2").submit();
        	});
        </script>
        </body>
        </html>