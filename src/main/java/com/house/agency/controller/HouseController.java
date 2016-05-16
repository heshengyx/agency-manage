package com.house.agency.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.data.home.HouseHomeData;
import com.house.agency.data.home.HouseHomeDescData;
import com.house.agency.data.manage.HouseManageData;
import com.house.agency.entity.House;
import com.house.agency.page.IPage;
import com.house.agency.param.home.HouseHomeQueryParam;
import com.house.agency.param.manage.HouseManageQueryParam;
import com.house.agency.service.IConfigureService;
import com.house.agency.service.IHouseService;
import com.house.agency.service.IRegionService;
import com.myself.common.exception.ServiceException;
import com.myself.common.message.JsonMessage;
import com.myself.common.message.JsonResult;
import com.myself.common.utils.MapUtil;

@Controller
@RequestMapping("/manage/house")
public class HouseController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(HouseController.class);
	
	@Autowired
	private IHouseService houseService;
	
	@Autowired
	private IRegionService regionService;
	
	@Autowired
	private IConfigureService configureService;
	
	@RequestMapping("/used/sale")
	public String pageUsedSale(Model model) {
		setModel(model, regionService);
		
		String imageUrl = configureService.getValueByKey("image_url");
		model.addAttribute("imageUrl", imageUrl);
		
		String match = configureService.getValueByKey("match");
		Map<String, String> matchs = MapUtil.getMap(match, "[,]");
		model.addAttribute("matchs", matchs);
		return "house";
	}
	
	@RequestMapping("/new/sale")
	public String pageNewSale(Model model) {
		setModel(model, regionService);
		
		String imageUrl = configureService.getValueByKey("image_url");
		model.addAttribute("imageUrl", imageUrl);
		return "house";
	}
	
	@RequestMapping("/used/sale/add")
	public String pageUsedSaleAdd(Model model) {
		return "house-add";
	}
	
	@RequestMapping("/select")
	@ResponseBody
	public Object select(String buildingUnitId) {
		JsonMessage jMessage = new JsonMessage();
		List<HouseHomeDescData> datas = null;
		try {
			datas = houseService.queryByBuildingUnitId(buildingUnitId);
			jMessage.setStatus(JsonMessage.TRUE);
			jMessage.setData(datas);
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
	public Object save(House param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			houseService.save(param);
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
	
	@RequestMapping("")
	public String pageHouse(Model model) {
		setModel(model, regionService);
		
		String imageUrl = configureService.getValueByKey("image_url");
		model.addAttribute("imageUrl", imageUrl);
		return "houses";
	}
	
	@RequestMapping("/queryHomeData")
	@ResponseBody
	public Object queryHomeData(HouseHomeQueryParam param) {
		IPage<HouseHomeData> datas = houseService.queryHomeData(param, param.getPage(),
				param.getLength());
		JsonResult<HouseHomeData> jResult = new JsonResult<HouseHomeData>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<HouseHomeData>) datas.getData());
		return jResult;
	}
	
	@RequestMapping("/queryManageData")
	@ResponseBody
	public Object queryManageData(HouseManageQueryParam param) {
		IPage<HouseManageData> datas = houseService.queryManageData(param, param.getPage(),
				param.getLength());
		JsonResult<HouseManageData> jResult = new JsonResult<HouseManageData>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<HouseManageData>) datas.getData());
		return jResult;
	}
	
	@RequestMapping("/queryByCustomerRequire")
	@ResponseBody
	public Object queryByCustomerRequire(HouseHomeQueryParam param) {
		IPage<HouseHomeData> datas = houseService.queryByCustomerRequire(param, param.getPage(),
				param.getLength());
		JsonResult<HouseHomeData> jResult = new JsonResult<HouseHomeData>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<HouseHomeData>) datas.getData());
		return jResult;
	}
}
