package com.github.freetie.employee.dao;

import java.util.List;

import com.github.freetie.employee.entity.Employee;
import com.github.freetie.employee.entity.EmployeeQueryParameters;

public interface EmployeeDao {

	public void save(Employee employee);
	
	public void delete(Integer id);
	
	public void update(Employee employee);
	
	public Employee find(Integer id);
	
	public List<Employee> findAll(EmployeeQueryParameters queryParameters);
	
	public List<String> findAllJobNumbers();

	public Integer count(Employee queryParameters);
	
}