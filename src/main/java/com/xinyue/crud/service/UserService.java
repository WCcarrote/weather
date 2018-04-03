package com.xinyue.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.crud.bean.User;
import com.xinyue.crud.bean.UserExample;
import com.xinyue.crud.bean.UserExample.Criteria;
import com.xinyue.crud.bean.UserWithBLOBs;
import com.xinyue.crud.dao.UserMapper;


@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;

	public boolean checkUserName(String username) {
		// TODO Auto-generated method stub
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		long count = userMapper.countByExample(userExample);
		System.out.println("count:"+count);
		return count==0;
	}

	public User getUser(String username, String password) {
		// TODO Auto-generated method stub
		List<User> user=null;
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		user = userMapper.selectByExample(userExample);
		System.out.println("List<User> user:"+user);
		String ps = user.get(0).getPassword();
		System.out.println("user.get(0).getPassword:"+ps+"--password:"+password);
		if(ps.equals(password)){
			System.out.println("user.get(0):"+user.get(0));
			return user.get(0);
		}else {
			return null;
		}
	}

	public User getUserById(Integer id) {
		// TODO Auto-generated method stub
		User user = userMapper.selectByPrimaryKey(id);
		return user;
	}

	public void addUser(UserWithBLOBs user) {
		// TODO Auto-generated method stub
		userMapper.insertSelective(user);
	}
	

	
}
