<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="box">
	<div class="box-header">
		<div class="row search-panel">
			<div class="col-lg-3 col-xs-6">
				<label for="searchOfferName" class="control-label"> 供货商： </label>
				<input type="text" class="form-control" id="searchOfferName">
			</div>
			<div class="col-lg-3 col-xs-6">
				<label for="searchPhone" class="control-label">电话：</label>
				<input type="text" class="form-control" id="searchPhone">
			</div>
		</div>

		<div class="row" style="margin-top: 15px">
			<div class="col-lg-3 col-xs-6">
				<button id="btnAddOffer" type="button" class="btn btn-primary">添加供货商</button>
				<button id="btnSearch" type="button" class="btn btn-primary">查询</button>
				<button id="btnClear" type="button" class="btn btn-default">重置</button>
				<button id="btnRefreshList" type="button" class="btn btn-success" onclick="freshMainPage()"><i class="fa fa-refresh"></i>刷新</button>
			</div>
		</div>
	</div>

	<div class="box-body">
		<table id="offerList" class="table table-bordered table-hover">
			<thead>
				<tr>
					<th width="8%">序号</th>
					<th width="10%">供货商</th>
					<th width="8%">联系人</th>
					<th width="10%">电话</th>
					<th width="15%">地址</th>
					<th width="15%" id="remark">备注</th>
					<th width="15%">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${offers}" var="offer" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${offer.name }</td>
						<td>${offer.linkman }</td>
						<td>${offer.telephone }</td>
						<td>${offer.address }</td>
						<td>${offer.remark }</td>
						<td class="operate">
							<i class="fa fa-edit" onclick="offer_edit(${offer.id })"></i>
							<i class="fa fa-trash-o" onclick="offer_del(${offer.id })"></i>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<script>
	$(function() {
		
		$('#offerList').dataTable({
			"searching": true,
			"paging": true,
			"info": true,
			"bAutoWidth": true,
            "aaSorting": [[0, "asc"]],
            "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 4,5,6 ] }],
            "sPaginationType": "full_numbers",
	    });
		
		$('#btnAddOffer').click(function() {
			var url = sitePath + "/Offer/addEditOffer?id=0";
			window.popUp(url, "添加供货商", "primary", 850, 500, function() {
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
			name : $("#searchOfferName").val(),
			telephone : $("#searchPhone").val()
		}, function(result) {
			setTableBodyRows(result);
		});
	}

	function setTableBodyRows(result) {
		var tBody = $("#offerList>tbody");
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