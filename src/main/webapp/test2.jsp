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
	
	<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="#">Questions</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link " href="add_new_category.jsp">Categories</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="import_file.jsp">Import</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">Export</a>
		  </li>	  
	</ul>
	
	<h4 style="color: #c63834; margin-top:20px;">Question bank</h4>
	<br>

	<form action="" method="get">
		<label for="select_category">Select a category: </label>
		<select id="select_category" name="select_category" class="form-select" aria-label="Default select example" onchange="changeSelect()">
			<option value="Default" selected>Default</option>
		

		<%
			category listcategory = new category();
			ArrayList<String> categoryList = listcategory.listcategory();
			ArrayList<Integer> categoryLevel = listcategory.levelcategory();
			categoryDao ctd = new categoryDao();
			questionDao quedao = new questionDao();
			
		%>
		
        <% for (int i=0; i< categoryList.size(); i++) { 
        	ArrayList<category> listcate = new ArrayList<category>();
        	int countquestion = quedao.selectAllByNameCategory(categoryList.get(i)).size();
			String stCountQuestion=(countquestion>0)?"("+String.valueOf(countquestion)+")":"";
						
        	String nameCate = categoryList.get(i);
        	int idcate = ctd.selectByParent(nameCate).getIdCategory();
        	int level = 3* categoryLevel.get(i);
        %>
            <option value="<%=idcate%>">
            <% for(int j=0; j<level; j++) { %>
            &nbsp; <%} %>
            <%=nameCate%>&nbsp;&nbsp;<%=stCountQuestion %></option>
        <% } %>
		</select>
		
		<br>
		
		<p style="margin-top:10px;">The default category for questions shared in context</p>

		<div class="form-check">
			  <input class="form-check-input" type="checkbox" value="" id="question_subcategory" name="question_subcategory" onclick="window.location.href = 'list_sub_question.jsp';">
			  <label class="form-check-label" for="flexCheckDefault">
			    Also show questions from subcategories
			  </label>
		</div>
		<div class="form-check">
			  <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" >
			  <label class="form-check-label" for="flexCheckChecked">
			    Also show old questions
			  </label>
		</div>
	</form>
	
	<a href="add_new_question.jsp"><button style="margin-top:10px;" id="create_new_question" name="create_new_question"
	 class="btn btn-primary mb-3">CREATE A NEW QUESTION </button></a>
	
	<%
		ArrayList<category> listcate = new ArrayList<category>();
		categoryDao catedao = new categoryDao();
		questionDao quesdao = new questionDao();
		listcate = catedao.selectAll();
		for (int j = 0; j < listcate.size(); j++) {
			category cateselected = listcate.get(j);
			int idcateselected = cateselected.getIdCategory();
			ArrayList<question> listquestion = new ArrayList<question>();			
			listquestion = quesdao.selectAllByNameCategory(cateselected.getNameCategory());
	%>
	
	 <div class="listquestion" id="<%=idcateselected %>"  style="display:none;">
		  <%
		  for (int k =0; k < listquestion.size(); k++) {
			  question que = listquestion.get(k);
			  String strquestion =que.getTextQuestion()+": 1."+que.getChoice1().getTextChoice()
					  +" 2."+que.getChoice2().getTextChoice()+" 3."+que.getChoice3().getTextChoice()
					  +" 4."+que.getChoice4().getTextChoice()+" 5."+que.getChoice5().getTextChoice();
			  	String color = (k%2==1)?"#ebebeb":"white"; 
		  		String namequestion = que.getNameQuestion();
		  
		  %>
		  
		  <form action="change_question" method="post" id = "edit_question">
		  <div style="padding: 6px; display:flex; justify-content:space-between; align-items:baseline; background-color:<%=color%>;">
		  	<input type = "text" value="<%=namequestion %>" readonly id="Question" name="Question" 
		  	style="display: inline-block; white-space:no-wrap; width: 9.5%; height:30px; overflow: hidden;text-overflow:ellipsis; border:none; margin-right:-40px; padding:0px; background-color:<%=color%>;">
		  	<div  style="display: inline-block; width: 85%; height:30px; overflow: hidden;text-overflow:ellipsis; border:none; margin-left:20px;"><%=strquestion %></div>
		  	<input type="submit" value = "Edit" style = "border: none; background-color:<%=color%>; color: #0d6efd;">
		  </div>
		  </form> 	
		   	  
		   <%} %>
	 </div>
	<%	}	%>
</div>
<!--  End  Giao dien lua chon noi dung can xem  -->

<script>
		var clickCount = 0;
		function popup() {
			document.getElementById("popup").style.display="flex";
		}
		
		function popup_out() {
			document.getElementById("popup").style.display="none";
		}
		
		function popup2() {
			// Lấy đối tượng HTML của phần tử chứa nội dung cần hiển thị và tắt
			const contentElement = document.getElementById("popup");
		
			// Xử lý sự kiện click trên phần tử
			contentElement.addEventListener("click", function() {
			  clickCount++;
			  if (clickCount % 2 === 1) {
			    contentElement.style.display = "none"; // Ẩn nội dung
			  } else {
			    contentElement.style.display = "flex"; // Hiển thị nội dung
			  }
			});
		}
		
		function changeSelect() {
			const collection = document.getElementsByClassName("listquestion");
			for (let i = 0; i < collection.length; i++) {
				  collection[i].style.display = "none";
				}
			let idid = document.getElementById("select_category").value;
			document.getElementById(idid).style.display = "block";
		}
		
</script>

</body>
</html>