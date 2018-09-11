<%@ page pageEncoding="UTF-8"%>
<div class="box box-primary">
	<div class="box-body box-profile">
		<img class="profile-user-img img-responsive img-circle"
			src="${basePath }/static/images/user2-160x160.jpg" alt="User profile picture">

		<h3 class="profile-username text-center">${staff_name }</h3>

		<p class="text-muted text-center">Software Engineer</p>

		<ul class="list-group list-group-unbordered">
			<li class="list-group-item"><b>职务</b> <a
				class="pull-right">${modal.duty }</a></li>
			<li class="list-group-item"><b>电话</b> <a
				class="pull-right">${modal.telephone }</a></li>
			<li class="list-group-item"><b>注册日期</b> <a class="pull-right">${modal.addon }</a>
			</li>
		</ul>

		<button id="btnCancel" class="btn btn-primary btn-block"><b>Close</b></button>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$('#btnCancel').click(function() {
			$('#userModal').modal('hide');
		});
	})
</script>