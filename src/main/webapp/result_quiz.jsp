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
	position: relative;
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
.theme-table-wrap {
    position: relative;
    background-color: #fff;
    z-index: 2;
    margin-top: 1.3rem;
    clear: both;
    border-radius: 0.15rem;
}
th.cell {
    padding: 1px 0.5em 1px 1em;
    font-weight: 700;
    text-align: right;
    width: 10em;
}
td.cell {
	padding: 1px 0.5em 1px 1em;
}
th.th_odd {
	background-color: #f7f7f7;
}
th.th_even {
	background-color: #f0f0f0;
}
th {
	vertical-align: top;
    color: #cf1628;
    display: table-cell;
    font-size: .85rem;
}
td.td_odd {
	background-color: #f7f7f7;
}
td.td_even {
	background-color: #fafafa;
}
table {
	font-size: .85rem;
	width: 100%;
	margin-bottom: 20px;
	color: #212529;
	border-collapse: collapse;
	text-indent: initial;
    border-spacing: 2px;
    border-color: gray;
}
</style>
</head>
<body>
<!-- 	Header Page      -->
<%
	String nameOfQuizTime = session.getAttribute("nameOfQuiz")+"";
	nameOfQuizTime = (nameOfQuizTime.equalsIgnoreCase("null"))?"":nameOfQuizTime;
	
	quizDao quizdaoTime = new quizDao();
	quiz quizSelectedTime = quizdaoTime.selectByNameQuiz(nameOfQuizTime);
	
%>
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
				<span><a href="index.jsp" style="text-decoration:none;"><span style="color:#c63834;">Home /</span></a> My courses / 
				<a href="index.jsp" style="text-decoration:none;"><span style="color:#c63834;"> THI CUỐI KỲ /</span></a>
				<span style="color:#c63834;"> General / </span> 
				<a href="setup_quiz.jsp" style="text-decoration:none;"><span style="color:#c63834;"> <%=quizSelectedTime.getNameQuiz() %> /</span></a>
				<span style="color:#c63834;">Preview</span></span>
			</div>
			<div style="position:relative;">
				
				
			</div>
		</div>
	</div>
<!-- End Thong tin IT -->

<!-- Noi dung quiz -->
<%
	String startQuiz = (String) session.getAttribute("startQuiz");
	String finishQuiz = (String) session.getAttribute("finishQuiz");
	String timeTaken = request.getAttribute("timeForQuiz")+"";
	
	ArrayList<String> listQuestion = (ArrayList<String>) session.getAttribute("listQuestion");
	ArrayList<String> answerQuestion = (ArrayList<String>) session.getAttribute("answerQuestion");
	ArrayList<String> resultQuiz = (ArrayList<String>) session.getAttribute("resultQuiz");
	ArrayList<Boolean> markQuestion = (ArrayList<Boolean>) session.getAttribute("markQuestion");
	int marks = (int) session.getAttribute("marks");
	double grade = (double) session.getAttribute("grade");
	double roundGrade = Math.round(grade * 100) / 100.0;
	double roundPercentGrade = Math.round(grade * 1000) / 100;
	
	int numberQuestion = 0;
	if(listQuestion != null) {numberQuestion = listQuestion.size(); }
	
%>
<form action="finish_attemp" method="post" id="attemp_form">
<div class="container" style="display:flex; justify-content: space-between; align-items:flex-start; margin-bottom: 100px;">

	<!-- List cac cau hoi -->
	<div style="position: sticky; top:70px; border: 1.5px solid #ebebeb; height:auto; margin-top:20px; margin-right:10px; padding: 20px 25px; width: 75%; ">
		<div class="theme-table-wrap">
			<table>
				<tbody>
					<tr>
						<th class="cell th_odd" scope="row">Started on</th>
						<td class="cell td_odd"><%=startQuiz %></td>
					</tr>
					<tr>
						<th class="cell th_even" scope="row">State</th>
						<td class="cell td_even">Finished</td>
					</tr>
					<tr>
						<th class="cell th_odd" scope="row">Completed on</th>
						<td class="cell td_odd"><%=finishQuiz %></td>
					</tr>
					<tr>
						<th class="cell th_even" scope="row">Time taken</th>
						<td class="cell td_even"><%=timeTaken %></td>
					</tr>
					<tr>
						<th class="cell th_odd" scope="row">Marks</th>
						<td class="cell td_odd"><b><%=marks %></b> out of <%=numberQuestion %> </td>
					</tr>
					<tr>
						<th class="cell th_even" scope="row">Grade</th>
						<td class="cell td_even"><b><%=roundGrade %></b> out of 10.00 (<b><%=roundPercentGrade%></b>%)</td>
					</tr>
				</tbody>
			</table>
		</div>
		<br>
		<div>
			<%
			if(listQuestion != null) {
				int k = 0;
				questionDao quedao = new questionDao();
				for(int j = 0; j<listQuestion.size(); j++) {
					String nameQue = listQuestion.get(j);
					String answered = answerQuestion.get(j);
					String resulted = resultQuiz.get(j);
					
					k++;
					question que = quedao.selectAllByName(nameQue);
					String strquestion = nameQue + ": " + que.getTextQuestion();
					ArrayList<String> result = que.choiceNotNull();
					String selectChoice = "selectChoice"+k;
					String link ="link"+k;
			%>
			<div id="<%=k %>" style="display:flex; justify-content:space-between; align-items:flex-start; margin-bottom:20px;">
				<div style="width:100px; height: auto; padding:5px; margin-right:10px; border: 1px solid #ebebeb; background-color:#F2F2F2;">
					<span style="color:#c63834; font-size:13px;">Question<b style="font-size:16px;"> <%=k %></b></span><br>
					<span style="font-size:13px;">Not yet answered</span><br>
					<span style="font-size:13px;">Marked out of: 1.00</span><br>
					<span style="font-size:13px;">Flag question</span>
				</div>
				
				<div style="width:90%;">
					<div style="height: auto; min-height: 200px; padding:10px 10px 25px 10px; background-color: #d6f7fb;">
					<p><%=strquestion %></p>
					<%
						for (int i = 0; i < result.size()-1; i++) {
							
					%>
						<div class="form-check" >
							  <input class="form-check-input" type="radio" disabled>
							  <label class="form-check-label" for="<%=selectChoice %>" style="opacity:1;">
							    <%=result.get(i) %>
							    <%
							    	if(result.get(i).equals(answered)) {
							    		if (!answered.equals(resulted)) {
							    %>
							    			<i class="fa-solid fa-xmark" style="color: #ff0000;"></i>
							    <%			
							    		} else {
							    %>
								    		<i class="fa-solid fa-check" style="color: #4dd232;"></i>
								<%							    			
							    		}
							    	}
							    %>
							  </label>
						</div>
					<%
						}
					%>
					</div>
					<%
					String correct_or_incorrect="";
						if(answered.equals(resulted)) {
							correct_or_incorrect = "Your answer is correct.";
						} else {
							correct_or_incorrect = "Your answer is incorrect.";
						}
					%>
					<div style="margin-top:10px; height: auto; padding:10px 10px 20px 10px; background-color: #fff3cd;">
						<p style="margin-bottom:5px;"><%=correct_or_incorrect %></p>
						<p style="margin-bottom:5px;">The correct answer is: <%=resulted %>
					</div>
				</div>
			</div>
			
			<%
				}
			}	
			%>
		</div>
		
		<br>
		<div style="position:absolute; right:25px;">
		<a href="index.jsp"><button type="button" style="text-decoration:none; color:#049fe5; cursor:pointer; border: none; background-color: transparent;" >Finish review</button></a>
		</div>
		<br>
		
	</div>
	<!-- End list cac cau hoi -->
	
	<!-- Quiz navigation -->
	<div style="border: 1.5px solid #ebebeb; height:auto; margin-top:20px; width:25%; position: sticky; top:70px;">
		<div style="padding:12px; background-color: #F2F2F2; border-bottom: 1.5px solid #ebebeb; ">
			<span style="color:#c63834;"><b>Quiz navigation</b></span><br>
		</div>
		<div style=" margin-top: 20px; display: flex; flex-wrap: wrap; justify-content: flex-start;">
			<%
				for (int i = 1; i <= numberQuestion; i++) {
					String link_id = "link" + i ;
					String bgr_img ="";
					if(markQuestion.get(i-1)) {
						bgr_img = "linear-gradient(to bottom, white 60%, #606060 40%)";
					}
			%>
				<a href="#<%=i %>" id="<%=link_id %>" 
				style="display:inline-block; text-align:center; text-decoration:none; color:black; 
				width: 10%; height: 45px; border:2px solid #ebebeb; margin:5px; background-image: <%=bgr_img%>">
					<%=i %>
				</a>
			<%
				}
			%>
		</div>
		<br>
		<a href="index.jsp"><button type="button" style="text-decoration:none; color:#049fe5; cursor:pointer; border: none; background-color: transparent;" >Finish review</button></a>
		<br><br>
		
	</div>		
	<!-- End quiz navigation -->
</form>
</div>
<!-- end noi dung quiz -->

<script>
	function selected_choice(link) {
		var link_question = document.getElementById(link);
		link_question.style.backgroundImage = "linear-gradient(to bottom, white 60%, #606060 40%)";
	}
</script>
</body>
</html>