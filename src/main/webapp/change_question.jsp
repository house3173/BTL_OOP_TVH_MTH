<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList" %>
<%@page import="model.category" %>
<%@page import="database.categoryDao" %>
<%@page import="model.question" %>

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
				<span><span style="color:red;">Home /</span> My courses / <span style="color:red;"> THI CUỐI KỲ</span></span>
			</div>
			<div style="position:relative;">
				
				
			</div>
		</div>
	</div>
<!-- End Thong tin IT -->

	<!--  Adding a new question -->
	
<%
		question questionEdit = (question)request.getAttribute("questionEdit");
		int idcategory = questionEdit.getIdCategory();
		categoryDao cated = new categoryDao();
		category cateEdit = cated.selectCategoryById(idcategory);
		

		String ErrorGrade = request.getAttribute("ErrorGrade")+"";
		ErrorGrade = (ErrorGrade.equals("null"))?"":ErrorGrade;
		
		String ErrorChoice = request.getAttribute("ErrorChoice")+"";
		ErrorChoice = (ErrorChoice.equals("null"))?"":ErrorChoice;
		
		String categoryQuestion= request.getAttribute("categoryQuestion")+"";	
		categoryQuestion = (categoryQuestion.equals("null"))?cateEdit.getNameCategory():categoryQuestion;
		
		String nameQuestion= request.getAttribute("nameQuestion")+"";
		nameQuestion = (nameQuestion.equals("null"))?questionEdit.getNameQuestion():nameQuestion;
		
		String textQuestion= request.getAttribute("textQuestion")+"";
		textQuestion = (textQuestion.equals("null"))?questionEdit.getTextQuestion():textQuestion;
		
		String choiceText1= request.getAttribute("choiceText1")+"";
		choiceText1 = (choiceText1.equals("null"))?questionEdit.getChoice1().getTextChoice():choiceText1;
		
		String choiceText2= request.getAttribute("choiceText2")+"";
		choiceText2 = (choiceText2.equals("null"))?questionEdit.getChoice2().getTextChoice():choiceText2;
		
		String choiceText3= request.getAttribute("choiceText3")+"";
		choiceText3 = (choiceText3.equals("null"))?questionEdit.getChoice3().getTextChoice():choiceText3;
		
		String choiceText4= request.getAttribute("choiceText4")+"";
		choiceText4 = (choiceText4.equals("null"))?questionEdit.getChoice4().getTextChoice():choiceText4;
		
		String choiceText5= request.getAttribute("choiceText5")+"";
		choiceText5 = (choiceText5.equals("null"))?questionEdit.getChoice5().getTextChoice():choiceText5;
		
		String gradechoice1= request.getAttribute("gradeChoice1")+"";
		double gradeChoice1;
		if(gradechoice1.equalsIgnoreCase("null")) {gradeChoice1=questionEdit.getChoice1().getGradeChoice();} else
		{ gradeChoice1 = Double.parseDouble(gradechoice1);}
		
		String gradechoice2= request.getAttribute("gradeChoice2")+"";
		double gradeChoice2;
		if(gradechoice2.equalsIgnoreCase("null")) {gradeChoice2=questionEdit.getChoice2().getGradeChoice();} else
		{ gradeChoice2 = Double.parseDouble(gradechoice2);}
		
		String gradechoice3= request.getAttribute("gradeChoice3")+"";
		double gradeChoice3;
		if(gradechoice3.equalsIgnoreCase("null")) {gradeChoice3=questionEdit.getChoice3().getGradeChoice();} else
		{ gradeChoice3 = Double.parseDouble(gradechoice3);}
		
		String gradechoice4= request.getAttribute("gradeChoice4")+"";
		double gradeChoice4;
		if(gradechoice4.equalsIgnoreCase("null")) {gradeChoice4=questionEdit.getChoice4().getGradeChoice();} else
		{ gradeChoice4 = Double.parseDouble(gradechoice4);}
		
		String gradechoice5= request.getAttribute("gradeChoice5")+"";
		double gradeChoice5;
		if(gradechoice5.equalsIgnoreCase("null")) {gradeChoice5=questionEdit.getChoice5().getGradeChoice();} else
		{ gradeChoice5 = Double.parseDouble(gradechoice5);}
		

		ArrayList<String> choiceText = new ArrayList<String>();
		choiceText.add(choiceText3); choiceText.add(choiceText4); choiceText.add(choiceText5);
		
		ArrayList<Double> gradeChoice = new ArrayList<Double>();
		gradeChoice.add(gradeChoice3); gradeChoice.add(gradeChoice4); gradeChoice.add(gradeChoice5);
		
	%>
	
<div class="container" style="border: 1.5px solid #ebebeb; border-radius:5px; height:auto; margin-top:20px; padding: 20px 25px;">
	
	<div style="height:30px; margin-bottom:20px;">
		<span class="question_adding">Editing Multiple choice question</span>
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
				<textarea style="display:inline-block; width:80%; height:200px; margin-left:4px; " class="form-control"  id="textQuestion" name="textQuestion" required><%=textQuestion%></textarea>
				</div>
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
			<%
			String sub_or_notsub = session.getAttribute("sub_or_notsub")+"";
			String url;
			if (sub_or_notsub.equals("") || sub_or_notsub.equals("list_question")) {
				url = "list_question.jsp";
			} else {
				url = "list_sub_question.jsp";
			}
			%>
			<a href = "<%=url%>"><input style="margin-left:15px;" type="button" class="btn btn-primary" value="CANCEL"></a>
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
</script>
</body>
</html>