package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import model.category;
import model.question;
import model.choice;

public class questionDao implements DAOInterface<question>{

	@Override
	public ArrayList<question> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ArrayList<question> selectAllByNameCategory(String nameCategory) {
		ArrayList<question> result = new ArrayList<question>();
		categoryDao catedao = new categoryDao();
		category cate = catedao.selectByParent(nameCategory);
		
		Connection con = JDBCUtil.getConnection();
		String sql = "SELECT * FROM question WHERE idcategory=?";
		
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, cate.getIdCategory());
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				
				String nameQuestion = rs.getString("namequestion");
				String textQuestion = rs.getString("textquestion");
				String choiceText1 = rs.getString("choicetext1");
				String choiceText2 = rs.getString("choicetext2");
				String choiceText3 = rs.getString("choicetext3");
				String choiceText4 = rs.getString("choicetext4");
				String choiceText5 = rs.getString("choicetext5");
				double gradeChoice1 = rs.getDouble("gradechoice1");
				double gradeChoice2 = rs.getDouble("gradechoice2");
				double gradeChoice3 = rs.getDouble("gradechoice3");
				double gradeChoice4 = rs.getDouble("gradechoice4");
				double gradeChoice5 = rs.getDouble("gradechoice5");
				choice choice1 = new choice(choiceText1,gradeChoice1);
				choice choice2 = new choice(choiceText2,gradeChoice2);
				choice choice3 = new choice(choiceText3,gradeChoice3);
				choice choice4 = new choice(choiceText4,gradeChoice4);
				choice choice5 = new choice(choiceText5,gradeChoice5);
				
				question ques = new question(cate.getIdCategory(), nameQuestion, textQuestion, choice1, choice2, choice3, choice4, choice5);
						
				result.add(ques);
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<question> selectRandomQuestion(int idcategory, int numberquestion) {
		ArrayList<question> result = new ArrayList<question>();
	
		Connection con = JDBCUtil.getConnection();
		String sql = "SELECT * FROM question WHERE idcategory = ? ORDER BY RAND() LIMIT ?";
		
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, idcategory);
			st.setInt(2, numberquestion);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				
				String nameQuestion = rs.getString("namequestion");
				String textQuestion = rs.getString("textquestion");
				String choiceText1 = rs.getString("choicetext1");
				String choiceText2 = rs.getString("choicetext2");
				String choiceText3 = rs.getString("choicetext3");
				String choiceText4 = rs.getString("choicetext4");
				String choiceText5 = rs.getString("choicetext5");
				double gradeChoice1 = rs.getDouble("gradechoice1");
				double gradeChoice2 = rs.getDouble("gradechoice2");
				double gradeChoice3 = rs.getDouble("gradechoice3");
				double gradeChoice4 = rs.getDouble("gradechoice4");
				double gradeChoice5 = rs.getDouble("gradechoice5");
				choice choice1 = new choice(choiceText1,gradeChoice1);
				choice choice2 = new choice(choiceText2,gradeChoice2);
				choice choice3 = new choice(choiceText3,gradeChoice3);
				choice choice4 = new choice(choiceText4,gradeChoice4);
				choice choice5 = new choice(choiceText5,gradeChoice5);
				
				question ques = new question(idcategory, nameQuestion, textQuestion, choice1, choice2, choice3, choice4, choice5);
						
				result.add(ques);
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public question selectAllByName(String nameQuestion) {
		question result = new question();

		Connection con = JDBCUtil.getConnection();
		String sql = "SELECT * FROM question WHERE namequestion=?";
		
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, nameQuestion);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				
				int idcategory = rs.getInt("idcategory");
				String textQuestion = rs.getString("textquestion");
				String choiceText1 = rs.getString("choicetext1");
				String choiceText2 = rs.getString("choicetext2");
				String choiceText3 = rs.getString("choicetext3");
				String choiceText4 = rs.getString("choicetext4");
				String choiceText5 = rs.getString("choicetext5");
				double gradeChoice1 = rs.getDouble("gradechoice1");
				double gradeChoice2 = rs.getDouble("gradechoice2");
				double gradeChoice3 = rs.getDouble("gradechoice3");
				double gradeChoice4 = rs.getDouble("gradechoice4");
				double gradeChoice5 = rs.getDouble("gradechoice5");
				choice choice1 = new choice(choiceText1,gradeChoice1);
				choice choice2 = new choice(choiceText2,gradeChoice2);
				choice choice3 = new choice(choiceText3,gradeChoice3);
				choice choice4 = new choice(choiceText4,gradeChoice4);
				choice choice5 = new choice(choiceText5,gradeChoice5);
				
				question ques = new question(idcategory, nameQuestion, textQuestion, choice1, choice2, choice3, choice4, choice5);
						
				result = ques;
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public question selectById(question t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(question t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO question (idcategory, namequestion, textquestion, choicetext1, gradechoice1 "
					+ ", choicetext2, gradechoice2, choicetext3, gradechoice3, choicetext4, gradechoice4, choicetext5, gradechoice5) "+
					" VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, t.getIdCategory());
			st.setString(2, t.getNameQuestion());
			st.setString(3, t.getTextQuestion());
			st.setString(4, t.getChoice1().getTextChoice());
			st.setDouble(5, t.getChoice1().getGradeChoice());
			st.setString(6, t.getChoice2().getTextChoice());
			st.setDouble(7, t.getChoice2().getGradeChoice());
			st.setString(8, t.getChoice3().getTextChoice());
			st.setDouble(9, t.getChoice3().getGradeChoice());
			st.setString(10, t.getChoice4().getTextChoice());
			st.setDouble(11, t.getChoice4().getGradeChoice());
			st.setString(12, t.getChoice5().getTextChoice());
			st.setDouble(13, t.getChoice5().getGradeChoice());
			
			
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
	public int insertAll(ArrayList<question> arr) {
		// TODO Auto-generated method stub
		return 0;
	}


	public int delete(String nameQuestion) {
		int ketQua = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "DELETE From question " + " WHERE namequestion=?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, nameQuestion);

			System.out.println(sql);
			ketQua = st.executeUpdate();

			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ketQua;
	}

	@Override
	public int deleteAll(ArrayList<question> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(question t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(question t) {
		// TODO Auto-generated method stub
		return 0;
	}
	
//	public static void main(String[] args) {
//		questionDao qued = new questionDao();
//		ArrayList<question> result = qued.selectRandomQuestion(141292, 2);
//		for (question que : result) {
//			System.out.println(que.getNameQuestion());
//		}
//	}
}

