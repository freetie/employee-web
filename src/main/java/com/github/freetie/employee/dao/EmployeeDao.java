package com.github.freetie.employee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.jdbc.SQL;

import com.github.freetie.employee.entity.Employee;
import com.github.freetie.employee.entity.EmployeeQueryParameters;

@Mapper
public interface EmployeeDao {
	public class SqlProvider {
		public String selectAll(EmployeeQueryParameters queryParameters) {
			System.out.println(new SQL() {
				{
					SELECT("*");
					FROM("employee");
					LIMIT(5);
					OFFSET((queryParameters.getPage() - 1) * 5);
					if (queryParameters.getJobNumber() != null && queryParameters.getJobNumber() != "") {
						WHERE("job_number LIKE '%#{jobNumber}%'");
					}
					if (queryParameters.getName() != null && queryParameters.getName() != "") {
						WHERE("name LIKE '%#{name}%'");
					}
					if (queryParameters.getAge() != null && queryParameters.getAge() != 0) {
						WHERE("age = #{age}");
					}
					if (queryParameters.getGender() != null) {
						WHERE("gender = #{gender}");
					}
					if (queryParameters.getMaritalStatus() != null) {
						WHERE("marital_status = #{maritalStatus}");
					}
				}
			}.toString());
			return new SQL() {
				{
					SELECT("*");
					FROM("employee");
					LIMIT(5);
					OFFSET((queryParameters.getPage() - 1) * 5);
					if (queryParameters.getJobNumber() != null && queryParameters.getJobNumber() != "") {
						WHERE("job_number LIKE CONCAT('%', #{jobNumber}, '%')");
					}
					if (queryParameters.getName() != null && queryParameters.getName() != "") {
						WHERE("name LIKE CONCAT('%', #{name}, '%')");
					}
					if (queryParameters.getAge() != null && queryParameters.getAge() != 0) {
						WHERE("age = #{age}");
					}
					if (queryParameters.getGender() != null) {
						WHERE("gender = #{gender}");
					}
					if (queryParameters.getMaritalStatus() != null) {
						WHERE("marital_status = #{maritalStatus}");
					}
				}
			}.toString();
		}
	}

	@Insert("INSERT INTO employee (job_number, name, gender, age, marital_status, hire_year, hire_month, hire_day, email, phone, birth_date, account_id) VALUES (#{jobNumber}, #{name}, #{gender}, #{age}, #{maritalStatus}, #{hireYear}, #{hireMonth}, #{hireDay}, #{email}, #{phone}, #{birthDate}, #{accountId})")
	public void save(Employee employee);

	@Delete("DELETE FROM employee WHERE id = #{id}")
	public void delete(Integer id);

	public void update(Employee employee);

	@Select("SELECT * FROM employee e WHERE id = #{id} LEFT JOIN account a ON e.account_id = a.id")
	public Employee find(Integer id);

	@Select("SELECT job_number FROM employee")
	public List<String> findAllJobNumbers();

	@SelectProvider(type = SqlProvider.class, method = "selectAll")
	public List<Employee> findAll(EmployeeQueryParameters queryParameters);

	@Select("SELECT COUNT(*) FROM employee")
	public Integer count(EmployeeQueryParameters queryParameters);
}