package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import model.category;

public class categoryDao implements DAOInterface<category>{

	@Override
	public ArrayList<category> selectAll() {
		
		ArrayList<category> result = new ArrayList<category>();
		Connection con = JDBCUtil.getConnection();
		String sql = "SELECT * FROM category";
		
		try {
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int idCategory = rs.getInt("idcategory");
				int idParent = rs.getInt("idparent");
				String nameCategory = rs.getString("namecategory");
				String textCategory = rs.getString("textcategory");

				category category = new category(idCategory, idParent, nameCategory, textCategory);
						
				result.add(category);
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	public int countChild(int idParentCategory) {
			
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT COUNT(*) FROM category WHERE idparent=? ";
			int count = 0;
			try {
				PreparedStatement st = con.prepareStatement(sql);
				st.setInt(1, idParentCategory);
				ResultSet rs = st.executeQuery();
				if (rs.next()) {
					count = rs.getInt(1);
				}
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return count;
		}

	public ArrayList<category> categoryChild(int idParentCategory) {
		
		ArrayList<category> result = new ArrayList<category>();
		Connection con = JDBCUtil.getConnection();
		String sql = "SELECT * FROM category WHERE idparent=? ";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, idParentCategory);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int idCategory = rs.getInt("idcategory");
				int idParent = rs.getInt("idparent");
				String nameCategory = rs.getString("namecategory");
				String textCategory = rs.getString("textcategory");

				category category = new category(idCategory, idParent, nameCategory, textCategory);
						
				result.add(category);
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public category selectByParent(String parentName) {
		
		ArrayList<category> result = new ArrayList<category>();
		Connection con = JDBCUtil.getConnection();
		String sql = "SELECT * FROM category WHERE namecategory= ?";
		
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, parentName);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int idCategory = rs.getInt("idcategory");
				int idParent = rs.getInt("idparent");
				String nameCategory = rs.getString("namecategory");
				String textCategory = rs.getString("textcategory");

				category Category = new category(idCategory, idParent, nameCategory, textCategory);
				result.add(Category);
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result.get(0);
		
	}
	
	public int selectIdByNameCategory(String namecategory) {
		
		Connection con = JDBCUtil.getConnection();
		String sql = "SELECT idcategory FROM category WHERE namecategory=? ";
		int id = -1;
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, namecategory);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				id = rs.getInt("idcategory");
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return id;
		
	}
	
	public category selectCategoryById(int idcategory) {
		
		category result = new category();
		Connection con = JDBCUtil.getConnection();
		String sql = "SELECT * FROM category WHERE idcategory=? ";
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, idcategory);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				int idCategory = rs.getInt("idcategory");
				int idParent = rs.getInt("idparent");
				String nameCategory = rs.getString("namecategory");
				String textCategory = rs.getString("textcategory");

				category categorySelectByID = new category(idCategory, idParent, nameCategory, textCategory);
				result = categorySelectByID;
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	@Override
	public int insert(category t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO category (idCategory, idParent, nameCategory, textCategory) "+
					" VALUES (?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, t.getIdCategory());
			st.setInt(2, t.getIdParent());
			st.setString(3, t.getNameCategory());
			st.setString(4, t.getTextCategory());
			
			
			// Bước 3: thực thi câu lệnh SQL
			ketQua = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ ketQua+" dòng bị thay đổi!");
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketQua;
	}

	@Override
	public int insertAll(ArrayList<category> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(category t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<category> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(category t) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public category selectById(category t) {
		// TODO Auto-generated method stub
		return null;
	}

}
