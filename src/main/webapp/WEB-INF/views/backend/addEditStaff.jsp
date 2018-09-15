<%@ page pageEncoding="UTF-8"%>
<div class="box">
	<form id="staffForm" class="form-horizontal">
		<div class="box-body">
			<div class="form-group">
				<input type="hidden" id="hidStaffId" value="${staff.id}">
				<label for="staffName" class="col-sm-2 control-label required">姓名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="staffName" name="staffName" value="${staff.name}">
				</div>

				<label class="col-sm-2 control-label">性别</label>
				<div class="col-sm-4">
					<input type="hidden" id="hidOldGender" value="${staff.gender}">
					<div class="radio">
						<label>
							<input type="radio" name="gender" value="1" checked="checked">
							男
						</label>
						<label>
							<input type="radio" name="gender" value="0">
							女
						</label>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label for="telephone" class="col-sm-2 control-label required">电话</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="telephone" name="telephone" value="${staff.telephone}">
				</div>
				<label for="idCard" class="col-sm-2 control-label required">身份证</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="idCard" name="idCard" value="${staff.idCard}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="age" class="col-sm-2 control-label">年龄</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="age" name="age" value="${staff.age}">
				</div>
				<label for="address" class="col-sm-2 control-label">地址</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="address" name="address" value="${staff.address}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="parentId" class="col-sm-2 control-label">上级职务</label>
				<div class="col-sm-10">
					<input type="text" class="form-control "
						readonly="readonly" id="parentId" placeholder="上级职务" value="${staff.parentName}">
			</div>
			</div>
			
			<div class="form-group">
				<label for="remark" class="col-sm-2 control-label">备注</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="remark" name="remark" value="${staff.remark}">
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
		<div class="layui-layer-content" style="height: 300px;">
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
<script type="text/javascript">
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
	
	$(function() {
		$("#staffForm").on("click","#parentId",doLoadZTreeNodes);
		$("#menuLayer").on("click", ".btn-cancle", doHideTree);
		$('#menuLayer').on('click','.btn-confirm',doSetSelectedNode);
		$('#btnCancel').click(function() {
			window.parent.closePopUp();
		});
		setDropDownValue();
	});
	
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
		 $('#staffForm').data('parentId',node.id);
	}
	function doHideTree(){
		  $('#menuLayer').css('display','none');
	}
	
	function setDropDownValue() {
		var oldGender = $('#hidOldGender').val();
		$('input[name=gender][value="' + oldGender + '"]').attr('checked', true);
	}

	$('#staffForm').validate({
		rules : {
			name : {
				required : true
			},
			phone : {
				required : true
			},
			idCard : {
				required : true
			}
		},
		onkeyup : false,
		focusCleanup : true,
		success : "valid",
		submitHandler : function(form) {
			saveStaff();
		}
	});

	function saveStaff() {
		var formObj = {};
		formObj.id = $('#hidStaffId').val();
		if (!formObj.id) {
			formObj.id = 0;
		}

		formObj.name = $('#staffName').val();
		formObj.gender = $('input[name=gender]:checked').val();
		formObj.age = $('#age').val();
		
		formObj.duty = $("#staffForm").data("parentId");
		
		formObj.idCard = $('#idCard').val();
		formObj.telephone = $('#telephone').val();			
		formObj.address = $('#address').val();
		formObj.remark = $('#remark').val();
		
		$.ajax({
			type : 'post',
			url : sitePath + '/Staff/doAddEditStaff',
			data : formObj,
			success : function(ret) {
				window.parent.closePopUp();
			}
		});
	}
</script>