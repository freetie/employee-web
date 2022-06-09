package com.github.freetie.employee.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.freetie.employee.service.EmployeeService;

@Controller
public class EmployeeController {

	EmployeeService employeeService;

	public EmployeeController(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	@RequestMapping("/")
	public String getIndexPage() {
		return "redirect:list";
	}

	@RequestMapping("/list")
	public String getListPage() {
		return "employee-list";
	}

	@RequestMapping("/new")
	public String getCreatePage(Model model) {
		return "employee-detail";
	}

	@GetMapping("/job-number")
	@ResponseBody
	public List<String> getJobNumbers() {
		return employeeService.findAllJobNumbers();
	}
}
