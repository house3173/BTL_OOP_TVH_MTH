package model;

public class choice {
	private String textChoice;
	private double gradeChoice;
	
	public choice() {

	}

	public choice(String textChoice, double gradeChoice) {
		this.textChoice = textChoice;
		this.gradeChoice = gradeChoice;
	}

	public String getTextChoice() {
		return textChoice;
	}

	public void setTextChoice(String textChoice) {
		this.textChoice = textChoice;
	}

	public double getGradeChoice() {
		return gradeChoice;
	}

	public void setGradeChoice(double gradeChoice) {
		this.gradeChoice = gradeChoice;
	}
	
	
}
