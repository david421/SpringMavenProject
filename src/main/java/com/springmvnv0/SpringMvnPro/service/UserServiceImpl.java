package com.springmvnv0.SpringMvnPro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springmvnv0.SpringMvnPro.dao.UserDAO;
import com.springmvnv0.SpringMvnPro.entity.User;

@Service
public class UserServiceImpl implements UserService {

	private UserDAO userDAO;
	
	@Autowired
	public UserServiceImpl(UserDAO theUserDAO) {
		userDAO = theUserDAO;
	}
	
	@Override
	@Transactional
	public List<User> findAll() {
		return userDAO.findAll();
	}

	@Override
	@Transactional
	public User findById(int theId) {
		return userDAO.findById(theId);
	}

	@Override
	@Transactional
	public void save(User theUser) {
		userDAO.save(theUser);

	}

	@Override
	@Transactional
	public void deleteById(int theId) {
		userDAO.deleteById(theId);
	}

}
