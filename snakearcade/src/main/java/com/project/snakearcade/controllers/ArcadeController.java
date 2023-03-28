package com.project.snakearcade.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/arcade")
public class ArcadeController {
	
	public ArcadeController() {
		// TODO Auto-generated constructor stub
	}

	@GetMapping("/snake")
	public String snake() {
		return "/game/snake.jsp";
	}
	
	@GetMapping("/tetris")
	public String tetris() {
		return "/game/tetris.jsp";
	}
	
	@GetMapping("/tictactoe")
	public String tictactoe() {
		return "/game/tictactoe.jsp";
	}
	
}
