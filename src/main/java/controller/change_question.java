package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.question;
import database.questionDao;

/**
 * Servlet implementation class change_question
 */
@WebServlet("/change_question")
public class change_question extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public change_question() {
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
		
		String nameQuestion = request.getParameter("Question");
		System.out.println(nameQuestion);
		questionDao quesdao = new questionDao();
		question questionEdit = quesdao.selectAllByName(nameQuestion);
		request.setAttribute("questionEdit", questionEdit);
		System.out.println(questionEdit.getTextQuestion());
		
		String sub_or_notsub = request.getParameter("edit_question");
		HttpSession session = request.getSession(false);
		if (!(session != null)) {
		    session = request.getSession();
		}
		session.setAttribute("sub_or_notsub", sub_or_notsub);
		
		String url="/change_question.jsp";
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
		
	}

}
