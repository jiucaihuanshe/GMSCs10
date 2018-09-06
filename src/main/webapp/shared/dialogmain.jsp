<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>
<jsp:include page="css.jsp"></jsp:include>
</head>
<body>
	<div class="container" id="contentFrame"></div>
	<jsp:include page="js.jsp"></jsp:include>
	<script>
		$(function() {
			var loadUrl = $(window.parent.frames["framePopup"])
					.attr('data-url');

			loadDialogPage(loadUrl);

			function loadDialogPage(url) {
				var index = layer.load(0, {
					shade : false
				});
				$.ajax({
					type : 'get',
					url : url,
					success : function(ret) {
						$("#contentFrame").html(ret);
						layer.close(index);
					},
					error : function() {
						layer.close(index);
					}
				});
			}

		})
	</script>
</body>
</html>