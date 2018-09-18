<%@ page pageEncoding="UTF-8"%>
<div class="box">
	<form id="typeForm" class="form-horizontal">
		<div class="box-body">
			<div class="form-group">
				<input type="hidden" id="hidSysTypeId" value="${type.id}">
				<label for="typeName" class="col-sm-2 control-label required">类别</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="typeName" name="typeName" value="${type.name}">
				</div>
			</div>
			<div class="form-group">
				<label for="parentId" class="col-sm-2 control-label">上级类别</label>
				<div class="col-sm-10">
					<input type="text" class="form-control "
						readonly="readonly" id="parentId" placeholder="上级类别" value="${type.tarentName}">
				</div>
			</div>
			<div class="form-group">
				<label for="tremark" class="col-sm-2 control-label">备注</label>
				<div class="col-sm-10">
					<textarea rows="4" id="tremark" name="tremark" class="form-control">${type.tremark}</textarea>
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

<script>
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
		$("#typeForm").on("click","#parentId",doLoadZTreeNodes);
		$("#menuLayer").on("click", ".btn-cancle", doHideTree);
		$('#menuLayer').on('click','.btn-confirm',doSetSelectedNode);
	});
	function doLoadZTreeNodes(){
			$('#menuLayer').css('display','block');
			$.ajax({
				type : 'get',
				url : sitePath + '/Stock/findTreeUI',
				success : function(ret) {
					ztree = $.fn.zTree.init($("#menuTree"),setting,ret);
				}
			});
		}
		function doSetSelectedNode(){
			 var selectedNodes = ztree.getSelectedNodes();
			 var node = selectedNodes[0];
			 console.log("node"+node);
			 $('#menuLayer').css('display','none');
			 $('#parentId').val(node.name);
			 $('#typeForm').data('parentId',node.id);
		}
		function doHideTree(){
			  $('#menuLayer').css('display','none');
		}
		
		$('#btnCancel').click(function() {
			window.parent.closePopUp();
		});

		$('#typeForm').validate({
			rules : {
				typeName : {
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
			formObj.tid = $('#hidSysTypeId').val();
			if (!formObj.tid) {
				formObj.tid = 0;
			}

			formObj.tname = $('#typeName').val();
			
			formObj.tarentId = $("#typeForm").data("parentId");
			
			formObj.tremark = $('#tremark').val();
			$.ajax({
				type : 'post',
				url : sitePath + '/Stock/doAddEditType',
				data : formObj,
				success : function(ret) {
					window.parent.closePopUp();
				}
			});
		}
</script>