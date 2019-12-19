package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.onetable;

public interface UserMapper {
	
	public List<onetable> SelectAll();
	
	public List<onetable> SelectOne(@Param("name")String name,@Param("address")String address);

	public void InsetList(List<onetable> listforone);
	
}
