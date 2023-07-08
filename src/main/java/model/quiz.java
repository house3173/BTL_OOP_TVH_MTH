package model;

import java.sql.Time;
import java.util.Date;


public class quiz {
	private String idCategory;
	private String nameQuiz;
	private String textQuiz;
	private Date openQuiz;
	private Time timeOpen;
	private Date closeQuiz;
	private Time timeClose;
	private int timeLimit;
	private String timeUit;
	private String timeLimitEnable;

	

	public quiz(String idCategory, String nameQuiz, String textQuiz, Date openQuiz, Time timeOpen, Date closeQuiz,
			Time timeClose, int timeLimit, String timeUit, String timeLimitEnable) {
		this.idCategory = idCategory;
		this.nameQuiz = nameQuiz;
		this.textQuiz = textQuiz;
		this.openQuiz = openQuiz;
		this.timeOpen = timeOpen;
		this.closeQuiz = closeQuiz;
		this.timeClose = timeClose;
		this.timeLimit = timeLimit;
		this.timeUit = timeUit;
		this.timeLimitEnable = timeLimitEnable;
	}

	public quiz() {
		
	}

	public Time getTimeOpen() {
		return timeOpen;
	}

	public void setTimeOpen(Time timeOpen) {
		this.timeOpen = timeOpen;
	}

	public Time getTimeClose() {
		return timeClose;
	}

	public void setTimeClose(Time timeClose) {
		this.timeClose = timeClose;
	}

	public String getIdCategory() {
		return idCategory;
	}

	public void setIdCategory(String idCategory) {
		this.idCategory = idCategory;
	}

	public String getNameQuiz() {
		return nameQuiz;
	}

	public void setNameQuiz(String nameQuiz) {
		this.nameQuiz = nameQuiz;
	}

	public String getTextQuiz() {
		return textQuiz;
	}

	public void setTextQuiz(String textQuiz) {
		this.textQuiz = textQuiz;
	}

	public Date getOpenQuiz() {
		return openQuiz;
	}

	public void setOpenQuiz(Date openQuiz) {
		this.openQuiz = openQuiz;
	}

	public Date getCloseQuiz() {
		return closeQuiz;
	}

	public void setCloseQuiz(Date closeQuiz) {
		this.closeQuiz = closeQuiz;
	}

	public int getTimeLimit() {
		return timeLimit;
	}

	public void setTimeLimit(int timeLimit) {
		this.timeLimit = timeLimit;
	}

	public String getTimeUit() {
		return timeUit;
	}

	public void setTimeUit(String timeUit) {
		this.timeUit = timeUit;
	}

	public String getTimeLimitEnable() {
		return timeLimitEnable;
	}

	public void setTimeLimitEnable(String timeLimitEnable) {
		this.timeLimitEnable = timeLimitEnable;
	}

	
	
}
