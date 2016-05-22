<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ page import="jp.co.koh.common.constants.SystemConst" %>
<%@ page import="jp.co.koh.common.constants.JspConst" %>
<link rel="StyleSheet" href="/koh/css/kohRegist.css" type="text/css">

<html:html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>武士帳</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">
		<SCRIPT type="text/javascript">
		<!--
		 //値が入力されなければ登録ボタン押せない用に仕様変更
		 // フィールドが変更された場合に処理する関数
		function fieldChanged(){
		     var userId = getField("userId");
		     var password = getField("userPassword");
		     var disabled = true;

		     if (userId.value.length > 0 && userPassword.value.length > 0) {
		         disabled = false;
		     }

		    var login = getField("login");
		     if (disabled) {
		         login.setAttribute("disabled", "disabled");
		     }
		     else {
		         login.removeAttribute("disabled");
		     }
		 }

		 // フィールドを取得する関数
		 function getField(fieldName){
		      var field = document.getElementById(fieldName);
		     if (field == undefined) {
		         throw new Error("要素が見つかりません: " + fieldName);
		     }
		     return field;
		 }
		// -->
		</SCRIPT>
	</head>
	<body onload="fieldChanged();">
	<html:form action="/UserRegistAction" method="POST">
			<div style="text-align:center">
				<h1>武士帳</h1>
				<h2>新武士登録</h2><br>
				<h3>登録するIDとパスワードを入力されたし</h3>
			</div>
			<!-- cssを使用してみる -->
				<br>

				<div class="message_area" align="center">
						<!-- バリデーションエラー -->
					<html:errors />
							<logic:notEmpty name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request">
								<bean:write name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request" /><br>
							</logic:notEmpty>
				</div>

			<div style="text-align:center">ID</div><br>

			<div style="text-align:center"><input type=text name="userId" value="" id="userId" onkeyup="fieldChanged();" onchange="fieldChanged();"/></div><br>

			<div style="text-align:center">パスワード</div><br>

			<div style="text-align:center"><input type=password name="userPassword" value="" id="userPassword" onkeyup="fieldChanged();" onchange="fieldChanged();"/></div><br>

			<div style="text-align:center"><input type="submit" value="登録" id="login"></div>

	</html:form>
	</body>
</html:html>