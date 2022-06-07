package com.github.freetie.employee.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.github.freetie.employee.service.AccountService;

@Controller
public class AccountController {

	AccountService accountService;

	public AccountController(AccountService accountService) {
		this.accountService = accountService;
	}

	@GetMapping("/account/name")
	public List<String> getAccountNames() {
		return accountService.findAllNames();
	}
}
