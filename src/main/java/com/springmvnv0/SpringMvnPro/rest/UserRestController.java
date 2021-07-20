package com.springmvnv0.SpringMvnPro.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	// add mapping for GET /users/{userId}
	@GetMapping("/users/{userId}")
	public User getUser(@PathVariable int userId) {
		
		User theUser = userService.findById(userId);
		
		if(theUser == null) {
			throw new RuntimeException("User id not found - " + userId);
		}
		
		return theUser;
	}
	
	// add mapping for POST /users - add new user
	@PostMapping("/users")
	public User addUser(@RequestBody User theUser) {
		
		// also just in case they pass an id in JSON ... set id to 0
		// this is to force a save of new item ... instead of update
		
		theUser.setId(0);
		
		userService.save(theUser);
		
		return theUser;
	}
}
