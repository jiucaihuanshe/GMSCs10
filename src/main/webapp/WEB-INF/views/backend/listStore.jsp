<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="box">
	<div class="box-header">
		<div class="row">
			<div class="col-lg-3 col-xs-6">
				<label for="searchStoreName" class="control-label"> 仓库名称 </label>
				<input type="text" class="form-control" id="searchStoreName">
			</div>
			<div class="col-lg-3 col-xs-6">
				<label for="searchPhone" class="control-label">电话：</label>
				<input type="text" class="form-control" id="searchPhone">
			</div>
			<div class="col-lg-6 col-xs-12" style="margin-top: 25px">
				<button id="btnSearch" type="button" class="btn btn-primary">查询</button>
			</div>
		</div>

		<div class="row" style="margin-top: 15px">
			<div class="col-lg-3 col-xs-6">
				<button id="btnAddStore" type="button" class="btn btn-primary">添加仓库</button>
			</div>
			<div class="col-xs-9">
				<button id="btnRefreshList" type="button" class="btn btn-success pull-right" onclick="freshMainPage()">刷新</button>
			</div>
		</div>
	</div>

	<div class="box-body">
		<table id="storeList" class="table table-bordered table-hover">
			<thead>
				<tr>
					<th width="8%">序号</th>
					<th width="10%">仓库名称</th>
					<th width="10%">电话</th>
					<th width="15%">地址</th>
					<th width="8%">负责人</th>
					<th width="15%">备注</th>
					<th width="15%">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${stores}" var="store" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${store.name }</td>
						<td>${store.telephone }</td>
						<td>${store.address }</td>
						<td>${store.eid }</td>
						<td>${store.remark }</td>
						<td class="operate">
							<i class="fa fa-edit" onclick="store_edit(${store.id })"></i>
							<i class="fa fa-trash-o" onclick="store_del(${store.id })"></i>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<script>
	$(function() {
		
		$('#storeList').dataTable({
			"searching": true,
			"paging": true,
			"info": true,
			"bAutoWidth": true,
            "aaSorting": [[0, "asc"]],
            "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 4,5,6 ] }],
            "sPaginationType": "full_numbers",
	    });
		
		$('#btnAddStore').click(function() {
			var url = sitePath + "/Store/addEditStore?id=0";
			window.popUp(url, "添加供货商", "primary", 850, 500, function() {
				$('#btnRefreshList').click();
			}, false, false);
		});

		$('#btnSearch').click(function() {
			doQueryObject();
		});
	});

	function store_edit(storeId) {
		var url = sitePath + "/Store/addEditStore?id=" + storeId;
		window.popUp(url, "编辑供应商", "primary", 850, 500, function() {
			$('#btnRefreshList').click();
		}, false, false);

	}

	function store_del(storeId) {
		if (!storeId) {
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
				url : sitePath + '/Store/deleteStore',
				data : {
					id : storeId
				},
				success : function() {
					$('#btnRefreshList').click();
				}

			});
		}
	}

	function doQueryObject() {
		$.post(sitePath + '/Store/findStore', {
			name : $("#searchStoreName").val(),
			telephone : $("#searchPhone").val()
		}, function(result) {
			setTableBodyRows(result);
		});
	}

	function setTableBodyRows(result) {
		var tBody = $("#storeList>tbody");
		tBody.empty();

		for ( var i in result) {

			var tr = $("<tr></tr>");

			var tds = "<td>" + (parseInt(i) + 1) + "</td>" + "<td>" + result[i].name + "</td>" + "<td>" + result[i].telephone + "</td>"
					+ "<td>" + result[i].address + "</td>" +  "<td>" + result[i].eid + "</td>" +"<td>" + result[i].remark + "</td>" + '<td class="operate"><i class="fa fa-edit"	onclick="store_edit('
					+ result[i].id + ')"></i> ' + '<i class="fa fa-trash-o" onclick="store_del(' + result[i].id + ')"></td>';

			tr.append(tds);
			tBody.append(tr);
		}
	}
</script>