<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="database.quizDao" %>
<%@page import ="model.quiz" %>
<%@page import ="database.questionDao" %>
<%@page import ="model.question" %>
<%@page import ="java.util.ArrayList" %>

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
.dropdown li {
	background-color: #ebebeb;
	color: black;
}
.dropdown li:hover {
	background-color: #049fe5;
	color: white;
}
.dropdown li:hover i {
	color: white;
}
.form-check i {
	margin-left:5px;
}
.questionSelected i {
	margin-right:5px; 
	margin-left:5px;
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
	
	ArrayList<String> listQuestion = (ArrayList<String>) session.getAttribute("listQuestion");
	int numberQuestion = 0;
	if(listQuestion != null) {numberQuestion = listQuestion.size(); }
	
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
				<span style="color:#c63834;"> <%=quizSelected.getNameQuiz() %> / </span>
				<span style="color:#c63834;">Edit quiz </span></span></div>
			<div style="position:relative;">
				
				
			</div>
		</div>
	</div>
<!-- End Thong tin IT -->


<!--  Adding a new quiz -->
<div class="container" style="border: 1.5px solid #ebebeb; border-radius:5px; height:auto; margin-top:20px; padding: 20px 25px;">
	
	<div style="padding:15px 15px 15px 0px; display:flex; width:100%; justify-content:space-between;">
		<div>
			<h2 style="color:#c63834; font-family:Times New Roman;" class="quiz_adding"><b> Editing quiz: <%=nameOfQuiz %></b>
			<i class="fa-solid fa-circle-question" style="color: #2addea;"></i> </h2>
		</div>
		<div style="position:relative;">
		</div>
	</div>
	
	<div style="display:flex; width:100%; justify-content:space-between;">
		<div>Question: <%=numberQuestion %> | This quiz is open</div>
		<div >
		<span>Maximum grade:</span>
		<span style="padding:8px; ">10.00</span>
		<a class="btn btn-primary" href="setup_quiz.jsp" role="button" style="background-color: #009fe5;">SAVE</a>
		</div>
	</div>
	
	<div style="padding-top: 5px;display:flex; width:100%; justify-content:space-between;">		
		<div >
		<a class="btn btn-primary" href="#" role="button" style="background-color: #009fe5;">REPAGINATE</a>
		<a class="btn btn-primary" href="#" role="button" style="background-color: #009fe5;">SELECT MULTIPLEITEMS</a>
		</div>
		<div style="padding-top: 5px;">Total of marks: <%=numberQuestion %></div>
	</div>
	<br>
	<div style="background-color:#f7f7f7; padding:10px 40px;">
		<div style="display:flex; width:100%; justify-content:space-between; ">
			<div><i class="fa-solid fa-pen" style="color: #2b72ee;"></i></div>
			<div >
			<form action="editing_quiz" method="get" id="submitShuffle">
				<div class="form-check">
				<%
					String shuffle = session.getAttribute("shuffle")+"";
					boolean check = false;
					if(shuffle.equalsIgnoreCase("yes")) check = true;
				%>
					  <input class="form-check-input" type="checkbox" value="yes" id="flexCheckDefault" name="flexCheckDefault" <%=(check)?"checked='checked'":"" %>>
					  <label class="form-check-label" for="flexCheckDefault">
					    Shuffle<i class="fa-solid fa-circle-question" style="color: #2addea;"></i>
					  </label>
				</div>
			</form>	
				<div class="dropdown">
					  <button style="color: black; background-color: #f7f7f7; border:none;" class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
					    Add 
					  </button>
					  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="padding: 0px;">
					    <li><a class="dropdown-item" href="#"><i class="fa-solid fa-plus" style="color: black;"></i> a new question</a></li>
					    <li><a class="dropdown-item" href="question_to_quiz.jsp"><i class="fa-solid fa-plus" style="color: black;"></i> from question bank</a></li>
					    <li><a class="dropdown-item" href="random_question.jsp"><i class="fa-solid fa-plus" style="color: black;"></i> a random question</a></li>
					  </ul>
				</div>
			</div>	 
		</div>
		<div>
		<%
			if(listQuestion != null) {
				int k = 0;
				questionDao quedao = new questionDao();
				for(String nameQue : listQuestion) {
					k++;
					question que = quedao.selectAllByName(nameQue);
					String strquestion = nameQue + " " + que.getTextQuestion();
		%>
		<form action="editing_quiz" method="post">
			<div class="questionSelected" style="padding: 6px; display:flex; justify-content:space-between; align-items:baseline; background-color:#CCCCCC; border: 1px solid #ebebeb; height:42px;">
			  <div style="width: 70%; display:flex; align-items:baseline;">	
			  	<input type="hidden" name="remove_question" value="<%=nameQue %>">
			  	<i class="fa-solid fa-up-down-left-right" style="color: #216ef2; margin-right:5px; margin-left:5px;"></i>
			  	<span style="display:flex; justify-content:center; height:100%; width:40px; background-color:#B0B0B0; "><%=k %></span>
			  	<i class="fa-solid fa-list" style="color: #000000; margin-right:5px; margin-left:5px;"></i>
			  	<i class="fa-solid fa-gear" style="color: #216ef2;"></i>
			  	<div  style="display: inline-block; width: 70%; height:30px; overflow: hidden;text-overflow:ellipsis; border:none; margin-left:5px;"><%=strquestion %></div>
		     </div>	
		     
		     <div style="display:flex; align-items:baseline;">
		     	<i class="fa-sharp fa-solid fa-magnifying-glass-plus" style="color: #216ef2;"></i>
		     	<button type="submit" style="background-color:transparent; border:none;"><i class="fa-solid fa-trash-can" style="color: #216ef2;"></i></button>
		     	<span style="height:90%; width:auto; background-color:white; ">1.00 <i class="fa-solid fa-pen" style="color: #216ef2;"></i></span>
		     </div>
		    </div>
		</form>
		<%
				}
			}
		%>
		
		</div>
	</div>
</div>
<!-- End adding a new quiz -->

<script>
	function submitShuffle() {
		var form = document.getElementById("submitShuffle");
		form.submit();
	}
</script>
</body>
</html>