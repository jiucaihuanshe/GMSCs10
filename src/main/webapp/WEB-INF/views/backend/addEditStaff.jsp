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
				
				<label for="duty" class="col-sm-2 control-label">职务</label>
				<div class="col-sm-4">
					<input type="hidden" id="hidOldDuty" value="${staff.duty}">
					<select id="duty" class="form-control">
						<option value="1">店长</option>
						<option value="2">收银员</option>
						<option value="3">理货员</option>
						<option value="4">采购员</option>
						<option value="5">学校接送</option>
						<!-- 这块用动态树 -->
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label for="address" class="col-sm-2 control-label">地址</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="address" name="address" value="${staff.address}">
				</div>
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
<script>
	$(function() {
		$('#btnCancel').click(function() {
			window.parent.closePopUp();
		});

		setDropDownValue();
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
			formObj.duty = $('#duty').val();
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
	})
</script>