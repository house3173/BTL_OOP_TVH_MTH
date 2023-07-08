<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="database.quizDao" %>
<%@page import ="model.quiz" %>
<%@page import ="database.questionDao" %>
<%@page import ="model.question" %>
<%@page import ="java.util.ArrayList" %>
<%@page import= "java.time.LocalDateTime"%>
<%@page import= "java.time.format.DateTimeFormatter"%>

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
 #countdown {
	  display: inline-block;
	  font-size: 16px;
	  border: 1px solid red;
	  padding: 3px;
}
</style>
</head>
<body>
<%
	String nameOfQuizTime = session.getAttribute("nameOfQuiz")+"";
	nameOfQuizTime = (nameOfQuizTime.equalsIgnoreCase("null"))?"":nameOfQuizTime;
	
	quizDao quizdaoTime = new quizDao();
	quiz quizSelectedTime = quizdaoTime.selectByNameQuiz(nameOfQuizTime);

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
<form action="finish_attemp" method="post" id="attemp_form">
<div class="container" style="display:flex; justify-content: space-between; align-items:flex-start; margin-bottom: 100px;">

	<!-- List cac cau hoi -->
	<div style="position: sticky; top:70px; border: 1.5px solid #ebebeb; height:auto; margin-top:20px; margin-right:10px; padding: 20px 25px; width: 75%; ">
		<% if(quizSelectedTime.getTimeLimitEnable().equalsIgnoreCase("yes")) { %>
		<div style="position:absolute; top:10px; right:25px; margin-bottom:5px;" id="countdown">
			
		</div>
		<% } %>
		<br>
		<div style="margin-top:10px;">
			<%
			if(listQuestion != null) {
				int k = 0;
				questionDao quedao = new questionDao();
				for(String nameQue : listQuestion) {
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
				
				<div style="width:90%; height: auto; min-height: 200px; padding:5px 5px 25px 5px; background-color: #d6f7fb;">
					<p><%=strquestion %></p>
					<%
						for (int i = 0; i < result.size()-1; i++) {
							
					%>
						<div class="form-check" >
							  <input class="form-check-input" type="radio" name="<%=selectChoice %>" value="<%=result.get(i) %>" onclick="selected_choice('<%=link%>')">
							  <label class="form-check-label" for="<%=selectChoice %>">
							    <%=result.get(i) %>
							  </label>
						</div>
					<%
						}
					%>
				</div>
			</div>
			
			<%
				}
			}	
			%>
		</div>
		
		<br>
		<div style="position:absolute; right:25px;">
			<button type="button" onclick="turn_on_finish_attempt()" style="color:#049fe5; cursor:pointer; border: none; background-color: transparent;" >Finish attemp...</button>
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
			%>
				<a href="#<%=i %>" id="<%=link_id %>" style="display:inline-block; text-align:center; text-decoration:none; color:black; width: 10%; height: 45px; border:2px solid #ebebeb; margin:5px;">
					<%=i %>
				</a>
			<%
				}
			%>
		</div>
		<br>
		<button type="button" onclick="turn_on_finish_attempt()" style="color:#049fe5; cursor:pointer; border: none; background-color: transparent;" >Finish attemp...</button>
		<br><br>
		
	</div>		
	<!-- End quiz navigation -->
<%
        // Lấy thời gian hiện tại
        LocalDateTime now = LocalDateTime.now();

        // Định dạng thời gian
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE, dd MMMM yyyy, h:mm a");
        String startTime = now.format(formatter);
%>	
<!-- xử lý đồng hồ hiện thời gian Time limit -->
<%
	String nameOfQuiz = session.getAttribute("nameOfQuiz")+"";
	nameOfQuiz = (nameOfQuiz.equalsIgnoreCase("null"))?"":nameOfQuiz;
	
	quizDao quizdao = new quizDao();
	quiz quizSelected = quizdao.selectByNameQuiz(nameOfQuiz);
	
	int lengthTime = 0;
	int timeLimit = quizSelected.getTimeLimit();
	String timeUnit = quizSelected.getTimeUit();
	if (timeUnit.equals("minutes")) {
		lengthTime = timeLimit * 60 * 1000;
	} else {
		if (timeUnit.equals("hours")) {
			lengthTime = timeLimit * 60 * 60 * 1000;
		} else {
			if (timeUnit.equals("days")) {
				lengthTime = timeLimit * 24 * 60 * 60 * 1000;
			}
		}
	}
%>
<!-- end  xử lý đồng hồ hiện thời gian Time limit-->
	<input type="hidden" name="startTime" id="startTime" value="<%=startTime %>">
	<input type="hidden" name="timeTaken" id="timeTaken" value="<%=lengthTime %>">
</form>
</div>
<!-- end noi dung quiz -->

<!-- 	THÔNG BÁO FINISH ATTEMP -->
<div class="overlay" id="finish_attemp" style="display:none;">
	<div style="width: 30%; height:auto; border: 1px solid grey; padding: 10px; background-color:white;">
		<div style="display:flex; justify-content:space-between; align-items:baseline;">
			<h4>Finish attempt</h4> 
			<i class="fa-solid fa-xmark" style="color: #d21e27; cursor:pointer;" onclick="cancel_finish_attemp()"></i>
		</div>
		<hr>
		<div style="margin-left:20px;">		
			<p>
			Submit all and finish. And see the results of the quiz
			</p>
		</div>
		<button type="button" class="btn btn-danger" onclick="submitForm()">SUBMIT ALL AND FINISH</button>
		<button type="button" class="btn btn-primary" onclick="cancel_finish_attemp()" style="cursor:pointer;">RETURN TO ATTEMP</button>
	</div>
</div>
<!-- 	END THÔNG BÁO FINISH ATTEMP -->
<script>
	function selected_choice(link) {
		var link_question = document.getElementById(link);
		link_question.style.backgroundImage = "linear-gradient(to bottom, white 60%, #606060 40%)";
	}
	function cancel_finish_attemp() {
		document.getElementById("finish_attemp").style.display ="none";
	}
	function turn_on_finish_attempt() {
		document.getElementById("finish_attemp").style.display ="flex";
	}
	function submitForm() {
		var form = document.getElementById("attemp_form");
		form.submit();
	}
</script>

<script>
	// Đặt thời gian kết thúc đếm ngược
	var startTime = new Date().getTime();
	var length = <%=lengthTime%>;
	var endTime = new Date(startTime + (length));
	
	// Cập nhật thời gian đếm ngược mỗi giây
	var countdownTimer = setInterval(function() {
	  // Lấy thời gian hiện tại
	  var now = new Date().getTime();
	
	  // Tính thời gian còn lại
	  var timeRemaining = endTime - now;
	
	  // Tính toán giờ, phút và giây
	  var hours = Math.floor((timeRemaining % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	  var minutes = Math.floor((timeRemaining % (1000 * 60 * 60)) / (1000 * 60));
	  var seconds = Math.floor((timeRemaining % (1000 * 60)) / 1000);
	
	  // Hiển thị thời gian đếm ngược trong khung HTML
	  document.getElementById('countdown').innerHTML ='Time limit: '+ pad(hours) + ':' + pad(minutes) + ':' + pad(seconds);
	
	  // Kiểm tra nếu thời gian kết thúc
	  if (timeRemaining <= 0) {
	    clearInterval(countdownTimer);
	    document.getElementById('countdown').innerHTML = 'End quiz';
	    var form = document.getElementById("attemp_form");
		form.submit();
	  }
	}, 1000);
	
	function pad(number) {
		  return (number < 10 ? '0' : '') + number;
		}
</script>
</body>
</html>