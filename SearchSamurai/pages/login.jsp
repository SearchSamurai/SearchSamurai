<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ page import="jp.co.koh.common.constants.SystemConst"%>
<%@ page import="jp.co.koh.common.constants.JspConst"%>

<html:html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>武士帳</title>
		<SCRIPT type="text/javascript">
		<!--
		 //値が入力されなければログインボタン押せない用に変更
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
			//自動でメッセージを表示
			myMsg = "よくぞ参られた,,,其方を待っておったぞ,,,⊂二二二（　＾ω＾）二⊃";
			myCnt = 0;
			function myFunc(){
		     document.LoginActionForm.myFormMes.value = myMsg.substring( 0 , myCnt ) + "_";
		     myCnt = ( myCnt == myMsg.length ) ? 0 : myCnt+1;
			}
		// -->
		</SCRIPT>

	</head>
	<body onload="fieldChanged();">
	<html:form action="/LoginAction" method="POST">
		<div style="text-align:center">
			<h1>武士帳</h1>
				<h2>ログイン</h2>
				<!-- 自動でメッセージを出す -->
			<p><input type="text" size="50" name="myFormMes"></p>
			<script type="text/javascript"><!--
			setInterval("myFunc()",200);
			// -->
			</script>
				<p>IDとパスワードを入力されたし</p>
		</div>


	<!-- actionでセットしたメッセージ -->
	<div style="text-align:center">
	<logic:notEmpty name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request">
		<bean:write name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request" />
	</logic:notEmpty>
	</div>
	<br>

		<div style="text-align:center">武士ID</div><br>

		<div style="text-align:center"><input type=text name="userId" value="" id="userId" onkeyup="fieldChanged();" onchange="fieldChanged();"/></div><br>

		<div style="text-align:center">パスワード</div><br>

		<div style="text-align:center"><input type=password name="userPassword" value="" id="userPassword" onkeyup="fieldChanged();" onchange="fieldChanged();"/></div><br>

		<div style="text-align:center"><input type="submit" value="ログイン" id="login"></div><br>


		<div style="text-align:center">※新規登録する方は<html:link href="<%=JspConst.JSP_FOWARD.USER_REGIST%>" >こちら</html:link></div>

	</html:form>
	</body>
</html:html>
