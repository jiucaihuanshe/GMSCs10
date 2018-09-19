<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="box">
	<div class="box-header">
		<div class="row search-panel">
			<div class="col-lg-3 col-xs-6">
				<label for="barCode" class="control-label"> 条形码编号： </label>
				<input type="text" class="form-control" id="barCode">
			</div>
			<div class="col-lg-3 col-xs-6">
				<label for="tradeName" class="control-label">商品名称：</label>
				<input type="text" class="form-control" id="tradeName">
			</div>
		</div>

		<div class="row" style="margin-top: 15px">
			<div class="col-lg-3 col-xs-6">
				<button id="btnSearch" type="button" class="btn btn-primary">查询</button>
				<button id="btnClear" type="button" class="btn btn-default">重置</button>
				<button id="btnRefreshList" type="button" class="btn btn-success" onclick="freshMainPage()"><i class="fa fa-refresh"></i>刷新</button>
			</div>
		</div>
	</div>

	<div class="box-body">
		<table id="merchList" class="table table-bordered table-hover">
			<thead>
				<tr>
					<th width="5%">序号</th>
					<th width="10%">条形码编号</th>
					<th width="15%">商品名称</th>
					<th width="8%">单位编号</th>
					<th width="5%">进货价格</th>
					<th width="5%">预售价格</th>
					<th width="5%">折扣率</th>
					<th width="5%">商品类别编号</th>
					<th width="10%">备注</th>
					<th width="8%">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${merchs}" var="merch" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${merch.barCode }</td>
						<td>${merch.tradeName }</td>
						<td>${merch.name }</td>
						<td>${merch.purchasePrice }</td>
						<td>${merch.presellPrice }</td>
						<td>${merch.discount }</td>
						<td>${merch.mname }</td>
						<td>${merch.remark }</td>
						<td class="operate">
							<i class="fa fa-edit" onclick="merch_edit(${merch.id })"></i>
							<i class="fa fa-trash-o" onclick="merch_del(${merch.id })"></i>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
		<div class="row box-header" style="margin-top: 15px">
			<div class="col-lg-3 col-xs-6">
				<button id="btnAddType" type="button" class="btn btn-primary">添加类别</button>
				<button id="btnAddType" type="button" class="btn btn-primary" onclick="type_edit(${type_id})">修改类别</button>
				<button id="btnDelType" type="button" class="btn btn-primary" onclick="type_del(${type_id})">删除类别</button>
			</div>
		</div>
		
		<div class="box-body table-responsive no-padding">
			<table id="typeList" class="table table-hover">
				<thead>
				   <tr>
					<th data-field="selectItem" data-checkbox="true"></th>
				  </tr>
				</thead>
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
       			title : '类别ID',
       			field : 'id',
       			visible : false,
       			align : 'center',
       			valign : 'middle',
       			width : '80px'
       		},
       		{
       			title : '类别名称',
       			field : 'name',
       			align : 'center',
       			valign : 'middle',
       			sortable : true,
       			width : '180px'
       		},
       		{
       			title : '上级类别',
       			field : 'tarentName',
       			align : 'center',
       			valign : 'middle',
       			sortable : true,
       			width : '180px'
       		}, 
       		{
       			title : '备注',
       			field : 'remark',
       			align : 'center',
       			valign : 'middle',
       			sortable : true,
       			width : '160px'
       		}];
       		
	$(function() {
		doGetObjects();
		$('#merchList').dataTable({
			"searching": true,
			"paging": true,
			"info": true,
			"bAutoWidth": true,
			"aaSorting" : [ [ 0, "asc" ] ],
			"bStateSave" : true,
			"sPaginationType": "full_numbers",
			"aoColumnDefs" : [{"orderable" : false,"aTargets" : [ 6,7,8 ]}] 
		});
		
		$('#btnAddType').click(function() {
			var url = sitePath + "/Stock/addEditStock?id=0";
			window.popUp(url, "添加类别", "primary", 850, 500, function() {
				$('#btnRefreshList').click();
			}, false, false);
		});
		
		$('#btnSearch').click(function() {
			doQueryObject();
		});
		
		$('#btnClear').click(function(){
			var container=	$('div.search-panel');
			clearSearchCriteria(container);
		});
	});
	
	function doGetObjects() {
		var tableId="typeList";
		var url=sitePath+"/Stock/findType";
		var table = new TreeTable(tableId,url, columns);
		table.setExpandColumn(2);
		table.init();
	}
	
	function getSelectedId(){
		//1.获取选中的对象，默认返回值为一个数据对象
		var selections = $("#typeList").bootstrapTreeTable("getSelections");
		if(selections.length==0){
			return -1;//表示没选中任何对象
		}
		//1.2获得选中数组中下标为0的元素id的值
		return selections[0].id;
	}

	function type_edit(typeId) {
		var typeId = getSelectedId();
		if (typeId==-1) {
			swal("请选择修改的类别");
			return;
		}
		var url = sitePath + "/Stock/addEditStock?id=" + typeId;
		window.popUp(url, "修改类别", "primary", 850, 500, function() {
			$('#btnRefreshList').click();
		}, false, false);

	}

	function type_del(typeId) {
		var typeId = getSelectedId();
		if (!typeId) {
			return;
		}
		if(typeId==-1){
			swal("请选择删除的类别！");
			return;
		}

		$.ajax({
			type : 'get',
			url : sitePath + '/Stock/findTypeCount',
			data : {
				id : typeId,
			},
			success : function(ret) {
				if(ret==1){
					swal("请先删除类别下的分类！");
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
				url : sitePath + '/Stock/deleteType',
				data : {
					id : typeId
				},
				success : function(ret) {
					$('#btnRefreshList').click();
				}
			});
		}
	}

	function doQueryObject() {
		$.post(sitePath + '/Stock/findStock', {
			barCode : $("#barCode").val(),
			tradeName : $("#tradeName").val()
		}, function(result) {
			setTableBodyRows(result);
		});
	}

	function setTableBodyRows(result) {
		var tBody = $("#merchList>tbody");
		tBody.empty();

		for ( var i in result) {

			var tr = $("<tr></tr>");

			var tds = "<td>" + (parseInt(i) + 1) + "</td>" + "<td>" + result[i].barCode + "</td>" + "<td>" + result[i].tradeName + "</td>" + "<td>" + result[i].name + "</td>"
					+ "<td>" + result[i].purchasePrice + "</td>" + "<td>" + result[i].presellPrice + "</td>" +"<td>" + result[i].discount + "</td>" +"<td>" + result[i].mname + "</td>" +
					"<td>" + result[i].remark  +"</td>" + '<td class="operate"><i class="fa fa-edit"	onclick="merch_edit('
					+ result[i].id + ')"></i> ' + '<i class="fa fa-trash-o" onclick="merch_del(' + result[i].id + ')"></td>';

			tr.append(tds);
			tBody.append(tr);
		}
	}
</script>