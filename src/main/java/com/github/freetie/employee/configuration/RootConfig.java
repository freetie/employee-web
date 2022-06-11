package com.github.freetie.employee.configuration;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionManager;

import com.alibaba.druid.pool.DruidDataSource;

@Configuration
@ComponentScan(basePackages = "com.github.freetie.employee", excludeFilters = {
		@ComponentScan.Filter(org.springframework.stereotype.Controller.class) })
@MapperScan(basePackages = "com.github.freetie.employee.dao")
@PropertySource("classpath:application.properties")
public class RootConfig {
	@Value("${jdbc.driver-class-name}")
	private String driverClassName;
	@Value("${jdbc.url}")
	private String url;
	@Value("${jdbc.username}")
	private String username;
	@Value("${jdbc.password}")
	private String password;

	@Bean
	public DataSource dataSource() {
		DruidDataSource dataSource = new DruidDataSource();
		dataSource.setDriverClassName(driverClassName);
		dataSource.setUrl(url);
		dataSource.setUsername(username);
		dataSource.setPassword(password);
		return dataSource;
	}

	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(dataSource());
		factoryBean.setTypeAliasesPackage("com.github.freetie.employee.entity");
		factoryBean.getObject().getConfiguration().setMapUnderscoreToCamelCase(true);
//		factoryBean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:com/github/freetie/employee/dao/*.xml"));
		return factoryBean.getObject();
	}

	@Bean
	public TransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}
}
