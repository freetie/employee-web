package com.github.freetie.employee.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.github.freetie.employee.dao.AccountDao;
import com.github.freetie.employee.entity.Account;

@Service
public class AccountService {

	AccountDao accountDao;

	public AccountService(AccountDao accountDao) {
		this.accountDao = accountDao;
	}

	public Account findByName(String name) {
		return accountDao.findByName(name);
	}

	public List<String> findAllNames() {
		return accountDao.findAllNames();
	}
}
