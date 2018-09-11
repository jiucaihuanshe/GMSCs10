<%@ page pageEncoding="UTF-8"%>
<div class="box">
	<form id="offerForm" class="form-horizontal">
		<div class="box-body">
			<div class="form-group">
				<input type="hidden" id="hidOfferId" value="${offer.id}">
				<label for="offerName" class="col-sm-2 control-label required">供应商</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="offerName" name="offerName" value="${offer.name}">
				</div>
				
				<label for="offerLinkMan" class="col-sm-2 control-label required">联系人</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="offerLinkMan" name="offerLinkMan" value="${offer.linkman}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="telephone" class="col-sm-2 control-label required">电话</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="telephone" name="telephone" value="${offer.telephone}">
				</div>
				<label for="address" class="col-sm-2 control-label">地址</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="address" name="address" value="${offer.address}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="remark" class="col-sm-2 control-label">备注</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="remark" name="remark" value="${offer.remark}">
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

		$('#offerForm').validate({
			rules : {
				name : {
					required : true
				},
				telephone : {
					required : true
				},
				linkman : {
					required : true
				}
			},
			onkeyup : false,
			focusCleanup : true,
			success : "valid",
			submitHandler : function(form) {
				saveOffer();
			}
		});

		function saveOffer() {
			var formObj = {};
			formObj.id = $('#hidOfferId').val();
			if (!formObj.id) {
				formObj.id = 0;
			}

			formObj.name = $('#offerName').val();
			formObj.linkman = $('#offerLinkMan').val();
			formObj.telephone = $('#telephone').val();			
			formObj.address = $('#address').val();
			formObj.remark = $('#remark').val();
			
			$.ajax({
				type : 'post',
				url : sitePath + '/Offer/doAddEditOffer',
				data : formObj,
				success : function(ret) {
					window.parent.closePopUp();
				}
			});
		}
	})
</script>