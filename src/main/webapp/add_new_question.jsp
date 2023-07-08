<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList" %>
<%@page import="model.category" %>
<%@page import="database.categoryDao" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.question_adding {
	font-family:Times New Roman;
	font-size: 25px;
	color:red;
	padding-left: 5px;
	padding-right: 5px;  
	display: inline-block;
}
.form_question label {
	width:30%;
}
.form_question i {
	margin-right:4px;
}

</style>
</head>
<body>

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
				<span><span style="color:#c63834;">Home /</span> My courses / <span style="color:#c63834;"> THI CUỐI KỲ /</span>
				<span style="color:#c63834;"> Question bank / </span> <span style="color:#c63834;"> Questions /</span>
				<span>Editing a Multiple choice question</span></span>
			</div>
			<div style="position:relative;">
				
				
			</div>
		</div>
	</div>
<!-- End Thong tin IT -->

	<!--  Adding a new question -->
	
<%
		String ErrorGrade = request.getAttribute("ErrorGrade")+"";
		ErrorGrade = (ErrorGrade.equals("null"))?"":ErrorGrade;
		
		String ErrorChoice = request.getAttribute("ErrorChoice")+"";
		ErrorChoice = (ErrorChoice.equals("null"))?"":ErrorChoice;
		
		String categoryQuestion= request.getAttribute("categoryQuestion")+"";	
		categoryQuestion = (categoryQuestion.equals("null"))?"":categoryQuestion;
		
		String nameQuestion= request.getAttribute("nameQuestion")+"";
		nameQuestion = (nameQuestion.equals("null"))?"":nameQuestion;
		
		String textQuestion= request.getAttribute("textQuestion")+"";
		textQuestion = (textQuestion.equals("null"))?"":textQuestion;
		
		String choiceText1= request.getAttribute("choiceText1")+"";
		choiceText1 = (choiceText1.equals("null"))?"":choiceText1;
		
		String choiceText2= request.getAttribute("choiceText2")+"";
		choiceText2 = (choiceText2.equals("null"))?"":choiceText2;
		
		String choiceText3= request.getAttribute("choiceText3")+"";
		choiceText3 = (choiceText3.equals("null"))?"":choiceText3;
		
		String choiceText4= request.getAttribute("choiceText4")+"";
		choiceText4 = (choiceText4.equals("null"))?"":choiceText4;
		
		String choiceText5= request.getAttribute("choiceText5")+"";
		choiceText5 = (choiceText5.equals("null"))?"":choiceText5;
		
		String gradechoice1= request.getAttribute("gradeChoice1")+"";
		double gradeChoice1;
		if(gradechoice1.equalsIgnoreCase("null")) {gradeChoice1=0;} else
		{ gradeChoice1 = Double.parseDouble(gradechoice1);}
		
		String gradechoice2= request.getAttribute("gradeChoice2")+"";
		double gradeChoice2;
		if(gradechoice2.equalsIgnoreCase("null")) {gradeChoice2=0;} else
		{ gradeChoice2 = Double.parseDouble(gradechoice2);}
		
		String gradechoice3= request.getAttribute("gradeChoice3")+"";
		double gradeChoice3;
		if(gradechoice3.equalsIgnoreCase("null")) {gradeChoice3=0;} else
		{ gradeChoice3 = Double.parseDouble(gradechoice3);}
		
		String gradechoice4= request.getAttribute("gradeChoice4")+"";
		double gradeChoice4;
		if(gradechoice4.equalsIgnoreCase("null")) {gradeChoice4=0;} else
		{ gradeChoice4 = Double.parseDouble(gradechoice4);}
		
		String gradechoice5= request.getAttribute("gradeChoice5")+"";
		double gradeChoice5;
		if(gradechoice5.equalsIgnoreCase("null")) {gradeChoice5=0;} else
		{ gradeChoice5 = Double.parseDouble(gradechoice5);}
		

		ArrayList<String> choiceText = new ArrayList<String>();
		choiceText.add(choiceText3); choiceText.add(choiceText4); choiceText.add(choiceText5);
		
		ArrayList<Double> gradeChoice = new ArrayList<Double>();
		gradeChoice.add(gradeChoice3); gradeChoice.add(gradeChoice4); gradeChoice.add(gradeChoice5);
		
	%>
	
<div class="container" style="border: 1.5px solid #ebebeb; border-radius:5px; height:auto; margin-top:20px; padding: 20px 25px;">
	
	<div style="height:30px; margin-bottom:20px;">
		<span class="question_adding">Adding a Multiple choice question</span>
	</div>
	
	<div style="margin-left:20px; width:100%;">
		<form class="form_question" action="create_question" method="post">
			<div style="margin-bottom:20px;">
				<i class="fa-solid fa-caret-down" style="color: #0799ca;"></i>
				<span style="color:red;">General</span>
			</div>
			
			<!-- THONG BAO NEU CO LOI XAY RA -->
			<div style="display:flex; justify-content:center; color:red;"> <%=ErrorGrade %></div>
			<div style="display:flex; justify-content:center; color:red;"> <%=ErrorChoice %></div>
			<br>

			<label for="categoryQuestion">Category</label>
			<select id="categoryQuestion" name="categoryQuestion" style="margin-left:25px; height:35px;">
				<%
				ArrayList<category> result = new ArrayList<category>();
				categoryDao catedao = new categoryDao();
				result = catedao.selectAll();
				for (category cate : result) {
					String nameCate = cate.getNameCategory();
					boolean checkSelectedCategory = categoryQuestion.equals(nameCate);
				%>
				<option value="<%=nameCate %>" <%=(checkSelectedCategory)?"selected='selected'":"" %> ><%=nameCate %></option>
				<% } %>
			</select>
			<br><br>
			
			<label for="nameQuestion">Question name</label>
			<i class="fa-solid fa-circle-exclamation" style="color: #ef0b17;"></i>
			<input style="width:35%;" type="text" id="nameQuestion" name="nameQuestion" required value="<%=nameQuestion%>">
			<br><br>
			
			<div style="display:flex; width:100%;">
			<div style="display:inline-block; width:30%;">Question text</div>
			<div style="display:inline-block; width:65%; " >
				<div style="display:flex; align-items: flex-start;">
				<i class="fa-solid fa-circle-exclamation" style="color: #ef0b17; margin-left:4px;"></i>
				<textarea style="display:inline-block; resize:none; overflow: hidden; width:80%; height:auto; margin-left:4px; " class="form-control"  id="textQuestion" name="textQuestion" required oninput="autoAdjustTextareaHeight()"><%=textQuestion%></textarea>
				</div>
				<img id="imageTextQuestion" src=""  style="max-width: 80%; height: auto; margin-left:29px;">
				<br>
				<div style="margin-left:29px; margin-top:10px; display:none;" id="addImageTextQuestion">
				<p>URL Image </p>
				<input type="text" style="width:60%; height:auto;" name="urlImageInputTextQuestion" id="urlImageInputTextQuestion" onchange="prviewImageLink()" >
				<p> or Select from PC </p>
				<input type="file" name="imageInputTextQuestion" accept="image/*" onchange="previewImage()" />
				</div>
				<button style="margin-left:29px; margin-top:10px;" type="button" onclick="selectImageTextQuestion()" class="btn btn-primary">INSERT IMAGE</button>
				
			</div>
			</div>
			<br>
	
			<label for="markQuestion">Default mark</label>
			<i class="fa-solid fa-circle-exclamation" style="color: #ef0b17;"></i>
			<input style="width:5%;" type="number" id="markQuestion" name="markQuestion" required value=1.0 disabled>
			
			<br>
			
			<%
			 ArrayList<Double> gradelist = new ArrayList<Double>();
			 gradelist.add(1.0);gradelist.add(0.9);gradelist.add(0.8333333);gradelist.add(0.8);gradelist.add(0.75);gradelist.add(0.7);
			 gradelist.add(0.6666667);gradelist.add(0.6);gradelist.add(0.5);gradelist.add(0.4);gradelist.add(0.3333333);gradelist.add(0.3);
			 gradelist.add(0.25);gradelist.add(0.2);gradelist.add(0.1666667);gradelist.add(0.1428571);gradelist.add(0.125);
			 gradelist.add(0.1111111);gradelist.add(0.1);gradelist.add(0.05);
			 int size = gradelist.size()-1;
			 for (int i = size; i>=2; i--) gradelist.add(-gradelist.get(i));
			 %>
			
			
			<!-- Choice 1 -->
			<div style="margin-top:10px;">
			<label style="width:25%;"></label>
			<div style="display:inline-block; width:35%; background-color: rgba(60,60,60,0.08); padding:10px;">
			<span>Choice1</span>
			<textarea style="display:inline-block; width:70%; height:50px; margin-left:10px; border-radius:0px;" class="form-control"  id="choiceText1" name="choiceText1" ><%=choiceText1%></textarea>
				<img id="imageTextQuestion1" src=""  style="max-width: 70%; height: auto; margin-left:71px;">
				<br>
				<div style="margin-left:71px; margin-top:10px; display:none;" id="addImageTextQuestion1">
				<p>URL Image </p>
				<input type="text" style="width:60%; height:auto;" name="urlImageInputTextQuestion1" id="urlImageInputTextQuestion1" onchange="prviewImageLink1()" >
				<p> or Select from PC </p>
				<input type="file" name="imageInputTextQuestion1" accept="image/*" onchange="previewImage1()" />
				</div>
				<button style="margin-left:71px; margin-top:10px;" type="button" onclick="selectImageTextQuestion1()" class="btn btn-primary">INSERT IMAGE</button>
			
			<br><br>
			<span>Grade</span>
			<select style="display:inline-block; width:30%; margin-left:25px;" id="gradeChoice1" name="gradeChoice1" >
				<option  value="0" selected>None</option>
				<% String i15 ="14.28571\u0025", i24="-14.28571\u0025";
				for (int i=0; i<gradelist.size(); i++) {
					boolean checkSelectedChoice1 = (gradeChoice1 == gradelist.get(i));
					 if(i!=15 && i!=24) {
					
				%>
				<option  value="<%=gradelist.get(i) %>" <%=(checkSelectedChoice1)?"selected='selected'":"" %>><%=gradelist.get(i)*100.0 %>%</option>
				<%} else {  if (i==15) { %>
				<option  value="<%=gradelist.get(i) %>" <%=(checkSelectedChoice1)?"selected='selected'":"" %>><%=i15 %></option>
				<%} else {  if (i==24) { %>
				<option  value="<%=gradelist.get(i) %>" <%=(checkSelectedChoice1)?"selected='selected'":"" %>><%=i24 %></option>
				<% }}}} %>	
			</select>
			</div>
			</div>
			
			<!-- Choice 2 -->
			<div style="margin-top:10px;">
			<label style="width:25%;"></label>
			<div style="display:inline-block; width:35%; background-color: rgba(60,60,60,0.08); padding:10px;">
			<span>Choice2</span>
			<textarea style="display:inline-block; width:70%; height:50px; margin-left:10px; border-radius:0px;" class="form-control"  id="choiceText2" name="choiceText2"  ><%=choiceText2%></textarea>
				<img id="imageTextQuestion2" src=""  style="max-width: 70%; height: auto; margin-left:71px;">
				<br>
				<div style="margin-left:71px; margin-top:10px; display:none;" id="addImageTextQuestion2">
				<p>URL Image </p>
				<input type="text" style="width:60%; height:auto;" name="urlImageInputTextQuestion2" id="urlImageInputTextQuestion2" onchange="prviewImageLink2()" >
				<p> or Select from PC </p>
				<input type="file" name="imageInputTextQuestion2" accept="image/*" onchange="previewImage2()" />
				</div>
				<button style="margin-left:71px; margin-top:10px;" type="button" onclick="selectImageTextQuestion2()" class="btn btn-primary">INSERT IMAGE</button>
			
			<br><br>
			<span>Grade</span>
			<select style="display:inline-block; width:30%; margin-left:25px;" id="gradeChoice2" name="gradeChoice2">
				<option  value="0" selected>None</option>
				<% 
				for (int i=0; i<gradelist.size(); i++) { 
					boolean checkSelectedChoice2 = (gradeChoice2 == gradelist.get(i));
					if(i!=15 && i!=24) {
				%>
				<option  value="<%=gradelist.get(i) %>" <%=(checkSelectedChoice2)?"selected='selected'":"" %>><%=gradelist.get(i)*100.0 %>%</option>
				<%} else {  if (i==15) { %>
				<option  value="<%=gradelist.get(i) %>" <%=(checkSelectedChoice2)?"selected='selected'":"" %>><%=i15 %></option>
				<%} else {  if (i==24) { %>
				<option  value="<%=gradelist.get(i) %>" <%=(checkSelectedChoice2)?"selected='selected'":"" %>><%=i24 %></option>
				<% }}}} %>				
			</select>
			</div>
			</div>
			
			<div id="threeChoice" style="margin-top:10px; display: none;">
			<!-- Choice 3 -->
			<div style="margin-top:10px;">
			<label style="width:25%;"></label>
			<div style="display:inline-block; width:35%; background-color: rgba(60,60,60,0.08); padding:10px;">
			<span>Choice3</span>
			<textarea style="display:inline-block; width:70%; height:50px; margin-left:10px; border-radius:0px;" class="form-control"  id="choiceText3" name="choiceText3"  ><%=choiceText3%></textarea>
				<img id="imageTextQuestion3" src=""  style="max-width: 70%; height: auto; margin-left:71px;">
				<br>
				<div style="margin-left:71px; margin-top:10px; display:none;" id="addImageTextQuestion3">
				<p>URL Image </p>
				<input type="text" style="width:60%; height:auto;" name="urlImageInputTextQuestion3" id="urlImageInputTextQuestion3" onchange="prviewImageLink3()" >
				<p> or Select from PC </p>
				<input type="file" name="imageInputTextQuestion3" accept="image/*" onchange="previewImage3()" />
				</div>
				<button style="margin-left:71px; margin-top:10px;" type="button" onclick="selectImageTextQuestion3()" class="btn btn-primary">INSERT IMAGE</button>
			
			<br><br>
			<span>Grade</span>
			<select style="display:inline-block; width:30%; margin-left:25px;" id="gradeChoice3" name="gradeChoice3">
				<option  value="0" selected>None</option>
				<% 
				for (int i=0; i<gradelist.size(); i++) { 
					boolean checkSelectedChoice3 = (gradeChoice3 == gradelist.get(i));
					if(i!=15 && i!=24) {
				%>
				<option  value="<%=gradelist.get(i) %>" <%=(checkSelectedChoice3)?"selected='selected'":"" %>><%=gradelist.get(i)*100.0 %>%</option>
				<%} else {  if (i==15) { %>
				<option  value="<%=gradelist.get(i) %>" <%=(checkSelectedChoice3)?"selected='selected'":"" %>><%=i15 %></option>
				<%} else {  if (i==24) { %>
				<option  value="<%=gradelist.get(i) %>" <%=(checkSelectedChoice3)?"selected='selected'":"" %>><%=i24 %></option>
				<% }}}} %>				
			</select>
			</div>
			</div>
			
			<!-- Choice 4 -->
			<div style="margin-top:10px;">
			<label style="width:25%;"></label>
			<div style="display:inline-block; width:35%; background-color: rgba(60,60,60,0.08); padding:10px;">
			<span>Choice4</span>
			<textarea style="display:inline-block; width:70%; height:50px; margin-left:10px; border-radius:0px;" class="form-control"  id="choiceText4" name="choiceText4"  ><%=choiceText4%></textarea>
				<img id="imageTextQuestion4" src=""  style="max-width: 70%; height: auto; margin-left:71px;">
				<br>
				<div style="margin-left:71px; margin-top:10px; display:none;" id="addImageTextQuestion4">
				<p>URL Image </p>
				<input type="text" style="width:60%; height:auto;" name="urlImageInputTextQuestion4" id="urlImageInputTextQuestion4" onchange="prviewImageLink4()" >
				<p> or Select from PC </p>
				<input type="file" name="imageInputTextQuestion4" accept="image/*" onchange="previewImage4()" />
				</div>
				<button style="margin-left:71px; margin-top:10px;" type="button" onclick="selectImageTextQuestion4()" class="btn btn-primary">INSERT IMAGE</button>
			
			<br><br>
			<span>Grade</span>
			<select style="display:inline-block; width:30%; margin-left:25px;" id="gradeChoice4" name="gradeChoice4">
				<option  value="0" selected>None</option>
				<% 
				for (int i=0; i<gradelist.size(); i++) { 
					boolean checkSelectedChoice4 = (gradeChoice4 == gradelist.get(i));
					if(i!=15 && i!=24) {
				%>
				<option  value="<%=gradelist.get(i) %>" <%=(checkSelectedChoice4)?"selected='selected'":"" %>><%=gradelist.get(i)*100.0 %>%</option>
				<%} else {  if (i==15) { %>
				<option  value="<%=gradelist.get(i) %>" <%=(checkSelectedChoice4)?"selected='selected'":"" %>><%=i15 %></option>
				<%} else {  if (i==24) { %>
				<option  value="<%=gradelist.get(i) %>" <%=(checkSelectedChoice4)?"selected='selected'":"" %>><%=i24 %></option>
				<% }}}} %>				
			</select>
			</div>
			</div>
			
			<!-- Choice 5 -->
			<div style="margin-top:10px;">
			<label style="width:25%;"></label>
			<div style="display:inline-block; width:35%; background-color: rgba(60,60,60,0.08); padding:10px;">
			<span>Choice5</span>
			<textarea style="display:inline-block; width:70%; height:50px; margin-left:10px; border-radius:0px;" class="form-control"  id="choiceText5" name="choiceText5"  ><%=choiceText5%></textarea>
				<img id="imageTextQuestion5" src=""  style="max-width: 70%; height: auto; margin-left:71px;">
				<br>
				<div style="margin-left:71px; margin-top:10px; display:none;" id="addImageTextQuestion5">
				<p>URL Image </p>
				<input type="text" style="width:60%; height:auto;" name="urlImageInputTextQuestion5" id="urlImageInputTextQuestion5" onchange="prviewImageLink5()" >
				<p> or Select from PC </p>
				<input type="file" name="imageInputTextQuestion5" accept="image/*" onchange="previewImage5()" />
				</div>
				<button style="margin-left:71px; margin-top:10px;" type="button" onclick="selectImageTextQuestion5()" class="btn btn-primary">INSERT IMAGE</button>
			
			<br><br>
			<span>Grade</span>
			<select style="display:inline-block; width:30%; margin-left:25px;" id="gradeChoice5" name="gradeChoice5">
				<option  value="0" selected>None</option>
				<% 
				for (int i=0; i<gradelist.size(); i++) { 
					boolean checkSelectedChoice5 = (gradeChoice5 == gradelist.get(i));
					if(i!=15 && i!=24) {
				%>
				<option  value="<%=gradelist.get(i) %>" <%=(checkSelectedChoice5)?"selected='selected'":"" %>><%=gradelist.get(i)*100.0 %>%</option>
				<%} else {  if (i==15) { %>
				<option  value="<%=gradelist.get(i) %>" <%=(checkSelectedChoice5)?"selected='selected'":"" %>><%=i15 %></option>
				<%} else {  if (i==24) { %>
				<option  value="<%=gradelist.get(i) %>" <%=(checkSelectedChoice5)?"selected='selected'":"" %>><%=i24 %></option>
				<% }}}} %>				
			</select>
			</div>
			</div>
			
			</div>
			
			<div style="margin-top:20px;">
			<label></label>
			<button type="button" style="margin-left:25px;" class="btn btn-primary" value="BLANKS FOR 3 MORE CHOICES" onclick="insert3choice()">BLANKS FOR 3 MORE CHOICES</button>
			</div>
			
			<div style="margin-top:20px;">
			<label></label>
			<button type = "button" style="margin-left:25px;" class="btn btn-primary" value="SAVE CHANGES AND CONTINUE EDITING">SAVE CHANGES AND CONTINUE EDITING</button>
			</div>
			
			<div>
			<label></label>
			<div style=" display: inline-block;">
			<label></label>
			<input  type="submit" class="btn btn-primary" style="margin-left:25px; background-color: red; border:none;" value="SAVE CHANGES">
			</div>
			<div style="display: inline-block;">
			<label></label>
			<a href = "list_question.jsp"><input style="margin-left:15px;" type="button" class="btn btn-primary" value="CANCEL"></a>
			</div>
			</div>
			<br>

		</form>
	</div> 
</div>
<!-- End adding a new question -->

<script>
	function insert3choice() {
		document.getElementById("threeChoice").style.display = "block";
	}
	function autoAdjustTextareaHeight() {
        var textarea = document.querySelector('#textQuestion');
        textarea.style.height = "auto";
        textarea.style.height = textarea.scrollHeight + "px";
    }
	
	function previewImage() {
        var preview = document.querySelector('#imageTextQuestion');
        var file = document.querySelector('input[type=file]').files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }
	function prviewImageLink() {
		var url = document.getElementById("urlImageInputTextQuestion").value;
		document.getElementById("imageTextQuestion").src = url;
	}
	var clickCount = 0;
	function selectImageTextQuestion() {
		clickCount++;
		  if (clickCount % 2 === 0) {
			  document.getElementById("addImageTextQuestion").style.display = "none"; // Ẩn nội dung
		  } else {
			  document.getElementById("addImageTextQuestion").style.display = "block"; // Hiển thị nội dung
		  }
	}
	
	/* Choice 1	*/
	function previewImage1() {
        var preview = document.querySelector('#imageTextQuestion1');
        var fileInputs = document.querySelectorAll('input[type=file]');
        var secondFileInput = fileInputs[1];
/*      if (fileInputs.length > 1) {
          var secondFileInput = fileInputs[1];
        } else {
        	var secondFileInput = fileInputs[0];
        }
*/
        var file = secondFileInput.files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }
	function prviewImageLink1() {
		var url = document.getElementById("urlImageInputTextQuestion1").value;
		document.getElementById("imageTextQuestion1").src = url;
	}
	var clickCount1 = 0;
	function selectImageTextQuestion1() {
		clickCount1 ++;
		  if (clickCount1 % 2 === 0) {
			  document.getElementById("addImageTextQuestion1").style.display = "none"; // Ẩn nội dung
		  } else {
			  document.getElementById("addImageTextQuestion1").style.display = "block"; // Hiển thị nội dung
		  }
	}
	
	/* Choice 2	*/
	function previewImage2() {
        var preview = document.querySelector('#imageTextQuestion2');
        var fileInputs = document.querySelectorAll('input[type=file]');
        var secondFileInput = fileInputs[2];
/*      if (fileInputs.length > 1) {
          var secondFileInput = fileInputs[1];
        } else {
        	var secondFileInput = fileInputs[0];
        }
*/
        var file = secondFileInput.files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }
	function prviewImageLink2() {
		var url = document.getElementById("urlImageInputTextQuestion2").value;
		document.getElementById("imageTextQuestion2").src = url;
	}
	var clickCount2 = 0;
	function selectImageTextQuestion2() {
		clickCount2 ++;
		  if (clickCount2 % 2 === 0) {
			  document.getElementById("addImageTextQuestion2").style.display = "none"; // Ẩn nội dung
		  } else {
			  document.getElementById("addImageTextQuestion2").style.display = "block"; // Hiển thị nội dung
		  }
	}
	
	/* Choice 3	*/
	function previewImage3() {
        var preview = document.querySelector('#imageTextQuestion3');
        var fileInputs = document.querySelectorAll('input[type=file]');
        var secondFileInput = fileInputs[3];
/*      if (fileInputs.length > 1) {
          var secondFileInput = fileInputs[1];
        } else {
        	var secondFileInput = fileInputs[0];
        }
*/
        var file = secondFileInput.files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }
	function prviewImageLink3() {
		var url = document.getElementById("urlImageInputTextQuestion3").value;
		document.getElementById("imageTextQuestion3").src = url;
	}
	var clickCount3 = 0;
	function selectImageTextQuestion3() {
		clickCount3 ++;
		  if (clickCount3 % 2 === 0) {
			  document.getElementById("addImageTextQuestion3").style.display = "none"; // Ẩn nội dung
		  } else {
			  document.getElementById("addImageTextQuestion3").style.display = "block"; // Hiển thị nội dung
		  }
	}
	
	/* Choice 4	*/
	function previewImage4() {
        var preview = document.querySelector('#imageTextQuestion4');
        var fileInputs = document.querySelectorAll('input[type=file]');
        var secondFileInput = fileInputs[4];
/*      if (fileInputs.length > 1) {
          var secondFileInput = fileInputs[1];
        } else {
        	var secondFileInput = fileInputs[0];
        }
*/
        var file = secondFileInput.files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }
	function prviewImageLink4() {
		var url = document.getElementById("urlImageInputTextQuestion4").value;
		document.getElementById("imageTextQuestion4").src = url;
	}
	var clickCount4 = 0;
	function selectImageTextQuestion4() {
		clickCount4 ++;
		  if (clickCount4 % 2 === 0) {
			  document.getElementById("addImageTextQuestion4").style.display = "none"; // Ẩn nội dung
		  } else {
			  document.getElementById("addImageTextQuestion4").style.display = "block"; // Hiển thị nội dung
		  }
	}
	
	/* Choice 5	*/
	function previewImage5() {
        var preview = document.querySelector('#imageTextQuestion5');
        var fileInputs = document.querySelectorAll('input[type=file]');
        var secondFileInput = fileInputs[5];
/*      if (fileInputs.length > 1) {
          var secondFileInput = fileInputs[1];
        } else {
        	var secondFileInput = fileInputs[0];
        }
*/
        var file = secondFileInput.files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }
	function prviewImageLink5() {
		var url = document.getElementById("urlImageInputTextQuestion5").value;
		document.getElementById("imageTextQuestion5").src = url;
	}
	var clickCount5 = 0;
	function selectImageTextQuestion5() {
		clickCount5 ++;
		  if (clickCount5 % 2 === 0) {
			  document.getElementById("addImageTextQuestion5").style.display = "none"; // Ẩn nội dung
		  } else {
			  document.getElementById("addImageTextQuestion5").style.display = "block"; // Hiển thị nội dung
		  }
	}
/*	  var selectElement1 = document.getElementById("gradeChoice1");
	  selectElement1.value = "None"; 
	  var selectElement2 = document.getElementById("gradeChoice2");
	  selectElement2.value = "None"; 
	  var selectElement3 = document.getElementById("gradeChoice3");
	  selectElement3.value = "None"; 
	  var selectElement4 = document.getElementById("gradeChoice4");
	  selectElement4.value = "None"; 
	  var selectElement5 = document.getElementById("gradeChoice5");
	  selectElement5.value = "None";  */
	  
</script>
</body>
</html>