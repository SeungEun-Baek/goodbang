package com.goodbang.main.model;

import java.util.List;

public class Room {
	/** subject 제목 */
	private String subject;
	/** deposit 보증금 */
	private int deposit;
	/** monthlyRent 월세 */
	private int monthlyRent;
	/** id 등록번호 */
	private String id;
	/** shape 방 구조 */
	private String shape;
	/** buildingType 건물 형태 */
	private String buildingType;
	/** floor 층 */
	private int floor;
	/** topFloor 건물층수 */
	private int topFloor;
	/** managementExpenses 관리비 */
	private int managementExpenses ;
	/** managementServices 관리비 포함항목 */
	private List<String> managementServices;
	/** dimensions 크기 */
	private String dimensions;
	/** parking 주차 */
	private boolean parking;
	/** elevator 엘레베이터 */
	private boolean elevator;
	/** options 옵션 */
	private List<String> options;
	/** movingDate 입주가능일 */
	private String movingDate;
	/** description 상세설명 */
	private String description;
	/** address 주소 */
	private String address;
	/** nearbySubways 인근전철역 */
	private List<String> nearbySubways;
	/** latitude 위도*/
	private String latitude;
	/** longitude 경도*/
	private String longitude;
	
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public int getMonthlyRent() {
		return monthlyRent;
	}
	public void setMonthlyRent(int monthlyRent) {
		this.monthlyRent = monthlyRent;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getShape() {
		return shape;
	}
	public void setShape(String shape) {
		this.shape = shape;
	}
	public String getBuildingType() {
		return buildingType;
	}
	public void setBuildingType(String buildingType) {
		this.buildingType = buildingType;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public int getTopFloor() {
		return topFloor;
	}
	public void setTopFloor(int topFloor) {
		this.topFloor = topFloor;
	}
	public int getManagementExpenses() {
		return managementExpenses;
	}
	public void setManagementExpenses(int managementExpenses) {
		this.managementExpenses = managementExpenses;
	}
	public List<String> getManagementServices() {
		return managementServices;
	}
	public void setManagementServices(List<String> managementServices) {
		this.managementServices = managementServices;
	}
	public String getDimensions() {
		return dimensions;
	}
	public void setDementions(String dimensions) {
		this.dimensions = dimensions;
	}
	public boolean isParking() {
		return parking;
	}
	public void setParking(boolean parking) {
		this.parking = parking;
	}
	public boolean isElevator() {
		return elevator;
	}
	public void setElevator(boolean elevator) {
		this.elevator = elevator;
	}
	public List<String> getOptions() {
		return options;
	}
	public void setOptions(List<String> options) {
		this.options = options;
	}
	public String getMovingDate() {
		return movingDate;
	}
	public void setMovingDate(String movingDate) {
		this.movingDate = movingDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public List<String> getNearbySubways() {
		return nearbySubways;
	}
	public void setNearbySubways(List<String> nearbySubways) {
		this.nearbySubways = nearbySubways;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

}
