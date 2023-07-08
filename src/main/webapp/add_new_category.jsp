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

.form_category label {
	width:30%;
}
.form_category i {
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

<!--  Giao dien them Category -->
<div class="container" style="border: 1.5px solid #ebebeb; border-radius:5px; height:auto; margin-top:20px; padding: 20px 25px;">
	
	<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link "  href="list_question.jsp">Questions</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="add_new_category.jsp">Categories</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="import_file.jsp">Import</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">Export</a>
		  </li>	  
	</ul>

	<div style="margin-left:20px; width:100%;">
		<form class="form_category" action="create_category" method="post">
			<div style="margin-bottom:20px; margin-top:20px;">
				<i class="fa-solid fa-caret-down" style="color: #0799ca;"></i>
				<span style="color:red;">Add category</span>
			</div>
			
			<div>
			<label for="parentCategory">Parent category</label>
 			<i class="fa-solid fa-circle-question" style="color: #2addea;"></i>		
<!--		<input style="width:35%;" type="text" id="parentCategory" name="parentCategory" required> 	-->
			<select style="width:35%; height:35px;" id="parentCategory" name="parentCategory" required>
				<option value="Default" selected>Default</option>
			<%
				ArrayList<category> result = new ArrayList<category>();
				categoryDao catedao = new categoryDao();
				result = catedao.selectAll();
				for (category cate : result) {
					String nameParentCategory = cate.getNameCategory();
			%>
				<option value="<%=nameParentCategory %>"><%=nameParentCategory %></option>
			
			<% 	
				}
			%>
			
			</select>
			</div>	
			<br>
			
			<div>
			<label for="nameCategory">Name</label>
			<i class="fa-solid fa-circle-exclamation" style="color: #ef0b17;"></i>
			<input style="width:35%;" type="text" id="nameCategory" name="nameCategory" required>
			</div>
			<br>
			
			<div style="display:flex;">
			<div style="display:inline-block; width:30%;">Category info</div>
			<div style="display:inline-block; margin-left:30px; width:65%; " >
				<textarea style="display:inline-block; width:80%; height:200px; " class="form-control"  id="textCategory" name="textCategory" ></textarea>
				
			</div>
			</div>
			<br>
			
			<div>
			<label for="idCategory">ID Number</label>
			<i class="fa-solid fa-circle-question" style="color: #2addea;"></i>
			<input style="width:25%;" type="number" id="idCategory" name="idCategory" required>
			</div>
			
			<hr>
			
			<div style="margin-top:30px;">
			<label></label>
			<input style="margin-left:20px; background-color:#c02424; color:white; border:none;" type="submit" class="btn btn-primary" value="ADD CATEGORY">
			</div>
			
			<div style="margin-left: 250px; margin-top:10px;">
			<span style="font-size:15px;">There are required fields in this form marked</span> <i class="fa-solid fa-circle-exclamation" style="color: #ef0b17;"></i>
			</div>
		</form>
	</div>
</div>

<!-- End Giao dien them Category  -->
</body>
</html>