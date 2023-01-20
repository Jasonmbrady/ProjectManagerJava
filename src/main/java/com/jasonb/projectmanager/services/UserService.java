package com.jasonb.projectmanager.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.jasonb.projectmanager.models.LoginUser;
import com.jasonb.projectmanager.models.User;
import com.jasonb.projectmanager.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepo;
	
	public User getByEmail(String email) {
		Optional<User> optUser = userRepo.findByEmail(email);
		if (optUser.isEmpty()) {
			return null;
		} else {
			return optUser.get();
		}
	}
	
	public User register(User u, BindingResult result) {
		if (!u.getPassword().equals(u.getConfirmPass())) {
			result.rejectValue("password", "Match", "Passwords must match!");
		}
		if (this.getByEmail(u.getEmail()) != null) {
			result.rejectValue("email", "Duplicate", "That email is already in use!");
		}
		if (result.hasErrors()) {
			return null;
		}
		u.setPassword(BCrypt.hashpw(u.getPassword(), BCrypt.gensalt()));
		return userRepo.save(u);
	}
	
	public User login(LoginUser l, BindingResult result) {
		User logUser = this.getByEmail(l.getEmail());
		if (logUser == null || !BCrypt.checkpw(l.getPassword(), logUser.getPassword())) {
			result.rejectValue("email", "Invalid", "Invalid credentials");
			return null;
		}
		return logUser;

	}
	
	public User getById(Long id) {
		Optional<User> optUser = userRepo.findById(id);
		if (optUser.isEmpty()) {
			return null;
		} else {
			return optUser.get();
		}
	}
}
