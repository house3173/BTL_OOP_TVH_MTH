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

import database.categoryDao;
import database.questionDao;
import model.question;
import model.category;
import model.choice;

/**
 * Servlet implementation class create_question
 */
@WebServlet("/create_question")
public class create_question extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public create_question() {
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
		
		questionDao questiondao = new questionDao();
		
		String nameCategory = request.getParameter("categoryQuestion");
		int idCategory;
		 if (nameCategory.equalsIgnoreCase("Default")) {
			 idCategory = -1;
		 } else {
			 
		categoryDao CategoryDao = new categoryDao();
		category Category = CategoryDao.selectByParent(nameCategory);
		
		idCategory = Category.getIdCategory();
		 }
		System.out.println(nameCategory);
		System.out.println(idCategory);
		
		String nameQuestion = request.getParameter("nameQuestion");
		questiondao.delete(nameQuestion);	// Trong TH edit cau hoi, thi can xoa cau hoi cux roi moi insert thay the
		
		String textQuestion = request.getParameter("textQuestion");
		
//		String markquestion = request.getParameter("markQuestion");
//		double markQuestion = Double.parseDouble(markquestion);
		
		String choiceText1 = request.getParameter("choiceText1");
		String gradechoice1 = request.getParameter("gradeChoice1");
		double gradeChoice1 = Double.parseDouble(gradechoice1);
		choice choice1 = new choice(choiceText1, gradeChoice1);
		
		String choiceText2 = request.getParameter("choiceText2");
		String gradechoice2 = request.getParameter("gradeChoice2");
		double gradeChoice2 = Double.parseDouble(gradechoice2);
		choice choice2 = new choice(choiceText2, gradeChoice2);
		
		String choiceText3 = request.getParameter("choiceText3");
		String gradechoice3 = request.getParameter("gradeChoice3");
		double gradeChoice3 = Double.parseDouble(gradechoice3);
		choice choice3 = new choice(choiceText3, gradeChoice3);
		
		String choiceText4 = request.getParameter("choiceText4");
		String gradechoice4 = request.getParameter("gradeChoice4");
		double gradeChoice4 = Double.parseDouble(gradechoice4);
		choice choice4 = new choice(choiceText4, gradeChoice4);
		
		String choiceText5 = request.getParameter("choiceText5");
		String gradechoice5 = request.getParameter("gradeChoice5");
		double gradeChoice5 = Double.parseDouble(gradechoice5);
		choice choice5 = new choice(choiceText5, gradeChoice5);
		
		request.setAttribute("categoryQuestion",nameCategory);
		request.setAttribute("nameQuestion",nameQuestion);
		request.setAttribute("textQuestion",textQuestion);
//		request.setAttribute("markQuestion",markQuestion);
		request.setAttribute("choiceText1",choiceText1);
		request.setAttribute("gradeChoice1",gradechoice1);
		request.setAttribute("choiceText2",choiceText2);
		request.setAttribute("gradeChoice2",gradechoice2);
		request.setAttribute("choiceText3",choiceText3);
		request.setAttribute("gradeChoice3",gradechoice3);
		request.setAttribute("choiceText4",choiceText4);
		request.setAttribute("gradeChoice4",gradechoice4);
		request.setAttribute("choiceText5",choiceText5);
		request.setAttribute("gradeChoice5",gradechoice5);
		
		
		String ErrorGrade="", ErrorChoice="";
		Double sum = 0.0;
		ArrayList<Double> grade = new ArrayList<Double>();
		grade.add(gradeChoice1); grade.add(gradeChoice2); grade.add(gradeChoice3); grade.add(gradeChoice4); grade.add(gradeChoice5);
		for (int i = 0; i<5; i++) {
			if (grade.get(i) > 0 ) sum = sum+grade.get(i);
		}
		if (sum != 1.0) ErrorGrade += "Tổng điểm các đáp án có điểm lớn hơn không phải bằng Default mark là 1";
				
		ArrayList<String> choiceText = new ArrayList<String>();
		choiceText.add(choiceText1); choiceText.add(choiceText2); choiceText.add(choiceText3); 
		choiceText.add(choiceText4); choiceText.add(choiceText5); 
		
		Integer count = 0;
		for (int i=0; i<5; i++) {
	//		System.out.println(choiceText.get(i));
			if ((choiceText.get(i).length() > 0))  count++;
		}
		if (count<2) ErrorChoice += "Số phương án lựa chọn phải ít nhất là 2";

		request.setAttribute("ErrorGrade", ErrorGrade);
		request.setAttribute("ErrorChoice", ErrorChoice);
		String url="";
		
		if (ErrorGrade.length() > 0 || ErrorChoice.length() > 0) {
			url = "/add_new_question.jsp";
		} else {
		
		question que = new question(idCategory, nameQuestion, textQuestion , choice1, choice2, choice3, choice4, choice5);
		questiondao.insert(que);
		
		HttpSession session = request.getSession(false);
		if (!(session != null)) {
		    session = request.getSession();
		}
		String sub_or_notsub = session.getAttribute("sub_or_notsub")+"";
		if (sub_or_notsub.equals("") || sub_or_notsub.equals("list_question")) {
			url = "/list_question.jsp";
		} else {
			url = "/list_sub_question.jsp";
		}
		
		}
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
		
	}	
}
	
