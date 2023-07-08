package model;

import java.util.ArrayList;

import database.categoryDao;

public class category {
	private int idCategory;
	private int idParent;
	private String nameCategory;
	private String textCategory;
	
	public category(int idCategory, int idParent, String nameCategory, String textCategory) {
		this.idCategory = idCategory;
		this.idParent = idParent;
		this.nameCategory = nameCategory;
		this.textCategory = textCategory;
	}

	public category() {
		
	}

	public int getIdCategory() {
		return idCategory;
	}

	public void setIdCategory(int idCategory) {
		this.idCategory = idCategory;
	}

	public int getIdParent() {
		return idParent;
	}

	public void setIdParent(int idParent) {
		this.idParent = idParent;
	}

	public String getNameCategory() {
		return nameCategory;
	}

	public void setNameCategory(String nameCategory) {
		this.nameCategory = nameCategory;
	}

	public String getTextCategory() {
		return textCategory;
	}

	public void setTextCategory(String textCategory) {
		this.textCategory = textCategory;
	}
	
	public void printCategoryList(category cate, int level, ArrayList<String> subname, ArrayList<Integer> level2) {
		categoryDao categorydao = new categoryDao();
		String str;
	    ArrayList<category> subcategories = categorydao.categoryChild(cate.getIdCategory());
	    if (!subcategories.isEmpty()) {     
	        for (category subcategory : subcategories) {
	            str = subcategory.getNameCategory();
	            subname.add(str);
	            level2.add(level);
	            printCategoryList(subcategory, level + 1, subname, level2);
	        }
	     
	    }
	    
	}
	
	
	public ArrayList<String> listcategory(){
	ArrayList<String> subname = new ArrayList<String>();
	ArrayList<Integer> level = new ArrayList<Integer>();
	ArrayList<category> result = new ArrayList<category>();
	  
	categoryDao catedao = new categoryDao();
	result = catedao.selectAll();
	
	for (int i=0; i<result.size(); i++) {
		if (result.get(i).getIdParent() == -1) {
			subname.add(result.get(i).getNameCategory());
			printCategoryList(result.get(i), 1, subname, level);
		}
	}
	return subname;
	}
	
	public ArrayList<Integer> levelcategory(){
		ArrayList<String> subname = new ArrayList<String>();
		ArrayList<Integer> level = new ArrayList<Integer>();
		ArrayList<category> result = new ArrayList<category>();
		  
		categoryDao catedao = new categoryDao();
		result = catedao.selectAll();
		
		for (int i=0; i<result.size(); i++) {
			if (result.get(i).getIdParent() == -1) {
				subname.add(result.get(i).getNameCategory());
				level.add(0);
				printCategoryList(result.get(i), 1, subname, level);
			}
		}
		return level;
	}
	
	public void SubCategoryList(category cate, ArrayList<String> subname) {
		categoryDao categorydao = new categoryDao();
		String str;
	    ArrayList<category> subcategories = categorydao.categoryChild(cate.getIdCategory());
	    if (!subcategories.isEmpty()) {     
	        for (category subcategory : subcategories) {
	            str = subcategory.getNameCategory();
	            subname.add(str);
	            SubCategoryList(subcategory, subname);
	        }
	     
	    }    
	}
	
	public ArrayList<String> SubCategory(category cate) {
		ArrayList<String> subname = new ArrayList<String>();
		SubCategoryList(cate, subname);
		subname.add(cate.getNameCategory());
		return subname;
	}
	
	public static void main(String[] args) {
		category listcategory = new category();
		categoryDao catedao = new categoryDao();
		ArrayList<String> categoryList = listcategory.listcategory();
		ArrayList<Integer> categoryLevel = listcategory.levelcategory();
		
		listcategory = catedao.selectByParent("Lập trình hướng đối tượng");
		ArrayList<String> categorysubList = listcategory.SubCategory(listcategory);
		for (String nameCate : categorysubList) {
			System.out.println(nameCate);
		}
		
		for (int i=0; i<categoryLevel.size(); i++) {
			System.out.println(categoryLevel.get(i));
		}
//		categoryDao categorydao = new categoryDao();
//		ArrayList<category> result =  categorydao.selectAll();
//		for (category cate : result) {
//			System.out.println(categorydao.countChild(cate.getIdCategory()));
//		}
//				
	}
}
