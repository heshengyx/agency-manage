package com.house.agency.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.entity.User;
import com.myself.common.message.JsonMessage;

@Controller
@RequestMapping("/manage")
public class LoginController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(LoginController.class);

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Object login(User user) {
		JsonMessage jMessage = new JsonMessage();
		String username = user.getUsername();
		UsernamePasswordToken token = new UsernamePasswordToken(
				username, user.getPassword());
		Subject subject = SecurityUtils.getSubject();
		try {
			// token.setRememberMe(true);
			subject.login(token);
			jMessage.setStatus(JsonMessage.TRUE);
			logger.info("[{}]登录成功", new Object[]{username});
		} catch (Exception e) {
			logger.error("[{}]登录失败", new Object[]{username}, e);
			jMessage.setStatus(JsonMessage.FALSE);
			jMessage.setMessage("登录失败");
		}
		return jMessage;
	}
}
