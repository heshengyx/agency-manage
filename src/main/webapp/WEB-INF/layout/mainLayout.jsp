<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title><sitemesh:write property="title" /></title>
    <!-- basic styles -->
	  <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
	  <link href="${ctx}/css/font-awesome.min.css" rel="stylesheet">

		<!--[if IE 7]>
		  <link rel="stylesheet" href="${ctx}/css/font-awesome-ie7.min.css">
		<![endif]-->
		
		<!-- page styles -->
		<link href="${ctx}/css/ui-dialog.css" rel="stylesheet">
    <sitemesh:write property="head" />
		<!-- fonts -->
		<!-- <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" rel="stylesheet"> -->
	
		<!-- ace styles -->
		<link href="${ctx}/css/ace.min.css" rel="stylesheet">
		<link href="${ctx}/css/ace-rtl.min.css" rel="stylesheet">
		<link href="${ctx}/css/ace-skins.min.css" rel="stylesheet">
	
		<!--[if lte IE 8]>
		  <link href="${ctx}/css/ace-ie.min.css" rel="stylesheet">
		<![endif]-->
		
		<!-- inline styles -->
		<sitemesh:write property="css" />

		<!-- settings handler -->
		<script src="${ctx}/js/ace-extra.min.js"></script>
	
		<!--[if lt IE 9]>
		<script src="${ctx}/js/html5shiv.js"></script>
		<script src="${ctx}/js/respond.min.js"></script>
		<![endif]-->
  </head>
  
  <body>
		<div class="navbar navbar-default" id="navbar">

			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small><i class="icon-leaf"></i>Ace Admin</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->

				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="grey">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="icon-tasks"></i>
								<span class="badge badge-grey">4</span>
							</a>

							<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="icon-ok"></i>
									4 Tasks to complete
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">Software Update</span>
											<span class="pull-right">65%</span>
										</div>

										<div class="progress progress-mini">
											<div style="width:65%" class="progress-bar"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">Hardware Upgrade</span>
											<span class="pull-right">35%</span>
										</div>

										<div class="progress progress-mini">
											<div style="width:35%" class="progress-bar progress-bar-danger"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">Unit Testing</span>
											<span class="pull-right">15%</span>
										</div>

										<div class="progress progress-mini">
											<div style="width:15%" class="progress-bar progress-bar-warning"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">Bug Fixes</span>
											<span class="pull-right">90%</span>
										</div>

										<div class="progress progress-mini progress-striped active">
											<div style="width:90%" class="progress-bar progress-bar-success"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										See tasks with details
										<i class="icon-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="purple">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="icon-bell-alt icon-animated-bell"></i>
								<span class="badge badge-important">8</span>
							</a>

							<ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="icon-warning-sign"></i>
									8 Notifications
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-pink icon-comment"></i>
												New Comments
											</span>
											<span class="pull-right badge badge-info">+12</span>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<i class="btn btn-xs btn-primary icon-user"></i>
										Bob just signed up as an editor ...
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-success icon-shopping-cart"></i>
												New Orders
											</span>
											<span class="pull-right badge badge-success">+8</span>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-info icon-twitter"></i>
												Followers
											</span>
											<span class="pull-right badge badge-info">+11</span>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										See all notifications
										<i class="icon-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="green">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="icon-envelope icon-animated-vertical"></i>
								<span class="badge badge-success">5</span>
							</a>

							<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="icon-envelope-alt"></i>
									5 Messages
								</li>

								<li>
									<a href="#">
										<img src="${ctx}/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Alex:</span>
												Ciao sociis natoque penatibus et auctor ...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>a moment ago</span>
											</span>
										</span>
									</a>
								</li>

								<li>
									<a href="#">
										<img src="${ctx}/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Susan:</span>
												Vestibulum id ligula porta felis euismod ...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>20 minutes ago</span>
											</span>
										</span>
									</a>
								</li>

								<li>
									<a href="#">
										<img src="${ctx}/avatars/avatar4.png" class="msg-photo" alt="Bob's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Bob:</span>
												Nullam quis risus eget urna mollis ornare ...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>3:15 pm</span>
											</span>
										</span>
									</a>
								</li>

								<li>
									<a href="inbox.html">
										See all messages
										<i class="icon-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="${ctx}/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>Welcome,</small>
									<shiro:principal property="username" />
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="#">
										<i class="icon-cog"></i>
										Settings
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-user"></i>
										Profile
									</a>
								</li>
								<li class="divider"></li>
								<li><a href="#" id="logout"><i class="icon-off"></i>Logout</a></li>
							</ul>
						</li>
					</ul><!-- /.ace-nav -->
				</div><!-- /.navbar-header -->
			</div><!-- /.container -->
		</div>

		<div class="main-container" id="main-container">

			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>

				<div class="sidebar" id="sidebar">

					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<button class="btn btn-success">
								<i class="icon-signal"></i>
							</button>
							<button class="btn btn-info">
								<i class="icon-pencil"></i>
							</button>
							<button class="btn btn-warning">
								<i class="icon-group"></i>
							</button>
							<button class="btn btn-danger">
								<i class="icon-cogs"></i>
							</button>
						</div>

						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>
							<span class="btn btn-info"></span>
							<span class="btn btn-warning"></span>
							<span class="btn btn-danger"></span>
						</div>
					</div><!-- #sidebar-shortcuts -->

					<ul class="nav nav-list">
						<li>
							<a href="index.html">
								<i class="icon-cog"></i>
								<span class="menu-text"> 控制台 </span>
							</a>
						</li>
						
						<li>
							<a href="#" class="dropdown-toggle">
								<i class="icon-building"></i>
								<span class="menu-text"> 新房 </span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li>
									<a href="${ctx}/manage/house/new/sale"><i class="icon-double-angle-right"></i>出售</a>
								</li>
								<li>
									<a href="${ctx}/manage/house/add"><i class="icon-double-angle-right"></i>出租</a>
								</li>
							</ul>
						</li>
						<li>
              <a href="#" class="dropdown-toggle">
                <i class="icon-home"></i>
                <span class="menu-text"> 二手房 </span>
                <b class="arrow icon-angle-down"></b>
              </a>
              <ul class="submenu">
                <li>
                  <a href="${ctx}/manage/house/used/sale"><i class="icon-double-angle-right"></i>出售</a>
                </li>
                <li>
                  <a href="${ctx}/manage/house/add"><i class="icon-double-angle-right"></i>出租</a>
                </li>
              </ul>
            </li>
            <li>
              <a href="#" class="dropdown-toggle">
                <i class="icon-globe"></i>
                <span class="menu-text"> 客源 </span>
                <b class="arrow icon-angle-down"></b>
              </a>
              <ul class="submenu">
                <li>
                  <a href="${ctx}/manage/customer"><i class="icon-double-angle-right"></i>客户</a>
                </li>
                <li>
                  <a href="${ctx}/manage/customerRequire"><i class="icon-double-angle-right"></i>需求</a>
                </li>
              </ul>
            </li>
            <li>
              <a href="#" class="dropdown-toggle">
                <i class="icon-table"></i>
                <span class="menu-text"> 小区 </span>
                <b class="arrow icon-angle-down"></b>
              </a>
              <ul class="submenu">
                <li>
                  <a href="${ctx}/manage/building"><i class="icon-double-angle-right"></i>楼盘</a>
                </li>
                <li>
                  <a href="${ctx}/manage/house"><i class="icon-double-angle-right"></i>房源</a>
                </li>
              </ul>
            </li>
						<li>
              <a href="#" class="dropdown-toggle">
                <i class="icon-table"></i>
                <span class="menu-text"> 地区 </span>
                <b class="arrow icon-angle-down"></b>
              </a>
              <ul class="submenu">
                <li>
                  <a href="${ctx}/manage/region/country"><i class="icon-double-angle-right"></i>国家</a>
                </li>
                <li>
                  <a href="${ctx}/manage/region/province"><i class="icon-double-angle-right"></i>省份</a>
                </li>
                <li>
                  <a href="${ctx}/manage/region/city"><i class="icon-double-angle-right"></i>市县</a>
                </li>
                <li>
                  <a href="${ctx}/manage/region/district"><i class="icon-double-angle-right"></i>城区</a>
                </li>
                <li>
                  <a href="${ctx}/manage/region/town"><i class="icon-double-angle-right"></i>乡镇</a>
                </li>
              </ul>
            </li>
					</ul><!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>
				</div>

				<sitemesh:write property="body" />
        <!-- /#ace-settings-container -->
			</div><!-- /.main-container-inner -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='${ctx}/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->
		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='${ctx}/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
		</script>
		<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${ctx}/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="${ctx}/js/bootstrap.min.js"></script>
		<script src="${ctx}/js/typeahead-bs2.min.js"></script>
		<!-- ace scripts -->
		<script src="${ctx}/js/ace-elements.min.js"></script>
		<script src="${ctx}/js/ace.min.js"></script>
    <script src="${ctx}/js/dialog-min.js"></script>
    <script src="${ctx}/js/dialog-util.js"></script>
    <script>
    $(document).ready(function() {
    	$("#logout").click(function() {
    		dialog({
   		    title: '消息',
   		    content: '确定要退出吗?',
   		    okValue: '确定',
   		    ok: function () {
   		    	var that = this;
   		    	this.title('退出中…');
   		      setTimeout(function () {
               that.close().remove();
               location.href = "${ctx}/manage/logout";
            }, 2000);
            return false;
   		    },
   		    cancelValue: '取消',
   	      cancel: function () {}
    		}).width(150).showModal();
    	});
    	
    	var href = window.location.href;
   	  $(".nav-list li").removeClass("active");
   	  $(".nav-list>li>ul.submenu>li>a").each(function() {
   	    var $this = $(this);
   	    var $href = $this.attr("href");
   	    if (href.indexOf($href) != -1) {
   	    	$this.parent().addClass("active");
   	      $this.parent().parent().parent().addClass("active");
   	    }
   	  });
    });
    </script>
		<sitemesh:write property="jscript" />
	</body>
</html>