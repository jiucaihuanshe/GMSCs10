<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
	application.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>超市管理系统后台登录</title>
<link rel="stylesheet" href="${basePath}/static/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${basePath}/static/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${basePath}/static/plugins/adminlte/css/AdminLTE.min.css">
<link rel="stylesheet" href="${basePath}/static/plugins/iCheck/square/blue.css">
</head>
<body class="hold-transition login-page">

	<div class="login-box">
		<div class="login-logo">
			<a href="javascript:;">
				<b>超市管理系统</b>
				v1.0
			</a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">Sign in to start your session</p>
			<form id="login-form" method="post">
				<div class="row">
					<div class="col-xs-12">
						<div id="divErrorMsg" style="color: #ff0000;"></div>
					</div>
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="account" id="account">
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" name="password" id="password">
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row" style="display: none">
					<div class="col-xs-12">
						<input class="form-control" type="text" name="validateCode" id="validateCode" placeholder="验证码" style="width: 150px; display: inline;">
						<img id="validateImg" src="${basePath }/Account/validateCode.do">
						<a id="kanbuq" href="javascript:refreshValidateCode();">换一张</a>
					</div>
				</div>
				<div class="row" style="margin-top: 20px;">
					<div class="col-xs-12">
						<button type="button" id="btnLogin" class="btn btn-primary btn-block btn-flat">Sign In</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script src="${basePath}/static/plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<script src="${basePath}/static/plugins/bootstrap/js/bootstrap.min.js"></script>

	<script>
		$(function() {
			$("#btnLogin").click(function() {
				var username = $("#account").val();
				var password = $("#password").val();

				$.ajax({
					type : 'post',
					url : '${basePath }/Account/dologin',
					data : {
						username : username,
						password : password
					},
					success : function(ret) {
						if (ret != 0) {
							var message = "用户名或密码不正确";
							$('#divErrorMsg').html(message);
						} else {
							location.href = '${basePath }/Admin/main';
						}
					}

				});

			});

		});
	</script>
</body>
</html>