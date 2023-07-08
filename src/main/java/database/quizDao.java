package database;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;


import model.quiz;

public class quizDao implements DAOInterface<quiz>{

	@Override
	public ArrayList<quiz> selectAll() {
		
		ArrayList<quiz> result = new ArrayList<quiz>();
		Connection con = JDBCUtil.getConnection();
		String sql = "SELECT * FROM quiz";
		
		try {
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String idCategory = rs.getString("idcategory");
				String nameQuiz = rs.getString("namequiz");
				String textQuiz = rs.getString("textquiz");
				Date openQuiz = rs.getDate("openquiz");
				Time timeOpen = rs.getTime("timeopen");
				Date closeQuiz = rs.getDate("closequiz");
				Time timeClose = rs.getTime("timeclose");
				int timeLimit = rs.getInt("timelimit");
				String timeUnit = rs.getString("timeunit");
				String timeLimitEnable = rs.getString("timelimitenable");

				quiz Quiz = new quiz(idCategory, nameQuiz, textQuiz, openQuiz,timeOpen, closeQuiz, timeClose, timeLimit,timeUnit,timeLimitEnable);
						
				result.add(Quiz);
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public quiz selectByNameQuiz(String nameQuiz) {
		
		quiz result = new quiz();
		Connection con = JDBCUtil.getConnection();
		String sql = "SELECT * FROM quiz WHERE namequiz = ?";
		
		try {
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, nameQuiz);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				String idCategory = rs.getString("idcategory");
				String textQuiz = rs.getString("textquiz");
				Date openQuiz = rs.getDate("openquiz");
				Time timeOpen = rs.getTime("timeopen");
				Date closeQuiz = rs.getDate("closequiz");
				Time timeClose = rs.getTime("timeclose");
				int timeLimit = rs.getInt("timelimit");
				String timeUnit = rs.getString("timeunit");
				String timeLimitEnable = rs.getString("timelimitenable");

				quiz Quiz = new quiz(idCategory, nameQuiz, textQuiz, openQuiz,timeOpen, closeQuiz, timeClose, timeLimit,timeUnit,timeLimitEnable);		
				result = Quiz;
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public quiz selectById(quiz t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(quiz t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO quiz (idcategory, namequiz, textquiz, openquiz, timeopen, closequiz, timeclose, timelimit, timeunit,timelimitenable) "+
					" VALUES (?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getIdCategory());
			st.setString(2, t.getNameQuiz());
			st.setString(3, t.getTextQuiz());
			st.setDate(4, new java.sql.Date(t.getOpenQuiz().getTime()));
			st.setTime(5, t.getTimeOpen());
			st.setDate(6, new java.sql.Date(t.getCloseQuiz().getTime()));
			st.setTime(7,t.getTimeClose());
			st.setInt(8, t.getTimeLimit());
			st.setString(9, t.getTimeUit());
			st.setString(10, t.getTimeLimitEnable() );
			
			
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
	public int insertAll(ArrayList<quiz> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(quiz t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<quiz> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(quiz t) {
		// TODO Auto-generated method stub
		return 0;
	}


//public static void main (String [] args) {
//	quizDao qdao = new quizDao();
//	System.out.println(qdao.selectByNameQuiz("Thi thử cuối kỳ môn Kỹ thuật lập trình").getTimeLimit()+"");
//}
}
