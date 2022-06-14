package com.github.freetie.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.freetie.employee.entity.Account;
import com.github.freetie.employee.service.AccountService;
import com.github.freetie.employee.service.EmployeeService;

@Controller
public class SessionController {
	
	AccountService accountService;
	EmployeeService employeeService;
	
	public SessionController(AccountService accountService, EmployeeService employeeService) {
		this.accountService = accountService;
		this.employeeService = employeeService;
	}

	@RequestMapping("/signin")
	public String signin(Account account, Model model, HttpSession session) {
		if (account == null || account.getName() == null) {
			return "signin";
		}
		Account foundAccount = accountService.findByName(account.getName());
		if (foundAccount == null) {
			model.addAttribute("name", account.getName());
			model.addAttribute("nameMessage", "ユーザー名は存在しません");
			return "signin";
		}
		if (!foundAccount.getPassword().equals(account.getPassword())) {
			model.addAttribute("name", account.getName());
			model.addAttribute("passwordMessage", "間違ったパスワード");
			return "signin";
		}
		session.setAttribute("user", employeeService.findByAccountId(foundAccount.getId()));
		return "redirect:list";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:signin";
	}
}
