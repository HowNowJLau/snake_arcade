package com.project.snakearcade.controllers;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.snakearcade.models.User;
import com.project.snakearcade.services.UserService;

@RestController
public class ApiController {

	private final UserService userServ;
	
	public ApiController(UserService userServ) {
		this.userServ = userServ;
	}
	
	@GetMapping("/api/users/{id}")
	public User getOne(@PathVariable("id") Long id) {
		//User userToGet = userServ.getOne(id);
		//userToGet.setPasswordConfirm("anything");
		return userServ.getOne(id);
	}
	
	@PutMapping("/api/users/{id}")
	@ResponseBody
	public User update(@PathVariable("id") Long id, 
			@RequestBody User user) {
		return userServ.update(user);
	}
	
}
