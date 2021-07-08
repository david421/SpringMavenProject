package com.springmvnv0.SpringMvnPro.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.springmvnv0.SpringMvnPro.dao.UserDAO;
import com.springmvnv0.SpringMvnPro.entity.User;

@RestController
@RequestMapping("/api")
public class UserRestController {
	
	private UserDAO userDAO;
	
	// quick and dirty: inject employee dao (use constructor injection)
	@Autowired
	public UserRestController(UserDAO theUserDAO) {
		userDAO = theUserDAO;
	}
	
	// expose "/users" and return list of users
	@GetMapping("/users")
	public List<User> findAll(){
		return userDAO.findAll();
	}
	
}
