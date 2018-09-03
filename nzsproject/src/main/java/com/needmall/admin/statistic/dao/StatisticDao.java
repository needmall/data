package com.needmall.admin.statistic.dao;

import java.util.List;

import com.needmall.admin.statistic.vo.SalesDataVO;

public interface StatisticDao {
	public List<SalesDataVO> totalData();
}
