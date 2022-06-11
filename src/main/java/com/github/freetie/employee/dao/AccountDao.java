package com.github.freetie.employee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.github.freetie.employee.entity.Account;

@Mapper
public interface AccountDao {
	@Insert("INSERT INTO account (name, password) VALUES (#{name}, #{password})")
	public void save(Account account);
	
	@Delete("DELETE FROM account WHERE id=#{id}")
	public void delete(Integer id);
	
	public void update(Account account);
	
	@Select("SELECT * FROM account WHERE name = #{name}")
	public Account findByName(String name);
	
	@Select("SELECT name FROM account")
	public List<String> findAllNames();
}
