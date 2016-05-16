package com.house.agency.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.data.manage.BuildingUnitManageData;
import com.house.agency.entity.BuildingUnit;
import com.house.agency.page.IPage;
import com.house.agency.param.manage.BuildingUnitManageQueryParam;
import com.house.agency.service.IBuildingUnitService;
import com.myself.common.exception.ServiceException;
import com.myself.common.message.JsonMessage;
import com.myself.common.message.JsonResult;

@Controller
@RequestMapping("/manage/buildingUnit")
public class BuildingUnitController extends BaseController {
	
	private final static Logger logger = LoggerFactory
			.getLogger(BuildingUnitController.class);

	@Autowired
	private IBuildingUnitService buildingUnitService;
	
	@RequestMapping("/queryManageData")
	@ResponseBody
	public Object queryManageData(BuildingUnitManageQueryParam param) {
		IPage<BuildingUnitManageData> datas = buildingUnitService.queryManageData(param, param.getPage(),
				param.getLength());
		JsonResult<BuildingUnitManageData> jResult = new JsonResult<BuildingUnitManageData>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<BuildingUnitManageData>) datas.getData());
		return jResult;
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public Object save(BuildingUnit param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			buildingUnitService.save(param);
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
	
	@RequestMapping("/select")
	@ResponseBody
	public Object select(String buildingId) {
		JsonMessage jMessage = new JsonMessage();
		List<BuildingUnit> datas = null;
		try {
			datas = buildingUnitService.queryByBuildingId(buildingId);
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
	
	@RequestMapping("/trash")
	@ResponseBody
	public Object trash(String id) {
		JsonMessage jMessage = new JsonMessage();
		try {
			buildingUnitService.deleteById(id);
			jMessage.setStatus(JsonMessage.TRUE);
			jMessage.setMessage("删除成功");
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
