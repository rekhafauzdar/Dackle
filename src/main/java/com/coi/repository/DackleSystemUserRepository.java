package com.coi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.coi.entity.DackleSystemUser;

public interface DackleSystemUserRepository extends JpaRepository<DackleSystemUser, Long> {
	List<DackleSystemUser> findAllByUserName(String name);
	
}
