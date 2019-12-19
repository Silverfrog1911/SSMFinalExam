package com.ssm.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.dao.UserMapper;
import com.ssm.pojo.onetable;

@Controller
public class mainController {
	//private static final Log logger=LogFactory.getLog(mainController.class);
	
	@Autowired
	private UserMapper usermapper;
	
	@RequestMapping("/Final")
	public String Show() {
		
		return "Final";
	}
	
	@RequestMapping(value="/Select0")
	@ResponseBody
	public List<onetable> SelectTwoTables(@RequestBody String CurPageStatus) {
		
		System.out.println(CurPageStatus);
		String str=CurPageStatus.replace("&", "=");
		System.out.println(str);
		String[] spl=str.split("=");
		
		List<onetable> p = usermapper.SelectOne(spl[1], spl[3]);
		return p;
	}
	
	@RequestMapping(value="/Select1")
	@ResponseBody
	public List<onetable> SelectAllThings() {
		
		List<onetable> p = usermapper.SelectAll();
		
		return p;
	}
	
	@RequestMapping("/InsertList0")
	@ResponseBody
	public String InsertList(@RequestBody Map<String,onetable> insert) {
		
		onetable test1 = insert.get("test1");
		onetable test2 = insert.get("test2");
		System.out.println(test1.getId());
		System.out.println(test2.getId());
		
		List<onetable> listforone=new ArrayList<onetable>();
		listforone.add(test1);
		listforone.add(test2);
		System.out.println(listforone);
		for(onetable a :listforone) {
			System.out.println(a.getName());
		}
		
		
		usermapper.InsetList(listforone);
		//session.comit();
		return "Success";
	}
	
}
