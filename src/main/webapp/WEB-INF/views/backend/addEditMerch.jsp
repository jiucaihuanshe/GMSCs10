<%@ page pageEncoding="UTF-8"%>
<div class="box">
	<form id="merchForm" class="form-horizontal">
		<div class="box-body">
			<div class="form-group">
				<input type="hidden" id="hidMerchId" value="${merch.id}">
				<label for="merchName" class="col-sm-2 control-label required">条形码编号</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="merchName" name="merchName" value="${merch.barCode}">
				</div>

				<label for="tradeName" class="col-sm-2 control-label required">商品名称</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="tradeName" name="tradeName" value="${merch.tradeName}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="uid" class="col-sm-2 control-label">单位编号</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="uid" name="uid" value="${merch.uid}">
				</div>
				<label for="purchasePrice" class="col-sm-2 control-label required">进货价格</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="purchasePrice" name="purchasePrice" value="${merch.purchasePrice}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="presellPrice" class="col-sm-2 control-label">预售价格</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="presellPrice" name="presellPrice" value="${merch.presellPrice}">
				</div>
				<label for="discount" class="col-sm-2 control-label">折扣率</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="discount" name="discount" value="${merch.discount}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="parentId" class="col-sm-2 control-label">上级类别</label>
				<div class="col-sm-10">
					<input type="text" class="form-control "
						readonly="readonly" id="parentId" placeholder="上级类别" value="${merch.mid}">
			</div>
			</div>
			
			<div class="form-group">
				<label for="remark" class="col-sm-2 control-label">备注</label>
				<div class="col-sm-10">
					<textarea rows="4" id="remark" name="remark" class="form-control">${merch.remark}</textarea>
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
		$("#merchForm").on("click","#parentId",doLoadZTreeNodes);
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
			url : sitePath + '/Stock/findMerchUI',
			success : function(ret) {
				console.log(ret);
				ztree = $.fn.zTree.init($("#menuTree"),setting,ret);
			}
		});
	}
	function doSetSelectedNode(){
		 var selectedNodes = ztree.getSelectedNodes();
		 var node = selectedNodes[0];
		 $('#menuLayer').css('display','none');
		 $('#parentId').val(node.name);
		 $('#merchForm').data('parentId',node.id);
	}
	function doHideTree(){
		  $('#menuLayer').css('display','none');
	}
	
	function setDropDownValue() {
		var oldGender = $('#hidOldGender').val();
		$('input[name=gender][value="' + oldGender + '"]').attr('checked', true);
	}

	$('#merchForm').validate({
		rules : {
			merchName : {
				required : true
			},
			tradeName : {
				required : true
			},
			purchasePrice : {
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
		formObj.id = $('#hidMerchId').val();
		if (!formObj.id) {
			formObj.id = 0;
		}

		formObj.name = $('#merchName').val();
		formObj.gender = $('input[name=gender]:checked').val();
		formObj.age = $('#age').val();
		
		formObj.duty = $("#merchForm").data("parentId");
		
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