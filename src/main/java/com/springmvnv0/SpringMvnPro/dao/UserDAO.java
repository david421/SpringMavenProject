package com.springmvnv0.SpringMvnPro.dao;

import java.util.List;

import com.springmvnv0.SpringMvnPro.entity.User;

public interface UserDAO {

	public List<User> findAll();
	
	public User findById(int theId);
	
	public void save(User theUser);
	
	public void deleteById(int theId);
}
