<%@ page contentType="text/html; charset=Windows-31J" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ page import="jp.co.koh.common.constants.SystemConst" %>
<%@ page import="jp.co.koh.form.KohRegistActionForm" %>
<%@ page import="com.ibatis.common.resources.Resources" %>
<%@ page import="com.ibatis.sqlmap.client.SqlMapClient" %>
<%@ page import="com.ibatis.sqlmap.client.SqlMapClientBuilder" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.Reader" %>

<%@ page import="jp.co.koh.common.constants.SystemConst" %>
<%@ page import="jp.co.koh.common.constants.JspConst" %>
<link rel="StyleSheet" href="/koh/css/kohRegist.css" type="text/css">
<html:html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>武士帳結果</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">
	</head>
	<body>
		<html:form action="/KohRegistAction" method="POST">
			<div style="text-align:center">
				<h1>武士帳</h1>
				<h2>武士結果画面でござる</h2><br>
			</div>
				<!-- cssを使用してみる -->
				<p>
			<div class="message_area" align="center">
						<!-- 登録とか削除とかできたらとできなかったら -->
						<logic:notEmpty name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request">
							<bean:write name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request" /><br>
						</logic:notEmpty>
			</div>
			<div style="text-align:center">
				<!-- リンクをつけてみました -->
					<ul  style="list-style-type:none;">
						<li><a href="/koh/pages/parts/menu.jsp">メニュー画面へ行きもうし候</a></li><br>
					</ul>
			</div>
		</html:form>
	</body>
</html:html>
