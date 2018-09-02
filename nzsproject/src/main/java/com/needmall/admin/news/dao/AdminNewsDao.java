package com.needmall.admin.news.dao;

import java.util.List;

import com.needmall.common.vo.NewsVO;



public interface AdminNewsDao {
	public List<NewsVO> adminNewsList();
	public NewsVO adminNewsDetail(NewsVO  nvo);
	public int adminNewsDelete(NewsVO  nvo);
	public int adminNewsUpdate(NewsVO nvo);
	public int adminNewsInsert(NewsVO nvo);
}
