package com.xinyue.crud.test;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.junit.Test;
import org.apache.ibatis.session.SqlSession;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xinyue.crud.bean.User;
import com.xinyue.crud.bean.UserWithBLOBs;
import com.xinyue.crud.dao.UserMapper;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	UserMapper userMapper;
 	@Test
	public void testCRUD() {
//		//1创建SpringIOC容器
//		ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
//		//2从容器中获取
//		ioc.getBean(DepartmentMapper.class);
		System.out.println(userMapper);

		UserWithBLOBs user = userMapper.selectByPrimaryKey(4);
		System.out.println(user.getUserId());
	}
}
