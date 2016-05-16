package com.house.agency.security;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import com.house.agency.entity.Permission;
import com.house.agency.entity.Role;
import com.house.agency.entity.User;
import com.house.agency.service.IPermissionService;
import com.house.agency.service.IRoleService;
import com.house.agency.service.IUserService;


public class SecurityRealm extends AuthorizingRealm {

	@Autowired
	private IUserService userService;
	
	@Autowired
	private IRoleService roleService;
	
	@Autowired
	private IPermissionService permissionService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		SimpleAuthorizationInfo simpleAuthorInfo = null;
		/*String currentUsername = (String) super
				.getAvailablePrincipal(principals);*/
		User user = (User) super
				.getAvailablePrincipal(principals);
		List<String> roleList = new ArrayList<String>();
		List<String> permissionList = new ArrayList<String>();

		//User user = userService.getByUserName(currentUsername);
		if (null != user) {
			List<Role> roles = roleService.queryRolesByUserId(user.getId());
			if (!CollectionUtils.isEmpty(roles)) {
				for (Role role : roles) {
					roleList.add(role.getName());
					List<Permission> permissions = permissionService.queryPermissionsByRoleId(role.getId());
					if (!CollectionUtils.isEmpty(permissions)) {
						for (Permission permission : permissions) {
							if (!StringUtils.isEmpty(permission.getName())) {
								permissionList.add(permission.getName());
							}
						}
					}
				}
				simpleAuthorInfo = new SimpleAuthorizationInfo();
				simpleAuthorInfo.addRoles(roleList);
				simpleAuthorInfo.addStringPermissions(permissionList);
			}
		}
		return simpleAuthorInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		AuthenticationInfo authcInfo = null;
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		System.out.println("login token:"
				+ ReflectionToStringBuilder.toString(token,
						ToStringStyle.MULTI_LINE_STYLE));
		User user = userService.getDataByUsername(token.getUsername());
		if (null != user) {
			authcInfo = new SimpleAuthenticationInfo(user,
					user.getPassword(), user.getUsername());
			this.setSession("currentUser", user);
		}
		return authcInfo;
	}

	private void setSession(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			System.out
				.println("Session getTimeout:" + session.getTimeout() + "]");
			if (null != session) {
				session.setAttribute(key, value);
			}
		}
	}
}
