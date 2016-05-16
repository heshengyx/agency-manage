package com.house.agency.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage/logout")
public class LogoutController extends BaseController {

	@RequestMapping("")
	public String page() {
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			subject.logout(); //
		}
		return "redirect:/login.jsp";
	}
}
