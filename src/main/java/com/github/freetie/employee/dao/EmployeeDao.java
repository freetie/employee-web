package com.github.freetie.employee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.jdbc.SQL;

import com.github.freetie.employee.entity.Employee;
import com.github.freetie.employee.entity.EmployeeQueryParameters;

@Mapper
public interface EmployeeDao {
	public class SqlProvider {
		public SQL selectAllWhereSql(String startSelect, EmployeeQueryParameters queryParameters) {
			return new SQL() {
				{
					SELECT(startSelect);
					FROM("employee");
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
					if (queryParameters.getHireYear() != null) {
						WHERE("hire_year = #{hireYear}");
					}
					if (queryParameters.getHireMonth() != null) {
						WHERE("hire_month = #{hireMonth}");
					}
					if (queryParameters.getHireDay() != null) {
						WHERE("hire_day = #{hireDay}");
					}
					if (queryParameters.getBirthYear() != null) {
						WHERE("DATE_FORMAT(birth_date, '%Y') = #{birthYear}");
					}
					if (queryParameters.getBirthMonth() != null) {
						WHERE("DATE_FORMAT(birth_date, '%c') = #{birthMonth}");
					}
					if (queryParameters.getBirthDay() != null) {
						WHERE("DATE_FORMAT(birth_date, '%e') = #{birthDay}");
					}
				}
			};
		}

		public String selectAll(EmployeeQueryParameters queryParameters) {
			return selectAllWhereSql("*", queryParameters).LIMIT(5).OFFSET((queryParameters.getPage() - 1) * 5)
					.toString();
//			return new SQL() {
//				{
//					SELECT("*");
//					FROM("employee");
//					LIMIT(5);
//					OFFSET((queryParameters.getPage() - 1) * 5);
//					if (queryParameters.getJobNumber() != null && queryParameters.getJobNumber() != "") {
//						WHERE("job_number LIKE CONCAT('%', #{jobNumber}, '%')");
//					}
//					if (queryParameters.getName() != null && queryParameters.getName() != "") {
//						WHERE("name LIKE CONCAT('%', #{name}, '%')");
//					}
//					if (queryParameters.getAge() != null && queryParameters.getAge() != 0) {
//						WHERE("age = #{age}");
//					}
//					if (queryParameters.getGender() != null) {
//						WHERE("gender = #{gender}");
//					}
//					if (queryParameters.getMaritalStatus() != null) {
//						WHERE("marital_status = #{maritalStatus}");
//					}
//				}
//			}.toString();
		}

		public String count(EmployeeQueryParameters queryParameters) {
			return selectAllWhereSql("COUNT(*)", queryParameters).toString();
		}
	}

	@Insert("INSERT INTO employee (job_number, name, gender, age, marital_status, hire_year, hire_month, hire_day, email, phone, birth_date, account_id) VALUES (#{jobNumber}, #{name}, #{gender}, #{age}, #{maritalStatus}, #{hireYear}, #{hireMonth}, #{hireDay}, #{email}, #{phone}, #{birthDate}, #{accountId})")
	public void save(Employee employee);

	@Delete("DELETE FROM employee WHERE id = #{id}")
	public void delete(Integer id);

	@Update("UPDATE employee SET name = #{name}, gender = #{gender}, age = #{age}, marital_status = #{maritalStatus}, hire_year = #{hireYear}, hire_month = #{hireMonth}, hire_day = #{hireDay}, email = #{email}, phone = #{phone}, birth_date = #{birthDate} WHERE id = #{id}")
	public void update(Employee employee);

	@Select("SELECT e.*, a.name account_name, a.password account_password FROM employee e LEFT JOIN account a ON e.account_id = a.id WHERE e.id = #{id}")
	public Employee find(Integer id);
	
	@Select("SELECT * FROM employee WHERE account_id = #{accountId}")
	public Employee findByAccountId(Integer accountId);

	@Select("SELECT job_number FROM employee")
	public List<String> findAllJobNumbers();

	@SelectProvider(type = SqlProvider.class, method = "selectAll")
	public List<Employee> findAll(EmployeeQueryParameters queryParameters);

	@SelectProvider(type = SqlProvider.class, method = "count")
	public Integer count(EmployeeQueryParameters queryParameters);
}