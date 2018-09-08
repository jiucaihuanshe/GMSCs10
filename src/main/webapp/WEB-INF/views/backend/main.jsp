<%@ page pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
	application.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/shared/css.jsp"></jsp:include>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">
			<a href="${basePath }/Admin/main.do" class="logo">
				<span class="logo-lg">
					<b>超市管理系统</b>
					v1.0
				</span>
			</a>
			<nav class="navbar navbar-static-top">
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
					<span class="sr-only">Toggle navigation</span>
				</a>

				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<img src="${basePath }/static/images/user2-160x160.jpg" class="user-image" alt="User Image">
								<span class="hidden-xs">${staff_name }</span>
							</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header">
									<img src="${basePath }/static/images/user2-160x160.jpg" class="img-circle" alt="User Image">
									<p>个人签名，座右铭</p>
								</li>

								<li class="user-footer">
									<div class="pull-left">
										<a href="javascript:myselfinfo('${basePath }/Staff/doShowUserInfo?id=${staff_id}')" class="btn btn-default btn-flat">个人信息</a>
									</div>
									<div style="display: inline; margin-left: 20px;">
										<a href="javascript:showChangePwdDialog();" class="btn btn-default btn-flat">修改密码</a>
									</div>
									<div class="pull-right">
										<a href="${basePath }/Account/dologout.do" class="btn btn-default btn-flat">退出</a>
									</div>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</header>

		<aside class="main-sidebar">
			<jsp:include page="/shared/left.jsp"></jsp:include>
		</aside>

		<div class="content-wrapper">
			<section class="content-header">
				<h1 id=pageHeader></h1>
				<input type="hidden" id="currentUrl" value="">
			</section>

			<section class="content" id="contentFrame">
				<jsp:include page="index.jsp"></jsp:include>
			</section>
		</div>

		<footer class="main-footer">
			<div>
				<input type="hidden" id="hidSysUserId" value="${staff_id }">
			</div>
			<div class="pull-right hidden-xs">
				<b>Version</b>
				2.3.3
			</div>
			<strong>Copyright &copy; 2014-2015 </strong>
			All rights reserved.
		</footer>
	</div>

	<div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 600px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="userModalTitle"></h4>
				</div>
				<div class="modal-body" id="userModalContent" style="height: 450px; overflow-y: auto;"></div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="changePwdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 600px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="changePwdModalTitle">修改密码</h4>
				</div>
				<div class="modal-body" id="changePwdModalContent" style="height: 450px; overflow-y: auto;">
					<form class="form-horizontal" id="form-changepwd">

						<div class="form-group">
							<label for="title" class="col-sm-3 control-label"> 新密码： </label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="newPwd" name="newPwd">
							</div>
						</div>

						<div class="form-group">
							<label for="keywords" class="col-sm-3 control-label"> 确认密码： </label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="newPwdEx" name="newPwdEx">
							</div>
						</div>
						<div class="form-group" style="text-align: center;">
							<button type="button" id="btnChangePwd" class="btn btn-primary" style="margin-right: 15px;">保存</button>
							<button type="button" id="btnCancelChangePwd" class="btn btn-default">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/shared/js.jsp"></jsp:include>

	<script type="text/javascript">
		function loadMainPage(url, title) {
			var index = layer.load(0, {
				shade : false
			});
			$.ajax({
				type : 'get',
				url : url,
				cache : false,
				success : function(ret) {
					$("#contentFrame").html(ret);
					$('#currentUrl').val(url);
					layer.close(index);
				},
				error : function() {
					layer.close(index);
				}
			});

		}
		function freshMainPage() {
			var currentUrl = $('#currentUrl').val();
			loadMainPage(currentUrl, '');
		}

		function myselfinfo(url) {
			console.log(url);
			$("#userModal").modal('show');
			$("#userModalTitle").html('个人信息');
			$("#userModalContent").load(url);
		}

		function showChangePwdDialog() {
			$('#changePwdModal').modal('show');
		}

		$(function() {

			$('#btnCancelChangePwd').click(function() {
				$('input[type=password]', '#form-changepwd').val('');
				$('#changePwdModal').modal('hide');
			});

			$('#btnChangePwd').click(function() {
				var userId = $('#hidSysUserId').val();
				var newPassword = $('#newPwd').val();
				var newPasswordEx = $('#newPwdEx').val();

				if (!newPassword) {
					layer.msg('新密码不能为空', {
						icon : 5
					});
					return;
				}

				if (!newPasswordEx) {
					layer.msg('确认密码不能为空', {
						icon : 5
					});
					return;
				}

				if (newPassword != newPasswordEx) {
					layer.msg('两次密码不一致', {
						icon : 5
					});
					return;
				}

				$.ajax({
					type : 'post',
					url : sitePath + '/Account/doChangePassword',
					data : {
						password : newPassword,
						id : userId
					},
					success : function(ret) {
						if (ret == '1') {
							layer.msg('修改成功', {
								icon : 1,
								time : 1000
							}, function() {
								$('#btnCancelChangePwd').trigger('click');
								window.location = sitePath + "/Account/dologout";
							});
						}

					}

				});
			});
		})
	</script>
</body>
</html>