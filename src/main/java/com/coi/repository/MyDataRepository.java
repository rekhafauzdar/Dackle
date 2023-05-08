package com.coi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.coi.entity.DackleOrders;

public interface MyDataRepository extends JpaRepository<DackleOrders, Long> {
	List<DackleOrders> findAllByPartyName(String name);
	
}
