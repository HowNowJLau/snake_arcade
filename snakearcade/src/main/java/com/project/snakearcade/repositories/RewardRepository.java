package com.project.snakearcade.repositories;



import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.project.snakearcade.models.Reward;

@Repository
public interface RewardRepository extends CrudRepository<Reward, Long>{
	 
}
