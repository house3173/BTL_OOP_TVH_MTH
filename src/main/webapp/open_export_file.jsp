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
<%
	String nameOfQuiz = session.getAttribute("nameOfQuiz")+"";
	nameOfQuiz = (nameOfQuiz.equalsIgnoreCase("null"))?"":nameOfQuiz;
%>
<meta charset="UTF-8">
<title><%=nameOfQuiz %></title>
</head>
<body>
<%
		ArrayList<String> listQuestion = (ArrayList<String>) session.getAttribute("listQuestion");
		
%>	    
		<p><%=nameOfQuiz %></p>
		<br>
<%
		if(listQuestion != null) {
				int k = 0;
				questionDao quedao = new questionDao();
				for(String nameQue : listQuestion) {
					k++;
					String numberQuestion = "Question " + k +":";
%>
				<p><%=numberQuestion %></p>
<%					
					question que = quedao.selectAllByName(nameQue);
					String strquestion = nameQue + ": " + que.getTextQuestion();
%>
				<p><%=strquestion %></p>
<%
					ArrayList<String> result = que.choiceNotNull();
						for (int i = 0; i < result.size()-1; i++) {
%>
				<p><%=result.get(i)%></p>
<%
						}
%>
					<br>
<%
		}	
		}
%>
</body>
</html>