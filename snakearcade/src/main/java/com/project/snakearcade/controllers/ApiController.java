package com.project.snakearcade.controllers;

import org.apache.commons.io.IOUtils;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;


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
	
	@GetMapping("/api/trophy/{id}")
	public ResponseEntity<byte[]> getTrophy(@PathVariable("id") String id) throws IOException {
	    String url = "https://api.dicebear.com/6.x/bottts/svg";
	    URL obj = new URL(url);
	    HttpURLConnection conn = (HttpURLConnection) obj.openConnection();
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Content-Type", "image/svg+xml");
	    InputStream in = conn.getInputStream();
	    byte[] imageBytes = IOUtils.toByteArray(in);
	    in.close();
	    return ResponseEntity.ok().contentType(MediaType.ALL).body(imageBytes);
	}

}
