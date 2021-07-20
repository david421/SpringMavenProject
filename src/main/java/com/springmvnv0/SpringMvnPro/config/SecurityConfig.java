package com.springmvnv0.SpringMvnPro.config;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		// add our users for in memory authentication
		UserBuilder users = User.withDefaultPasswordEncoder();
		
		auth.inMemoryAuthentication()
			.withUser(users.username("john").password("test123").roles("EMPLOYEE"))
		    .withUser(users.username("mary").password("test123").roles("EMPLOYEE", "MANAGER"))	
			.withUser(users.username("susan").password("test123").roles("EMPLOYEE", "ADMIN"));
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		http.authorizeRequests()
		    .antMatchers("/").hasRole("EMPLOYEE")	
			.antMatchers("/leaders/**").hasRole("MANAGER")
			.antMatchers("/systems/**").hasRole("ADMIN")
			.and()
			.formLogin()
				.loginPage("/showMyLoginPage")
				.loginProcessingUrl("/authenticateTheUser")
				.permitAll()
			.and()
			.logout().permitAll()
			.and() //access deny page for the role don't have right to access
			.exceptionHandling().accessDeniedPage("/access-denied").and().csrf().disable();
	}

//	RequestMatcher csrfRequestMatcher = new RequestMatcher() {
//        // Enabled CSFR protection on the following urls:
//        //@formatter:off
//        private AntPathRequestMatcher[] requestMatchers = 
//            {
//                new AntPathRequestMatcher("/**/verify"),
//                        new AntPathRequestMatcher("/**/login*")
//            };
//        //@formatter:off
//
//        @Override
//        public boolean matches(final HttpServletRequest request) {
//            // If the request match one url the CSFR protection will be enabled
//            for (final AntPathRequestMatcher rm : requestMatchers) {
//                if (rm.matches(request)) {
//                    System.out.println();
//                    /* return true; */
//                }
//            }
//            return false;
//        } // method matches
//    };
}
