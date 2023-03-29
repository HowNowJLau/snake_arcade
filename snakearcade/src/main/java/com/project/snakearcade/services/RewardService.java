package com.project.snakearcade.services;

import org.springframework.stereotype.Service;

import com.project.snakearcade.models.ArchivedReward;
import com.project.snakearcade.models.Reward;
import com.project.snakearcade.models.User;
import com.project.snakearcade.repositories.RewardRepository;

@Service
public class RewardService {

	private final UserService userServ;
	private final ArchivedRewardService archivedRewardServ;
	private final RewardRepository rewardRepo;
	
	public RewardService(RewardRepository rewardRepo, UserService userServ, 
			ArchivedRewardService archivedRewardServ) {
		this.rewardRepo = rewardRepo;
		this.userServ = userServ;
		this.archivedRewardServ = archivedRewardServ;
	}

	public Reward create(Long userId, Long archivedRewardId) {
		User thisUser = userServ.getOne(userId);
		ArchivedReward thisArchivedReward = archivedRewardServ.getOne(archivedRewardId);
		Reward rewardToSave = new Reward(thisUser, thisArchivedReward);
		return rewardRepo.save(rewardToSave);
	}
	
	
}
