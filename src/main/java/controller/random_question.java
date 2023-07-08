package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.questionDao;
import model.question;
/**
 * Servlet implementation class random_question
 */
@WebServlet("/random_question")
public class random_question extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public random_question() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String actionForm = request.getParameter("actionForm");
		if (actionForm.equals("selectCategory")) {
			selectCategory(request, response);
		} else {
			if (actionForm.equals("selectedNumber")) {
				showRandomQuestion(request, response);
			}
		 }
	}

	protected void selectCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String selectedCategory = request.getParameter("select_category");
		request.setAttribute("selectedCategory", selectedCategory);
		
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.setAttribute("selectedCategory", selectedCategory);
		} else {
		    session = request.getSession();
		    session.setAttribute("selectedCategory", selectedCategory);
		}
		
		
		String url = "/random_question.jsp";
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	protected void showRandomQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String selectedCategory = request.getParameter("select_category");
		String number_question = request.getParameter("number_question");
		Integer selected_Category = Integer.valueOf(selectedCategory);
		Integer numberQuestion = Integer.valueOf(number_question);
		questionDao quesdao = new questionDao();
		ArrayList<question> randomQuestion = quesdao.selectRandomQuestion(selected_Category, numberQuestion);
		
		HttpSession session = request.getSession(false);
		if (!(session != null)) {
		    session = request.getSession();
		}
		session.setAttribute("selectedCategory", selectedCategory);
		session.setAttribute("numberQuestion", numberQuestion);
		session.setAttribute("randomQuestion", randomQuestion);
		
		String url = "/random_question.jsp";
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
			
		}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
