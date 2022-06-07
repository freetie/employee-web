package com.github.freetie.employee.dao;

import java.util.List;

import com.github.freetie.employee.entity.Account;

public interface AccountDao {
	public void save(Account account);
	
	public void delete(Integer id);
	
	public void update(Account account);
	
	public Account findByName(String name);
	
	public List<String> findAllNames();
}
