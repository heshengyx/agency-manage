<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>  
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>用户登录-爱房网</title>
    <!-- basic styles -->
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/css/font-awesome.min.css" rel="stylesheet">

    <!--[if IE 7]>
      <link rel="stylesheet" href="${ctx}/css/font-awesome-ie7.min.css">
    <![endif]-->

    <!-- fonts -->
    <!-- <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" rel="stylesheet"> -->
  
    <!-- ace styles -->
    <link href="${ctx}/css/ace.min.css" rel="stylesheet">
    <link href="${ctx}/css/ace-rtl.min.css" rel="stylesheet">
    <link href="${ctx}/css/ace-skins.min.css" rel="stylesheet">
  
    <!--[if lte IE 8]>
      <link href="${ctx}/css/ace-ie.min.css" rel="stylesheet">
    <![endif]-->
    
    <!-- page specific plugin styles -->
    <link href="${ctx}/css/bootstrapValidator.min.css" rel="stylesheet">
    
    <!-- inline styles related to this page -->
    <!-- ace settings handler -->
    <script src="${ctx}/js/ace-extra.min.js"></script>
  
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${ctx}/js/html5shiv.js"></script>
    <script src="${ctx}/js/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body class="login-layout">
    <div class="main-container">
      <div class="main-content">
        <div class="row">
          <div class="col-sm-10 col-sm-offset-1">
            <div class="login-container">
              <div class="center">
                <br><br>
                <h1>
                  <i class="icon-home green"></i>
                  <span class="red">爱房网</span>
                  <span class="white">经纪人平台</span>
                </h1>
                <!-- <h4 class="blue">&copy; Company Name</h4> -->
              </div>

              <div class="space-6"></div>

              <div class="position-relative">
                <div id="login-box" class="login-box visible widget-box no-border">
                  <div class="widget-body">
                    <div class="widget-main">
                      <h4 class="header blue lighter bigger">
                        <i class="icon-coffee green"></i>用户登录
                      </h4>

                      <div class="space-6"></div>

                      <form id="dataForm" action="${ctx}/manage/login" method="post">
                        <fieldset>
                          <label class="block clearfix">
                            <span class="block input-icon input-icon-right">
                              <input type="text" class="form-control" name="username" placeholder="手机/账号/邮箱" />
                              <i class="icon-user"></i>
                              <span id="usernameMessage"></span>
                            </span>
                          </label>

                          <label class="block clearfix">
                            <span class="block input-icon input-icon-right">
                              <input type="password" class="form-control" name="password" placeholder="密码" />
                              <i class="icon-lock"></i>
                              <span id="passwordMessage"></span>
                            </span>
                          </label>

                          <div class="space"></div>

                          <div class="clearfix">
                            <label class="inline">
                              <input type="checkbox" class="ace" />
                              <span class="lbl"> 记住我</span>
                            </label>

                            <button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
                              <i class="icon-key"></i>登录
                            </button>
                          </div>

                          <div class="space-4"></div>
                        </fieldset>
                      </form>

                      <div class="social-or-login center">
                        <span class="bigger-110">或者 其他登录</span>
                      </div>

                      <div class="social-login center">
                        <a class="btn btn-primary">
                          <i class="icon-facebook"></i>
                        </a>

                        <a class="btn btn-info">
                          <i class="icon-twitter"></i>
                        </a>

                        <a class="btn btn-danger">
                          <i class="icon-google-plus"></i>
                        </a>
                      </div>
                    </div><!-- /widget-main -->

                    <div class="toolbar clearfix">
                      <div>
                        <a href="#" onclick="show_box('forgot-box');" class="forgot-password-link">
                          <i class="icon-arrow-left"></i>忘记密码
                        </a>
                      </div>

                      <div>
                        <a href="#" onclick="show_box('signup-box');" class="user-signup-link">我要注册
                          <i class="icon-arrow-right"></i>
                        </a>
                      </div>
                    </div>
                  </div><!-- /widget-body -->
                </div><!-- /login-box -->

                <div id="forgot-box" class="forgot-box widget-box no-border">
                  <div class="widget-body">
                    <div class="widget-main">
                      <h4 class="header red lighter bigger">
                        <i class="icon-key"></i>
                        Retrieve Password
                      </h4>

                      <div class="space-6"></div>
                      <p>
                        Enter your email and to receive instructions
                      </p>

                      <form>
                        <fieldset>
                          <label class="block clearfix">
                            <span class="block input-icon input-icon-right">
                              <input type="email" class="form-control" placeholder="Email" />
                              <i class="icon-envelope"></i>
                            </span>
                          </label>

                          <div class="clearfix">
                            <button type="button" class="width-35 pull-right btn btn-sm btn-danger">
                              <i class="icon-lightbulb"></i>
                              Send Me!
                            </button>
                          </div>
                        </fieldset>
                      </form>
                    </div><!-- /widget-main -->

                    <div class="toolbar center">
                      <a href="#" onclick="show_box('login-box');" class="back-to-login-link">
                        Back to login
                        <i class="icon-arrow-right"></i>
                      </a>
                    </div>
                  </div><!-- /widget-body -->
                </div><!-- /forgot-box -->

                <div id="signup-box" class="signup-box widget-box no-border">
                  <div class="widget-body">
                    <div class="widget-main">
                      <h4 class="header green lighter bigger">
                        <i class="icon-group blue"></i>
                        New User Registration
                      </h4>

                      <div class="space-6"></div>
                      <p> Enter your details to begin: </p>

                      <form>
                        <fieldset>
                          <label class="block clearfix">
                            <span class="block input-icon input-icon-right">
                              <input type="email" class="form-control" placeholder="Email" />
                              <i class="icon-envelope"></i>
                            </span>
                          </label>

                          <label class="block clearfix">
                            <span class="block input-icon input-icon-right">
                              <input type="text" class="form-control" placeholder="Username" />
                              <i class="icon-user"></i>
                            </span>
                          </label>

                          <label class="block clearfix">
                            <span class="block input-icon input-icon-right">
                              <input type="password" class="form-control" placeholder="Password" />
                              <i class="icon-lock"></i>
                            </span>
                          </label>

                          <label class="block clearfix">
                            <span class="block input-icon input-icon-right">
                              <input type="password" class="form-control" placeholder="Repeat password" />
                              <i class="icon-retweet"></i>
                            </span>
                          </label>

                          <label class="block">
                            <input type="checkbox" class="ace" />
                            <span class="lbl">
                              I accept the
                              <a href="#">User Agreement</a>
                            </span>
                          </label>

                          <div class="space-24"></div>

                          <div class="clearfix">
                            <button type="reset" class="width-30 pull-left btn btn-sm">
                              <i class="icon-refresh"></i>
                              Reset
                            </button>

                            <button type="button" class="width-65 pull-right btn btn-sm btn-success">
                              Register
                              <i class="icon-arrow-right icon-on-right"></i>
                            </button>
                          </div>
                        </fieldset>
                      </form>
                    </div>

                    <div class="toolbar center">
                      <a href="#" onclick="show_box('login-box');" class="back-to-login-link">
                        <i class="icon-arrow-left"></i>
                        Back to login
                      </a>
                    </div>
                  </div><!-- /widget-body -->
                </div><!-- /signup-box -->
              </div><!-- /position-relative -->
            </div>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div>
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
    <script src="${ctx}/js/bootstrapValidator.min.js"></script>
    <script>
    $(document).ready(function() {
			$('#dataForm').bootstrapValidator({
			  submitHandler: function(validator, form, submitButton) {
			    $.post(form.attr('action'), form.serialize(), function(result) {
			      if (result.status) {
			    	  window.location.href = '${ctx}/manage/house/used/sale';
			      } else {
			    	  //$('#message').text(result.message);
		          validator.disableSubmitButtons(false);
			      }
			    }, 'json');
			  },
			  fields: {
			    username: {
			    	container: '#usernameMessage',
            validators: {
              notEmpty: {
            	  message: '账号不能为空'
              }
            }
          },
          password: {
        	  container: '#passwordMessage',
            validators: {
              notEmpty: {
            	  message: '密码不能为空'
              }
            }
          }
			  }
		  });
    });
    </script>
  </body>
</html>

