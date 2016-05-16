<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%> 
<html>
<head>
  <title>客户-爱房网</title>
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
	      <li><i class="icon-home home-icon"></i><a href="#">客源</a></li>
	      <li class="active">客户</li>
	    </ul>
	  </div>
	
	  <div class="page-content">
      <div class="widget-container-span">
        <div class="widget-box transparent">
          <div class="widget-header">
            <h5>客户搜索</h5>
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
                        <label class="col-md-1 control-label no-padding-right">姓名：</label>
                        <div class="col-md-2">
                          <input type="text" id="name" name="name" placeholder="客户名称">
                        </div>
                      </div>
                      <div class="form-group form-row">
                        <div class="col-md-3 col-md-offset-1">
                          <div class="input-group">
                            <span class="input-group-btn">
                              <button type="submit" class="btn btn-info btn-xs">搜索<i class="icon-search icon-on-right"></i></button>
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
      
	    <div class="row">
	      <div class="col-xs-12 widget-container-span">
	        <!-- PAGE CONTENT BEGINS -->
	        <div class="widget-box">
		        <div class="widget-header header-color-blue">
		          <h5><i class="icon-table"></i>客户列表</h5>
	            <div class="widget-toolbar">
	              <button class="btn btn-minier btn-purple" data-toggle="modal" data-target="#modal-add" data-whatever="add">新增<i class="icon-edit align-top icon-on-right"></i>
                </button>
	              <button class="btn btn-minier">导出<i class="icon-print align-top icon-on-right"></i>
								</button>
	            </div>
		        </div>

		        <div class="widget-body widget-none">
			        <div class="table-responsive">
			          <table id="tableCustomer" class="table table-striped table-bordered table-hover" width="100%">
			            <thead>
			              <tr>
			                <th width="50"></th>
			                <th class="text-center" width="50"><label><input type="checkbox" class="ace" /><span class="lbl"></span></label></th>
			                <th>客户名称</th>
			                <th>手机</th>
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
                  <h5 class="blue bigger">客户新增</h5>
                </div>
                <!-- form -->
                <form class="form-horizontal" id="dataAddForm">
                  <input type="hidden" id="dataId">
                  <div class="modal-body overflow-visible modal-body-content">                
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">姓名：</label>
                      <div class="col-md-8">
                        <input type="text" id="nameAdd" placeholder="客户名称">
                      </div>
                    </div>
                    <div class="form-group form-row">
                      <label class="col-md-2 control-label no-padding-right">手机：</label>
                      <div class="col-md-8">
                        <input type="text" id="phoneAdd" placeholder="手机">
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
	                  <button class="btn btn-xs btn-primary" type="submit"><i class="icon-ok"></i>保存</button>
	                </div>
                </form>
                <!-- form -->
              </div>
            </div>
          </div>
          <!-- modal-add -->
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
	var tableCustomer = null;
	var tableCustomerUnit = null;
	$(document).ready(function() {
		$('#searchForm').bootstrapValidator({
      submitHandler: function(validator, form, submitButton) {
    	  queryCustomers();
    	  validator.disableSubmitButtons(false);
      }
    });
		$('#dataAddForm').bootstrapValidator({
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
		tableCustomer = $('#tableCustomer').DataTable({
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
        'url': '${ctx}/manage/customer/queryData',
        'type': 'POST',
        'data': function ( d ) { //添加额外的参数发送到服务器
          //d.tag = 'release';
          //d.sort = $('#sort').val();
          //d.level = '${level}';
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
          return data.phone;
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
          //content += '  <a class="blue" href="#modal-table" role="button" data-toggle="modal" data-customer="' + data.id + '" title="查看需求"><i class="icon-info bigger-130"></i></a>';
          //content += '  <a class="blue" href="#" title="新增需求"><i class="icon-edit bigger-130"></i></a><br>';
          content += '  <a class="blue" href="#" title="详情"><i class="icon-zoom-in bigger-130"></i></a>';
          content += '  <a class="green" href="#" onclick="editCustomer(\'' + data.id + '\');" title="编辑"><i class="icon-pencil bigger-130"></i></a>';
          //content += '  <a class="green" href="#modal-add" role="button" data-toggle="modal" data-region="' + data.id + '" title="编辑"><i class="icon-pencil bigger-130"></i></a>';
          content += '  <a class="red" href="#" onclick="trashCustomer(\'' + data.id + '\');" title="删除" ><i class="icon-trash bigger-130"></i></a>';
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
		tableCustomer.on('order.dt search.dt',
      function () {
			  tableCustomer.column(0, {
          search: 'applied',
          order: 'applied'
        }).nodes().each(function (cell, i) {
          cell.innerHTML = i + 1;
        });
    }).draw();
		
		$('#modal-add').on('show.bs.modal', function (event) {
			var button = $(event.relatedTarget);
		  var whatever = button.data('whatever');
			$('#dataAddForm').data('bootstrapValidator').resetForm();
			if (whatever) {
				$('#nameAdd').val('');
				$('#phoneAdd').val('');
				$('#statusAdd').attr('checked', 'checked');
			}
		});
	});
	
	function submitForm() {
		var dataId = $('#dataId').val();
    var name = $('#nameAdd').val();
    var phone = $('#phoneAdd').val();
    var status = '0';
    if ($('#statusAdd').is(':checked')) {
      status = '1';
    }
    var url = '${ctx}/manage/customer/saveOrUpdate?random='+ Math.random();
    var params = {
    		id: dataId,
        name: name,
        phone: phone,
        status: status
    };
    $.post(url, params, function(result) {
      $('#modal-add').modal('hide');
      dialog({
       title: '消息',
       content: result.message,
       okValue: '确定',
       ok: function () {
         queryCustomers();
         return true;
       }
     }).width(100).showModal();
    }, 'json');
	}
	function queryCustomers() {
		d = dialog({
      title: '查询载入中...'
    });
    d.showModal();
    var search = '?random=' + Math.random();
    var nameValue = $('#name').val();
    if (nameValue) {
    	search += '&name=' + nameValue;
    }
    tableCustomer.ajax.url('${ctx}/manage/customer/queryData' + search).load();
    d.close();
	}
	function editCustomer(dataId) {
		var url = '${ctx}/manage/customer/getData?random='+ Math.random();
    var params = {
        id: dataId
    };
    $.post(url, params, function(result) {
      if (result.status) {
    	  $('#dataId').val(dataId);
    	  $('#nameAdd').val(result.data.name);
    	  $('#phoneAdd').val(result.data.phone);
    	  var status = result.data.status;
    	  if (+status) {
          $('#statusAdd').attr('checked', 'checked');
        } else {
          $('#statusAdd').removeAttr('checked');
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
	function trashCustomer(dataId) {
		dialog({
      title: '消息',
      content: '确定要删除吗?',
      okValue: '确定',
      ok: function () {
        var that = this;
        this.title('删除中…');
        var url = '${ctx}/manage/customer/trash?random='+ Math.random();
        var params = {
            id: dataId
        };
        $.post(url, params, function(result) {
          dialog({
            title: '消息',
            content: result.message,
            okValue: '确定',
            ok: function () {
              tableCustomer.ajax.reload();
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
