package com.github.freetie.employee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.github.freetie.employee.entity.Employee;
import com.github.freetie.employee.entity.EmployeeQueryParameters;

public interface EmployeeDao {
	@Insert("INSERT INTO employee (job_number, name, gender, marital_status, hire_year, hire_month, hire_day, email, phone, birth_date, account_id) VALUES (#{jobNumber}, #{name}, #{gender}, #{maritalStatus}, #{hireYear}, #{hireMonth}, #{hireDay}, #{email}, #{phone}, #{birthDate}, #{accountId})")
	public void save(Employee employee);

	@Delete("DELETE FROM employee WHERE id = #{id}")
	public void delete(Integer id);

	public void update(Employee employee);

	@Select("SELECT * FROM employee e WHERE id = #{id} LEFT JOIN account a ON e.account_id = a.id")
	public Employee find(Integer id);

	@Select("SELECT job_number FROM employee")
	public List<String> findAllJobNumbers();

	public List<Employee> findAll(EmployeeQueryParameters queryParameters);

	public Integer count(EmployeeQueryParameters queryParameters);
}