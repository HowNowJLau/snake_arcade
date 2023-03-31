package com.project.snakearcade.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.project.snakearcade.models.LoginUser;
import com.project.snakearcade.models.Reward;
import com.project.snakearcade.models.User;
import com.project.snakearcade.repositories.UserRepository;

@Service
public class UserService {

	private final UserRepository userRepo;
	public UserService(UserRepository userRepo) {
		this.userRepo = userRepo;
	}
	
	public User create(User user) {
		String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashed);
		return userRepo.save(user);
	}
	
	public List<User> getAll() {
		return userRepo.findAll();
	}
	
	public User getOne(Long id) {
		Optional<User> optionalUser = userRepo.findById(id);
		return optionalUser.isPresent() ? optionalUser.get() : null;
	}

	public User getOne(String userName) {
		Optional<User> optionalUser = userRepo.findByUserName(userName);
		return optionalUser.isPresent() ? optionalUser.get() : null;
	}
	
	public User update(User user) {
		return userRepo.save(user);
	}
	
	public User register(User newUser, BindingResult result) {
	    
    	// TO-DO - Reject values or register if no errors:

        // Reject if username is taken (present in database)
		
		if (userRepo.findByUserName(newUser.getUserName()).isPresent()) {
			result.rejectValue("email", "Unique", "A user has already been created with this email");
		}
        // Reject if password doesn't match confirmation
        if (!newUser.getPassword().equals(newUser.getPasswordConfirm())) {
        	result.rejectValue("password", "Match", "Passwords do not match");
        }
        // Return null if result has errors
        if (result.hasErrors()) {
        	return null;
        }
        // Hash and set password, save user to database
        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		System.out.println("registering user");
		return userRepo.save(newUser);
    }
	
	// This method will be called from the controller
    // whenever a user submits a login form.
    public User login(LoginUser newLoginObject, BindingResult result) {
        // TO-DO - Reject values:
    	if (result.hasErrors()) {
    		return null;
    	}
    	// Find user in the DB by username
    	Optional<User> potentialLogin = userRepo.findByUserName(newLoginObject.getUserName());
        // Reject if NOT present
    	if (!potentialLogin.isPresent()) {
        	result.rejectValue("email", "Bad Login", "Invalid credentials");
        }
        
        // Reject if BCrypt password match fails
    	else if (!BCrypt.checkpw(newLoginObject.getPassword(), potentialLogin.get().getPassword())) {
    		result.rejectValue("email", "Bad Login", "Invalid credentials");
    	}
    	
        // Return null if result has errors
    	if (result.hasErrors()) {
    		return null;
    	}
        return potentialLogin.get();
    }
    
}
