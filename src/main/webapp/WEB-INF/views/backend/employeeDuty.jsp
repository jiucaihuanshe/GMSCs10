<%@ page pageEncoding="UTF-8"%>
<div class="box">
	<form id="dutyForm" class="form-horizontal">
		<div class="box-body">
			<div class="form-group">
				<input type="hidden" id="hidSysDutyId" value="${duty.id}">
				<label for="dutyName" class="col-sm-2 control-label required">职务新增</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="dutyName" name="dutyName" value="${duty.name}">
				</div>
			</div>
			<div class="form-group">
				<label for="parentId" class="col-sm-2 control-label">上级职务</label>
				<div class="col-sm-10">
					<input type="text" class="form-control "
						readonly="readonly" id="parentId" placeholder="上级职务">
				</div>
			</div>
		</div>

		<div class="box-footer">
			<button type="button" id="btnCancel" class="btn btn-default">取消</button>
			<button type="submit" id="btnSave" class="btn btn-info">保存</button>
		</div>
	</form>
</div>
<div class="layui-layer layui-layer-page layui-layer-molv layer-anim" id="menuLayer" type="page" times="2" showtime="0" contype="object"
		style="z-index:59891016; width: 300px; height: 400px; top: 15px; left: 300px; display:none">
		<div class="layui-layer-title" style="cursor: move;">选择菜单</div>
		<div class="layui-layer-content" style="height: 258px;">
			<div style="padding: 10px;" class="layui-layer-wrap">
				<ul id="menuTree" class="ztree"></ul>    <!-- 动态加载树 -->
			</div>
		</div>
		<span class="layui-layer-setwin"> <a class="layui-layer-ico layui-layer-close layui-layer-close1 btn-cancle" ></a></span>
		<div class="layui-layer-btn layui-layer-btn-">
			<a class="layui-layer-btn0 btn-confirm">确定</a>
			<a class="layui-layer-btn1 btn-cancle">取消</a>
		</div>
</div>

<script>
	$(function() {
		$("#dutyForm").on("click","#parentId",doLoadZTreeNodes);
		$("#menuLayer").on("click", ".btn-cancle", doHideTree);
		$('#menuLayer').on('click','.btn-confirm',doSetSelectedNode);
		var ztree;
		var setting = {
			data : {
				simpleData : {
					enable : true,
					idKey : "id",
					pIdKey : "parentId",
					rootPId : null
				}
			}
		}
		function doLoadZTreeNodes(){
			$('#menuLayer').css('display','block');
			$.ajax({
				type : 'get',
				url : sitePath + '/Staff/findTreeUI',
				success : function(ret) {
					ztree = $.fn.zTree.init($("#menuTree"),setting,ret);
				}
			});
		}
		function doSetSelectedNode(){
			 var selectedNodes = ztree.getSelectedNodes();
			 var node = selectedNodes[0];
			 $('#menuLayer').css('display','none');
			 $('#parentId').val(node.name);
			 $('#dutyForm').data('parentId',node.id);
		}
		function doHideTree(){
			  $('#menuLayer').css('display','none');
		}
		
		$('#btnCancel').click(function() {
			window.parent.closePopUp();
		});

		$('#dutyForm').validate({
			rules : {
				dutyNumber : {
					required : true
				},
			},
			onkeyup : false,
			focusCleanup : true,
			success : "valid",
			submitHandler : function(form) {
				saveDuty();
			}
		});

		function saveDuty() {
			var formObj = {};
			formObj.id = $('#hidSysDutyId').val();
			if (!formObj.id) {
				formObj.id = 0;
			}

			formObj.name = $('#dutyName').val();
			
			formObj.parentId = $("#dutyForm").data("parentId"),
			
			$.ajax({
				type : 'post',
				url : sitePath + '/Staff/doAddEditDuty',
				data : formObj,
				success : function(ret) {
					window.parent.closePopUp();
				}
			});
		}
	})
</script>