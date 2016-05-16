<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%> 
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
                    <ul class="nav nav-tabs" id="myTab">
                      <li class="active">
                        <a data-toggle="tab" href="#buildingImages">
                          <i class="green icon-picture bigger-110"></i>楼盘图片
                          <span class="badge badge-danger">3</span>
                        </a>
                      </li>
                      <li>
                        <a data-toggle="tab" href="#profile">
                          <i class="purple icon-cloud-upload bigger-110"></i>上传图片
                        </a>
                      </li>
                    </ul>

                    <div class="tab-content">
                      <div id="buildingImages" class="tab-pane in active">
                        <ul class="ace-thumbnails">
                          <li>
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
                          </li>
                          <li>
                            <a href="${ctx}/images/gallery/image-2.jpg" data-rel="colorbox">
                              <img alt="150x150" src="${ctx}/images/gallery/thumb-2.jpg" />
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
                          </li>
                          <li>
                            <a href="${ctx}/images/gallery/image-3.jpg" data-rel="colorbox">
                              <img alt="150x150" src="${ctx}/images/gallery/thumb-3.jpg" />
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
                          </li>
                        </ul>
                        <div class="clearfix"></div>
                      </div>

                      <div id="profile" class="tab-pane">
                        <div class="alert alert-info">
                          <i class="icon-hand-right"></i>
                          Please note that demo server is not configured to save uploaded files, therefore you may get an error message.
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
<script>
$(document).ready(function() {
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
		    $('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
		    $("#cboxLoadingGraphic").append("<i class='icon-spinner orange'></i>");
		    
		    var params = '?random=' + Math.random();
		    params += '&foreignId=1';
		    params += '&type=2';
		    try {
		      $(".dropzone").dropzone({
		        url: '${ctx}/home/file/upload' + params,
		        paramName: 'file', // The name that will be used to transfer the file
		        maxFilesize: 0.5, // MB
		        addRemoveLinks : true,
		        dictDefaultMessage :'<span class="bigger-150 bolder"><i class="icon-caret-right red"></i> 选择图片</span> 上传 \<span class="smaller-80 grey">(或者点击下面图标)</span> <br /> \<i class="upload-icon icon-cloud-upload blue icon-3x"></i>',
		        dictResponseError: 'Error while uploading file!',
		        //change the previewTemplate to use Bootstrap progress bars
		        previewTemplate: "<div class=\"dz-preview dz-file-preview\">\n  <div class=\"dz-details\">\n    <div class=\"dz-filename\"><span data-dz-name></span></div>\n    <div class=\"dz-size\" data-dz-size></div>\n    <img data-dz-thumbnail />\n  </div>\n  <div class=\"progress progress-small progress-striped active\"><div class=\"progress-bar progress-bar-success\" data-dz-uploadprogress></div></div>\n  <div class=\"dz-success-mark\"><span></span></div>\n  <div class=\"dz-error-mark\"><span></span></div>\n  <div class=\"dz-error-message\"><span data-dz-errormessage></span></div>\n</div>"
		      });
		    } catch(e) {
		      alert('Dropzone.js does not support older browsers!');
		    }
		    
		    $('#modal-image').on('show.bs.modal', function (event) {
		        var button = $(event.relatedTarget);
		        //var buildingId = button.data('building');
		        var buildingId = '${param.buildingId}';
		        console.log(buildingId);
		        //$('#buildingId').val(buildingId);
		        var url = "${ctx}/home/building/getData?random="+ Math.random();
		        var params = {
		            id: buildingId
		        };
		        $.post(url, params, function(result) {
		          if (result.status) {
		            var data = result.data;
		            $('#buildingNameImageText').text(data.buildingName);
		            $('#buildingAddressImageText').text(data.buildingAddress);
		            
		            //dropzoneImage(buildingId, '2');
		          }
		        }, 'json');
		      });
		      $('#modal-image').on('hidden.bs.modal', function() {
		          $(this).removeData('bs.modal');
		      });
});
</script>