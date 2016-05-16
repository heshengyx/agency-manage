package com.house.agency.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.data.ImageData;
import com.house.agency.entity.Image;
import com.house.agency.entity.User;
import com.house.agency.param.ImageQueryParam;
import com.house.agency.service.IImageService;
import com.myself.common.exception.ServiceException;
import com.myself.common.message.JsonMessage;

@Controller
@RequestMapping("/manage/image")
public class ImageController extends BaseController {
	
	@Autowired
	private IImageService imageService;

	private final static Logger logger = LoggerFactory
			.getLogger(ImageController.class);
	
	@RequestMapping("/queryData")
	@ResponseBody
	public Object queryData(ImageQueryParam param) {
		JsonMessage jMessage = new JsonMessage();
		List<ImageData> data = null;
		try {
			data = imageService.queryDataByFuid(param);
			jMessage.setStatus(JsonMessage.TRUE);
			jMessage.setData(data);
		} catch (Exception e) {
			jMessage.setStatus(JsonMessage.FALSE);
			if (e instanceof ServiceException) {
				jMessage.setMessage(e.getMessage());
			} else {
				jMessage.setMessage("系统异常");
			}
			logger.error(jMessage.getMessage(), e);
		}
		return jMessage;
	}
	
	@RequestMapping("/queryMyData")
	@ResponseBody
	public Object queryMyData(ImageQueryParam param) {
		JsonMessage jMessage = new JsonMessage();
		User user =  getCurrentUser();
		param.setUserId(user.getId());
		List<ImageData> data = null;
		try {
			data = imageService.queryDataByFuid(param);
			jMessage.setStatus(JsonMessage.TRUE);
			jMessage.setData(data);
		} catch (Exception e) {
			jMessage.setStatus(JsonMessage.FALSE);
			if (e instanceof ServiceException) {
				jMessage.setMessage(e.getMessage());
			} else {
				jMessage.setMessage("系统异常");
			}
			logger.error(jMessage.getMessage(), e);
		}
		return jMessage;
	}
	
	@RequestMapping("/queryHomeData")
	@ResponseBody
	public Object queryHomeData(ImageQueryParam param) {
		JsonMessage jMessage = new JsonMessage();
		List<ImageData> data = null;
		try {
			data = imageService.queryHomeDataByFuid(param);
			jMessage.setStatus(JsonMessage.TRUE);
			jMessage.setData(data);
		} catch (Exception e) {
			jMessage.setStatus(JsonMessage.FALSE);
			if (e instanceof ServiceException) {
				jMessage.setMessage(e.getMessage());
			} else {
				jMessage.setMessage("系统异常");
			}
			logger.error(jMessage.getMessage(), e);
		}
		return jMessage;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Object update(Image param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			imageService.update(param);
			jMessage.setStatus(JsonMessage.TRUE);
			jMessage.setMessage("保存成功");
		} catch (Exception e) {
			jMessage.setStatus(JsonMessage.FALSE);
			if (e instanceof ServiceException) {
				jMessage.setMessage(e.getMessage());
			} else {
				jMessage.setMessage("系统异常");
			}
			logger.error(jMessage.getMessage(), e);
		}
		return jMessage;
	}
}
