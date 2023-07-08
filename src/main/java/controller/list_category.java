package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.category;
import database.categoryDao;
/**
 * Servlet implementation class list_category
 */
@WebServlet("/list_category")
public class list_category extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public list_category() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		ArrayList<String> subname = new ArrayList<String>();
		ArrayList<category> result = new ArrayList<category>();
		  
		categoryDao catedao = new categoryDao();
		result = catedao.selectAll();
		
		for (int i=0; i<result.size(); i++) {
			if (result.get(i).getIdParent() == -1) {
				subname.add(result.get(i).getNameCategory());
				printCategoryList(result.get(i), 1, subname);
			}
		}
		

		System.out.println(subname);
		
		
        request.setAttribute("subname", subname);
        
        RequestDispatcher rd = getServletContext().getRequestDispatcher("list_question.jsp");
		rd.forward(request, response);
		
	}
	
	private void printCategoryList(category cate, int level, ArrayList<String> subname) {
		categoryDao categorydao = new categoryDao();
		String str;
	    ArrayList<category> subcategories = categorydao.categoryChild(cate.getIdCategory());
	    String tabtab="";
	    for (int k = 1; k <=level*3; k++) {   
	    	tabtab+=" ";
	    }
	    if (!subcategories.isEmpty()) {     
	        for (category subcategory : subcategories) {
	            str = tabtab + subcategory.getNameCategory();
	            subname.add(str);
	            printCategoryList(subcategory, level + 1, subname);
	        }
	     
	    }
	    
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
