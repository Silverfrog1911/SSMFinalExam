package com.ssm.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ssm.dao.UserMapper;
import com.ssm.pojo.onetable;

public class ServiceKitImpl implements ServiceKit {

	@Autowired
	private UserMapper usermapper;

	@Override
	public List<onetable> SelectAll() {
		// TODO Auto-generated method stub
		return usermapper.SelectAll();
	}

	@Override
	public List<onetable> SelectOne(String name, String address) {
		// TODO Auto-generated method stub
		return usermapper.SelectOne(name,address);
	}

	@Override
	public void InsetList(List<onetable> listforone) {
		// TODO Auto-generated method stub
		
	}

	
	
}
