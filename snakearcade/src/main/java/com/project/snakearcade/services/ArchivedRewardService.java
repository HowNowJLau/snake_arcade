package com.project.snakearcade.services;

import java.util.List;

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
}
