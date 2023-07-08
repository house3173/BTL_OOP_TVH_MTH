<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="database.quizDao" %>
<%@page import ="model.quiz" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
.quiz_adding {
	font-family:Times New Roman;
	font-size: 25px;
	color:red;
	padding-left: 5px;
	padding-right: 5px;  
	display: inline-block;
}
.form_quiz label {
	width:30%;
}
.form_quiz i {
	margin-right:4px;
}
.time input[type="number"] {
	width: 50px;
	background-color: #e9ecef;
	border: 1px solid grey;
}
.overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.2); 
      z-index: 9999; 
      display:flex;
      justify-content:center;
      align-items:center;
    }
</style>
</head>
<body>
<%
	String nameOfQuiz = session.getAttribute("nameOfQuiz")+"";
	nameOfQuiz = (nameOfQuiz.equalsIgnoreCase("null"))?"":nameOfQuiz;
	
	quizDao quizdao = new quizDao();
	quiz quizSelected = quizdao.selectByNameQuiz(nameOfQuiz);
	
	String timelimit = quizSelected.getTimeLimit() + " " + quizSelected.getTimeUit();
	
%>
	<!-- 	Header Page      -->
	<div style="z-index:2; display:flex; height:50px; background-color:#0073a5; padding: 0px 50px; justify-content: space-between; align-items:center; position:sticky; top:0;">
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
				<span><span style="color:#c63834;">Home /</span> My courses / <span style="color:#c63834;"> THI CUỐI KỲ / </span>
				<span style="color:#c63834;"> General / </span> 
				<span style="color:#c63834;"> <%=quizSelected.getNameQuiz() %> </span></span>
			</div>
			<div style="position:relative;">
				
				
			</div>
		</div>
	</div>
<!-- End Thong tin IT -->

<!--  Adding a new quiz -->
<div class="container" style="border: 1.5px solid #ebebeb; border-radius:5px; height:auto; margin-top:20px; padding: 20px 25px;">
	
	<div style="padding:15px; display:flex; width:100%; justify-content:space-between;">
		<div>
			<h2 style="color:#c63834; font-family:Times New Roman;" class="quiz_adding"><b><%=nameOfQuiz %></b></h2>
		</div>
		<div style="position:relative;">
			<a href="editing_quiz.jsp"><i class="fa-solid fa-gear" style="cursor:pointer; color: #049fe5; margin-right:5px;"></i></a>
			<i class="fa-sharp fa-solid fa-caret-down" style="color: #c63834;"></i>
		</div>
	</div>
	<div style="width: 40%;padding-top:20px;display:flex;flex-direction: column;align-items: center;margin-left: 60%; ">
		<div>Time limit: <%=timelimit %></div>
		<div style="margin-top:10px;">Grading method: Last attemp</div>
	</div>
	
	<div>
		<h4 style="color:#c63834; font-family:Times New Roman;" class="quiz_adding"><b>Summary of your previous attempts</b></h4>
	</div>
		
	<table style="width:100%; ">
	  <thead style="background-color:#009fe5; height:50px; color: white;">
	    <tr>
	      <th scope="col" style="width:20%;"></th>
	      <th scope="col" style="width:20%;">Attempt</th>
	      <th scope="col" style="width:20%;">State</th>
	      <th scope="col" style="width:40%;"></th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr style="height:50px; background-color:#ebebeb;">
	      <td></td>
	      <td>Preview</td>
	      <td>Never submitted</td>
	      <td></td>
	    </tr>
	  </tbody>
	</table>
	
	<br>
	<div style="padding-top:20px; display:flex; justify-content: flex-end;">
	
	<div><button class="btn btn-primary" onclick="turn_on_export_file()" role="button" style="background-color: #009fe5; margin-right:10px;">EXPORT FILE QUESTION</button></div>
	<div><button class="btn btn-primary" onclick="turn_on_start_attempt()" role="button" style="background-color: #009fe5;">PREVIEW QUIZ NOW</button></div>
	
	</div> 
</div>
<!-- End adding a new quiz -->

<!-- 	THÔNG BÁO START ATTEMP -->
<div class="overlay" id="start_attemp" style="display:none;">
	<div style="width: 40%; height:auto; border: 1px solid grey; padding: 10px; background-color:white;">
		<div style="display:flex; justify-content:space-between; align-items:baseline;">
			<h4>Start attempt</h4> 
			<i class="fa-solid fa-xmark" style="color: #d21e27; cursor:pointer;" onclick="cancel_start_attemp()"></i>
		</div>
		<hr>
		<div style="margin-left:20px;">
			<h5 style="color:#c02424;">Time limit</h5>
			<p>
			Your attempt will have a time limit of <%=timelimit%>. When you start, the timer will begin to count down and cannot be paused. 
			You must finish your attempt before it expires. Are you sure you wish to start now?
			</p>
		</div>
		<hr>
		<a href="start_attemp_quiz.jsp"><button type="button" class="btn btn-danger">START ATTEMPT</button></a>
		<button type="button" class="btn btn-primary" onclick="cancel_start_attemp()" style="cursor:pointer;">CANCEL</button>
	</div>
</div>
<!-- 	END THÔNG BÁO START ATTEMP -->

<!-- 	THÔNG BÁO EXPORT FILE -->
<div class="overlay" id="export_file" style="display:none;">
	<div style="width: 40%; height:auto; border: 1px solid grey; padding: 10px; background-color:white;">
		<div style="display:flex; justify-content:space-between; align-items:baseline;">
			<h4>Export file question</h4> 
			<i class="fa-solid fa-xmark" style="color: #d21e27; cursor:pointer;" onclick="cancel_export_file()"></i>
		</div>
		<hr>
		<div style="margin-left:20px;">
			<p>
			Download the file <b><%=nameOfQuiz %>.txt</b> containing the entire content of the quiz question: "<%=nameOfQuiz %>"
			</p>
		</div>
		
		<form action="export_file" method="get" style="display:inline-block;">
			<button type="submit" class="btn btn-danger" onclick="" >DOWNLOAD FILE</button>
		</form>
		<button type="button" class="btn btn-primary" onclick="cancel_export_file()" style="cursor:pointer;">CANCEL</button>
	</div>
</div>
<!-- 	END THÔNG BÁO EXPORT FILE -->

<!-- Hien thi thong bao xem noi dung file sau khi da export thanh cong -->
<%
	String linkFile = request.getAttribute("openFile")+"";
	if (!linkFile.equals("null")) {
%>

	<div id="export_file_success" style="display:block; position:fixed; bottom:0; left:0;">
		<a href="open_export_file.jsp" target="_blank"><button type="button" class="btn btn-primary" style="cursor:pointer;">EXPORT FILE SUCCESS! OPEN FILE!!</button></a>
	</div>

<%
	}
%>
<!-- End Hien thi thong bao xem noi dung file sau khi da export thanh cong -->
<script>
	setTimeout(function() {
	  var myDiv = document.getElementById("export_file_success");
	  myDiv.style.display = "none";
	}, 3000);
	
	function cancel_start_attemp() {
		document.getElementById("start_attemp").style.display ="none";
	}
	function turn_on_start_attempt() {
		document.getElementById("start_attemp").style.display ="flex";
	}
	
	function cancel_export_file() {
		document.getElementById("export_file").style.display ="none";
	}
	function turn_on_export_file() {
		document.getElementById("export_file").style.display ="flex";
	}
</script>
</body>
</html>