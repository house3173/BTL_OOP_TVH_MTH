<%@page import="java.util.ArrayList" %>
<%@page import="model.category" %>
<%@page import="model.question" %>
<%@page import="model.choice" %>
<%@page import="database.categoryDao" %>
<%@page import="database.questionDao" %>


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

#select_category {
	display: inline-block;
	width: 400px;
}
#number_question {
	display: inline-block;
	width: 100px;
}
#select_category option::before {
  content: "\00a0\00a0\00a0"; 
  padding-left: 20px; 
}
</style>
</head>
<body>

<!-- 	Header Page      -->
<div style="display:flex; height:50px; background-color:#0073a5; padding: 0px 50px; justify-content: space-between; align-items:center; position:sticky; top:0;">
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

<!--  Giao dien lua chon noi dung can xem -->
<div class="container" style="border: 1.5px solid #ebebeb; border-radius:5px; height:auto; margin-top:20px; padding: 20px 25px;">
	<h4 style="color: #c63834; margin-top:20px;">Add a random question to page 1</h4>
	<hr>
	<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="#">Existing category</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link " href="#">New category</a>
		  </li> 
	</ul>
	<br>
<%
		String selectedCategory = request.getAttribute("selectedCategory")+"";
%>
	<form action="random_question_new" method="get" id="form_select_category_for_random">
		<input type="hidden" name="actionForm" value="selectCategory">
		<label for="select_category" style="width:30%;">Category</label>
		<select id="select_category" name="select_category" class="form-select" aria-label="Default select example" onchange="changeInfo()">
			<option value="0" selected>Default</option>
		

		<%	
			int numberMax = 0;
			category listcategory = new category();
			ArrayList<String> categoryList = listcategory.listcategory();
			ArrayList<Integer> categoryLevel = listcategory.levelcategory();
			categoryDao ctd = new categoryDao();
			questionDao quedao = new questionDao();
			
		%>
		
        <% for (int i=0; i< categoryList.size(); i++) { 
        	ArrayList<category> listcate = new ArrayList<category>();
        	int countquestion = quedao.selectAllByNameCategory(categoryList.get(i)).size();
        	if (countquestion > numberMax) { numberMax = countquestion; }
			String stCountQuestion=(countquestion>0)?"("+String.valueOf(countquestion)+")":"";
						
        	String nameCate = categoryList.get(i);
        	int idcate = ctd.selectByParent(nameCate).getIdCategory();
        	int level = 3* categoryLevel.get(i);
        	
        	String idcateString = ""+idcate;
        	boolean checkSelectedCategory = (idcateString.equalsIgnoreCase(selectedCategory));
        %>
            <option value="<%=idcate%>" <%=(checkSelectedCategory)?"selected='selected'":"" %>>
            <% for(int j=0; j<level; j++) { %>
            &nbsp; <%} %>
            <%=nameCate%>&nbsp;&nbsp;<%=stCountQuestion %></option>
        <% } %>
		</select>
		
		<br>	
		<div class="form-check" style="margin-left:calc(30% + 5px); margin-top:10px;">
			  <input class="form-check-input" type="checkbox" value="" id="question_subcategory" name="question_subcategory" >
			  <label class="form-check-label" for="flexCheckDefault">
			    Include questions from subcategories too
			  </label>
		</div>
		
		<br>
		<div style="margin-top:50px;"></div>
		<label for="number_question" style="width:30%;">Number of random questions</label>
		<select id="number_question" name="number_question" class="form-select" aria-label="Default select example" onchange="changeInfo()">
			<option value="1" selected>1</option>
			<%
			 int countquestion = 1;
			 if (!selectedCategory.equals("null")) { 
			 Integer id_selected_category = Integer.valueOf(selectedCategory);
			 countquestion = quedao.selectAllByNameCategory(ctd.selectCategoryById(id_selected_category).getNameCategory()).size();
			 }
			 for (int i=2; i<=countquestion; i++) {
				 Integer numberQuestion = (Integer) session.getAttribute("numberQuestion");
				 boolean checkNumberSelected = false;
				 if (numberQuestion != null ) {	checkNumberSelected = (i == numberQuestion); }
			%>

            <option value="<%=i%>" <%=(checkNumberSelected)?"selected='selected'":"" %>><%=i%></option>
        <% } %>
		</select>	
	</form>
	
	<div style="margin-top:50px;">Questions matching the filter</div>
		<nav aria-label="...">
			  <ul class="pagination">
			    <li class="page-item ">
			      <span class="page-link"><i class="fa-solid fa-angle-left" style="color:#0d6efd;"></i></span>
			    </li>
			    <li class="page-item active">
			      <span class="page-link">
			        1
			        <span class="sr-only">(current)</span>
			      </span>
			    </li>
			    <li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item"><a class="page-link" href="#">4</a></li>
			    <li class="page-item"><a class="page-link" href="#">5</a></li>
			    <li class="page-item"><a class="page-link" href="#">6</a></li>
			    <li class="page-item"><a class="page-link" href="#">7</a></li>
			    <li class="page-item"><a class="page-link" href="#">8</a></li>
			    <li class="page-item"><a class="page-link" href="#">9</a></li>
			    <li class="page-item"><a class="page-link" href="#">...</a></li>
			    <li class="page-item">
			      <a class="page-link" href="#"><i class="fa-solid fa-angle-right" style="color:#0d6efd;"></i></a>
			    </li>
			  </ul>
		</nav>
		
	<%
		ArrayList<question> randomQuestion = (ArrayList<question>) session.getAttribute("randomQuestion");
		if (randomQuestion != null) {
	%>
		<div class="listquestion" id="showRandomQuestion">
		  <%
		  for(question que : randomQuestion) {
			  String strquestion =que.getTextQuestion()+": 1."+que.getChoice1().getTextChoice()
					  +" 2."+que.getChoice2().getTextChoice()+" 3."+que.getChoice3().getTextChoice()
					  +" 4."+que.getChoice4().getTextChoice()+" 5."+que.getChoice5().getTextChoice();
		  		String namequestion = que.getNameQuestion();
		  
		  %>
		  
		  <div style="padding: 6px; display:flex; justify-content:space-between; align-items:baseline; background-color:white; border: 1px solid #ebebeb;">
		  	<i class="fa-solid fa-list" style="color: #000000; margin-right:5px; margin-left:5px;"></i>
		  	<input type = "text" value="<%=namequestion %>" readonly id="Question" name="Question" 
		  	style="display: inline-block; white-space:no-wrap; width: 10%; height:30px; overflow: hidden;text-overflow:ellipsis; border:none; margin-right:-40px; padding:0px; background-color:white;">
		  	<div  style="display: inline-block; width: 88%; height:30px; overflow: hidden;text-overflow:ellipsis; border:none; margin-left:20px;"><%=strquestion %></div>
		  </div>
		   	  
		   <%} %>
	 </div>
	
	<%
		}
	%>
	<a href="editing_quiz.jsp" ><button style="margin-top:25px;" class="btn btn-primary">ADD RANDOM QUESTIONS TO THE QUIZ</button></a>
	<a href="editing_quiz.jsp" ><button style="margin-top:25px;" class="btn btn-danger">CANCEL</button></a>
</div>
<!--  End  Giao dien lua chon noi dung can xem  -->

<script>
		function changeSelect() {			
			var showQuestionOfCategory = document.getElementById("showQuestionOfCategory");
			showQuestionOfCategory.style.display = "block";
			var showRandomQuestion = document.getElementById("showRandomQuestion");
			showRandomQuestion.style.display = "none";
			
			var inputHiddenName =  document.getElementsByName("actionForm");
			inputHiddenName.value = "selectCategory";
						
			var form = document.getElementById("form_select_category_for_random");
			form.submit();
		}
		
		function changeNumber() {
			var showRandomQuestion = document.getElementById("showRandomQuestion");
			showRandomQuestion.style.display = "block";
			var showQuestionOfCategory = document.getElementById("showQuestionOfCategory");
			showQuestionOfCategory.style.display = "none";

			var inputHiddenName =  document.getElementsByName("actionForm");
			inputHiddenName.value = "selectedNumber";
			
			var form = document.getElementById("form_select_category_for_random");
			form.submit();
		}
		
		function changeInfo() {
			var form = document.getElementById("form_select_category_for_random");
			form.submit();
		}
</script>

</body>
</html>