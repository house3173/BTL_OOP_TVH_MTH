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
	String baoLoi = request.getAttribute("baoLoi")+"";
	baoLoi = (baoLoi.equalsIgnoreCase("null"))?"":baoLoi;
	
	String loiAiken = request.getAttribute("loiAiken")+"";
	loiAiken = (loiAiken.equalsIgnoreCase("null"))?"":loiAiken;
	
	String checkImported = request.getAttribute("checkImported")+"";
	checkImported = (checkImported.equalsIgnoreCase("null"))?"":checkImported;
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
				<span><span style="color:red;">Home /</span> My courses / <span style="color:red;"> THI CUỐI KỲ</span></span>
			</div>
			<div style="position:relative;">
				
				
			</div>
		</div>
	</div>
<!-- End Thong tin IT -->

	<!--  Import file -->
	
<div class="container" style="border: 1.5px solid #ebebeb; border-radius:5px; height:auto; margin-top:20px; padding: 20px 25px;">
	
	<div style="height:30px; margin-bottom:20px;">
		<span class="question_adding">Import questions from file</span>
	</div>
	
	<div style="margin-left:20px; width:100%;">
		<form class="form_question" action="import_file" method="post" enctype="multipart/form-data">
		
			<div style="margin-bottom:20px;">
				<i class="fa-solid fa-caret-down" style="color: #0799ca;"></i>
				<span style="color:red; width:40%">File format</span>
				<label></label>
				<span>Aiken format</span>
			</div>
			<hr>
			
			<div style="margin-bottom:20px;">
				<i class="fa-solid fa-caret-right" style="color: #0799ca;"></i>
				<span style="color:red;">General</span>
			</div>
			<br>
			<hr>
			
			<div style="margin-bottom:20px;">
				<i class="fa-solid fa-caret-down" style="color: #0799ca;"></i>
				<span style="color:red;">Import questions from file</span>
			</div>
			
			<div style="display:flex;">
			<div style="display:inline-block; width:30%;">Import</div>
			<i class="fa-solid fa-circle-exclamation" style="color: #ef0b17;"></i>
			<div style="display:inline-block; margin-left:5px; width:65%;">
				<input type="file" id="chooseFile" name="chooseFile" class="btn btn-primary" style="width:260px; text-overflow: ellipsis; oevrflow:hidden; "> 
				<span> Maximum size for new files: 100MB</span>
				<div style="color:red;"><%=baoLoi %></div>
				<% if (baoLoi.equalsIgnoreCase("")) { %>
				<div style="color:red;"><%=loiAiken %></div>
				<%} %>
				<br><br>
				
				<div style="width: 90%; height:150px; margin-left:10px; border: 2px dashed #a9a9a9; outline: 2px solid #a9a9a9; outline-offset:10px;">
					<div style="display:flex; justify-content:center; margin-top:30px;"><img alt="IMPORT FILE HERE" src="https://cdn-icons-png.flaticon.com/512/3198/3198914.png" style="height:70px; width:70px; opacity:0.6;"></div>
					<div style="display:flex; justify-content:center;">You can drap and drop file here to add them</div>
				</div>
			</div>
			</div>
			
			<div style="margin-top:30px;">
			<label></label>
			<input style="margin-left:20px; background-color:#c02424; color:white; border:none;" type="submit" class="btn btn-primary" value="IMPORT">
			</div>
			
			<div style="margin-left: 250px; margin-top:10px;">
			<span style="font-size:15px;">There are required fields in this form marked</span> <i class="fa-solid fa-circle-exclamation" style="color: #ef0b17;"></i>
			</div>

			<br>

		</form>
	</div> 
<%
	if(checkImported.equalsIgnoreCase("TVH")) {
%>
	<div class="overlay" id="import_success">
	<div style="width: 40%; height:auto; border: 1px solid grey; padding: 10px; background-color:white;">
		<div style="display:flex; justify-content:space-between; align-items:baseline;">
			<h4>Import success</h4> 
			<i class="fa-solid fa-xmark" style="color: #d21e27; cursor:pointer;" onclick="cancel_import_success()"></i>
		</div>
		<hr>
		<div style="margin-left:20px;">
			<p>
			Your file has been imported successfully
			</p>
		</div>
		<br>
		<a href="index.jsp"><button type="button" class="btn btn-danger">RETURN HOME</button></a>
	</div>
</div>
<%
	}
%>
</div>
<!-- End adding a new question -->
<script>
	function cancel_import_success() {
		document.getElementById("import_success").style.display ="none";
	}
	function turn_on_import_success() {
		document.getElementById("import_success").style.display ="flex";
	}
</script>
</body>
</html>