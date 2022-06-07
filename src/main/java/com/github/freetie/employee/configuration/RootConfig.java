package com.github.freetie.employee.configuration;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@ComponentScan(basePackages = "com.github.freetie.employee", excludeFilters = {
		@ComponentScan.Filter(org.springframework.stereotype.Controller.class) })
@PropertySource("application.properties")
public class RootConfig {

}
