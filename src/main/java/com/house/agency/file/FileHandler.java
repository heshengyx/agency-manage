package com.house.agency.file;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.myself.common.exception.ServiceException;
import com.myself.common.utils.FileUtil;

public class FileHandler {
	
	private final static Logger logger = LoggerFactory
			.getLogger(FileHandler.class);

	public static Map<String, File> upload(MultipartFile multipartFile, String path) {
		Map<String, File> map = null;
		if (multipartFile != null && !multipartFile.isEmpty()) { // 判断文件是否为空
			String fileName = multipartFile.getOriginalFilename();
			String fileSuffix = FileUtil.getFileSuffix(fileName);
			String originalName = fileName.substring(0, fileName.indexOf(fileSuffix));
			fileName = FileUtil.getFileName() + fileSuffix;

			File file = new File(path, fileName);
			if (!file.exists()) {
				file.mkdirs();
			}
			try {
				multipartFile.transferTo(file);
			} catch (Exception e) {
				logger.info("上传文件失败", e);
				throw new ServiceException("上传文件失败");
			}
			map = new HashMap<String, File>();
			map.put(originalName, file);
		} else {
			throw new ServiceException("上传文件为空");
		}
		return map;
	}
	
	public static void upload(MultipartFile multipartFile, File file) {
		try {
			multipartFile.transferTo(file);
		} catch (Exception e) {
			logger.info("上传文件失败", e);
			throw new ServiceException("上传文件失败");
		}
	}
	
	public static File getFile(MultipartFile multipartFile, String path) {
		File file = null;
		if (multipartFile != null && !multipartFile.isEmpty()) { // 判断文件是否为空
			String fileName = multipartFile.getOriginalFilename();
			String fileSuffix = FileUtil.getFileSuffix(fileName);
			fileName = FileUtil.getFileName() + fileSuffix;

			file = new File(path, fileName);
			if (!file.exists()) {
				file.mkdirs();
			} else {
				throw new ServiceException("文件创建失败");
			}
		} else {
			throw new ServiceException("上传文件为空");
		}
		return file;
	}
}
