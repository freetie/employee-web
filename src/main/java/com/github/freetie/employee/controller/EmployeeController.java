package com.github.freetie.employee.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String getCreatePage() {
		return "employee-detail";
	}
	
	@GetMapping("/job-number")
	public List<String> getJobNumbers() {
		return employeeService.findAllJobNumbers();
	}
}
