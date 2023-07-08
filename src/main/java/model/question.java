package model;

import java.util.ArrayList;
import database.questionDao;
import java.util.Random;

public class question {
	private int idCategory;
	private String nameQuestion;
	private String textQuestion;
//	private double markQuestion;
	private choice choice1;
	private choice choice2;
	private choice choice3;
	private choice choice4;
	private choice choice5;
	
	
	
	public question() {
		
	}

	public question( int idCategory, String nameQuestion, String textQuestion,
			choice choice1, choice choice2, choice choice3, choice choice4, choice choice5) {
		this.idCategory = idCategory;
		this.nameQuestion = nameQuestion;
		this.textQuestion = textQuestion;
//		this.markQuestion = markQuestion;
		this.choice1 = choice1;
		this.choice2 = choice2;
		this.choice3 = choice3;
		this.choice4 = choice4;
		this.choice5 = choice5;
	}



	public int getIdCategory() {
		return idCategory;
	}

	public void setIdCategory(int idCategory) {
		this.idCategory = idCategory;
	}

	public String getNameQuestion() {
		return nameQuestion;
	}

	public void setNameQuestion(String nameQuestion) {
		this.nameQuestion = nameQuestion;
	}

	public String getTextQuestion() {
		return textQuestion;
	}

	public void setTextQuestion(String textQuestion) {
		this.textQuestion = textQuestion;
	}

//	public double getMarkQuestion() {
//		return markQuestion;
//	}
//
//	public void setMarkQuestion(double markQuestion) {
//		this.markQuestion = markQuestion;
//	}
	
	public choice getChoice1() {
		return choice1;
	}

	public void setChoice1(choice choice1) {
		this.choice1 = choice1;
	}

	public choice getChoice2() {
		return choice2;
	}

	public void setChoice2(choice choice2) {
		this.choice2 = choice2;
	}

	public choice getChoice3() {
		return choice3;
	}

	public void setChoice3(choice choice3) {
		this.choice3 = choice3;
	}

	public choice getChoice4() {
		return choice4;
	}

	public void setChoice4(choice choice4) {
		this.choice4 = choice4;
	}

	public choice getChoice5() {
		return choice5;
	}

	public void setChoice5(choice choice5) {
		this.choice5 = choice5;
	}
	
	public String answerQuestion() {
		String result = "";
		if(this.choice1.getGradeChoice() > 0 ) {
			result +="1";
		}
		if(this.choice2.getGradeChoice() > 0 ) {
			result +="2";
		}
		if(this.choice3.getGradeChoice() > 0 ) {
			result +="3";
		}
		if(this.choice4.getGradeChoice() > 0 ) {
			result +="4";
		}
		if(this.choice5.getGradeChoice() > 0 ) {
			result +="5";
		}
		return result;
	}
	
	public ArrayList<String> choiceNotNull() {
		ArrayList<String> result = new ArrayList<String>();
		String answer="";
		char start = 'a';
		ArrayList<choice> choiceQuestion = new ArrayList<choice>();
		choiceQuestion.add(choice1); choiceQuestion.add(choice2); choiceQuestion.add(choice3); 
		choiceQuestion.add(choice4); choiceQuestion.add(choice5);
		for (choice choice: choiceQuestion ) {
			if (choice.getTextChoice() != null && !choice.getTextChoice().equals("")) {
				String choiceString = start +". "+choice.getTextChoice();
				result.add(choiceString);
				if (choice.getGradeChoice() > 0) {
					answer = choiceString;
				}
				start++;
			}
		}
		result.add(answer);
	return result;
	}
	
	public ArrayList<String> choiceRandom() {
		ArrayList<String> result = new ArrayList<String>();
		String answer="";
		char start = 'a';
		ArrayList<choice> choiceQuestion = new ArrayList<choice>();
		choiceQuestion.add(choice1); choiceQuestion.add(choice2); choiceQuestion.add(choice3); 
		choiceQuestion.add(choice4); choiceQuestion.add(choice5);
		for (choice choice: choiceQuestion ) {
			if (choice.getTextChoice() != null && !choice.getTextChoice().equals("")) {
				String choiceString = choice.getTextChoice();
				result.add(choiceString);
				if (choice.getGradeChoice() > 0) {
					answer = choiceString;
				}
			}
		}
		int max = result.size();
		Random rand = new Random();
		for (int i = 0 ; i < max; i++){
			int ranNum = rand.nextInt(max-1)+1;
			String temp = result.get(ranNum);
			result.set(ranNum, result.get(i));
			result.set(i, temp);
		}
		for (int i = 0; i < max; i++) {
			String choiceString = start +". "+result.get(i);
			if(result.get(i).equals(answer)) answer = choiceString;
			result.set(i, choiceString);
			start++;
		}
		result.add(answer);
	return result;
	}
	
	public static void main(String[] args) {
		questionDao quedao = new questionDao();
		question que = quedao.selectAllByName("KTMTEasy1");
		ArrayList<String> result = que.choiceRandom();
		for (String st : result) {
			System.out.println(st);
		}
	}
}
