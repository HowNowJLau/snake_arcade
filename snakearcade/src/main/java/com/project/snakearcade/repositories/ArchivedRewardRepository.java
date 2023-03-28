package com.project.snakearcade.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.project.snakearcade.models.ArchivedReward;

@Repository
public interface ArchivedRewardRepository extends CrudRepository<ArchivedReward, Long>{
	List<ArchivedReward> findAll();
}
