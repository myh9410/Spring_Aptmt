package com.ssafy.happyhouse.dto;

public class HouseDeal implements Comparable<HouseDeal>{
	private String APT_DEAL;
	private String APT_RENT;
	private String HOUSE_DEAL;
	private String HOUSE_RENT;
	private int no;
	private String dong;
	private String AptName;
	private int code;
	private String dealAmount;
	private int buildYear;
	private int dealYear;
	private int dealMonth;
	private int dealDay;
	private double area;
	private int floor;
	private String lat;
	private String lng;
	private String jibun;
	private String type;
	private String rentMoney;
	private String img;
	
	public HouseDeal() {}
	
	public HouseDeal(int no) {
		this.no = no;
	}

	@Override
	public int compareTo(HouseDeal o) {
		// TODO Auto-generated method stub
		return 0;
	}

	public String getAPT_DEAL() {
		return APT_DEAL;
	}

	public void setAPT_DEAL(String aPT_DEAL) {
		APT_DEAL = aPT_DEAL;
	}

	public String getAPT_RENT() {
		return APT_RENT;
	}

	public void setAPT_RENT(String aPT_RENT) {
		APT_RENT = aPT_RENT;
	}

	public String getHOUSE_DEAL() {
		return HOUSE_DEAL;
	}

	public void setHOUSE_DEAL(String hOUSE_DEAL) {
		HOUSE_DEAL = hOUSE_DEAL;
	}

	public String getHOUSE_RENT() {
		return HOUSE_RENT;
	}

	public void setHOUSE_RENT(String hOUSE_RENT) {
		HOUSE_RENT = hOUSE_RENT;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getAptName() {
		return AptName;
	}

	public void setAptName(String aptName) {
		AptName = aptName;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getDealAmount() {
		return dealAmount;
	}

	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}

	public int getBuildYear() {
		return buildYear;
	}

	public void setBuildYear(int buildYear) {
		this.buildYear = buildYear;
	}

	public int getDealYear() {
		return dealYear;
	}

	public void setDealYear(int dealYear) {
		this.dealYear = dealYear;
	}

	public int getDealMonth() {
		return dealMonth;
	}

	public void setDealMonth(int dealMonth) {
		this.dealMonth = dealMonth;
	}

	public int getDealDay() {
		return dealDay;
	}

	public void setDealDay(int dealDay) {
		this.dealDay = dealDay;
	}

	public double getArea() {
		return area;
	}

	public void setArea(double area) {
		this.area = area;
	}

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getJibun() {
		return jibun;
	}

	public void setJibun(String jibun) {
		this.jibun = jibun;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRentMoney() {
		return rentMoney;
	}

	public void setRentMoney(String rentMoney) {
		this.rentMoney = rentMoney;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "HouseDeal [APT_DEAL=" + APT_DEAL + ", APT_RENT=" + APT_RENT + ", HOUSE_DEAL=" + HOUSE_DEAL
				+ ", HOUSE_RENT=" + HOUSE_RENT + ", no=" + no + ", dong=" + dong + ", AptName=" + AptName + ", code="
				+ code + ", dealAmount=" + dealAmount + ", buildYear=" + buildYear + ", dealYear=" + dealYear
				+ ", dealMonth=" + dealMonth + ", dealDay=" + dealDay + ", area=" + area + ", floor=" + floor + ", lat="
				+ lat + ", lng=" + lng + ", jibun=" + jibun + ", type=" + type + ", rentMoney=" + rentMoney + ", img="
				+ img + "]";
	}
	
	
	
}
