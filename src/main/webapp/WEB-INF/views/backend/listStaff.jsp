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
			<div class="col-lg-6 col-xs-12" style="margin-top: 25px">
				<button id="btnSearch" type="button" class="btn btn-primary">查询</button>
			</div>
		</div>
		<div class="row" style="margin-top: 15px">
			<div class="col-lg-3 col-xs-6">
				<button id="btnAddDuty" type="button" class="btn btn-primary">添加职务</button>
				<button id="btnAddDuty" type="button" class="btn btn-primary" onclick="duty_edit(${duty_id})">修改职务</button>
				<button id="btnDelDuty" type="button" class="btn btn-primary" onclick="duty_del(${duty_id})">删除职务</button>
			</div>
		</div>
		
		<div class="box-body table-responsive no-padding">
			<table id="dutyList" class="table table-hover">
				<thead>
				   <tr>
					<th data-field="selectItem" data-checkbox="true"></th>
				  </tr>
				</thead>
			</table>
		</div>
		
		<div class="row" style="margin-top: 15px">
			<div class="col-lg-3 col-xs-6">
				<button id="btnAddStaff" type="button" class="btn btn-primary">添加员工</button>
			</div>
			<div class="col-xs-9" style="text-align: right">
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
<script type="text/javascript">
	var columns = [
		{
			field : 'selectItem',
			radio : true
		},
		{
			title : '职务ID',
			field : 'id',
			visible : false,
			align : 'center',
			valign : 'middle',
			width : '80px'
		},
		{
			title : '职务名称',
			field : 'name',
			align : 'center',
			valign : 'middle',
			sortable : true,
			width : '180px'
		},
		{
			title : '上级职务',
			field : 'parentName',
			align : 'center',
			valign : 'middle',
			sortable : true,
			width : '180px'
		}];

	$(function() {
		doGetObjects();
		$('#staffList').dataTable({
			"searching": true,	//	默认禁止搜索
			 /* "ordering": false, */	//禁止排序
			 "paging": true,	//禁止表格分页(默认打开)
			 "info": true,
			 "bAutoWidth": true,//自动宽度  
			 "aaSorting": [[0, "asc"]],
	         "aoColumnDefs": [{ "bSortable": false, "aTargets": [ 4,5,7 ] }],
	         "sPaginationType": "full_numbers"
		});
		
		$('#btnAddDuty').click(function() {
			var url = sitePath + "/Staff/addEditDuty?id=0";
			window.popUp(url, "添加职务", "primary", 850, 500, function() {
				$('#btnRefreshList').click();
			}, false, false);
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
	
	function doGetObjects() {
		var tableId="dutyList";
		var url=sitePath+"/Staff/findDuty";
		var table = new TreeTable(tableId,url, columns);
		table.setExpandColumn(2);
		table.init();
	}
	
	function getSelectedId(){
		//1.获取选中的对象，默认返回值为一个数据对象
		var selections = $("#dutyList").bootstrapTreeTable("getSelections");
		if(selections.length==0){
			return -1;//表示没选中任何对象
		}
		//1.2获得选中数组中下标为0的元素id的值
		return selections[0].id;
	}

	function staff_edit(staffId) {
		var url = sitePath + "/Staff/addEditStaff?id=" + staffId;
		window.popUp(url, "编辑员工", "primary", 850, 500, function() {
			$('#btnRefreshList').click();
		}, false, false);

	}
	
	function duty_edit(dutyId) {
		var dutyId = getSelectedId();
		if (dutyId==-1) {
			swal("请选择修改的职务");
			return;
		}
		var url = sitePath + "/Staff/addEditDuty?id=" + dutyId;
		window.popUp(url, "编辑职务", "primary", 850, 500, function() {
			$('#btnRefreshList').click();
		}, false, false);

	}

	function duty_del(dutyId) {
		var dutyId = getSelectedId();
		if (!dutyId) {
			return;
		}
		if(dutyId==-1){
			swal("请选择删除的职务！");
			return;
		}

		$.ajax({
			type : 'get',
			url : sitePath + '/Staff/findDutyCount',
			data : {
				id : dutyId,
			},
			success : function(ret) {
				if(ret==1){
					swal("请先删除部门下的职务！");
					return;
				}
				
				if(ret==0){
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
						del();
					});
				}
			}
		});
			
		function del() {
			$.ajax({
				type : 'get',
				url : sitePath + '/Staff/deleteDuty',
				data : {
					id : dutyId
				},
				success : function(ret) {
					$('#btnRefreshList').click();
				}
			});
		}
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