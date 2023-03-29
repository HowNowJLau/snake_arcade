package com.project.snakearcade.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.snakearcade.services.ArchivedRewardService;
import com.project.snakearcade.services.RewardService;
import com.project.snakearcade.services.UserService;

@Controller
public class RewardController {
	private final UserService userServ;
	private final ArchivedRewardService archivedRewardServ;
	private final RewardService rewardServ;
	
	public RewardController(UserService userServ, ArchivedRewardService archivedRewardServ,
			RewardService rewardServ) {
		this.userServ = userServ;
		this.archivedRewardServ = archivedRewardServ;
		this.rewardServ = rewardServ;
	}
	
	@GetMapping("/arcade/rewards")
	public String rewards(HttpSession session, Model model) {
		model.addAttribute("loggedUser", userServ.getOne((Long)session.getAttribute("user_id")));
		model.addAttribute("allRewards", archivedRewardServ.getAll());
		model.addAttribute("doesUserHaveReward", Boolean.FALSE);
		return "/reward/rewards.jsp";
	}
	
	@PostMapping("/arcade/rewards/redeem/{id}")
	public String redeem(@PathVariable("id") Long rewardId, HttpSession session) {
		rewardServ.create((Long)session.getAttribute("user_id"), rewardId);
		return "redirect:/arcade/rewards";
	}
}
