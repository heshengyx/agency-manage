package com.house.agency.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.ui.Model;

import com.house.agency.entity.Region;
import com.house.agency.entity.User;
import com.house.agency.param.RegionQueryParam;
import com.house.agency.service.IRegionService;

public abstract class BaseController {
	
	protected User getCurrentUser() {
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute("currentUser");
		return user;
	}

	protected void setModel(Model model, IRegionService regionService) {
		RegionQueryParam param = new RegionQueryParam();
		param.setCode("SZ");
		List<Region> regions = regionService.list(param);
		model.addAttribute("regions", regions);
	}

	protected void setModel(Model model, IRegionService regionService,
			RegionQueryParam param) {
		List<Region> regions = regionService.list(param);
		model.addAttribute("regions", regions);
	}
}
