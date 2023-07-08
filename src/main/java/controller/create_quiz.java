package controller;

import java.io.IOException;
import java.sql.Time;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.quiz;
import database.quizDao;

/**
 * Servlet implementation class create_quiz
 */
@WebServlet(value="/create_quiz")
public class create_quiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public create_quiz() {
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
		
		String idCategory = "IT3090";
		String nameQuiz = request.getParameter("nameQuiz");
		String textQuiz = request.getParameter("textQuiz");
		String openQuiz = request.getParameter("dateOpen");
		String timeOpen = request.getParameter("timeOpen");
		String closeQuiz = request.getParameter("dateClose");
		String timeClose = request.getParameter("timeClose");
		String timeLimit = request.getParameter("timeLimitQuiz");
		String timeUnit = request.getParameter("timeUnit");
		int timelimit = Integer.parseInt(timeLimit);
		String timeLimitEnable = request.getParameter("timeLimitEnable");
		if (timeLimitEnable == null) timeLimitEnable = "no";
		
		Date dateOpen = null;
		Date dateClose = null;
		Time openTime = null;
		Time closeTime = null;
//		Time openTime = Time.valueOf(timeOpen);
//		Time closeTime = Time.valueOf(timeClose);
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat format = new SimpleDateFormat("HH:mm");
        
        try {
			dateOpen = dateFormat.parse(openQuiz);
			dateClose = dateFormat.parse(closeQuiz);
			Date parsedTimeOpen = format.parse(timeOpen);
		    openTime = new Time(parsedTimeOpen.getTime());
		    Date parsedTimeClose = format.parse(timeClose);
		    closeTime = new Time(parsedTimeClose.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
//		request.setAttribute("tenDangNhap", tenDangNhap);		

		
		String url="";
		
	
		quizDao QuizDao = new quizDao();
		quiz qu = new quiz(idCategory, nameQuiz, textQuiz, dateOpen, openTime , dateClose, closeTime, timelimit, timeUnit, timeLimitEnable);
		QuizDao.insert(qu);
		url = "/index.jsp";
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
