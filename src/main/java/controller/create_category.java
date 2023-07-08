package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.categoryDao;
import model.category;

/**
 * Servlet implementation class create_category
 */
@WebServlet("/create_category")
public class create_category extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public create_category() {
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
		String idCategory = request.getParameter("idCategory");
		int idNumCategory = Integer.parseInt(idCategory);
		
		String parentCategory = request.getParameter("parentCategory");
		int idNumberParent;
		 if (parentCategory.equalsIgnoreCase("Default")) {
			 idNumberParent = -1;
		 } else {
			 
		categoryDao CategoryDao = new categoryDao();
		category Category = CategoryDao.selectByParent(parentCategory);
		
		idNumberParent = Category.getIdCategory();
		 }
		
		String nameCategory = request.getParameter("nameCategory");
		String textCategory = request.getParameter("textCategory");
		
        
//		request.setAttribute("idCategory", idCategory);		
//		request.setAttribute("idParent", idParent);
//		request.setAttribute("nameCategory", nameCategory);
//		request.setAttribute("textCategory", textCategory);

		
		String url="";
		
	
		categoryDao categoryDao = new categoryDao();
		category cate = new category(idNumCategory, idNumberParent, nameCategory, textCategory);
		categoryDao.insert(cate);
		url = "/list_question.jsp";
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
