package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.question;
import database.questionDao;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Servlet implementation class finish_attemp
 */
@WebServlet("/finish_attemp")
public class finish_attemp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public finish_attemp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession(false);
		if (!(session != null)) {
		    session = request.getSession();
		}
		
		LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE, dd MMMM yyyy, h:mm a");
        String finishQuiz = now.format(formatter);
        session.setAttribute("finishQuiz", finishQuiz);  
        
        String startTime = request.getParameter("startTime");
    	session.setAttribute("startQuiz", startTime);
    	
    	String timeTaken = request.getParameter("timeTaken");
    	Integer lengthTime = Integer.valueOf(timeTaken);
    	int totalSeconds = lengthTime/1000; 

    	int hours = totalSeconds / 3600; // Số giờ
    	int minutes = (totalSeconds % 3600) / 60; // Số phút
    	int seconds = totalSeconds % 60; // Số giây

    	String timeForQuiz = String.format("%02d hours %02d mins %02d secs", hours, minutes, seconds);
//    	request.setAttribute("timeForQuiz", timeForQuiz);
    	
    	SimpleDateFormat format = new SimpleDateFormat("EEEE, dd MMMM yyyy, h:mm a");

        try {
            Date datestart = format.parse(startTime);
            Date dateend = format.parse(finishQuiz);
            
            long durationInMillis = Math.abs(dateend.getTime() - datestart.getTime());
            Duration duration = Duration.ofMillis(durationInMillis);
            long hour = duration.toHours();
            long minute = duration.toMinutesPart();
            long second = duration.toSecondsPart();

            String formattedDuration = String.format("%02d hours %02d mins", hour, minute);
            request.setAttribute("timeForQuiz", formattedDuration);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
//    	DateTimeFormatter format = DateTimeFormatter.ofPattern("EEEE, dd MMMM yyyy, h:mm a", Locale.ENGLISH);
//    	LocalDateTime start = LocalDateTime.parse(startTime, format);
//    	LocalDateTime start = LocalDateTime.of(2023, 7, 1, 10, 30, 0); 
//    	LocalDateTime end = now;
//
//    	Duration duration = Duration.between(start, end); 
//
//    	long hours = duration.toHours(); // Số giờ
//    	long minutes = duration.toMinutes() % 60; // Số phút
//    	long seconds = duration.getSeconds() % 60; // Số giây
//
//    	String timeTaken = String.format("%02d:%02d:%02d", hours, minutes, seconds); 
//    	System.out.println(timeTaken);
			
		ArrayList<String> listQuestion = (ArrayList<String>) session.getAttribute("listQuestion");
		ArrayList<String> answerQuestion = new ArrayList<String>();
		ArrayList<String> resultQuiz = new ArrayList<String>();
		ArrayList<Boolean> markQuestion = new ArrayList<Boolean>(); 
		questionDao quedao = new questionDao();
		int marks = 0;
		int correct = 0;
		if (listQuestion != null) {
			for (int i = 0; i < listQuestion.size(); i++) {
				
				int k = i + 1; 
				String selectChoice = "selectChoice"+k;
				String choiceSelected = request.getParameter(selectChoice);
				if (choiceSelected == null) {
					choiceSelected = "";
					markQuestion.add(false);
				} else {
					marks++;
					markQuestion.add(true);
				}
				answerQuestion.add(choiceSelected);
				
				question que = quedao.selectAllByName(listQuestion.get(i));
				ArrayList<String> result = que.choiceNotNull();
				String correctAnswer = result.get(result.size()-1);
				resultQuiz.add(correctAnswer);
				if (choiceSelected.equals(correctAnswer)) {					
					correct++;
				}
			}
			double grade = 10.0*correct / listQuestion.size();
			session.setAttribute("grade", grade);
		}
		
	session.setAttribute("answerQuestion", answerQuestion);
	session.setAttribute("resultQuiz", resultQuiz);
	session.setAttribute("markQuestion", markQuestion);
	session.setAttribute("marks", marks);
	
	  String url = "/result_quiz.jsp";
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
