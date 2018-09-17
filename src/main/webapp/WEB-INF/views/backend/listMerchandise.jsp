<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="box">
	<div class="box-header">
		<div class="row">
			<div class="col-lg-3 col-xs-6">
				<label for="barCode" class="control-label"> 条形码编号： </label>
				<input type="text" class="form-control" id="barCode">
			</div>
			<div class="col-lg-3 col-xs-6">
				<label for="tradeName" class="control-label">商品名称：</label>
				<input type="text" class="form-control" id="tradeName">
			</div>
			<div class="col-lg-6 col-xs-12" style="margin-top: 25px">
				<button id="btnSearch" type="button" class="btn btn-primary">查询</button>
			</div>
		</div>

		<div class="row" style="margin-top: 15px">
			<div class="col-lg-3 col-xs-6">
				<button id="btnAddMerch" type="button" class="btn btn-primary">添加商品</button>
			</div>
			<div class="col-xs-9">
				<button id="btnRefreshList" type="button" class="btn btn-success pull-right" onclick="freshMainPage()">刷新</button>
			</div>
		</div>
	</div>

	<div class="box-body">
		<table id="merchList" class="table table-bordered table-hover">
			<thead>
				<tr>
					<th width="5%">序号</th>
					<th width="15%">条形码编号</th>
					<th width="10%">商品名称</th>
					<th width="10%">单位编号</th>
					<th width="5%">进货价格</th>
					<th width="5%">预售价格</th>
					<th width="5%">折扣率</th>
					<th width="8%">商品类别编号</th>
					<th width="8%">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${merchs}" var="merch" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${merch.barCode }</td>
						<td>${merch.tradeName }</td>
						<td>${merch.uid }</td>
						<td>${merch.purchasePrice }</td>
						<td>${merch.presellPrice }</td>
						<td>${merch.discount }</td>
						<td>${merch.mid }</td>
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
</div>
<script>
	$(function() {
		$('#merchList').dataTable({
			"searching": true,
			"paging": true,
			"info": true,
			"bAutoWidth": true,
			"aaSorting" : [ [ 0, "asc" ] ],
			"bStateSave" : true,
			"aoColumnDefs" : [ {
				"orderable" : false,
				"aTargets" : [ 6,7,8 ]}] 
		});
		
		$('#btnAddMerch').click(function() {
			var url = sitePath + "/Offer/addEditOffer?id=0";
			window.popUp(url, "添加商品", "primary", 850, 500, function() {
				$('#btnRefreshList').click();
			}, false, false);
		});

		$('#btnSearch').click(function() {
			doQueryObject();
		});
	});

	function offer_edit(offerId) {
		var url = sitePath + "/Offer/addEditOffer?id=" + offerId;
		window.popUp(url, "编辑供应商", "primary", 850, 500, function() {
			$('#btnRefreshList').click();
		}, false, false);

	}

	function offer_del(offerId) {
		if (!offerId) {
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
				url : sitePath + '/Offer/deleteOffer',
				data : {
					id : offerId
				},
				success : function() {
					$('#btnRefreshList').click();
				}

			});
		}
	}

	function doQueryObject() {
		$.post(sitePath + '/Offer/findOffer', {
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

			var tds = "<td>" + (parseInt(i) + 1) + "</td>" + "<td>" + result[i].name + "</td>" + "<td>" + result[i].linkman + "</td>" + "<td>" + result[i].telephone + "</td>"
					+ "<td>" + result[i].address + "</td>" + "<td>" + result[i].remark + "</td>" + '<td class="operate"><i class="fa fa-edit"	onclick="offer_edit('
					+ result[i].id + ')"></i> ' + '<i class="fa fa-trash-o" onclick="offer_del(' + result[i].id + ')"></td>';

			tr.append(tds);
			tBody.append(tr);
		}
	}
</script>