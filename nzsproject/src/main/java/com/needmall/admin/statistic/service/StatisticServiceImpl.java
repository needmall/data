package com.needmall.admin.statistic.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.admin.statistic.dao.StatisticDao;


@Service
public class StatisticServiceImpl implements StatisticService{

	
	@Autowired
	private StatisticDao statisticRegistDao;
	
	
			
}
