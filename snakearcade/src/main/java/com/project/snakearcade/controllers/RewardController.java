package com.project.snakearcade.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.snakearcade.models.ArchivedReward;
import com.project.snakearcade.models.Reward;
import com.project.snakearcade.models.User;
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
	public String redeem(@PathVariable("id") Long archivedRewardId, HttpSession session,
			RedirectAttributes redirectAttributes) {
		User user = userServ.getOne((Long)session.getAttribute("user_id"));
		ArchivedReward archivedReward = archivedRewardServ.getOne(archivedRewardId);
		if (user.getTickets() >= archivedReward.getCost()) {
			user.setTickets(user.getTickets() - archivedReward.getCost());
			userServ.update(user);
			rewardServ.create((Long)session.getAttribute("user_id"), archivedRewardId, Boolean.FALSE);
			return "redirect:/arcade/rewards";
		}
		redirectAttributes.addFlashAttribute("error", "Not enough tickets.");
		return "redirect:/arcade/rewards";
	}
	
	@GetMapping("/arcade/rewards/collection") 
	public String collection(HttpSession session, Model model) {
		User user = userServ.getOne((Long)session.getAttribute("user_id"));
		model.addAttribute("userRewards", user.getRewards());
		return "/reward/collection.jsp";
	}
	
	@PutMapping("/arcade/rewards/collection/{id}")
	public String useAvatar(@PathVariable("id") Long id, HttpSession session) {
		Reward updateReward = rewardServ.getOne(id);
		disableAllRewards((Long)session.getAttribute("user_id"));
		updateReward.setIsEnabled(true);
		rewardServ.update(updateReward);
		return "redirect:/arcade/rewards/collection";
	}
	
	private void disableAllRewards(Long userId) {
		User user = userServ.getOne(userId);
		for (Reward reward : user.getRewards()) {
			reward.setIsEnabled(false);
		}
	}
	
	@GetMapping("/arcade/rewards/admin")
	public String admin(@ModelAttribute("archived_reward") ArchivedReward archived_reward) {
		return "/reward/admin.jsp";
	}
	
	@PostMapping("/arcade/rewards/admin/create")
	public String createReward(@Valid @ModelAttribute("archived_reward") ArchivedReward archived_reward,
			BindingResult result) {
		if (result.hasErrors()) {
			return "/reward/admin.jsp";
		}
		archivedRewardServ.create(archived_reward);
		return "redirect:/arcade/rewards/admin";
	}
	
}
