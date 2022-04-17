package com.se.spring.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	//add a reference to our security data mode
	@Autowired
	private DataSource securityDataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		//use jdbc authentication -> get account from database
		auth.jdbcAuthentication().dataSource(securityDataSource);
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			//add resources
			.antMatchers("/resources/css/**").permitAll()
			.antMatchers("/resources/js/**").permitAll()
			//decentralization
			.antMatchers("/showForm*").hasAnyRole("MANAGER", "ADMIN")
			.antMatchers("/save*").hasAnyRole("MANAGER", "ADMIN")
			.antMatchers("/delete").hasRole("ADMIN")
			.antMatchers("/resources/**").permitAll()
			.antMatchers("/**").permitAll()
			//configure login
			.and().formLogin()
			.loginPage("/showLoginPage")
			.loginProcessingUrl("/authenticateTheUser").permitAll()
			.and().logout().permitAll()
			.and().exceptionHandling().accessDeniedPage("/access-dinied");
	}
	
	@Bean
	public UserDetailsManager userDetailsManager() {

		JdbcUserDetailsManager jdbcUserDetailsManager = new JdbcUserDetailsManager();

		jdbcUserDetailsManager.setDataSource(securityDataSource);

		return jdbcUserDetailsManager;
	}
}
