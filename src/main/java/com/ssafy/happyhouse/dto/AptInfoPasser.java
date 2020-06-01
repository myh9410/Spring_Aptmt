package com.ssafy.happyhouse.dto;

public class AptInfoPasser {
	private int currentPage;
	private int sizePerPage;
	private String key;
	private String word;
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getSizePerPage() {
		return sizePerPage;
	}
	public void setSizePerPage(int sizePerPage) {
		this.sizePerPage = sizePerPage;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public AptInfoPasser(int currentPage, int sizePerPage, String key, String word) {
		this.currentPage = currentPage;
		this.sizePerPage = sizePerPage;
		this.key = key;
		this.word = word;
	}
	
}
