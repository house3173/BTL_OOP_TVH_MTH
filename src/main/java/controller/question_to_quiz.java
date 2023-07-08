package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
/**
 * Servlet implementation class question_to_quiz
 */
@WebServlet("/question_to_quiz")
public class question_to_quiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public question_to_quiz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String idcate = request.getParameter("select_category");
		
		HttpSession session = request.getSession(false);
		if (!(session != null)) {
		    session = request.getSession();
		}
		
		session.setAttribute("idcate", idcate);
		
		String url = "/question_to_quiz.jsp";
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String[] nameQuestion = request.getParameterValues("checkboxQuestion");
		
		HttpSession session = request.getSession(false);
		if (!(session != null)) {
		    session = request.getSession();
		}
		
		ArrayList<String> listQuestion = (ArrayList<String>) session.getAttribute("listQuestion");
		if(listQuestion == null ) {
			listQuestion = new ArrayList<String>();
		}
		if (nameQuestion != null) {
		    for (String name : nameQuestion) {
		        System.out.println(name);
		        if (!listQuestion.contains(name)) 
		        	listQuestion.add(name);
		    }
		}
		
		session.setAttribute("listQuestion", listQuestion);
		
		String url = "/editing_quiz.jsp";
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
