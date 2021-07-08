package com.springmvnv0.SpringMvnPro.service;

import java.util.List;

import com.springmvnv0.SpringMvnPro.entity.User;

public interface UserService {
	
	public List<User> findAll();
	
	public User findById(int theId);
	
	public void save(User theUser);
	
	public void deleteById(int theId);
	
}
