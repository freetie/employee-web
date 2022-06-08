package com.github.freetie.employee.entity;

import java.time.LocalDateTime;

enum Gender {
	MALE, FEMALE
}

enum MaritalStatus {
	MARRIED, UNMARRIED
}

public class Employee {
	// table fields
	private Integer id;
	private String jobNumber;
	private String name;
	private Integer age;
	private Gender gender;
	private MaritalStatus maritalStatus;
	private Integer hireYear;
	private Integer hireMonth;
	private Integer hireDay;
	private String email;
	private String phone;
	private Integer accountId;
	private LocalDateTime birthDate;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getJobNumber() {
		return jobNumber;
	}
	public void setJobNumber(String jobNumber) {
		this.jobNumber = jobNumber;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Gender getGender() {
		return gender;
	}
	public void setGender(Gender gender) {
		this.gender = gender;
	}
	public MaritalStatus getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(MaritalStatus maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	public Integer getHireYear() {
		return hireYear;
	}
	public void setHireYear(Integer hireYear) {
		this.hireYear = hireYear;
	}
	public Integer getHireMonth() {
		return hireMonth;
	}
	public void setHireMonth(Integer hireMonth) {
		this.hireMonth = hireMonth;
	}
	public Integer getHireDay() {
		return hireDay;
	}
	public void setHireDay(Integer hireDay) {
		this.hireDay = hireDay;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public LocalDateTime getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(LocalDateTime birthDate) {
		this.birthDate = birthDate;
	}
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}
	public Integer getAccountId() {
		return accountId;
	}
	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}

	// associated fields
	private String accountName;
	private String accountPassword;
  public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getAccountPassword() {
		return accountPassword;
	}
	public void setAccountPassword(String accountPassword) {
		this.accountPassword = accountPassword;
	}
}
