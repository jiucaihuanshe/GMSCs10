(function() {
	var _dialogArray = [];
	var typeDef = {
		'default' : BootstrapDialog.TYPE_DEFAULT,
		'info' : BootstrapDialog.TYPE_INFO,
		'primary' : BootstrapDialog.TYPE_PRIMARY,
		'success' : BootstrapDialog.TYPE_SUCCESS,
		'warning' : BootstrapDialog.TYPE_WARNING,
		'danger' : BootstrapDialog.TYPE_DANGER
	};

	function alertInfo(msg) {
		swal(msg);
	}

	function confirmEx(msg) {
		var ret = false;
		BootstrapDialog.confirm(msg, function(result) {
			ret = result;
		});

		return ret;
	}

	function popUp(url, title, type, width, height, callback, refreshPage, isModal) {
		if (!width) {
			width = 600;
		}
		if (!height) {
			height = 400;
		}
		var frameWidth = width;
		var frameHeight = height - 15;

		var dialogMainPage = sitePath + "/shared/dialogmain.jsp";

		var $message = $(
				'<iframe id="framePopup" data-url="' + url + '" style="border: 0px; padding: 0px; margin: 0px; width: ' + frameWidth + 'px;height:' + frameHeight + 'px"></iframe>')
				.attr("src", dialogMainPage);
		popUpHtml($message, title, type, width, height, callback, refreshPage, isModal);
	}

	function popUpHtml(html, title, type, width, height, callback, refreshPage, isModal) {
		if (!title) {
			title = "System Message";
		}

		var dlgType = BootstrapDialog.TYPE_PRIMARY;
		if (type && typeDef[type]) {
			dlgType = typeDef[type];
		}

		var cssStyle = "", cssClass = "customDiaglog-" + width + "-" + height;
		if (width && !isNaN(width)) {
			cssStyle += "." + cssClass + " .modal-dialog{width:" + width + "px;}";
		}
		if (height && !isNaN(height)) {
			cssStyle += "." + cssClass + " .modal-dialog .modal-content .modal-body{height:" + (height - 10) + "px;overflow-y:auto;overflow-x:hidden;margin:0px;padding:0px;}";
		}
		cssStyle += "</style>";
		cssStyle = '<style type=\"text/css\">' + cssStyle;
		$($("head")[0]).append(cssStyle);

		cssClass = cssClass + " popuppage";

		if (localStorage["isNightMode"] == '1') {
			cssClass += ' night-dialog ';
		}

		var dialog = new BootstrapDialog({
			title : title,
			type : dlgType,
			message : html,
			cssClass : cssClass
		});

		if (isModal) {
			dialog.setCloseByBackdrop(false).setCloseByKeyboard(false);
		}

		var dialogObj = {};
		dialogObj['dialog'] = dialog;
		dialogObj['callback'] = callback;
		dialogObj['refreshPage'] = refreshPage;
		_dialogArray.push(dialogObj);

		dialog.open();
	}

	function closePopUp(ret) {
		if (_dialogArray.length == 0) {
			return;
		}

		var dialogObj = _dialogArray.pop();
		var dialog = dialogObj['dialog']
		if (dialog) {
			dialog.close();
		}

		var callback = dialogObj['callback'], refreshPage = dialogObj['refreshPage'];
		if (typeof (callback) == 'function') {
			callback.call(null, ret);
		}

		if (refreshPage) {
			window.location.href = window.location.href;
		}
	}

	window.alertInfo = alertInfo;
	window.confirmEx = confirmEx;
	window.popUp = popUp;
	window.popUpHtml = popUpHtml;
	window.closePopUp = closePopUp;
})();

(function() {
	var oLanguage = {
		"oAria" : {
			"sSortAscending" : ": 升序排列",
			"sSortDescending" : ": 降序排列"
		},
		"oPaginate" : {
			"sFirst" : "首页",
			"sLast" : "末页",
			"sNext" : "下页",
			"sPrevious" : "上页"
		},
		"sEmptyTable" : "没有相关记录",
		"sInfo" : "第 _START_ 到 _END_ 条记录，共 _TOTAL_ 条",
		"sInfoEmpty" : "第 0 到 0 条记录，共 0 条",
		"sInfoFiltered" : "(从 _MAX_ 条记录中检索)",
		"sInfoPostFix" : "",
		"sDecimal" : "",
		"sThousands" : ",",
		"sLengthMenu" : "每页显示条数: _MENU_",
		"sLoadingRecords" : "正在载入...",
		"sProcessing" : "正在载入...",
		"sSearch" : "搜索:",
		"sSearchPlaceholder" : "",
		"sUrl" : "",
		"sZeroRecords" : "没有相关记录"
	}
	$.fn.dataTable.defaults.oLanguage = oLanguage;
})();
