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
.OnlyTextQuestion {
	display: none;
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
	
	<h4 style="color: #c63834; margin-top:20px;">Add from the question bank at the end</h4>
	<br>

	<form method="post" id="form_select_category">
		<label for="select_category">Select a category: </label>
		<select id="select_category" name="select_category" class="form-select" aria-label="Default select example" onchange="changeSelect()">
			<option value="0" selected>Default</option>
		

		<%
			String getIdCate = request.getAttribute("idcate")+"";
		
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
        	
        	String idcateString = ""+idcate;
        	boolean checkSelectedCategory = (idcateString.equalsIgnoreCase(getIdCate));
        %>
            <option value="<%=idcate%>" <%=(checkSelectedCategory)?"selected='selected'":"" %>>
            <% for(int j=0; j<level; j++) { %>
            &nbsp; <%} %>
            <%=nameCate%>&nbsp;&nbsp;<%=stCountQuestion %></option>
        <% } %>
		</select>
		
		<br>
		
		<p style="margin-top:10px; color:#0a64ff;">Search option <i class="fa-solid fa-caret-down" style="color: #0a64ff;"></i></p>

		<div class="form-check">
			  <input class="form-check-input" type="checkbox" value="" id="question_subcategory" name="question_subcategory" onclick="setFormAction()">
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
	<br>
	
<!-- 	FORM HIEN THI SELECT DA DUOC CHON  -->
<form action="question_to_quiz" method="post" id = "category_selected" style="display:block;">
	 	<div class="OnlyTextQuestion" style="margin-left:6px; margin-bottom:5px;" >
		 	 <input  type="checkbox" id="selectAllQuestion" name="selectAllQuestion" onchange="selectAllQuestion()" >
		 	 <label  for="selectAllQuestion">
				    <b>Question</b>
			 </label>
	 	 </div>
	<%
			categoryDao catedao2 = new categoryDao();
			questionDao quesdao2 = new questionDao();
			if (getIdCate.equals("0") || getIdCate.equals("null")) {} else {
			Integer getidcate = Integer.valueOf(getIdCate);
			category cateselect2 = catedao2.selectCategoryById(getidcate);
			ArrayList<question> listquestion2 = new ArrayList<question>();
			listquestion2 = quesdao2.selectAllByNameCategory(cateselect2.getNameCategory());
	%>
	
	 <div class="listquestion"  style="display:block;">
		  <%
		  for (int k =0; k < listquestion2.size(); k++) {
			  question que = listquestion2.get(k);
			  String strquestion =que.getTextQuestion()+": 1."+que.getChoice1().getTextChoice()
					  +" 2."+que.getChoice2().getTextChoice()+" 3."+que.getChoice3().getTextChoice()
					  +" 4."+que.getChoice4().getTextChoice()+" 5."+que.getChoice5().getTextChoice();
			  	String color = (k%2==1)?"#ebebeb":"white"; 
		  		String namequestion = que.getNameQuestion();
		  
		  %>
		  
		  <div style="padding: 6px; display:flex; justify-content:space-between; align-items:baseline; background-color:<%=color%>;">
		  	<input type = "checkbox" name="checkboxQuestion" value="<%=namequestion %>">
		  	<input type = "text" value="<%=namequestion %>" readonly id="Question" name="Question" 
		  	style="display: inline-block; white-space:no-wrap; width: 9.5%; height:30px; overflow: hidden;text-overflow:ellipsis; border:none; margin-right:-40px; padding:0px; background-color:<%=color%>;">
		  	<div  style="display: inline-block; width: 90%; height:30px; overflow: hidden;text-overflow:ellipsis; border:none; margin-left:20px;"><%=strquestion %></div>
		  </div>
	
		   	  
		   <%} %>
	 </div>
	<input style="margin-top:25px; display:block;" type="submit" class="btn btn-primary" value="ADD SELECTED QUESTIONS TO THE QUIZ">
	<%} %>
	</form>
<!--  END -->
	
	 <form action="question_to_quiz" method="post" id = "edit_question">
	 
	 	<div class="OnlyTextQuestion" style="margin-left:6px; margin-bottom:5px;" >
		 	 <input type="checkbox" id="selectAllQuestion" name="selectAllQuestion" onchange="selectAllQuestion()" >
		 	 <label for="selectAllQuestion">
				    <b>Question</b>
			 </label>
	 	</div>
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
		  
		  <div style="padding: 6px; display:flex; justify-content:space-between; align-items:baseline; background-color:<%=color%>;">
		  	<input type = "checkbox" name="checkboxQuestion" value="<%=namequestion %>">
		  	<input type = "text" value="<%=namequestion %>" readonly id="Question" name="Question" 
		  	style="display: inline-block; white-space:no-wrap; width: 9.5%; height:30px; overflow: hidden;text-overflow:ellipsis; border:none; margin-right:-40px; padding:0px; background-color:<%=color%>;">
		  	<div  style="display: inline-block; width: 90%; height:30px; overflow: hidden;text-overflow:ellipsis; border:none; margin-left:20px;"><%=strquestion %></div>
		  </div>
	
		   	  
		   <%} %>
	 </div>
	<%	}	%>
	
	<input style="margin-top:25px; display:none;" id="submitAdd" type="submit" class="btn btn-primary" value="ADD SELECTED QUESTIONS TO THE QUIZ">
	</form>
</div>
<!--  End  Giao dien lua chon noi dung can xem  -->

<script>
		var clickCount = 0;
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
			document.getElementById("category_selected").style.display = "none";
			const collection = document.getElementsByClassName("listquestion");
			for (let i = 0; i < collection.length; i++) {
				  collection[i].style.display = "none";
				}
			let idid = document.getElementById("select_category").value;
			document.getElementById(idid).style.display = "block";
			document.getElementById("submitAdd").style.display="block";
			
			var selectAll = document.getElementsByClassName("OnlyTextQuestion");
			for (var i = 0; i < selectAll.length; i++) {
			    var select = selectAll[i];
			    select.style.display = "block" ;
			    
			}
		}
		
		function setFormAction() {
	        var form = document.getElementById("form_select_category");
	        var checkbox = document.getElementById("question_subcategory");
	        
	        if (checkbox.checked) {
	            form.action = "question_sub_quiz";
	            form.submit();
	        } else {
	            form.action = "";
	        }
	    }
		
		function selectAllQuestion() {
			var checkAllCheckbox = document.getElementsByName("selectAllQuestion");
			var checkAll = false;
			for (var i = 0; i < checkAllCheckbox.length; i++) {
			    if(checkAllCheckbox[i].checked) {
			    	checkAll = true;
			    }
			  }
			var checkboxes = document.getElementsByName("checkboxQuestion");	
			for (var i = 0; i < checkboxes.length; i++) {
			    checkboxes[i].checked = checkAll;
			  }
		}
</script>

</body>
</html>