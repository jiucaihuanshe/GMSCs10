<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
	pageContext.setAttribute("basePath", basePath);
%>
  <meta charset="utf-8">
  <title>后台管理</title>
  <link rel="stylesheet" href="${basePath}/static/plugins/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${basePath}/static/plugins/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="${basePath}/static/plugins/adminlte/css/AdminLTE.min.css">
  <link rel="stylesheet" href="${basePath}/static/plugins/adminlte/css/skins/_all-skins.min.css">
  <link rel="stylesheet" href="${basePath}/static/plugins/iCheck/flat/blue.css">
  <link rel="stylesheet" href="${basePath}/static/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <link rel="stylesheet" href="${basePath}/static/plugins/datepicker/datepicker3.css">
  <link rel="stylesheet" href="${basePath}/static/plugins/daterangepicker/daterangepicker-bs3.css">
  <link rel="stylesheet" href="${basePath}/static/plugins/datatables/dataTables.bootstrap.css">
  <link rel="stylesheet" href="${basePath}/static/plugins/bootstrap3-dialog/css/bootstrap-dialog.min.css">
  <link rel="stylesheet" href="${basePath}/static/plugins/sweetalert/sweetalert.css">
  <link rel="stylesheet" href="${basePath}/static/css/common.css">
  <link rel="stylesheet" href="${basePath}/static/plugins/layer/skin/default/layer.css">
  <link rel="stylesheet" href="${basePath}/static/plugins/ztree/css/metroStyle/metroStyle.css">
<script>
	var sitePath = '${basePath }';
</script>
