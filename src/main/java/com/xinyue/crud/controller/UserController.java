package com.xinyue.crud.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.security.jgss.LoginConfigImpl;

import com.xinyue.crud.bean.Msg;
import com.xinyue.crud.bean.User;
import com.xinyue.crud.bean.UserWithBLOBs;
import com.xinyue.crud.bean.login;
import com.xinyue.crud.bean.register;
import com.xinyue.crud.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/logn")
	@ResponseBody
	public Msg login(HttpServletRequest req, HttpServletResponse resp,
				@Valid login login) throws IOException{
		String username=login.getUsername();
		String password=login.getPassword();
		System.out.println("loginStart:");
		User user = null;
		boolean b = userService.checkUserName(username);
		if(!b){
			user = userService.getUser(username,password);
			if(user!=null){
				System.out.println(user+"密码正确");
			}else{
				System.out.println("密码错误");
				return Msg.fail().add("errorp", "密码错误");
			}
		}else {
			System.out.println("用户名不存在");
			return Msg.fail().add("erroru", "用户名不存在");
		}
		System.out.println("loginEnd:");
		return Msg.success().add("url","index.jsp?userid="+user.userId).add("success", "登录成功");
	}
	
	@RequestMapping("/register")
	@ResponseBody
	public Msg register(HttpServletRequest req, HttpServletResponse resp,
			@Valid UserWithBLOBs user) throws IOException{
		System.out.println("registerStart:");
		String regxusername = "(^[a-zA-Z0-9_-]{4,20}$)|(^[\u2E80-\u9FFF]{2,6})";
		String regxpassword = "(^[a-zA-Z0-9_-]{6,12}$)|(^[\u2E80-\u9FFF]{2,6})";
		String regxcontact = "(^[0-9-]{11}$)|(^[0-9-]{8}$)";
		String username = user.getUsername();
		String password = user.getPassword();
		String contact = user.getContact();
		if(username.matches(regxusername)){
			System.out.println("用户名正确");
			if(password.matches(regxpassword)){
				System.out.println("密码正确");
				if(contact.matches(regxcontact)){
					System.out.println("联系方式正确");
				}else {
					return Msg.fail().add("con", "手机格式不正确");
				}
			}else {
				return Msg.fail().add("psd", "密码格式不正确");
			}
		}else {
			return Msg.fail().add("usn", "用户名格式不正确");
		}
		if(userService.checkUserName(username)){
			System.out.println("registerEnd:");
			userService.addUser(user);
			return Msg.success().add("url", "index.jsp");
		}else {
			System.out.println("registerEnd:");
			return Msg.fail().add("usn", "用户名已存在");
		}
	}
	
	@ResponseBody
	@RequestMapping("/checklogin")
	public Msg checklogin(String username,String password){
		System.out.println("checkloginStart:"+username+password);
		String regxUsername,regxpassword;
		regxUsername = "^[a-zA-Z0-9_-]{4,20}$";
		regxpassword = "^[a-zA-Z0-9_-]{6,12}$";
		System.out.println("up");
		if(username.matches(regxUsername)){
			System.out.println("用户名格式正确");
			if(!password.matches(regxpassword)){
				System.out.println("密码格式错误");
				return Msg.fail().add("usn", "密码格式不正确，6-12个字符!");
			}
			System.out.println("密码格式正确");
			return Msg.success();
		}
		System.out.println("checkloginEnd:");
		return Msg.fail().add("psd", "用户名格式不正确，4-20个字符!");
	}
	
	@ResponseBody
	@RequestMapping(value = "/getuser/{id}",method = RequestMethod.GET)
	public Msg getuser(@PathVariable("id")Integer id){
		System.out.println("getuserStart:");
		User user = userService.getUserById(id);
		System.out.println("getuserEnd:");
		return Msg.success().add("user", user);
	}
}
