package com.house.agency.security;

import java.text.MessageFormat;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.config.Ini;
import org.apache.shiro.config.Ini.Section;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import com.house.agency.entity.Permission;
import com.house.agency.param.PermissionQueryParam;
import com.house.agency.service.IPermissionService;


public class ChainDefinitionSectionMetaSource implements
		FactoryBean<Ini.Section> {

	@Autowired  
    private IPermissionService permissionService;
	
	private String filterChainDefinitions;

	public static final String PREMISSION_STRING = "perms[\"{0}\"]";

	public void setFilterChainDefinitions(String filterChainDefinitions) {
		this.filterChainDefinitions = filterChainDefinitions;
	}

	public Section getObject() throws Exception {
		List<Permission> permissions = permissionService.list(new PermissionQueryParam());
  
        Ini ini = new Ini();  
        ini.load(filterChainDefinitions);  
        Ini.Section section = ini.getSection(Ini.DEFAULT_SECTION_NAME);  
     if (!CollectionUtils.isEmpty(permissions)) {
			for (Permission permission : permissions) {
				if(StringUtils.isNotEmpty(permission.getUrl()) && StringUtils.isNotEmpty(permission.getName())) {
					section.put(permission.getUrl(),  MessageFormat.format(PREMISSION_STRING, permission.getName()));
				}
			}
		}
		return section;
	}

	public Class<?> getObjectType() {
		return this.getClass();
	}

	public boolean isSingleton() {
		return false;
	}

}
