<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%> 
<html>
<head>
  <title>首页-爱房网</title>
  <link href="${ctx}/css/jquery.autocompleter.css" rel="stylesheet">
  <link href="${ctx}/css/autocompleter.css" rel="stylesheet">
  <link href="${ctx}/css/datepicker.css" rel="stylesheet">
  <link href="${ctx}/css/dropzone.css" rel="stylesheet">
  <link href="${ctx}/css/colorbox.css" rel="stylesheet">
  <css>
  <style>
  .hr-line {
    margin-top: 0;
    margin-bottom: 8px;
  }
  .form-row {margin-bottom: 0;}
  .form-row>label.control-label {padding-top: 10px;}
  .form-row>div {padding-top: 5px;}
  
  .input-field {width: 100%;}
  .input-select {width: 84px; height: 32px;}
  @media (min-width: 1200px) {
    .input-select {height: 28px;}
  }
  .input-text {width: 84px;}
  
  .btn-list {padding: 0;}
  .list-inline li {padding-left: 0;}
  
  .widget-none {border: 0;}
  .table-search {
    margin-top: 0;
    margin-bottom: 0;
  }
  .table-search>tbody>tr>td {
    padding-top: 0;
    padding-bottom: 0;
  } 
  .action-close {color: #e09e96;}
  .action-close:hover {color: #ffd9d5;}
  
  .modal-body-content {padding-top: 5px;}
  
  .date-picker {width: 110px;}
  
  .ace-thumbnails>li {
    width: 170px;
    /* height: 155px; */
    margin-left: 10px; 
    text-align: center;
    border: 0;
  } 
  .thumbnail>a {
    display: block;
    height: 115px;
    overflow: hidden;
  }
  .thumbnail .caption {
    padding-top: 0;
    padding-bottom: 0;
    padding-left: 4px;
    padding-right: 4px;
  }
  
  .dropzone .dz-preview, 
  .dropzone-previews .dz-preview {margin-left: 27px;}
  .dropzone .dz-preview .error-message-tip, 
  .dropzone-previews .dz-preview .error-message-tip {
    top: 0;
    left: 0;
    min-width: 0;
  }
  .switch-box {padding-top: 5px;}
  .checkbox-all {border-bottom: 1px dotted #e2e2e2;}
  </style>
  </css>
</head>
<body>
	<div class="main-content">
	  <div class="breadcrumbs" id="breadcrumbs">
	    <ul class="breadcrumb">
	      <li><i class="icon-home home-icon"></i><a href="#">新房</a></li>
	      <li class="active">出售</li>
	    </ul><!-- .breadcrumb -->
	
	    <!-- <div class="nav-search" id="nav-search">
	      <form class="form-search">
	        <span class="input-icon">
	          <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
	          <i class="icon-search nav-search-icon"></i>
	        </span>
	      </form>
	    </div> --><!-- #nav-search -->
	  </div>
	
	  <div class="page-content">
      <div class="widget-container-span">
        <div class="widget-box transparent">
          <div class="widget-header">
            <h5>房源搜索</h5>
            <div class="widget-toolbar no-border">
              <a href="#" data-action="collapse"><i class="icon-chevron-up"></i></a>
            </div>
          </div>
          
          <div class="widget-body">
            <table class="table table-striped table-search">
              <tbody>
                <tr>
                  <td>
                    <form class="form-horizontal">
                      <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">区域：</label>
                        <div class="col-md-11">
                          <ul class="list-inline" id="districts">
                            <li><button type="button" class="btn btn-danger btn-xs" onclick="queryRegions('', '', this, ['districts', 'towns', 'townsPane']);">不限</button></li>
                            <c:forEach var="data" items="${regions}">
                            <li><button type="button" class="btn btn-link btn-xs" onclick="queryRegions('${data.id}', '${data.name}', this, ['districts', 'towns', 'townsPane']);">${data.name}</button></li>
                            </c:forEach> 
                          </ul>
                          <div id="townsPane">
						                <hr class="hr-line">
						                <ul class="list-inline" id="towns">
						                  <li><button type="button" class="btn btn-danger btn-xs">不限</button></li>
						                </ul>
						              </div>
                        </div>
                      </div>
                      <div class="form-group form-row">
		                    <label class="col-md-1 control-label no-padding-right">楼盘：</label>
		                    <div class="col-md-4">
		                      <div class="input-group">
		                        <input class="input-field" type="text" id="buildingName" placeholder="楼盘名称">
		                        <span class="input-group-addon"><i class="icon-home"></i></span>
                          </div>
		                    </div>
		                    <label class="col-md-1 control-label no-padding-right">栋座：</label>
		                    <div class="col-md-4">
	                        <select class="input-select" id="buildingUnit">
                            <option value="">选择栋座</option>
                          </select>
                          <small>~</small>
                          <select class="input-select" id="house">
                            <option value="">选择房号</option>
                          </select>
		                    </div>
		                  </div>
		                  <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">价格：</label>
                        <div class="col-md-4">
                          <input class="input-text" type="text" id="priceBegin">
                          <small>~</small>
                          <input class="input-text" type="text" id="priceEnd"><small>（万）</small>
                        </div>
                        <label class="col-md-1 control-label no-padding-right">面积：</label>
                        <div class="col-md-4">
                          <input class="input-text" type="text" id="areaBegin">
                          <small>~</small>
                          <input class="input-text" type="text" id="areaEnd"><small>（平米）</small>
                        </div>
                      </div>
                      <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">户型：</label>
                        <div class="col-md-8">
                          <select class="input-select" id="room">
                            <option value="0">选择室</option>
                            <option value="1">1室</option>
                            <option value="2">2室</option>
                            <option value="3">3室</option>
                            <option value="4">4室</option>
                            <option value="5">5室</option>
                            <option value="5:gt">5室以上</option>
                          </select>
                          <small>~</small>
                          <select class="input-select" id="saloon">
                            <option value="0">选择厅</option>
                            <option value="1">1厅</option>
                            <option value="2">2厅</option>
                            <option value="3">3厅</option>
                            <option value="4">4厅</option>
                            <option value="5">5厅</option>
                            <option value="5">5厅</option>
                          </select>
                          <small>~</small>
                          <select class="input-select" id="toilet">
                            <option value="0">选择卫</option>
                            <option value="1">1卫</option>
                            <option value="2">2卫</option>
                            <option value="3">3卫</option>
                            <option value="4">4卫</option>
                            <option value="5">5卫</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">时间：</label>
                        <div class="col-md-5">
                          <span class="input-icon input-icon-right">
                            <input class="date-picker" id="dateBegin" type="text" data-date-format="yyyy-mm-dd" placeholder="开始时间">
                            <i class="icon-calendar"></i>
                          </span>
                          <small>~</small>
                          <span class="input-icon input-icon-right">
                            <input class="date-picker" id="dateEnd" type="text" data-date-format="yyyy-mm-dd" placeholder="结束时间">
                            <i class="icon-calendar"></i>
                          </span>
                        </div>
                      </div>
                      <div class="form-group form-row">
                        <div class="col-md-3 col-md-offset-1">
                          <div class="input-group">
                            <span class="input-group-btn">
                              <button type="button" class="btn btn-info btn-xs" id="btnHouseSearch">搜索<i class="icon-search icon-on-right"></i></button>
                              &nbsp;
                              <button type="reset" class="btn btn-xs">重置<i class="icon-undo icon-on-right"></i></button>
                            </span>
                          </div>
                        </div>  
                      </div>
                    </form>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div><!-- /.page-header -->
      
      <input id="districtsValue" type="hidden">
      <input id="townsValue" type="hidden">
      <input id="districtsAddValue" type="hidden">
      <input id="townsAddValue" type="hidden">
      <input id="tradeId" type="hidden" value="0">
      <input id="houseId" type="hidden" value="0">
      <input id="buildingId" type="hidden" value="0">
      <input id="houseIdAdd" type="hidden" value="0">
      <input id="buildingIdAdd" type="hidden" value="0">
      
	    <div class="row">
	      <div class="col-xs-12 widget-container-span">
	        <!-- PAGE CONTENT BEGINS -->
	        <!-- <div class="table-header">
	          <button class="btn btn-xs btn-success">
	          <i class="icon-edit"></i>
	          <span class="bigger-110 no-text-shadow">新增</span>
	          </button>
	        </div> -->
	        
	        <div class="widget-box">
		        <div class="widget-header header-color-blue">
		          <h5><i class="icon-table"></i>新房出售</h5>
	            <div class="widget-toolbar">
	              <button class="btn btn-minier btn-purple" data-toggle="modal" data-target="#modal-add">新增<i class="icon-edit align-top icon-on-right"></i>
                </button>
	              <button class="btn btn-minier">导出<i class="icon-print align-top icon-on-right"></i>
								</button>
	             <!-- <a href="#" id="btn-add" data-action="settings"><i class="icon-edit"></i></a>
	             <a href="#" data-action="reload"><i class="icon-refresh"></i></a>
	             <a class="action-close" href="#" title="删除"><i class="icon-remove"></i></a> --> 
	            </div>
		        </div>

		        <div class="widget-body widget-none">
			        <div class="table-responsive">
			          <table class="table table-striped table-bordered table-hover" id="tableHouse" width="100%">
			            <thead>
			              <tr>
			                <th width="50"></th>
			                <th class="text-center" width="50"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></th>
			                <th>楼盘信息</th>
			                <th class="text-right" width="90">户型</th>
			                <th width="110">价格（万）</th>
			                <th width="110">面积（㎡）</th>
			                <th width="130"><i class="icon-time hidden-480"></i>发布时间</th>
			                <th class="text-center hidden-480" width="80">状态</th>
			                <th class="text-center" width="110">操作</th>
			              </tr>
			            </thead>
			          </table>
			        </div>
		        </div>
	        </div>
	        
	        <!-- modal-add -->
	        <div id="modal-add" class="modal" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-body overflow-visible modal-body-content">
                  <div class="widget-container-span">
                    <div class="widget-box transparent">
						          <div class="widget-header">
						            <h6>房源新增</h6>
						            <div class="widget-toolbar no-border">
						              <a href="#" data-action="collapse"><i class="icon-chevron-up"></i></a>
						            </div>
						          </div>
						          
						          <div class="widget-body">
						            <table class="table table-striped table-search">
						            <tbody>
							            <tr>
								            <td>
									            <form class="form-horizontal">
					                      <div class="form-group form-row">
					                        <label class="col-md-2 control-label no-padding-right">区域：</label>
					                        <div class="col-md-10">
					                          <ul class="list-inline" id="districtsAdd">
					                            <li><button type="button" class="btn btn-danger btn-xs" onclick="queryRegions('', '', this, ['districtsAdd', 'townsAdd', 'townsPaneAdd']);">请选择</button></li>
					                            <c:forEach var="data" items="${regions}">
					                            <li><button type="button" class="btn btn-link btn-xs" onclick="queryRegions('${data.id}', '${data.name}', this, ['districtsAdd', 'townsAdd', 'townsPaneAdd']);">${data.name}</button></li>
					                            </c:forEach> 
					                          </ul>
					                          <div id="townsPaneAdd">
					                            <hr class="hr-line">
					                            <ul class="list-inline" id="townsAdd">
					                              <li><button type="button" class="btn btn-danger btn-xs">请选择</button></li>
					                            </ul>
					                          </div>
					                        </div>
					                      </div>
					                      <div class="form-group form-row">
					                        <label class="col-md-2 control-label no-padding-right">楼盘：</label>
					                        <div class="col-md-8">
					                          <div class="input-group">
					                            <input class="input-field" type="text" id="buildingNameAdd" placeholder="楼盘名称">
					                            <span class="input-group-addon"><i class="icon-home"></i></span>
					                          </div>
					                        </div>
					                      </div>
                                <div class="form-group form-row">
					                        <label class="col-md-2 control-label no-padding-right">栋座：</label>
					                        <div class="col-md-8">
					                          <select class="input-select" id="buildingUnitAdd">
					                            <option value="">选择栋座</option>
					                          </select>
					                          <small>~</small>
					                          <select class="input-select" id="cardAdd">
					                            <option value="">选择房号</option>
					                          </select>
					                        </div>
					                      </div>
					                      <div class="form-group form-row">
                                  <label class="col-md-2 control-label no-padding-right">面积：</label>
                                  <div class="col-md-8">
                                    <input class="input-text" type="text" id="areaAdd" disabled="disabled">
                                    <small>~</small>
                                    <input class="input-text" type="text" id="patternAdd" disabled="disabled">      
                                    <small>~</small>
                                    <input class="input-text" type="text" id="faceAdd" disabled="disabled">
                                  </div>
                                </div>
					                    </form>
				                    </td>
			                    </tr>
		                    </tbody>
		                    </table>
						          </div>
						        </div>
                  </div>
                  <table class="table table-search">
                  <tbody>
                    <tr>
                      <td>
                        <form class="form-horizontal">
                          <div class="form-group form-row">
                            <label class="col-md-2 control-label no-padding-right">标题：</label>
				                    <div class="col-md-8">
				                      <input class="input-field" type="text" id="titleAdd" placeholder="标题">
				                    </div>
				                  </div>
				                  <div class="form-group form-row">
                            <label class="col-md-2 control-label no-padding-right">价格：</label>
                            <div class="col-md-3">
                              <div class="input-group">
                                <input class="input-field" type="text" id="priceAdd" placeholder="价格">
                                <div class="input-group-addon"><small>万</small></div>
                              </div>
                            </div>
                          </div>
                          <c:if test="${!empty matchs}">
                          <div class="form-group form-row">
                            <label class="col-md-2 control-label no-padding-right">配套：</label>
                            <div class="col-md-10">
                              <div class="smaller lighter blue checkbox-all">
	                              <label>
	                                <input class="ace match-addall" type="checkbox" value="all" />
	                                <span class="lbl"> 全选</span>
	                              </label>
                              </div>
                              <ul class="list-inline">
                                <c:forEach var="item" items="${matchs}">
                                <li>
	                                <label>
	                                  <input class="ace match-add" type="checkbox" value="${item.key}" />
	                                  <span class="lbl"> ${item.value}</span>
	                                </label>
                                </li>
                                </c:forEach>
                              </ul>
                            </div>
                          </div>
                          </c:if>
                          <div class="form-group form-row">
                            <label class="col-md-2 control-label no-padding-right">描述：</label>
                            <div class="col-md-10">
                              <div class="wysiwyg-editor content-editor" id="contentAdd"></div>
                            </div>
                          </div>
				                </form>
                      </td>
                    </tr>
                  </tbody>
                  </table>
                </div>
                <div class="modal-footer">
                  <button class="btn btn-xs" data-dismiss="modal"><i class="icon-remove"></i>关闭</button>
                  <button class="btn btn-xs btn-primary" id="btnHouseSave"><i class="icon-ok"></i>保存</button>
                </div>
              </div>
            </div>
          </div>
          <!-- modal-add -->
          <!-- modal-edit -->
          <div id="modal-edit" class="modal" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-body overflow-visible modal-body-content">
                  <div class="widget-container-span">
                    <div class="widget-box transparent">
                      <div class="widget-header">
                        <h6>房源修改</h6>
                        <div class="widget-toolbar no-border">
                          <small id="smallTitle"></small>
                        </div>
                      </div>
                    </div>
                  </div>
                  <form class="form-horizontal">
                    <input type="hidden" id="tradeId">
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">标题：</label>
                      <div class="col-md-8">
                        <input class="input-field" type="text" id="titleEdit" placeholder="标题">
                      </div>
                    </div>
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">价格：</label>
                      <div class="col-md-3">
                        <div class="input-group">
                          <input class="input-field" type="text" id="priceEdit" placeholder="价格">
                          <div class="input-group-addon"><small>万</small></div>
                        </div>
                      </div>
                    </div>
                    <c:if test="${!empty matchs}">
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">配套：</label>
                      <div class="col-md-10">
                        <div class="smaller lighter blue checkbox-all">
                          <label>
                            <input class="ace match-editall" type="checkbox" value="all" />
                            <span class="lbl"> 全选</span>
                          </label>
                        </div>
                        <ul class="list-inline">
                          <c:forEach var="item" items="${matchs}">
                          <li>
                            <label>
                              <input class="ace match-edit" type="checkbox" value="${item.key}" />
                              <span class="lbl"> ${item.value}</span>
                            </label>
                          </li>
                          </c:forEach>
                        </ul>
                      </div>
                    </div>
                    </c:if>
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">状态：</label>
                      <div class="col-md-8">
                        <label class="switch-box">
                         <input class="ace ace-switch ace-switch-3" type="checkbox" id="statusEdit" checked/>
                         <span class="lbl"></span>
                        </label>
                      </div>
                    </div>
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">描述：</label>
                      <div class="col-md-10">
                        <div class="wysiwyg-editor content-editor" id="contentEdit"></div>
                      </div>
                    </div>
                  </form>
                </div>
                <div class="modal-footer">
                  <button class="btn btn-xs" data-dismiss="modal"><i class="icon-remove"></i>关闭</button>
                  <button class="btn btn-xs btn-primary" id="btnHouseUpdate"><i class="icon-ok"></i>保存</button>
                </div>
              </div>
            </div>
          </div>
          <!-- modal-edit -->
          <!-- modal-image -->
          <div id="modal-image" class="modal fade modal-pane" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header no-padding">
                  <div class="table-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                      <span class="white">&times;</span>
                    </button>
                    <span id="titleText"></span>
                  </div>
                </div>

                <div class="modal-body no-padding">
                  <div class="tabbable">
                    <ul class="nav nav-tabs img-tabs">
                      <li class="active">
                        <a href="#activeImages" data-toggle="tab" aria-controls="activeImages">
                          <i class="green icon-picture bigger-110"></i>当前图片
                          <span class="badge badge-danger" id="activeImagesNum">0</span>
                        </a>
                      </li>
                      <li>
                        <a href="#buildingImages" data-toggle="tab" aria-controls="buildingImages">
                          <i class="green icon-picture bigger-110"></i>楼盘图片
                          <span class="badge badge-danger" id="buildingImagesNum">0</span>
                        </a>
                      </li>
                      <li>
                        <a href="#houseImages" data-toggle="tab" aria-controls="houseImages">
                          <i class="green icon-picture bigger-110"></i>房源图片
                          <span class="badge badge-danger" id="houseImagesNum">0</span>
                        </a>
                      </li>
                      <li>
                        <a href="#myImages" data-toggle="tab" aria-controls="myImages">
                          <i class="green icon-picture bigger-110"></i>我的图片
                          <span class="badge badge-danger" id="myImagesNum">0</span>
                        </a>
                      </li>
                      <li>
                        <a href="#uploadImage" data-toggle="tab" aria-controls="uploadImage">
                          <i class="purple icon-cloud-upload bigger-110"></i>上传图片
                        </a>
                      </li>
                    </ul>

                    <div class="tab-content">
                      <div id="activeImages" class="tab-pane in active">
                        <ul class="ace-thumbnails" id="activeImageThumbnails">                       
                        </ul>
                        <div class="clearfix"></div>
                      </div>
                      <div id="buildingImages" class="tab-pane">
                        <ul class="ace-thumbnails" id="buildingImageThumbnails">                       
                        </ul>
                        <div class="clearfix"></div>
                      </div>
                      <div id="houseImages" class="tab-pane">
                        <ul class="ace-thumbnails" id="houseImageThumbnails">                       
                        </ul>
                        <div class="clearfix"></div>
                      </div>
                      <div id="myImages" class="tab-pane">
                        <ul class="ace-thumbnails" id="myImageThumbnails">                       
                        </ul>
                        <div class="clearfix"></div>
                      </div>
                      <div id="uploadImage" class="tab-pane">
                        <div class="alert alert-info">
                          <i class="icon-hand-right"></i>
                                                                    房源图片上传格式为：.jpg、.gif、.png
                          <button class="close" data-dismiss="alert">
                            <i class="icon-remove"></i>
                          </button>
                        </div>
                        <form action="//dummy.html" class="dropzone">
                          <div class="fallback">
                            <input name="file" type="file" multiple="" />
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                  </div>
              </div>
            </div>
          </div>
          <!-- modal-image -->
	        <!-- PAGE CONTENT ENDS -->
	      </div><!-- /.col -->
	    </div><!-- /.row -->
	  </div><!-- /.page-content -->
	</div><!-- /.main-content -->
	<jscript>
	<script src="${ctx}/js/format-util.js"></script>
	<script src="${ctx}/js/mapper.js"></script>
	<script src="${ctx}/js/jquery.dataTables.min.js"></script>
  <script src="${ctx}/js/dataTables.bootstrap.js"></script>
  <script src="${ctx}/js/jquery.autocompleter.js"></script>
  <script src="${ctx}/js/date-time/bootstrap-datepicker.min.js"></script>
  <script src="${ctx}/js/jquery.hotkeys.min.js"></script>
  <script src="${ctx}/js/bootstrap-wysiwyg.min.js"></script>
  <script src="${ctx}/js/dropzone.min.js"></script>
  <script src="${ctx}/js/jquery.colorbox-min.js"></script>
  <script src="${ctx}/js/fuelux/fuelux.spinner.min.js"></script>
	<script>
	var d = null;
	var tableHouse = null;
	var colorbox_params = {
    reposition: true,
    scalePhotos: true,
    scrolling: false,
    previous: '<i class="icon-arrow-left"></i>',
    next: '<i class="icon-arrow-right"></i>',
    close: '&times;',
    current: '{current} of {total}',
    maxWidth: '100%',
    maxHeight: '100%',
    onOpen: function(){
      document.body.style.overflow = 'hidden';
    },
    onClosed: function(){
      document.body.style.overflow = 'auto';
    },
    onComplete: function(){
      $.colorbox.resize();
    }
  };
	$(document).ready(function() {
		Dropzone.options.myAwesomeDropzone = false;
	  Dropzone.autoDiscover = false;
		$('#townsPane').hide();
		$('#townsPaneAdd').hide();
		
		tableHouse = $('#tableHouse').DataTable({
			'language': {
        'processing':  '处理中...',
        'lengthMenu':  '每页 _MENU_ 条记录',
        'zeroRecords': '没有找到记录',
        'infoEmpty':   '无记录',
        'info':        '当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录',
        'paginate': {
          'first':     '首页',
          'previous':  '上页',
          'next':      '下页',
          'last':      '末页'
        }
      },
      'dom': 't<"row"<"col-xs-6"i><"col-xs-6"p>>',
      'processing': true,
      'serverSide': true, //开启服务器模式
      //'deferRender': true, //开启延迟渲染
      'ajax': {
        'url': '${ctx}/manage/house/queryHomeData',
        'type': 'POST',
        'data': function ( d ) { //添加额外的参数发送到服务器
          //d.tag = 'release';
          //d.sort = $('#sort').val();
        }
      },
			'columnDefs': [
        { 'visible': false, 'targets': 0},
        { 'orderable': false, 'targets': 1, 'render': function(data, type, row) {
          var content = '<div class="text-center"><label>';
          content += '<input type="checkbox" class="ace" />';
          content += '<span class="lbl"></span>';
          content += '</label></div>';
          return content;
        }},
        { 'orderable': false, 'targets': 2, 'render': function(data, type, row) {
          var content = '';
          content += '<h4>' + data.title + '</h4>';
          content += data.buildingName + '<small>（' + data.districtName + '-' + data.townName + '）</small>，';
          content += data.floorName + '，' + data.card + '<br>';
          content += '<span class="text-muted hidden-480"><small>' + data.buildingAddress + '</small></span>';
          return content;
        }},
        { 'orderable': false, 'targets': 3, 'render': function(data, type, row) {
          var content = '<div class="text-right">';
          content += data.room + '室' + data.saloon + '厅' + data.toilet + '卫';
          content += '</div>';
          return content;
        }},
        { 'targets': 4, 'render': function(data, type, row) {
          var content = '<div class="text-right">';
          content += jmoney(data.price);
          content += '</div>';
          return content;
        }},
        { 'targets': 5, 'render': function(data, type, row) {
          var content = '<div class="text-right">';
          content += jmoney(data.area);
          content += '</div>';
          return content;
        }},
        { 'targets': 6, 'render': function(data, type, row) {
          var content = to_date_hm(data.releaseTime);
          return content;
        }},
        { 'orderable': false, 'targets': 7, 'render': function(data, type, row) {
        	var content = '<div class="text-center">';
          if (+data.status) {
            content += '<span class="label label-sm label-success">有效</span>';
          } else {
            content += '<span class="label label-sm arrowed"><s>失效</s></span>';
          }
          content += '</div>';
          return content;
        }},
        { 'orderable': false, "targets": 8, "render": function(data, type, row) {
        	var title = data.buildingName + '<small>（' + data.districtName + '-' + data.townName + '）' + data.floorName + '，' + data.card;
        	title += data.room + '室' + data.saloon + '厅' + data.toilet + '卫</small>';
        	var content = '<div class="text-center">';
          content += '  <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">';
          content += '  <a class="blue" href="#modal-image" role="button" data-toggle="modal" data-title="' + title + '" data-trade="' + data.tradeId + '" data-house="' + data.houseId + '" data-building="' + data.buildingId + '" title="图片"><i class="icon-picture bigger-130"></i></a><br>';
          content += '  <a class="blue" href="#" title="详情"><i class="icon-zoom-in bigger-130"></i></a>';
          content += '  <a class="green" href="#" onclick="editHouse(\'' + data.tradeId + '\', \'' + title + '\');" title="编辑"><i class="icon-pencil bigger-130"></i></a>';
          content += '  <a class="red" href="#" onclick="trashHouse(\'' + data.tradeId + '\');"  title="删除"><i class="icon-trash bigger-130"></i></a>';
          content += '</div>';
          content += '<div class="visible-xs visible-sm hidden-md hidden-lg">';
          content += '  <div class="inline position-relative">';
          content += '    <button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">';
          content += '      <i class="icon-caret-down icon-only bigger-120"></i>';
          content += '    </button>';
          content += '    <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">';
          content += '      <li>';
          content += '        <a href="#" class="tooltip-info" data-rel="tooltip" title="View">';
          content += '          <span class="blue"><i class="icon-zoom-in bigger-120"></i></span>';
          content += '        </a>';
          content += '      </li>';
          content += '      <li>';
          content += '        <a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">';
          content += '          <span class="green"><i class="icon-edit bigger-120"></i></span>';
          content += '        </a>';
          content += '      </li>';
          content += '      <li>';
          content += '        <a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">';
          content += '          <span class="red"><i class="icon-trash bigger-120"></i></span>';
          content += '        </a>';
          content += '      </li>';
          content += '    </ul>';
          content += '  </div>';
          content += '</div>';
          content += '</div>';
          return content;
        }}
			],
			'columns': [
        { 'data': null },
        { 'data': null },
        { 'data': null },
        { 'data': null },
        { 'data': null },
        { 'data': null },
        { 'data': null },
        { 'data': null },
        { 'data': null }
      ]
		});
		queryBuildingName('buildingName', 'buildingUnit', 'districtsValue', 'townsValue');
    queryBuildingName('buildingNameAdd', 'buildingUnitAdd', 'districtsAddValue', 'townsAddValue');
    changeBuildingUnit('buildingUnit', 'house');
    changeBuildingUnit('buildingUnitAdd', 'cardAdd');
    
    $('#modal-image').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget);
      var title = button.data('title');
      $('#titleText').html(title);
      var tradeId = button.data('trade');
      $('#tradeId').val(tradeId);
      var houseId = button.data('house');
      $('#houseId').val(houseId);
      var buildingId = button.data('building');
      $('#buildingId').val(buildingId);
      queryActiveImages();
      queryBuildingImages();
      queryHouseImages();
      queryMyImages();
      dropzoneImage(houseId, '1');
    });
    $('#modal-image').on('hidden.bs.modal', function (event) {
      //alert(1);
    });
    $('#modal-edit').on('hidden.bs.modal', function (event) {
      //alert(1);
    });
		
    $('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
        $(this).prev().focus();
      });
      
    $('#btnHouseSearch').click(function() {
      d = dialog({
        title: '房源载入中...'
      });
      d.showModal();
      var search = '?random=' + Math.random();
      var townsValue = $('#townsValue').val();
      if (townsValue) {
        search += '&townId=' + townsValue;
      } else {
        var districtsValue = $('#districtsValue').val();
        if (districtsValue) {
          search += '&districtId=' + districtsValue;
        }
      }
      var priceBeginValue = $('#priceBegin').val();
      if (priceBeginValue && priceBeginValue != '0') {
        search += '&priceBegin=' + (Number(priceBeginValue)*100);
      }
      var priceEndValue = $('#priceEnd').val();
      if (priceEndValue && priceEndValue != '0') {
        search += '&priceEnd=' + (Number(priceEndValue)*100);
      }
      var areaBeginValue = $('#areaBegin').val();
      if (areaBeginValue && areaBeginValue != '0') {
        search += '&areaBegin=' + (Number(areaBeginValue)*100);
      }
      var areaEndValue = $('#areaEnd').val();
      if (areaEndValue && areaEndValue != '0') {
        search += '&areaEnd=' + (Number(areaEndValue)*100);
      }
      var roomValue = $('#room').val();
      if (roomValue && roomValue != '0') {
        var values = roomValue.split(':');
        if (values.length > 1) {
          search += '&symbol=' + values[1];
        }
        search += '&room=' + values[0];
      }
      var saloonValue = $('#saloon').val();
      if (saloonValue && saloonValue != '0') {
        search += '&saloon=' + saloonValue;
      }
      var toiletValue = $('#toilet').val();
      if (toiletValue && toiletValue != '0') {
        search += '&toilet=' + toiletValue;
      }
      
      var dateBeginValue = $('#dateBegin').val();
      if (dateBeginValue) {
        search += '&releaseDateBegin=' + dateBeginValue;
      }
      var dateEndValue = $('#dateEnd').val();
      if (dateEndValue) {
        search += '&releaseDateEnd=' + dateEndValue;
      }
      tableHouse.ajax.url('${ctx}/manage/house/queryHomeData' + search).load();
      d.close();
    });
		
		$('#btnHouseSave').click(function() {
			var buildingId = $('#buildingIdAdd').val();
			var houseId = $('#houseIdAdd').val();
      var title = $('#titleAdd').val();
      var price = $('#priceAdd').val();
      var content = $('#contentAdd').html();
      var url = '${ctx}/manage/trade/saveOrUpdate?random='+ Math.random();
      var params = {
    		  buildingId: buildingId,
    		  houseId: houseId,
    		  title: title,
    		  price: price * 100,
    		  type: '1',
    		  content: content
      };
      $.post(url, params, function(result) {
    	  $('#modal-add').modal('hide');
        dialog({
         title: '消息',
         content: result.message,
         okValue: '确定',
         ok: function () {
        	 tableHouse.ajax.reload();
           return true;
         }
       }).width(100).showModal();
      }, 'json');
		});
		
		$('#btnHouseUpdate').click(function() {
      var tradeId = $('#tradeId').val();
      var title = $('#titleEdit').val();
      var price = $('#priceEdit').val();
      var matchs = [];
      $('.match-edit').each(function() {
    	  var $this = $(this);
    	  if ($(this).is(':checked')) {
    		  matchs.push($this.val());
   	    }
      });
      var content = $('#contentEdit').html();
      var url = '${ctx}/manage/trade/saveOrUpdate?random='+ Math.random();
      var params = {
          id: tradeId,
          title: title,
          price: price * 100,
          matchs: matchs.join(),
          content: content
      };
      $.post(url, params, function(result) {
        $('#modal-edit').modal('hide');
        dialog({
         title: '消息',
         content: result.message,
         okValue: '确定',
         ok: function () {
           tableHouse.ajax.reload();
           return true;
         }
       }).width(100).showModal();
      }, 'json');
    });
		
		$('.content-editor').ace_wysiwyg({
	    toolbar:
	    [
	      'font',
	      null,
	      'fontSize',
	      null,
	      {name:'bold', className:'btn-info'},
	      {name:'italic', className:'btn-info'},
	      {name:'strikethrough', className:'btn-info'},
	      {name:'underline', className:'btn-info'},
	      null,
	      {name:'insertunorderedlist', className:'btn-success'},
	      {name:'insertorderedlist', className:'btn-success'},
	      {name:'outdent', className:'btn-purple'},
	      {name:'indent', className:'btn-purple'},
	      null,
	      {name:'justifyleft', className:'btn-primary'},
	      {name:'justifycenter', className:'btn-primary'},
	      {name:'justifyright', className:'btn-primary'},
	      {name:'justifyfull', className:'btn-inverse'},
	      null,
	      {name:'createLink', className:'btn-pink'},
	      {name:'unlink', className:'btn-pink'},
	      null,
	      {name:'insertImage', className:'btn-success'},
	      null,
	      'foreColor',
	      null,
	      {name:'undo', className:'btn-grey'},
	      {name:'redo', className:'btn-grey'}
	    ],
	    'wysiwyg': {
	      fileUploadError: showErrorAlert
	    }
	  }).prev().addClass('wysiwyg-style2');
		
		$('#cardAdd').change(function() {
			var value = $(this).val();
			if(value) {
				var values = value.split(',');
				$('#houseIdAdd').val(values[0]);
				$('#areaAdd').val(jmoney(values[1]) + '㎡');
				$('#patternAdd').val(values[2] + '室' + values[3] + '厅' + values[4] + '卫');
				$('#faceAdd').val(values[5]);
			}
		});
		
		$('.img-tabs a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      var target = $(e.target).attr("aria-controls");
      if (target == 'activeImages') {
    	  queryActiveImages();
      } else if (target == 'buildingImages') {
        queryBuildingImages();
      } else if (target == 'houseImages') {
    	  queryHouseImages();
      } else if (target == 'myImages') {
        queryMyImages();
      }
    });
	});
	function showErrorAlert(reason, detail) {
    var msg='';
    if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
    else {
      console.log("error uploading file", reason, detail);
    }
    $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
     '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
  }
	function editHouse(tradeId, title) {
    var url = '${ctx}/manage/trade/getData?random='+ Math.random();
    var params = {
        id: tradeId
    };
    $.post(url, params, function(result) {
      if (result.status) {
    	  $('#smallTitle').html(title);
    	  $('#tradeId').val(tradeId);
    	  $('#titleEdit').val(result.data.title);
    	  $('#priceEdit').val(result.data.price/100);
    	  //$('#priceEdit').ace_spinner({value:result.data.price/100});
    	  var status = result.data.status;
    	  if (+status) {
          $('#statusEdit').attr('checked', 'checked');
        } else {
          $('#statusEdit').removeAttr('checked');
        }
    	  var map = new Map();
    	  var matchs = result.data.matchs;
    	  matchs = matchs.split(',');
    	  for (var i = 0; i < matchs.length; i++) {
    		  map.put(matchs[i], matchs[i]);
    	  }
    	  $('.match-edit').each(function() {
 	        var $this = $(this);
 	        if (map.containsKey($this.val())) {
 	        	$this.attr('checked', 'checked');
 	        }
 	      });
    	  $('#contentEdit').html(result.data.content);
        $('#modal-edit').modal('show');
      } else {
        dialog({
          title: '消息',
          content: result.message,
          okValue: '确定',
          ok: true
        }).width(100).showModal();
      }
    }, 'json');
  }
	function queryRegions(regionId, name, _this, fieldIds) {
    addActivedName(fieldIds[0], regionId, name, _this);
    var $towns = $('#' + fieldIds[1]);
    var $townsPane = $('#' + fieldIds[2]);
    $towns.children().not(':first').remove();
    if (regionId) {
      var url = '${ctx}/manage/region/list?random='+ Math.random();
      var params = {
        parentId: regionId
      };
      $.post(url, params, function(result) {
        if (result.status) {
          for (var i=0; i<result.data.length; i++) {
            $htmlLi = $('<li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName(\'' + fieldIds[1] + '\', \'' + result.data[i].id + '\', \'' + result.data[i].name + '\', this);">' + result.data[i].name + '</button></li>');
            $towns.append($htmlLi).append('\n');
          }
          $townsPane.show();
        }
      }, 'json');
    } else {
      $townsPane.hide();
      $towns.children(':first').children().removeClass('btn-link').addClass('btn-danger');
    }
  }
	function addActivedName(fieldId, val, name, _this) {
    $('#' + fieldId + ' li>button.btn-danger').removeClass('btn-danger').addClass('btn-link');
    if (_this) {
      $(_this).removeClass('btn-link').addClass('btn-danger');
    }
    $('#' + fieldId + 'Value').val(val);
  }
	function queryBuildingName(buildingName, buildingUnit, districts, towns) {
    $('#' + buildingName).autocompleter({
      // marker for autocomplete matches
      highlightMatches: true,
      // object to local or url to remote search
      source: '${ctx}/manage/building/search',
      // custom template
      template: '{{ label }} <span>({{ districtName }}-{{ townName }})</span>',
      // show hint
      hint: true,
      // abort source if empty field
      empty: false,
      // max results
      //limit: 1,
      combine: function() {
        var districtId = $('#' + districts).val();
        var townId = $('#' + towns).val();
        if (townId) {
          districtId = '';
        } else {
          townId = '';
        }
        return {
          buildingName: $('#' + buildingName).val(),
          districtId: districtId,
          townId: townId
        };
      },
      callback: function (value, index, selected) {
        if (selected) {
          var buildingId = selected.buildingId;
          if (buildingId) {
        	  $('#buildingIdAdd').val(buildingId);
            var url = '${ctx}/manage/buildingUnit/select?random='+ Math.random();
            var params = {
                buildingId: buildingId
            };
            $.post(url, params, function(result) {
              if (result.status) {
                var $buildingUnit = $('#' + buildingUnit);
                $buildingUnit.children().not(':first').remove();
                for(var i=0; i<result.data.length; i++) {
                  $buildingUnit.append('<option value="' + result.data[i].id + '">' + result.data[i].name + '</option>');
                }
              }
            }, 'json');
          }
        }
      }
    });
  }
	function changeBuildingUnit(buildingUnit, house) {
	  $('#' + buildingUnit).change(function() {
	    var buildingUnitId = $(this).val();
	    if (buildingUnitId) {
	      var url = '${ctx}/manage/house/select?random='+ Math.random();
	      var params = {
	          buildingUnitId: buildingUnitId
	      };
	      $.post(url, params, function(result) {
	        if (result.status) {
	          var $house = $('#' + house);
	          $house.children().not(':first').remove();
	          var items = [];
	          for(var i=0; i<result.data.length; i++) {
	            items.push(result.data[i].houseId);
	            items.push(result.data[i].area);
	            items.push(result.data[i].room);
	            items.push(result.data[i].saloon);
	            items.push(result.data[i].toilet);
	            items.push(result.data[i].faceName);
	            $house.append('<option value="' + items.join() + '">' + result.data[i].card + '</option>');
	            items.length = 0;
	          }
	        }
	      }, 'json');
	    }
	  });
	}
	function trashHouse(tradeId) {
    dialog({
      title: '消息',
      content: '确定要删除吗?',
      okValue: '确定',
      ok: function () {
        var that = this;
        that.title('删除中…');
        var url = '${ctx}/manage/trade/trash?random='+ Math.random();
        var params = {
            id: tradeId
        };
        $.post(url, params, function(result) {
          dialog({
            title: '消息',
            content: result.message,
            okValue: '确定',
            ok: function () {
              tableHouse.ajax.reload();
              return true;
            }
          }).width(100).showModal();
        }, 'json');
      },
      cancelValue: '取消',
      cancel: function () {}
    }).width(100).showModal();
  }
	function queryActiveImages() {
    var url = "${ctx}/manage/image/queryHomeData?random="+ Math.random();
    var params = {
      tradeId: $('#tradeId').val()
    };
    
    $.post(url, params, function(result) {
      if (result.status) {
        $('#activeImageThumbnails [data-rel="colorboxActive"]').colorbox().remove();
        var $imageThumbnails = $('#activeImageThumbnails');
        $imageThumbnails.children().remove();
        var data = result.data;
        $('#activeImagesNum').text(data.length);
        for (var i=0; i<data.length; i++) {
          var checked = '';
          var cover = data[i].cover;
          if (+cover) {
            checked = 'checked';
          }
          var content = '';
          content += '<li>';
          content += ' <div class="thumbnail">';
          content += '  <a href="${imageUrl}/' + data[i].url + '" title="' + data[i].title + '" data-rel="colorboxActive">';
          content += '   <img src="${imageUrl}/' + data[i].thumb + '" alt="...">';
          content += '  </a>';
          content += '  <div class="caption">';
          content += '    <h6><input class="form-control" type="text" id="inputActive_' + data[i].activeId + '" value="' + data[i].title + '" readonly></h6>';
          content += '    <label class="switch-box">';
          content += '      <input class="ace ace-switch ace-switch-3" type="checkbox" id="statusActive_' + data[i].activeId + '" onclick="coverImage(this, \'' + data[i].activeId + '\', \'' + data[i].id + '\')" value="' + data[i].activeId + '" ' + checked + '>';
          content += '      <span class="lbl"></span>';
          content += '    </label>';
          content += '    <p><input type="text" id="spinnerActive_' + data[i].activeId + '" /></p>';
          content += '    <p class="action-buttons"><a class="green" href="#" onclick="saveActiveImage(\'' + data[i].activeId + '\')" title="保存"><i class="icon-save bigger-130"></i></a><a class="red" href="#" onclick="trashActiveImage(\'' + data[i].activeId + '\');" title="删除"><i class="icon-trash bigger-130"></i></a></p>';
          content += '  </div>';
          content += ' </div>';
          content += '</li>';
          $imageThumbnails.append(content);
          var sort = data[i].sort;
          $('#spinnerActive_' + data[i].activeId).ace_spinner({value:sort,min:0,max:200,step:1, btn_up_class:'btn-info' , btn_down_class:'btn-info'})
          .on('change', function(){
            //alert(this.value)
          });
        }
        $('#activeImageThumbnails [data-rel="colorboxActive"]').colorbox(colorbox_params);
      }
    }, 'json');
  }
	function coverImage(_this, activeId, imageId) {
		var cover = '0';
		if ($(_this).is(':checked')) {
			cover = '1';
		}
		var url = '${ctx}/manage/tradeImage/cover?random='+ Math.random();
    var params = {
        id: activeId,
        tradeId: $('#tradeId').val(),
        imageId: imageId,
        cover: cover
    };
    $.post(url, params, function(result) {
      dialog({
       title: '消息',
       content: result.message,
       okValue: '确定',
       ok: function () {
    	   if (result.status) {
    		   queryActiveImages();
         }
         return true;
       }
     }).width(100).showModal();
    }, 'json');
	}
	function saveActiveImage(activeId) {
    var url = '${ctx}/manage/tradeImage/update?random='+ Math.random();
    var params = {
        id: activeId,
        sort: $('#spinnerActive_' + activeId).val()
    };
    $.post(url, params, function(result) {
      dialog({
       title: '消息',
       content: result.message,
       okValue: '确定',
       ok: true
     }).width(100).showModal();
    }, 'json');
  }
	function trashActiveImage(activeId) {
    dialog({
      title: '消息',
      content: '确定要删除吗?',
      okValue: '确定',
      ok: function () {
        var that = this;
         that.title('删除中…');
         var url = '${ctx}/manage/tradeImage/trash?random='+ Math.random();
         var params = {
             id: activeId
         };
         $.post(url, params, function(result) {
           dialog({
             title: '消息',
             content: result.message,
             okValue: '确定',
             ok: function () {
            	 if (result.status) {
            		 queryActiveImages();
            	 }
               return true;
             }
           }).width(100).showModal();
         }, 'json');
      },
      cancelValue: '取消',
      cancel: function () {}
    }).width(100).showModal();
  }
	function queryHouseImages() {
    var url = "${ctx}/manage/image/queryData?random="+ Math.random();
    var params = {
      foreignId: $('#houseId').val()
    };
    
    $.post(url, params, function(result) {
      if (result.status) {
        $('#houseImageThumbnails [data-rel="colorboxHouse"]').colorbox().remove();
        var $imageThumbnails = $('#houseImageThumbnails');
        $imageThumbnails.children().remove();
        var data = result.data;
        $('#houseImagesNum').text(data.length);
        for (var i=0; i<data.length; i++) {
        	var checked = '';
        	var activeId = data[i].activeId;
        	if (activeId) {
        		checked = 'checked';
        	} else {
            activeId = '';
          }
          var content = '';
          content += '<li>';
          content += ' <div class="thumbnail">';
          content += '  <a href="${imageUrl}/' + data[i].url + '" title="' + data[i].title + '" data-rel="colorboxHouse">';
          content += '   <img src="${imageUrl}/' + data[i].thumb + '" alt="...">';
          content += '  </a>';
          content += '  <div class="caption">';
          content += '    <h6><input class="form-control" type="text" id="inputHouse_' + data[i].id + '" value="' + data[i].title + '" readonly></h6>';
          content += '    <label class="switch-box">';
          content += '      <input class="ace ace-switch ace-switch-3" type="checkbox" id="statusHouse_' + data[i].id + '" onclick="switchImage(this, \'' + data[i].id + '\')" value="' + activeId + '" ' + checked + '>';
          content += '      <span class="lbl"></span>';
          content += '    </label>';
          content += '   </div>';
          content += ' </div>';
          content += '</li>';
          $imageThumbnails.append(content);
        }
        $('#houseImageThumbnails [data-rel="colorboxHouse"]').colorbox(colorbox_params);
      }
    }, 'json');
  }
	function queryMyImages() {
    var url = "${ctx}/manage/image/queryMyData?random="+ Math.random();
    var params = {
      foreignId: $('#houseId').val()
    };
    
    $.post(url, params, function(result) {
      if (result.status) {
        $('#myImageThumbnails [data-rel="colorboxMy"]').colorbox().remove();
        var $imageThumbnails = $('#myImageThumbnails');
        $imageThumbnails.children().remove();
        var data = result.data;
        $('#myImagesNum').text(data.length);
        for (var i=0; i<data.length; i++) {
          var checked = '';
          var activeId = data[i].activeId;
          if (activeId) {
            checked = 'checked';
          } else {
            activeId = '';
          }
          var content = '';
          content += '<li>';
          content += ' <div class="thumbnail">';
          content += '  <a href="${imageUrl}/' + data[i].url + '" title="' + data[i].title + '" data-rel="colorboxMy">';
          content += '   <img src="${imageUrl}/' + data[i].thumb + '" alt="...">';
          content += '  </a>';
          content += '  <div class="caption">';
          content += '    <h6><span id="titleMy_' + data[i].id + '">' + data[i].title + '</span><input class="form-control" type="text" id="inputMy_' + data[i].id + '" value="' + data[i].title + '"></h6>';
          content += '    <label class="switch-box">';
          content += '      <input class="ace ace-switch ace-switch-3" type="checkbox" id="statusMy_' + data[i].id + '" onclick="switchImage(this, \'' + data[i].id + '\')" value="' + activeId + '" ' + checked + '>';
          content += '      <span class="lbl"></span>';
          content += '    </label>';
          content += '    <p class="action-buttons"><a class="green" href="#" onclick="saveImage(\'' + data[i].id + '\')" title="保存"><i class="icon-save bigger-130"></i></a><a class="red" href="#" onclick="trashImage(\'' + data[i].id + '\');" title="删除"><i class="icon-trash bigger-130"></i></a></p>';
          content += '   </div>';
          content += ' </div>';
          content += '</li>';
          $imageThumbnails.append(content);
          $('#titleMy_' + data[i].id).hide();
        }
        $('#myImageThumbnails [data-rel="colorboxMy"]').colorbox(colorbox_params);
      }
    }, 'json');
  }
	function queryBuildingImages() {
    var url = "${ctx}/manage/image/queryData?random="+ Math.random();
    var params = {
      foreignId: $('#buildingId').val()
    };
    
    $.post(url, params, function(result) {
      if (result.status) {
        $('#buildingImageThumbnails [data-rel="colorboxBuilding"]').colorbox().remove();
        var $imageThumbnails = $('#buildingImageThumbnails');
        $imageThumbnails.children().remove();
        var data = result.data;
        $('#buildingImagesNum').text(data.length);
        for (var i=0; i<data.length; i++) {
        	var checked = '';
          var activeId = data[i].activeId;
          if (activeId) {
            checked = 'checked';
          } else {
        	  activeId = '';
          }
          var content = '';
          content += '<li>';
          content += ' <div class="thumbnail">';
          content += '  <a href="${imageUrl}/' + data[i].url + '" title="' + data[i].title + '" data-rel="colorboxBuilding">';
          content += '   <img src="${imageUrl}/' + data[i].thumb + '" alt="...">';
          content += '  </a>';
          content += '  <div class="caption">';
          content += '    <h6><input class="form-control" type="text" id="inputBuilding_' + data[i].id + '" value="' + data[i].title + '" readonly></h6>';
          content += '    <label class="switch-box">';
        	content += '      <input class="ace ace-switch ace-switch-3" type="checkbox" id="statusBuilding_' + data[i].id + '" onclick="switchImage(this, \'' + data[i].id + '\')" value="' + activeId + '" ' + checked + '>';
          content += '      <span class="lbl"></span>';
          content += '    </label>';
          content += '   </div>';
          content += ' </div>';
          content += '</li>';
          $imageThumbnails.append(content);
        }
        $('#buildingImageThumbnails [data-rel="colorboxBuilding"]').colorbox(colorbox_params);
      }
    }, 'json');
  }
	function switchImage(_this, imageId) {
		if ($(_this).is(':checked')) {
			saveTradeImage(_this, imageId);
		} else {
			trashTradeImage(_this);
		}
	}
	function saveTradeImage(_this, imageId) {
		var url = "${ctx}/manage/tradeImage/saveData?random="+ Math.random();
    var params = {
    		buildingId: $('#buildingId').val(),
    		houseId: $('#houseId').val(),
        tradeId: $('#tradeId').val(),
        imageId: imageId
    };
    $.post(url, params, function(result) {
    	if (result.status) {
    		$(_this).val(result.data);
    	}
    	dialog({
        title: '消息',
        content: result.message,
        okValue: '确定',
        ok: true
      }).width(100).showModal();
    }, 'json');
	}
	function trashTradeImage(_this) {
		var url = "${ctx}/manage/tradeImage/trash?random="+ Math.random();
    var params = {
        id: $(_this).val()
    };
    $.post(url, params, function(result) {
    	if (result.status) {
        $(_this).val('');
      } 
    	dialog({
        title: '消息',
        content: result.message,
        okValue: '确定',
        ok: true
      }).width(100).showModal();
    }, 'json');
	}
	function saveImage(imageId) {
    var url = '${ctx}/manage/image/update?random='+ Math.random();
    var params = {
        id: imageId,
        title: $('#inputMy_' + imageId).val()
    };
    $.post(url, params, function(result) {
      dialog({
       title: '消息',
       content: result.message,
       okValue: '确定',
       ok: true
     }).width(100).showModal();
    }, 'json');
  }
	function trashImage(imageId) {
    dialog({
      title: '消息',
      content: '确定要删除吗?',
      okValue: '确定',
      ok: function () {
        var that = this;
         that.title('删除中…');
         var url = '${ctx}/manage/file/trash?random='+ Math.random();
         var params = {
             id: imageId
         };
         $.post(url, params, function(result) {
           dialog({
             title: '消息',
             content: result.message,
             okValue: '确定',
             ok: function () {
               if (result.status) {
                 queryMyImages();
               }
               return true;
             }
           }).width(100).showModal();
         }, 'json');
      },
      cancelValue: '取消',
      cancel: function () {}
    }).width(100).showModal();
  }
	function dropzoneImage(foreignId, type) {
    var params = '?random=' + Math.random();
    try {
      $(".dropzone").dropzone({
        url: '${ctx}/manage/file/uploadMy' + params,
        paramName: 'file', // The name that will be used to transfer the file
        acceptedFiles: 'image/*',
        maxFilesize: 0.5, // MB
        addRemoveLinks : true,
        dictDefaultMessage: '<span class="bigger-150 bolder"><i class="icon-caret-right red"></i> 选择图片</span> 上传 \<span class="smaller-80 grey">(或者点击下面图标)</span> <br /> \<i class="upload-icon icon-cloud-upload blue icon-3x"></i>',
        dictResponseError: '上传失败',
        //dictInvalidFileType: '你不能上传该类型文件,文件类型只能是*.xls',
        dictRemoveFile: '删除文件',
        dictCancelUpload: '取消上传',
        dictCancelUploadConfirmation: '你确定要取消上传吗?',
        previewTemplate: '<div class="dz-preview dz-file-preview">\n  <div class="dz-details">\n    <div class="dz-filename"><span data-dz-name></span></div>\n    <div class="dz-size" data-dz-size></div>\n    <img data-dz-thumbnail />\n  </div>\n  <div class="progress progress-small progress-striped active"><div class="progress-bar progress-bar-success" data-dz-uploadprogress></div></div>\n  <div class="dz-success-mark"><span></span></div>\n  <div class="dz-error-mark"><span></span></div>\n  <div class="dz-error-message error-message-tip"><span data-dz-errormessage></span></div>\n</div>',
        params: {
          foreignId: foreignId,
          type: type
        },
        init: function() {
          this.on("success", function(file, result) {
            if (file.status == 'success') {
              if (!result.status) {
                $('.dz-preview').removeClass('dz-success').addClass('dz-error');
                $('.dz-error-message span').html('上传失败');
              }
            }
          });
          this.on("complete", function(file) {
            if (file.status == 'error') {
              $('.dz-error-message span').html('上传失败');
            }
          });
        },
        removedfile: function(file) {
          if (file.status == 'success') {
            var result = JSON.parse(file.xhr.response);
            if (result.status) {
              dialog({
                title: '消息',
                content: '确定要删除吗?',
                okValue: '确定',
                ok: function () {
                  var that = this;
                  this.title('删除中…');
                  var url = '${ctx}/manage/file/trash?random='+ Math.random();
                  var params = {
                      id: result.data.id
                  };
                  $.post(url, params, function(results) {
                    dialog({
                      title: '消息',
                      content: results.message,
                      okValue: '确定',
                      ok: function () {
                        if (results.status) {
                          var _ref;
                          return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
                        }
                        return true;
                      }
                    }).width(100).showModal();
                  }, 'json');
                },
                cancelValue: '取消',
                cancel: function () {}
              }).width(100).showModal();
            } else {
              var _ref;
              return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
            }
          }
        }
      });
      //console.log($dropzone);
    } catch(e) {
      //alert('Dropzone.js does not support older browsers!');
    }
  }
	</script>
	</jscript>
</body>
</html>
