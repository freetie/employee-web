package com.github.freetie.employee.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.github.freetie.employee.dao.AccountDao;
import com.github.freetie.employee.dao.EmployeeDao;
import com.github.freetie.employee.entity.Account;
import com.github.freetie.employee.entity.Employee;
import com.github.freetie.employee.entity.EmployeeQueryParameters;

@Service
public class EmployeeService {
	AccountDao accountDao;
	EmployeeDao employeeDao;
	
	public EmployeeService(AccountDao accountDao, EmployeeDao employeeDao) {
		this.accountDao = accountDao;
		this.employeeDao = employeeDao;
	}

	public void save(Employee employee) {
		Account account = new Account();
		account.setName(employee.getAccountName());
		account.setPassword(employee.getAccountPassword());
		accountDao.save(account);
		employeeDao.save(employee);
	}
	
	public void delete(Integer id) {
		Employee employee = employeeDao.find(id);
		accountDao.delete(employee.getAccountId());
		employeeDao.delete(id);
	}
	
	public void update(Employee employee) {
		Account account = new Account();
		account.setId(employee.getAccountId());
		account.setName(employee.getAccountName());
		account.setPassword(employee.getAccountPassword());
		accountDao.update(account);
		employeeDao.update(employee);
	}
	
	public Employee find(Integer id) {
		return employeeDao.find(id);
	}
	
	public List<Employee> findAll(EmployeeQueryParameters queryParameters) {
		return employeeDao.findAll(queryParameters);
	}
	
	public Integer count(Employee queryParameters) {
		return employeeDao.count(queryParameters);
	}
	
	public List<String> findAllJobNumbers() {
		return employeeDao.findAllJobNumbers();
	}
}
