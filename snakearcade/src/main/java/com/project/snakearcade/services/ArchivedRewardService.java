package com.project.snakearcade.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.project.snakearcade.models.ArchivedReward;
import com.project.snakearcade.repositories.ArchivedRewardRepository;

@Service
public class ArchivedRewardService {
	private final ArchivedRewardRepository archivedRewardRepo;
	public ArchivedRewardService(ArchivedRewardRepository archivedRewardRepo) {
		this.archivedRewardRepo = archivedRewardRepo;
	}
	
	public List<ArchivedReward> getAll() {
		return archivedRewardRepo.findAll();
	}
	
	public ArchivedReward getOne(Long id) {
		Optional<ArchivedReward> optionalArchivedReward = archivedRewardRepo.findById(id);
		return optionalArchivedReward.isPresent() ? optionalArchivedReward.get() : null;
	}
	
	public ArchivedReward create(ArchivedReward reward) {
		return archivedRewardRepo.save(reward);
	}
}
