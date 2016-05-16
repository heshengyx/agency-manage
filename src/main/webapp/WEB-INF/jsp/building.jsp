<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%> 
<html>
<head>
  <title>楼盘-爱房网</title>
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
  </style>
  </css>
</head>
<body>
	<div class="main-content">
	  <div class="breadcrumbs" id="breadcrumbs">
	    <ul class="breadcrumb">
	      <li><i class="icon-home home-icon"></i><a href="#">小区</a></li>
	      <li class="active">楼盘</li>
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
            <h5>楼盘搜索</h5>
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
		                    <div class="col-md-3">
		                      <div class="input-group">
		                        <input class="input-field" type="text" id="buildingName" placeholder="楼盘名称">
		                        <span class="input-group-addon"><i class="icon-home"></i></span>
                          </div>
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
                              <button type="button" class="btn btn-info btn-xs" id="btnBuildingSearch">搜索<i class="icon-search icon-on-right"></i></button>
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
      <input id="buildingId" type="hidden" value="0">
      
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
		          <h5><i class="icon-table"></i>楼盘列表</h5>
	            <div class="widget-toolbar">
	              <button class="btn btn-minier btn-purple" data-toggle="modal" data-target="#modal-form">新增<i class="icon-edit align-top icon-on-right"></i>
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
			          <table id="tableBuilding" class="table table-striped table-bordered table-hover" width="100%">
			            <thead>
			              <tr>
			                <th width="50"></th>
			                <th class="text-center" width="50"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></th>
			                <th>楼盘名称</th>
			                <th class="text-center" width="70">类型</th>
			                <th width="130"><i class="icon-time hidden-480"></i>创建时间</th>
			                <th class="text-center hidden-480" width="80">状态</th>
			                <th class="text-center" width="140">操作</th>
			              </tr>
			            </thead>
			          </table>
			        </div>
		        </div>
	        </div>
	        
	        <!-- modal-form -->
	        <div id="modal-form" class="modal" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-body overflow-visible modal-body-content">
                  <div class="widget-container-span">
                    <div class="widget-box transparent">
						          <div class="widget-header">
						            <h6>楼盘新增</h6>
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
					                            <li><button type="button" class="btn btn-danger btn-xs" onclick="queryRegions('', '', this, ['districtsAdd', 'townsAdd', 'townsPaneAdd']);">不限</button></li>
					                            <c:forEach var="data" items="${regions}">
					                            <li><button type="button" class="btn btn-link btn-xs" onclick="queryRegions('${data.id}', '${data.name}', this, ['districtsAdd', 'townsAdd', 'townsPaneAdd']);">${data.name}</button></li>
					                            </c:forEach> 
					                          </ul>
					                          <div id="townsPaneAdd">
					                            <hr class="hr-line">
					                            <ul class="list-inline" id="townsAdd">
					                              <li><button type="button" class="btn btn-danger btn-xs">不限</button></li>
					                            </ul>
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
                  </div>
                  <table class="table table-search">
                  <tbody>
                    <tr>
                      <td>
                        <form class="form-horizontal">
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
                            <label class="col-md-2 control-label no-padding-right">地址：</label>
                            <div class="col-md-8">
                              <input class="input-field" type="text" id="buildingAddressAdd" placeholder="楼盘地址">
                            </div>
                          </div>
                          <div class="form-group form-row">
                            <label class="col-md-2 control-label no-padding-right">建筑年代：</label>
                            <div class="col-md-2">
                              <input class="input-text" type="text" id="buildingYearAdd" placeholder="建筑年代">
                            </div>
                            <label class="col-md-2 control-label no-padding-right">类型：</label>
                            <div class="col-md-2">
                              <select class="input-select" id="typeAdd">
	                              <option value="0">选择类型</option>
	                              <option value="1">住宅</option>
	                            </select>
                            </div>
                          </div>
                          <div class="form-group form-row">
                            <label class="col-md-2 control-label no-padding-right">描述：</label>
                            <div class="col-md-10">
                              <div class="wysiwyg-editor" id="editor1"></div>
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
                  <button class="btn btn-xs btn-primary" id="btnBuildingSave"><i class="icon-ok"></i>保存</button>
                </div>
              </div>
            </div>
          </div>
          <!-- modal-form -->
          <!-- modal-table -->
          <div id="modal-table" class="modal fade modal-pane" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header no-padding">
                  <div class="table-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                      <span class="white">&times;</span>
                    </button>
                    <span id="buildingNameText"></span><small>（<span id="buildingAddressText"></span>）</small>
                  </div>
                </div>

                <div class="modal-body no-padding">
                  <form class="form-horizontal">
                    <div class="form-group form-row">
	                    <label class="col-md-2 control-label no-padding-right">栋座：</label>
	                    <div class="col-md-8">
	                      <input type="text" id="buildingUnitNameAdd" placeholder="栋座名称">
	                    </div>
	                  </div>
	                  <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">楼层：</label>
                      <div class="col-md-8">
                        <input class="input-text" type="text" id="buildingFloorAdd" placeholder="楼层">
                      </div>
                    </div>
                    <div class="form-group form-row">
                      <div class="col-md-3 col-md-offset-2">
                        <div class="input-group">
                          <span class="input-group-btn">
                            <button type="button" class="btn btn-info btn-xs" id="btnBuildingUnitSave">保存<i class="icon-ok icon-on-right"></i></button>
                            &nbsp;&nbsp;
                            <button type="reset" class="btn btn-xs">重置<i class="icon-undo icon-on-right"></i></button>
                          </span>
                        </div>
                      </div>  
                    </div>
                  </form>
                  <div class="space-4"></div>
                  <table class="table table-striped table-bordered table-hover no-margin-bottom" id="tableBuildingUnit">
                    <thead>
                      <tr>
                        <th width="50"></th>
                        <th class="text-center" width="50"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></th>
                        <th>栋座名称</th>
                        <th>楼层</th>
                        <th class="text-center" width="130">操作</th>
                      </tr>
                    </thead>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <!-- modal-table -->
          <!-- modal-image -->
          <div id="modal-image" class="modal fade modal-pane" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header no-padding">
                  <div class="table-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                      <span class="white">&times;</span>
                    </button>
                    <span id="buildingNameImageText"></span><small>（<span id="buildingAddressImageText"></span>）</small>
                  </div>
                </div>

                <div class="modal-body no-padding">
                  <!-- <form action="//dummy.html" class="dropzone">
                    <div class="fallback">
                      <input name="file" type="file" multiple="" />
                    </div>
                  </form> -->
                  <div class="tabbable">
                    <ul class="nav nav-tabs img-tabs">
                      <li class="active">
                        <a href="#buildingImages" data-toggle="tab" aria-controls="buildingImages">
                          <i class="green icon-picture bigger-110"></i>楼盘图片
                          <span class="badge badge-danger" id="imagesNum">0</span>
                        </a>
                      </li>
                      <li>
                        <a href="#uploadImage" data-toggle="tab" aria-controls="uploadImage">
                          <i class="purple icon-cloud-upload bigger-110"></i>上传图片
                        </a>
                      </li>
                    </ul>

                    <div class="tab-content">
                      <div id="buildingImages" class="tab-pane in active">
                        <ul class="ace-thumbnails" id="imageThumbnails">
                          <%-- <li>
                            <a href="${ctx}/images/gallery/image-4.jpg" data-rel="colorbox">
                              <img alt="150x150" src="${ctx}/images/gallery/thumb-4.jpg" />
                            </a>
                            <div class="tags">
                              <span class="label-holder">
                                <span class="label label-info arrowed">客厅</span>
                              </span>
                            </div>
                            <div class="tools tools-top">
                              <a href="#"><i class="icon-link"></i></a>
                              <a href="#"><i class="icon-paper-clip"></i></a>
                              <a href="#"><i class="icon-pencil"></i></a>
                              <a href="#"><i class="icon-remove red"></i></a>
                            </div>
                          </li> --%>                         
                        </ul>
                        <div class="clearfix"></div>
                      </div>

                      <div id="uploadImage" class="tab-pane">
                        <div class="alert alert-info">
                          <i class="icon-hand-right"></i>
                                                                    楼盘图片上传格式为：.jpg、.gif、.png
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
          
          <!--  -->
          <div id="preview-template" style="display: none;">
	          <div class="dz-preview dz-file-preview">
						  <div class="dz-details">
						    <div class="dz-filename"><span data-dz-name></span></div>
						    <div class="dz-size" data-dz-size></div>
						    <img data-dz-thumbnail />
						  </div>
						  <div class="dz-progress"><span class="dz-upload" data-dz-uploadprogress></span></div>
						  <div class="dz-success-mark"><span>✔</span></div>
						  <div class="dz-error-mark"><span>✘</span></div>
						  <div class="dz-error-message"><span data-dz-errormessage></span></div>
						</div>
					</div>
          <!--  -->
	        <!-- PAGE CONTENT ENDS -->
	      </div><!-- /.col -->
	    </div><!-- /.row -->
	  </div><!-- /.page-content -->
	</div><!-- /.main-content -->
	<jscript>
	<script src="${ctx}/js/format-util.js"></script>
	<script src="${ctx}/js/jquery.dataTables.min.js"></script>
  <script src="${ctx}/js/dataTables.bootstrap.js"></script>
  <script src="${ctx}/js/jquery.autocompleter.js"></script>
  <script src="${ctx}/js/date-time/bootstrap-datepicker.min.js"></script>
  <script src="${ctx}/js/bootbox.min.js"></script>
  <script src="${ctx}/js/jquery.hotkeys.min.js"></script>
  <script src="${ctx}/js/bootstrap-wysiwyg.min.js"></script>
  <script src="${ctx}/js/dropzone.min.js"></script>
  <script src="${ctx}/js/jquery.colorbox-min.js"></script>
  <script src="${ctx}/js/fuelux/fuelux.spinner.min.js"></script>
	<script>
	var d = null;
	var tableBuilding = null;
	var tableBuildingUnit = null;
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
		/* $("#bootbox-confirm").on(ace.click_event, function() {
      bootbox.confirm("Are you sure?", function(result) {
        if(result) {
          //
        }
      });
    }); */
    Dropzone.options.myAwesomeDropzone = false;
    Dropzone.autoDiscover = false;
    //$('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
    //$("#cboxLoadingGraphic").append("<i class='icon-spinner orange'></i>");
    
    //$(".dropzone").dropzone({});
    /* var params = '?random=' + Math.random();
    //params += '&foreignId=1';
    params += '&type=2';
    //Dropzone.autoDiscover = false;
    try {
      $(".dropzone").dropzone({
        url: '${ctx}/manage/file/upload' + params,
        paramName: 'file', // The name that will be used to transfer the file
        maxFilesize: 0.5, // MB
        addRemoveLinks : true,
        params: {
        	foreignId: $('#buildingId').val()
        },
        dictDefaultMessage :'<span class="bigger-150 bolder"><i class="icon-caret-right red"></i> 选择图片</span> 上传 \<span class="smaller-80 grey">(或者点击下面图标)</span> <br /> \<i class="upload-icon icon-cloud-upload blue icon-3x"></i>',
        dictResponseError: 'Error while uploading file!',
        //change the previewTemplate to use Bootstrap progress bars
        previewTemplate: "<div class=\"dz-preview dz-file-preview\">\n  <div class=\"dz-details\">\n    <div class=\"dz-filename\"><span data-dz-name></span></div>\n    <div class=\"dz-size\" data-dz-size></div>\n    <img data-dz-thumbnail />\n  </div>\n  <div class=\"progress progress-small progress-striped active\"><div class=\"progress-bar progress-bar-success\" data-dz-uploadprogress></div></div>\n  <div class=\"dz-success-mark\"><span></span></div>\n  <div class=\"dz-error-mark\"><span></span></div>\n  <div class=\"dz-error-message error-message-tip\"><span data-dz-errormessage></span></div>\n</div>"
      });
    } catch(e) {
      alert('Dropzone.js does not support older browsers!');
    } */
    
		$('#townsPane').hide();
		$('#townsPaneAdd').hide();
		tableBuilding = $('#tableBuilding').DataTable({
			'language': {
         'processing':  '处理中...',
         'lengthMenu':  '每页 _MENU_ 条记录',
         'zeroRecords': '没有找到记录',
         'infoEmpty':   '无记录',
         'info':        '当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录',
         'paginate': {
           'first':     '首页',
           'previous':  '上页 ',
           'next':      '下页 ',
           'last':      '末页 '
         }
      },
      'dom': 't<"row"<"col-xs-6"i><"col-xs-6"p>>',
      'processing': true,
      'serverSide': true, //开启服务器模式
      //'deferRender': true, //开启延迟渲染
      'ajax': {
        'url': '${ctx}/manage/building/queryManageData',
        'type': 'POST',
        'data': function ( d ) { //添加额外的参数发送到服务器
          //d.tag = 'release';
          //d.sort = $('#sort').val();
        }
      },
			'columnDefs': [
        { 'orderable': false, 'targets': 0},
        { 'orderable': false, 'targets': 1, 'render': function(data, type, row) {
          var content = '<div class="text-center"><label>';
          content += '<input type="checkbox" class="ace" />';
          content += '<span class="lbl"></span>';
          content += '</label></div>';
          return content;
        }},
        { 'orderable': false, 'targets': 2, 'render': function(data, type, row) {
          var content = '';
          content += data.buildingName + '<small>（' + data.districtName + '-' + data.townName + '）</small><br>';
          content += '<small class="text-muted">' + data.buildingAddress + '</small>'
          return content;
        }},
        { 'orderable': false, 'targets': 3, 'render': function(data, type, row) {
          var content = '<div class="text-center">';
          content += '<small>住宅</small>';
          content += '</div>';
          return content;
        }},
        { 'targets': 4, 'render': function(data, type, row) {
          var content = to_date_hm(data.createTime);
          return content;
        }},
        { 'orderable': false, 'targets': 5, 'render': function(data, type, row) {
          var content = '<div class="text-center">';
          content += '<span class="label label-sm label-warning">有效</span>';
          content += '</div>';
          return content;
        }},
        { 'orderable': false, 'targets': 6, 'render': function(data, type, row) {
        	var content = '<div class="text-center">';
          content += '<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">';
          content += '  <a class="blue" href="#modal-table" role="button" data-toggle="modal" data-building="' + data.buildingId + '" title="栋座"><i class="icon-building bigger-130"></i></a>';
          content += '  <a class="blue" href="#modal-image" role="button" data-toggle="modal" data-building="' + data.buildingId + '" title="图片"><i class="icon-picture bigger-130"></i></a><br>';
          content += '  <a class="blue" href="#" title="详情"><i class="icon-zoom-in bigger-130"></i></a>';
          content += '  <a class="green" href="#" title="编辑"><i class="icon-pencil bigger-130"></i></a>';
          content += '  <a class="red" href="#" title="删除"><i class="icon-trash bigger-130"></i></a>';
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
			'order': [
        [0, null]
      ],
      'columns': [
        { 'data': null },
        { 'data': null },
        { 'data': null },
        { 'data': null },
        { 'data': null },
        { 'data': null },
        { 'data': null }
      ],
      initComplete: function () {
    	  
      }
		});
		tableBuilding.on('order.dt search.dt',
      function () {
			  tableBuilding.column(0, {
          search: 'applied',
          order: 'applied'
        }).nodes().each(function (cell, i) {
          cell.innerHTML = i + 1;
        });
    }).draw();
		 
		tableBuildingUnit = $('#tableBuildingUnit').DataTable({
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
        'url': '${ctx}/manage/buildingUnit/queryManageData',
        'type': 'POST',
        'data': function ( d ) { //添加额外的参数发送到服务器
          d.buildingId = $('#buildingId').val();
          //d.sort = $('#sort').val();
        }
      },
      /* "rowCallback": function( row, data ) {
          if ( $.inArray(data.DT_RowId, selected) !== -1 ) {
              $(row).addClass('selected');
          }
      }, */
      'columnDefs': [
        { 'orderable': false, 'targets': 0},
        { 'orderable': false, 'targets': 1, 'render': function(data, type, row) {
          var content = '<div class="text-center"><label>';
          content += '<input type="checkbox" class="ace" />';
          content += '<span class="lbl"></span>';
          content += '</label></div>';
          return content;
        }},
			  { 'orderable': false, 'targets': 4, 'render': function(data, type, row) {
          var content = '<div class="text-center">';
          content += '<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">';
          content += '  <a class="blue" href="#" title="详情"><i class="icon-zoom-in bigger-130"></i></a>';
          content += '  <a class="green" href="#" title="编辑"><i class="icon-pencil bigger-130"></i></a>';
          content += '  <a class="red" href="#" onclick="trashBuildingUnit(\'' + data.id + '\');" title="删除"><i class="icon-trash bigger-130"></i></a>';
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
      'order': [
        [0, null]
      ],
      'columns': [
				{ 'data': null },
				{ 'data': null },
        { 'data': 'name' },
        { 'data': 'floor' },
        { 'data': null }
      ]
    });
		tableBuildingUnit.on('order.dt search.dt',
	     function () {
			tableBuildingUnit.column(0, {
	         search: 'applied',
	         order: 'applied'
	       }).nodes().each(function (cell, i) {
	         cell.innerHTML = i + 1;
	       });
	  }).draw();
		
		queryBuildingName('buildingName', 'buildingUnit', 'districtsValue', 'townsValue');
		
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
      $(this).prev().focus();
    });
		
		$('#btnBuildingSearch').click(function() {
			queryBuildings();
		});
		
		$('#btnBuildingSave').click(function() {
			var townId = $('#townsAddValue').val();
      var buildingName = $('#buildingNameAdd').val();
      var buildingAddress = $('#buildingAddressAdd').val();
      var buildingYear = $('#buildingYearAdd').val();
      var type = $('#typeAdd').val();
      var remarks = $('#editor1').html();
      var url = '${ctx}/manage/building/save?random='+ Math.random();
      var params = {
    		  townId: townId,
    		  buildingName: buildingName,
    		  buildingAddress: buildingAddress,
    		  buildingYear: buildingYear,
    		  type: type
      };
      $.post(url, params, function(result) {
    	  $('#modal-form').modal('hide');
    	  dialog({
	       title: '消息',
	       content: result.message,
	       okValue: '确定',
	       ok: function () {
	    	   queryBuildings();
	    	   return true;
	       }
	     }).width(100).showModal();
      }, 'json');
		});
		
		$('#btnBuildingUnitSave').click(function() {
			var buildingId = $('#buildingId').val();
      var buildingUnitName = $('#buildingUnitNameAdd').val();
      var buildingFloor = $('#buildingFloorAdd').val();
      var url = '${ctx}/manage/buildingUnit/save?random='+ Math.random();
      var params = {
    		  buildingId: buildingId,
    		  name: buildingUnitName,
    		  floor: buildingFloor
      };
      $.post(url, params, function(result) {
        //$('#modal-table').modal('hide');
        dialog({
         title: '消息',
         content: result.message,
         okValue: '确定',
         ok: function () {
        	 tableBuildingUnit.ajax.reload();
           return true;
         }
       }).width(100).showModal();
      }, 'json');
    });
		
		$('#modal-table').on('show.bs.modal', function (event) {
			var button = $(event.relatedTarget);
			var buildingId = button.data('building');
			$('#buildingId').val(buildingId);
			var url = "${ctx}/manage/building/getData?random="+ Math.random();
      var params = {
          id: buildingId
      };
      $.post(url, params, function(result) {
        if (result.status) {
        	var data = result.data;
        	$('#buildingNameText').text(data.buildingName);
        	$('#buildingAddressText').text(data.buildingAddress);
        	
        	//tableBuildingUnit.search(buildingId).draw();
        	tableBuildingUnit.ajax.reload();
        	//var args = tableBuildingUnit.ajax.params();
          //console.log("额外传到后台的参数值extra_search为："+args.buildingId);
        }
      }, 'json');
		});
		
		$('#modal-image').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget);
      var buildingId = button.data('building');
      $('#buildingId').val(buildingId);
      var url = "${ctx}/manage/building/getData?random="+ Math.random();
      var params = {
          id: buildingId
      };
      $.post(url, params, function(result) {
        if (result.status) {
          var data = result.data;
          $('#buildingNameImageText').text(data.buildingName);
          $('#buildingAddressImageText').text(data.buildingAddress);
          queryBuildingImages();
          dropzoneImage(buildingId, '2');
        }
      }, 'json');
    });
		$('#modal-image').on('hidden.bs.modal', function (event) {
		  //alert(1);
		});
		
		$('#editor1').ace_wysiwyg({
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
		
		$('.img-tabs a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      //e.target // newly activated tab
      //e.relatedTarget // previous active tab
      var target = $(e.target).attr("aria-controls");
      if (target == 'buildingImages') {
    	  queryBuildingImages();
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
	function queryBuildings() {
		d = dialog({
      title: '楼盘载入中...'
    });
    d.showModal();
    var search = '?random=' + Math.random();
    var townsValue = $('#townsValue').val();
    if (townsValue && townsValue != '0') {
      search += '&townId=' + townsValue;
    } else {
      var districtsValue = $('#districtsValue').val();
      if (districtsValue && districtsValue != '0') {
        search += '&districtId=' + districtsValue;
      }
    }
    var buildingNameValue = $('#buildingName').val();
    if (buildingNameValue) {
    	search += '&buildingName=' + buildingNameValue;
    }
    var dateBeginValue = $('#dateBegin').val();
    if (dateBeginValue) {
      search += '&createDateBegin=' + dateBeginValue;
    }
    var dateEndValue = $('#dateEnd').val();
    if (dateEndValue) {
      search += '&createDateEnd=' + dateEndValue;
    }
    tableBuilding.ajax.url('${ctx}/manage/building/queryManageData' + search).load();
    d.close();
	}
	function queryBuildingUnits() {
		d = dialog({
      title: '栋座载入中...'
    });
    d.showModal();
	}
	function queryBuildingImages() {
		var url = "${ctx}/manage/image/queryData?random="+ Math.random();
    var params = {
      foreignId: $('#buildingId').val()
    };
    
    $.post(url, params, function(result) {
      if (result.status) {
        $('.ace-thumbnails [data-rel="colorbox"]').colorbox().remove();
        var $imageThumbnails = $('#imageThumbnails');
        $imageThumbnails.children().remove();
        var data = result.data;
        $('#imagesNum').text(data.length);
        for (var i=0; i<data.length; i++) {
          var content = '';
          /* content += '<li>';
          content += '  <a href="${imageUrl}' + data[i].url + '" data-rel="colorbox">';
          content += '    <img alt="150x150" src="${imageUrl}' + data[i].thumb + '" />';
          content += '  </a>';
          content += '  <div class="tags">';
          content += '    <span class="label-holder">';
          //content += '      <span class="label label-info arrowed">' + data[i].title + '</span>';
          content += '    </span>';
          content += '  </div>';
          content += '  <div class="tools tools-top">';
          //content += '    <a href="#"><i class="icon-link"></i></a>';
          //content += '    <a href="#"><i class="icon-paper-clip"></i></a>';
          //content += '    <a href="#"><i class="icon-pencil"></i></a>';
          content += '    <a href="#" onclick="trashImage(\'' + data[i].id + '\')"><i class="icon-remove red"></i></a>';
          content += '  </div>';
          content += '</li>'; */
          content += '<li>';
          content += ' <div class="thumbnail">';
          content += '  <a href="${imageUrl}/' + data[i].url + '" title="' + data[i].title + '" data-rel="colorbox">';
        	content += '   <img src="${imageUrl}/' + data[i].thumb + '" alt="...">';
        	content += '  </a>';
        	content += '  <div class="caption">';
        	content += '    <h6><span id="title_' + data[i].id + '">' + data[i].title + '</span><input class="form-control" type="text" id="input_' + data[i].id + '" value="' + data[i].title + '"></h6>';
        	content += '    <p><input type="text" id="spinner_' + data[i].id + '"></p>';
        	content += '    <p class="action-buttons"><a class="green" href="#" onclick="saveImage(\'' + data[i].id + '\')" title="保存"><i class="icon-save bigger-130"></i></a><a class="red" href="#" onclick="trashImage(\'' + data[i].id + '\');" title="删除"><i class="icon-trash bigger-130"></i></a></p>';
        	content += '   </div>';
        	content += ' </div>';
	        content += '</li>';   
          $imageThumbnails.append(content);
          $('#title_' + data[i].id).hide();
          var sort = data[i].sort;
          $('#spinner_' + data[i].id).ace_spinner({value:sort,min:0,max:200,step:1, btn_up_class:'btn-info' , btn_down_class:'btn-info'})
          .on('change', function(){
            //alert(this.value)
          });
        }
        $('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
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
      }
    });
	}
	function saveImage(imageId) {
		var url = '${ctx}/manage/image/update?random='+ Math.random();
    var params = {
        id: imageId,
        title: $('#input_' + imageId).val(),
        sort: $('#spinner_' + imageId).val()
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
            		 queryBuildingImages();
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
	function trashBuildingUnit(buildingUnitId) {
		dialog({
      title: '消息',
      content: '确定要删除吗?',
      okValue: '确定',
      ok: function () {
        var that = this;
        that.title('删除中…');
        var url = '${ctx}/manage/buildingUnit/trash?random='+ Math.random();
        var params = {
            id: buildingUnitId
        };
        $.post(url, params, function(result) {
          dialog({
            title: '消息',
            content: result.message,
            okValue: '确定',
            ok: function () {
              tableBuildingUnit.ajax.reload();
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
		    url: '${ctx}/manage/file/upload' + params,
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
