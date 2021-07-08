package com.springmvnv0.SpringMvnPro.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.springmvnv0.SpringMvnPro.entity.User;
import com.springmvnv0.SpringMvnPro.service.UserService;

@RestController
@RequestMapping("/api")
public class UserRestController {
	
	private UserService userService;
	
	// quick and dirty: inject employee dao (use constructor injection)
	@Autowired
	public UserRestController(UserService theUserService) {
		userService = theUserService;
	}
	
	// expose "/users" and return list of users
	@GetMapping("/users")
	public List<User> findAll(){
		return userService.findAll();
	}
	
}
