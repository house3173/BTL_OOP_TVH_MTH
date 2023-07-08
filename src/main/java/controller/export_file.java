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
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.io.FileNotFoundException;
import java.io.FileWriter;

import database.questionDao;
import model.question;
/**
 * Servlet implementation class export_file
 */
@WebServlet("/export_file")
public class export_file extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public export_file() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession(false);
		if (!(session != null)) {
		    session = request.getSession();
		}
		ArrayList<String> listQuestion = (ArrayList<String>) session.getAttribute("listQuestion");
		String nameOfQuiz = session.getAttribute("nameOfQuiz")+"";
		nameOfQuiz = (nameOfQuiz.equalsIgnoreCase("null"))?"NoData":nameOfQuiz;
		
		String path = "C:\\Users\\Admin\\eclipse-workspace\\BTL_OOP\\src\\main\\webapp\\File\\" + nameOfQuiz +".txt";
		String openFile ="file:///C:/Users/Admin/eclipse-workspace/BTL_OOP/src/main/webapp/File/"+nameOfQuiz+".txt";
		try {
			PrintWriter fileExport = new PrintWriter(path,"UTF-8");
			fileExport.println(nameOfQuiz);
			fileExport.println();
			if(listQuestion != null) {
				int k = 0;
				questionDao quedao = new questionDao();
				for(String nameQue : listQuestion) {
					k++;
					String numberQuestion = "Question " + k +":";
					fileExport.println(numberQuestion);
					
					question que = quedao.selectAllByName(nameQue);
					String strquestion = nameQue + ": " + que.getTextQuestion();
					fileExport.println(strquestion);
					
					ArrayList<String> result = que.choiceNotNull();
						for (int i = 0; i < result.size()-1; i++) {
							fileExport.println(result.get(i));
						}
					fileExport.println();
				}
			}
			fileExport.flush();
			fileExport.close();
			request.setAttribute("openFile", openFile);
			System.out.println(openFile);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} 
		
		String url = "/setup_quiz.jsp";
		
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
