package com.github.freetie.employee.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.freetie.employee.entity.Employee;
import com.github.freetie.employee.service.EmployeeService;

@Controller
public class EmployeeController {

	EmployeeService employeeService;

	public EmployeeController(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	@RequestMapping("/")
	public String indexPage() {
		return "redirect:list";
	}

	@RequestMapping("/list")
	public String listPage() {
		return "employee-list";
	}

	@RequestMapping("/new")
	public String createPage(Model model) {
		return "employee-detail";
	}
	
	@RequestMapping("/{id}")
	public String detailPage(Model model) {
		return "employee-detail";
	}

	@GetMapping("/job-number")
	@ResponseBody
	public List<String> getJobNumbers() {
		return employeeService.findAllJobNumbers();
	}
	
	@PostMapping("/create")
	public String create(Employee employee) {
		System.out.println(employee);
		employeeService.save(employee);
		return "redirect:list";
	}
	
	@GetMapping("/detail")
	@ResponseBody
	public Employee detail(@RequestParam("id") Integer id) {
		return employeeService.find(id);
	}
	
	
}
