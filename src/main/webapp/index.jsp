<%@page import="model.quiz"%>
<%@page import="database.quizDao"%>
<%@page import="java.util.ArrayList"%>



<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bài tập lớn OOP</title>
<link rel="shortcut icon" type="image/png" href="/logo.png"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/38a30191cb.js" crossorigin="anonymous"></script>
<style>
body {
box-sizing: border-box;
}
#popup a {
 border:none; 
 color: #4d84dc;
 }
#popup {
	display: none; 
	position: absolute;
	background-color:white;
	right: 0px;
	width:600px; 
	height:auto; 
	justify-content:space-between;
	padding: 15px;
	border: 1.5px solid #ebebeb;
	border-radius: 5px;
	z-index:1;
}
.quiz_created {
	height:100%; 
	font-family:Times New Roman;
	color:black;
	padding-left: 20px; 
	display: inline-block;
}
</style>
</head>
<body>

<!-- 	Header Page      -->
<div style="display:flex; height:50px; background-color:#0073a5; padding: 0px 50px; justify-content: space-between; align-items:center; position:sticky; top:0; z-index: 2;">
	<div>
	<a href="index.jsp"> <i class="fa-solid fa-house" style="color: #ffffff; height: 100%; width:100px;"></i> </a>
	</div>
	<div style="color:white; height:100%; display:flex; align-items:center;">
		<span>Trịnh Văn Hậu 20215363</span>
		<img alt="" src="https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg" style="height:70%; border-radius:50%; padding: 0px 10px;">
		<i class="fa-sharp fa-solid fa-caret-down" style="color: #ffffff;"></i>
		
	</div>
</div>
<!-- 	End Header Page  -->

<!-- Thong tin IT -->
<div class="container" style="border: 1.5px solid #ebebeb; border-radius:5px; height:auto; margin-top:20px; padding-bottom: 15px;">
	<div style="padding:15px; display:flex; width:100%; justify-content:space-between;">
		<div>
			<h2 style="color:#c63834; font-family:Times New Roman;"><b>IT</b></h2>
			<span><span style="color:red;">Home /</span> My courses / <span style="color:red;"> THI CUỐI KỲ</span></span>
		</div>
		<div style="position:relative;">
			<a onclick="popup2()"><i class="fa-solid fa-gear" style="cursor:pointer; color: #049fe5; margin-right:5px;"></i></a>
			<i class="fa-sharp fa-solid fa-caret-down" style="color: #c63834;"></i>
			
			<!--  Giao dien 1.2 Popup cai dat cau hoi -->
				<div id="popup">
					<div>
						<h4 style="color: #4d84dc;">Question bank</h4>
					</div>
				<div class="list-group">
			 		  <a href="list_question.jsp" class="list-group-item list-group-item-action">Questions</a>
					  <a href="add_new_category.jsp" class="list-group-item list-group-item-action">Categories</a>
					  <a href="import_file.jsp" class="list-group-item list-group-item-action">Import</a>
					  <a href="#" class="list-group-item list-group-item-action">Export</a>
				</div>
				</div>

			<!--  End giao dien Popup cai dat cau hoi -->
		</div>
	</div>
	<div style="padding-top:20px; display:flex; justify-content: flex-end;">
	<div><a class="btn btn-primary" href="add_new_quiz.jsp" role="button" style="background-color: #0073a5;">TURN EDITING ON</a></div>
	</div>
</div>
<!-- End Thong tin IT -->

<!--  Hiển thị các quiz đã được tạo -->
<div class="container" style="border: 1.5px solid #ebebeb; border-radius:5px; height:auto; margin-top:20px; padding: 40px 50px;">
<form action="select_quiz" method="post">
<%
	quizDao newquiz = new quizDao();
	ArrayList<quiz> result = new ArrayList<quiz>();
	result = newquiz.selectAll();
	for (int i = result.size()-1; i>=0; i--) {
		quiz qu = result.get(i);
		String namequ = qu.getNameQuiz();
%>
	<div style="height:30px; margin-bottom:20px;">
		<img alt="" src="img/test_paper_icon.png" style="height:100%; ">
		<input type="submit" value="<%=namequ %>" name="submitQuiz" style ="border: none;background-color: white; font-size: 17px; font-family: serif;">
	</div>
	<% } %>	
</form>
</div>
<!--  End  Hiển thị các quiz đã được tạo -->
<script>
		var clickCount = 0;
		function popup2() {
		
			// Xử lý sự kiện click trên phần tử
			 clickCount++;
			  if (clickCount % 2 === 0) {
				  document.getElementById("popup").style.display = "none"; // Ẩn nội dung
			  } else {
				  document.getElementById("popup").style.display = "flex"; // Hiển thị nội dung
			  }
		}
</script>
</body>
</html>