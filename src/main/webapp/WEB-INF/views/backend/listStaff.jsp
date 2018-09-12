<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="box">
	<div class="box-header">
		<div class="row">
			<div class="col-lg-3 col-xs-6">
				<label for="searchStaffName" class="control-label"> 姓名： </label>
				<input type="text" class="form-control" id="searchStaffName">
			</div>
			<div class="col-lg-3 col-xs-6">
				<label for="searchPhone" class="control-label">电话：</label>
				<input type="text" class="form-control" id="searchPhone">
			</div>
		</div>

		<div class="row" style="margin-top: 15px">
			<div class="col-lg-3 col-xs-6">
				<button id="btnAddStaff" type="button" class="btn btn-primary">添加员工</button>
			</div>
			<div class="col-lg-6 col-xs-12">
				<button id="btnSearch" type="button" class="btn btn-primary">查询</button>
			</div>
			<div class="col-lg-3 col-xs-6">
				<button id="btnRefreshList" type="button" class="btn btn-success pull-right" onclick="freshMainPage()">刷新</button>
			</div>
		</div>
	</div>

	<div class="box-body">
		<table id="staffList" class="table table-bordered table-hover">
			<thead>
				<tr>
					<th width="8%">序号</th>
					<th width="10%">姓名</th>
					<th width="8%">性别</th>
					<th width="10%">电话</th>
					<th width="8%">职务</th>
					<th width="15%">地址</th>
					<th width="10%">添加时间</th>
					<th width="15%">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${staffs}" var="staff" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${staff.name }</td>
						<td>${staff.gender }</td>
						<td>${staff.telephone }</td>
						<td>${staff.duty }</td>
						<td>${staff.address }</td>
						<td>
							<fmt:formatDate value="${staff.addon }" pattern="yyyy-MM-dd HH:mm" ></fmt:formatDate>
						</td>
						<td class="operate">
							<i class="fa fa-edit" onclick="staff_edit(${staff.id })"></i>
							<i class="fa fa-trash-o" onclick="staff_del(${staff.id })"></i>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<script>
	$(function() {
		
		$('#staffList').dataTable({
	        "bAutoWidth": false, //自适应宽度
            "aaSorting": [[0, "asc"]],
            "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 4,5,7 ] }],
            "sPaginationType": "full_numbers",
            "bFilter":false,
            "oLanguage": {
                "sProcessing": "正在加载中......",
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "对不起，查询不到相关数据！",
                "sEmptyTable": "表中无数据存在！",
                "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                "sInfoFiltered": "数据表中共为 _MAX_ 条记录",
                "sSearch": "搜索",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上一页",
                    "sNext": "下一页",
                    "sLast": "末页"
                }
            }
	    });
		
		$('#btnAddStaff').click(function() {
			var url = sitePath + "/Staff/addEditStaff?id=0";
			window.popUp(url, "添加员工", "primary", 850, 500, function() {
				$('#btnRefreshList').click();
			}, false, false);
		});

		$('#btnSearch').click(function() {
			doQueryObject();
		});
	});

	function staff_edit(staffId) {
		var url = sitePath + "/Staff/addEditStaff?id=" + staffId;
		window.popUp(url, "编辑员工", "primary", 850, 500, function() {
			$('#btnRefreshList').click();
		}, false, false);

	}

	function staff_del(staffId) {
		if (!staffId) {
			return;
		}

		swal({
			title : "确定删除吗？",
			text : "你将永久删除员工相关的数据！",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "确定删除！",
			cancelButtonText : "取消",
			closeOnConfirm : true
		}, function() {
			del()
		});

		function del() {
			$.ajax({
				type : 'post',
				url : sitePath + '/Staff/deleteStaff',
				data : {
					id : staffId
				},
				success : function() {
					$('#btnRefreshList').click();
				}

			});
		}
	}

	function doQueryObject() {
		$.post(sitePath + '/Staff/findStaff', {
			name : $("#searchStaffName").val(),
			telephone : $("#searchPhone").val()
		}, function(result) {
			setTableBodyRows(result);
		});
	}

	function setTableBodyRows(result) {
		var tBody = $("#staffList>tbody");
		tBody.empty();

		for ( var i in result) {

			var tr = $("<tr></tr>");

			var tds = "<td>" + (parseInt(i) + 1) + "</td>" + "<td>" + result[i].name + "</td>" + "<td>" + result[i].gender + "</td>" + "<td>" + result[i].telephone + "</td>"
					+ "<td>" + result[i].address + "</td>" + "<td>" + result[i].addon + "</td>" + '<td class="operate"><i class="fa fa-edit"	onclick="staff_edit('
					+ result[i].id + ')"></i> ' + '<i class="fa fa-trash-o" onclick="staff_del(' + result[i].id + ')"></td>';

			tr.append(tds);
			tBody.append(tr);
		}
	}
</script>