package com.project.snakearcade.services;

import java.util.Optional;

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

	public Reward getOne(Long id) {
		Optional<Reward> optionalReward = rewardRepo.findById(id);
		return optionalReward.isPresent() ? optionalReward.get() : null;
	}
	
	public Reward create(Long userId, Long archivedRewardId, Boolean isEnabled) {
		User thisUser = userServ.getOne(userId);
		ArchivedReward thisArchivedReward = archivedRewardServ.getOne(archivedRewardId);
		Reward rewardToSave = new Reward(thisUser, thisArchivedReward, isEnabled);
		return rewardRepo.save(rewardToSave);
	}
	
	public Reward update(Reward reward) {
		return rewardRepo.save(reward);
	}
}
