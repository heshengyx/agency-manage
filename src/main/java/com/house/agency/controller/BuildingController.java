package com.house.agency.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.data.manage.BuildingManageData;
import com.house.agency.entity.Building;
import com.house.agency.page.IPage;
import com.house.agency.param.BuildingQueryParam;
import com.house.agency.param.manage.BuildingManageQueryParam;
import com.house.agency.service.IBuildingService;
import com.house.agency.service.IConfigureService;
import com.house.agency.service.IRegionService;
import com.myself.common.exception.ServiceException;
import com.myself.common.message.JsonMessage;
import com.myself.common.message.JsonResult;

@Controller
@RequestMapping("/manage/building")
public class BuildingController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(BuildingController.class);
	
	@Autowired
	private IBuildingService buildingService;
	
	@Autowired
	private IRegionService regionService;
	
	@Autowired
	private IConfigureService configureService;
	
	@RequestMapping("")
	public String pageBuilding(Model model) {
		setModel(model, regionService);
		
		String imageUrl = configureService.getValueByKey("image_url");
		model.addAttribute("imageUrl", imageUrl);
		return "building";
	}
	
	@RequestMapping("/queryManageData")
	@ResponseBody
	public Object queryManageData(BuildingManageQueryParam param) {
		IPage<BuildingManageData> datas = buildingService.queryManageData(param, param.getPage(),
				param.getLength());
		JsonResult<BuildingManageData> jResult = new JsonResult<BuildingManageData>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<BuildingManageData>) datas.getData());
		return jResult;
	}
	
	@RequestMapping("/search")
	@ResponseBody
	public Object search(BuildingQueryParam param) {
		param.setStatus("1");
		return buildingService.list(param);
	}
	
	@RequestMapping("/getData")
	@ResponseBody
	public Object getData(String id) {
		JsonMessage jMessage = new JsonMessage();
		Building data = null;
		try {
			data = buildingService.getDataById(id);
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
	
	@RequestMapping("/save")
	@ResponseBody
	public Object save(Building param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			buildingService.save(param);
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
