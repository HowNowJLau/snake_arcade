package com.project.snakearcade.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.snakearcade.models.Reward;
import com.project.snakearcade.repositories.RewardRepository;

@Service
public class RewardService {

	private final RewardRepository rewardRepo;
	
	public RewardService(RewardRepository rewardRepo) {
		this.rewardRepo = rewardRepo;
	}

	public List<Reward> getAll() {
		return rewardRepo.findAll();
	}
}
