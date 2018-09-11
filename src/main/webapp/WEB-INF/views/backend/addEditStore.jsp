<%@ page pageEncoding="UTF-8"%>
<div class="box">
	<form id="storeForm" class="form-horizontal">
		<div class="box-body">
			<div class="form-group">
				<input type="hidden" id="hidStoreId" value="${store.id}">
				<label for="storeName" class="col-sm-2 control-label required">仓库名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="storeName" name="storeName" value="${store.name}">
				</div>
				<label for="telephone" class="col-sm-2 control-label required">电话</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="telephone" name="telephone" value="${store.telephone}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="address" class="col-sm-2 control-label">地址</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="address" name="address" value="${store.address}">
				</div>
				<label for="remark" class="col-sm-2 control-label">备注</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="remark" name="remark" value="${store.remark}">
				</div>
			</div>
			
		</div>
		<div class="box-footer">
			<button type="button" id="btnCancel" class="btn btn-default">取消</button>
			<button type="submit" id="btnSave" class="btn btn-info">保存</button>
		</div>

	</form>
</div>
<script>
	$(function() {
		$('#btnCancel').click(function() {
			window.parent.closePopUp();
		});

		$('#storeForm').validate({
			rules : {
				storeName : {
					required : true
				},
				telephone : {
					required : true
				},
				eid : {
					required : true
				}
			},
			onkeyup : false,
			focusCleanup : true,
			success : "valid",
			submitHandler : function(form) {
				saveStore();
			}
		});

		function saveStore() {
			var formObj = {};
			formObj.id = $('#hidStoreId').val();
			if (!formObj.id) {
				formObj.id = 0;
			}

			formObj.name = $('#storeName').val();
			formObj.telephone = $('#telephone').val();
			formObj.address = $('#address').val();
			formObj.remark = $('#remark').val();
			
			$.ajax({
				type : 'post',
				url : sitePath + '/Store/doAddEditStore',
				data : formObj,
				success : function(ret) {
					window.parent.closePopUp();
				}
			});
		}
	})
</script>