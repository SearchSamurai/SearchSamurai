<%@ page contentType="text/html; charset=Windows-31J" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ page import="jp.co.koh.common.constants.SystemConst" %>
<%@ page import="jp.co.koh.common.constants.JspConst" %>
<link rel="StyleSheet" href="/koh/css/kohRegist.css" type="text/css">
<html:html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>武士帳登録</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">
	</head>
	<body>
	<html:form action="/KohDeleteCheckAction" method="POST">
	<h1>武士帳</h1>
	<h2>武士削除でござる</h2><br>

	<!-- cssを使用してみる -->
	<p>
	<div class="message_area">
					<!-- バリデーションエラー -->
					<html:errors />
						<!-- ID重複の場合 -->
						<logic:notEmpty name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request">
							<bean:write name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request" /><br>
						</logic:notEmpty>
	</div>
	</p>
	<br>
	<!-- 削除画面 -->
	<table border="1"><caption>削除したい武士のIDを選び候</caption>
	<tr><td> ID </td><td> <html:text property="bushiId"/> </td></tr>

	</table>
	<br>
		<html:submit property="submit" value=" 削除 " />
	<br>
	<!-- リンクをつけてみました -->
		<ul type="disc">
	<li><a href="/koh/pages/kohSearch.jsp">武士帳 検索画面へ行きもうし候</a></li>
		</ul>
		<ul type="disc">
	<li><a href="/koh/pages/parts/menu.jsp">登録画面へ行きもうし候</a></li>
		</ul>
		<ul type="disc">
	<li><a href="/koh/pages/parts/menu.jsp">メニュー画面へ行きもうし候</a></li>
		</ul>
	</html:form>
	</body>
</html:html>
