<%@ page language="java"
	contentType="text/html;
	charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>赤城樹2031003</title>
	<script type="text/javascript" src="<%= request.getContextPath() %>/jquery.min.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/jquery.cookie.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/jquery.simplemodal.1.4.2.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			var over18 = jQuery.cookie('over18');
			if (over18 !== "Yes") {
				confirm();
			}
			$('.remove_cookie').click(function () {
				$.cookie('over18', '', { expires: 0 });
				location.reload();
			});
		});

		function confirm() {
			jQuery('#modal').modal({
				opacity: 80,
				overlayCss: { backgroundColor: "#000" },
				containerId: 'confirm_modal',
				position: ["30%",],
				onShow: function (dialog) {
					var modal = this;
					jQuery('.yes', dialog.data[0]).click(function () {
						var clifetime = new Date();
						clifetime.setTime(clifetime.getTime() + (2 * 60 * 60 * 1000));//2時間
						jQuery.cookie('over18', 'Yes', { expires: clifetime });
						modal.close();
					});
				}
			});
		}
	</script>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style.css">
</head>

<body>
	<h1 class="time"><%= new java.util.Date() %></h1>

	<div id="modal">

		<p>このサイトは成人向けの情報を含みますので、<br />
			18歳未満の方の閲覧を固くお断りいたします。</p>

		<p>あなたは18歳以上ですか？</p>

		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td><a class="yes"><img src="<%= request.getContextPath() %>/enter.png" width="160" height="70" alt="ENTER" /><img src="<%= request.getContextPath() %>/confirm.png"
							width="70" height="70" alt="" /></a></td>
				<td></td>
				<td><a href="https://kids.yahoo.co.jp/"><img src="<%= request.getContextPath() %>/leave.png" width="160" height="70" alt="EXIT" /></a>
				</td>
			</tr>
		</table>

	</div>
	<!-- /modal -->

	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-27007852-1']);
		_gaq.push(['_trackPageview']);
		(function () {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		})();
	</script>

</body>
<footer>
	<a class="remove_cookie">Cookie削除</a>
</footer>

</html>