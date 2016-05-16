<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%> 
<html>
<head>
  <title>地区-爱房网</title>
  <link href="${ctx}/css/jquery.autocompleter.css" rel="stylesheet">
  <link href="${ctx}/css/autocompleter.css" rel="stylesheet">
  <link href="${ctx}/css/datepicker.css" rel="stylesheet">
  <link href="${ctx}/css/colorbox.css" rel="stylesheet">
  <link href="${ctx}/css/bootstrapValidator.min.css" rel="stylesheet">
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
  
  .modal-body-content {padding: 5px 0 0 0;}
  
  .ace-thumbnails>li {margin-left: 20px;} 
  
  .switch-box {padding-top: 5px;}
  </style>
  </css>
</head>
<body>
	<div class="main-content">
	  <div class="breadcrumbs" id="breadcrumbs">
	    <ul class="breadcrumb">
	      <li><i class="icon-home home-icon"></i><a href="#">地区</a></li>
	      <li class="active">${name}</li>
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
            <h5>${name}搜索</h5>
            <div class="widget-toolbar no-border">
              <a href="#" data-action="collapse"><i class="icon-chevron-up"></i></a>
            </div>
          </div>
          
          <div class="widget-body">
            <table class="table table-striped table-search">
              <tbody>
                <tr>
                  <td>
                    <form class="form-horizontal" id="searchForm">
                      <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">地区：</label>
                        <div class="col-md-11">
                          <select class="input-select" id="countrys" disabled>
                            <option value="">选择国家</option>
                            <c:forEach var="data" items="${regions}">
                            <option value="${data.id}">${data.name}</option>
                            </c:forEach>
                          </select>
                          <select class="input-select" id="provinces" disabled>
                            <option value="">选择省份</option>
                          </select>
                          <select class="input-select" id="citys" disabled>
                            <option value="">选择市县</option>
                          </select>
                          <select class="input-select" id="districts" disabled>
                            <option value="">选择城区</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">名称：</label>
                        <div class="col-md-2">
                          <input class="input-text" type="text" id="name" name="name" placeholder="${name}名称">
                        </div>
                      </div>
                      <div class="form-group form-row">
                        <label class="col-md-1 control-label no-padding-right">编码：</label>
                        <div class="col-md-2">
                          <input class="input-text" type="text" id="code" placeholder="${name}编码">
                        </div>
                      </div>
                      <div class="form-group form-row">
                        <div class="col-md-3 col-md-offset-1">
                          <div class="input-group">
                            <span class="input-group-btn">
                              <button type="submit" class="btn btn-info btn-xs" id="btnRegionSearch">搜索<i class="icon-search icon-on-right"></i></button>
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
      
      <input id="parentIdValue" type="hidden">
      <input id="parentIdAddValue" type="hidden">
      <input id="levelValue" type="hidden" value="${level}">
      
	    <div class="row">
	      <div class="col-xs-12 widget-container-span">
	        <!-- PAGE CONTENT BEGINS -->
	        <div class="widget-box">
		        <div class="widget-header header-color-blue">
		          <h5><i class="icon-table"></i>${name}列表</h5>
	            <div class="widget-toolbar">
	              <button class="btn btn-minier btn-purple" data-toggle="modal" data-target="#modal-add" data-whatever="add">新增<i class="icon-edit align-top icon-on-right"></i>
                </button>
	              <button class="btn btn-minier">导出<i class="icon-print align-top icon-on-right"></i>
								</button>
	            </div>
		        </div>

		        <div class="widget-body widget-none">
			        <div class="table-responsive">
			          <table id="tableRegion" class="table table-striped table-bordered table-hover" width="100%">
			            <thead>
			              <tr>
			                <th width="50"></th>
			                <th class="text-center" width="50"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></th>
			                <th>${name}名称</th>
			                <th>${name}编码</th>
			                <th width="130"><i class="icon-time hidden-480"></i>创建时间</th>
			                <th class="text-center hidden-480" width="80">状态</th>
			                <th class="text-center" width="140">操作</th>
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
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h5 class="blue bigger">${name}新增</h5>
                </div>
                <!-- form -->
                <form class="form-horizontal" id="dataForm">
                  <div class="modal-body overflow-visible modal-body-content">                  
                    <input id="regionId" type="hidden">
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">地区：</label>
                      <div class="col-md-8">
                        <select class="input-select" id="countrysAdd" disabled>
                          <option value="">选择国家</option>
                          <c:forEach var="data" items="${regions}">
                          <option value="${data.id}">${data.name}</option>
                          </c:forEach>
                        </select>
                        <select class="input-select" id="provincesAdd" disabled>
                          <option value="">选择省份</option>
                        </select>
                        <select class="input-select" id="citysAdd" disabled>
                          <option value="">选择市县</option>
                        </select>
                        <select class="input-select" id="districtsAdd" disabled>
                          <option value="">选择城区</option>
                        </select>
                      </div>
                    </div>
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">名称：</label>
                      <div class="col-md-8">
                        <input class="input-text" type="text" id="nameAdd" name="name" placeholder="${name}名称">
                      </div>
                    </div>
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">编码：</label>
                      <div class="col-md-8">
                        <input class="input-text" type="text" id="codeAdd" placeholder="${name}编码">
                      </div>
                    </div>
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">序号：</label>
                      <div class="col-md-8">
                        <input class="input-text" type="text" id="sortAdd" placeholder="排序序号">
                      </div>
                    </div>
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">状态：</label>
                      <div class="col-md-8">
                        <label class="switch-box">
                         <input class="ace ace-switch ace-switch-3" type="checkbox" id="statusAdd" checked/>
                         <span class="lbl"></span>
                        </label>
                      </div>
                    </div>
	                </div>
	                <div class="modal-footer">
	                  <button class="btn btn-xs" data-dismiss="modal"><i class="icon-remove"></i>关闭</button>
	                  <button class="btn btn-xs btn-primary" id="btnRegionSave1" type="submit"><i class="icon-ok"></i>保存</button>
	                </div>
                </form>
                <!-- form -->
              </div>
            </div>
          </div>
          <!-- modal-add -->
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
  <script src="${ctx}/js/jquery.colorbox-min.js"></script>
  <script src="${ctx}/js/bootstrapValidator.min.js"></script>
	<script>
	var d = null;
	var tableRegion = null;
	var tableRegionUnit = null;
	$(document).ready(function() {
		$('#searchForm').bootstrapValidator({
      submitHandler: function(validator, form, submitButton) {
    	  queryRegionDatas();
    	  validator.disableSubmitButtons(false);
      }
    });
		$('#dataForm').bootstrapValidator({
			/* message: 'This value is not valid',
      feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
      }, */
      submitHandler: function(validator, form, submitButton) {
        submitForm();
      },
			fields: {
				name: {
          validators: {
            notEmpty: {
              message: '不能为空'
            }
          }
        }
      }
		});
		<c:if test="${level == '2' || level == '3' || level == '4' || level == '5'}">
		$('#countrys').removeAttr("disabled");
		$('#countrysAdd').removeAttr("disabled");
		<c:if test="${level == '3' || level == '4' || level == '5'}">
		$('#provinces').removeAttr("disabled");
		$('#countrys').change(function() {
			changeRegion($(this).val(), 'provinces', ['citys', 'districts']);
    });
		$('#provincesAdd').removeAttr("disabled");
    $('#countrysAdd').change(function() {
      changeRegion($(this).val(), 'provincesAdd', ['citysAdd', 'districtsAdd']);
    });
		</c:if>
		<c:if test="${level == '4' || level == '5'}">
    $('#citys').removeAttr("disabled");
    $('#provinces').change(function() {
      changeRegion($(this).val(), 'citys', ['districts']);
    });
    $('#citysAdd').removeAttr("disabled");
    $('#provincesAdd').change(function() {
      changeRegion($(this).val(), 'citysAdd', ['districtsAdd']);
    });
    </c:if>
    <c:if test="${level == '5'}">
    $('#districts').removeAttr("disabled");
    $('#citys').change(function() {
      changeRegion($(this).val(), 'districts', []);
    });
    $('#districtsAdd').removeAttr("disabled");
    $('#citysAdd').change(function() {
      changeRegion($(this).val(), 'districtsAdd', []);
    });
    </c:if>
		</c:if>
		tableRegion = $('#tableRegion').DataTable({
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
        'url': '${ctx}/manage/region/queryManageData',
        'type': 'POST',
        'data': function ( d ) { //添加额外的参数发送到服务器
          //d.tag = 'release';
          //d.sort = $('#sort').val();
          d.level = '${level}';
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
          return data.name;
        }},
        { 'orderable': false, 'targets': 3, 'render': function(data, type, row) {
          return data.code;
        }},
        { 'targets': 4, 'render': function(data, type, row) {
          var content = to_date_hm(data.createTime);
          return content;
        }},
        { 'orderable': false, 'targets': 5, 'render': function(data, type, row) {
          var content = '<div class="text-center">';
          if (+data.status) {
        	  content += '<span class="label label-sm label-success">有效</span>';
          } else {
        	  content += '<span class="label label-sm arrowed"><s>失效</s></span>';
          }
          content += '</div>';
          return content;
        }},
        { 'orderable': false, 'targets': 6, 'render': function(data, type, row) {
        	var content = '<div class="text-center">';
          content += '<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">';
          content += '  <a class="blue" href="#" title="详情"><i class="icon-zoom-in bigger-130"></i></a>';
          content += '  <a class="green" href="#" onclick="editRegion(\'' + data.id + '\');" title="编辑"><i class="icon-pencil bigger-130"></i></a>';
          //content += '  <a class="green" href="#modal-add" role="button" data-toggle="modal" data-region="' + data.id + '" title="编辑"><i class="icon-pencil bigger-130"></i></a>';
          content += '  <a class="red" href="#" onclick="trashRegion(\'' + data.id + '\');" title="删除" ><i class="icon-trash bigger-130"></i></a>';
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
		tableRegion.on('order.dt search.dt',
      function () {
			  tableRegion.column(0, {
          search: 'applied',
          order: 'applied'
        }).nodes().each(function (cell, i) {
          cell.innerHTML = i + 1;
        });
    }).draw();
		
		$('#modal-add').on('show.bs.modal', function (event) {
			var button = $(event.relatedTarget);
		  var whatever = button.data('whatever');
			$('#dataForm').data('bootstrapValidator').resetForm();
			if (whatever) {
				$('#nameAdd').val('');
				$('#codeAdd').val('');
				$('#sortAdd').val('');
				$('#districtsAdd').children().not(':first').remove();
		    $('#citysAdd').children().not(':first').remove();
		    $('#provincesAdd').children().not(':first').remove();
		    $('#countrysAdd').val('');
			}
		});
	});
	
	function submitForm() {
		var regionId = $('#regionId').val();
    var name = $('#nameAdd').val();
    var code = $('#codeAdd').val();
    var level = $('#levelValue').val();
    var sort = $('#sortAdd').val();
    var countryValue = $('#countrysAdd').val();
    var provinceValue = $('#provincesAdd').val();
    var cityValue = $('#citysAdd').val();
    var districtValue = $('#districtsAdd').val();
    var status = '0';
    if ($('#statusAdd').is(':checked')) {
      status = '1';
    }
    var parentId = "";
    if (districtValue) {
      parentId = districtValue;
    } else if (cityValue) {
      parentId = cityValue;
    } else if (provinceValue) {
      parentId = provinceValue;
    } else {
      parentId = countryValue;
    }
    var url = '${ctx}/manage/region/saveOrUpdate?random='+ Math.random();
    var params = {
        id: regionId,
        parentId: parentId,
        name: name,
        code: code,
        level: level,
        sort: sort,
        status: status
    };
    $.post(url, params, function(result) {
      $('#modal-add').modal('hide');
      dialog({
       title: '消息',
       content: result.message,
       okValue: '确定',
       ok: function () {
         queryRegionDatas();
         return true;
       }
     }).width(100).showModal();
    }, 'json');
	}
	function queryRegionDatas() {
		d = dialog({
      title: '${name}载入中...'
    });
    d.showModal();
    var search = '?random=' + Math.random();
    var nameValue = $('#name').val();
    if (nameValue) {
    	search += '&name=' + nameValue;
    }
    var codeValue = $('#code').val();
    if (codeValue) {
      search += '&code=' + codeValue;
    }
    var countryValue = $('#countrys').val();
    var provinceValue = $('#provinces').val();
    var cityValue = $('#citys').val();
    var districtValue = $('#districts').val();
    if (districtValue) {
      search += '&parentId=' + districtValue;
    } else if (cityValue) {
    	search += '&parentId=' + cityValue;
    } else if (provinceValue) {
      search += '&parentId=' + provinceValue;
    } else {
    	search += '&parentId=' + countryValue;
    }
    tableRegion.ajax.url('${ctx}/manage/region/queryManageData' + search).load();
    d.close();
	}
	function resetRegion(fieldId) {
		var $children = $('#' + fieldId);
	  $children.children().not(':first').remove();
	}
	function changeRegion(regionId, fieldId, childrens) {
		var $children = $('#' + fieldId);
	  $children.children().not(':first').remove();
		if (regionId) {
      var url = '${ctx}/manage/region/list?random='+ Math.random();
      var params = {
        parentId: regionId
      };

      $.post(url, params, function(result) {
        if (result.status) {
          for (var i=0; i<result.data.length; i++) {
            $htmlOpt = $('<option value="' + result.data[i].id + '">' + result.data[i].name + '</option>');
            $children.append($htmlOpt);
          }
        }
      }, 'json');
    }
		for (var i=0; i<childrens.length; i++) {
			var children = childrens[i];
			resetRegion(children);
		}
	}
	function editRegion(regionId) {
		var url = '${ctx}/manage/region/getData?random='+ Math.random();
    var params = {
        id: regionId
    };
    $.post(url, params, function(result) {
      if (result.status) {
    	  $('#districtsAdd').children().not(':first').remove();
    	  $('#citysAdd').children().not(':first').remove();
    	  $('#provincesAdd').children().not(':first').remove();
    	  $('#regionId').val(regionId);
    	  var $select = null;
    	  for (var key in result.data) {
    		  var keys = key.split('_');
    		  var values = result.data[key];
    		  if (keys[0] === '5') {
    			  $('#nameAdd').val(keys[3]);
    			  $('#codeAdd').val(keys[4]);
    			  $('#sortAdd').val(keys[5]);
    			  if (+keys[6]) {
    				  $('#statusAdd').attr('checked', 'checked');
    			  } else {
    				  $('#statusAdd').removeAttr('checked');
    			  }
    		  } else if (keys[0] === '4') {
    			  $select = $('#districtsAdd');
    		  } else if (keys[0] === '3') {
    			  $select = $('#citysAdd');
          } else if (keys[0] === '2') {
        	  $select = $('#provincesAdd');
        	  $('#countrysAdd').val(keys[2]);
          }
    		  //$select.children().not(':first').remove();
    		  for (var i=0; i<values.length; i++) {
            $htmlOpt = $('<option value="' + values[i].id + '">' + values[i].name + '</option>');
            $select.append($htmlOpt);
            $select.val(keys[1]);
          }
    	  }
    	  $('#modal-add').modal('show');
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
	function trashRegion(regionId) {
		dialog({
      title: '消息',
      content: '确定要删除吗?',
      okValue: '确定',
      ok: function () {
        var that = this;
        this.title('删除中…');
        var url = '${ctx}/manage/region/trash?random='+ Math.random();
        var params = {
            id: regionId
        };
        $.post(url, params, function(result) {
          dialog({
            title: '消息',
            content: result.message,
            okValue: '确定',
            ok: function () {
              tableRegion.ajax.reload();
              return true;
            }
          }).width(100).showModal();
        }, 'json');
      },
      cancelValue: '取消',
      cancel: function () {}
    }).width(100).showModal();
	}
	</script>
	</jscript>
</body>
</html>
