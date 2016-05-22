<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ page import="jp.co.koh.form.LoginActionForm" %>
<%@ page import="java.util.List" %>
<%@ page import="jp.co.koh.common.constants.SystemConst" %>
<%@ page import="jp.co.koh.common.constants.JspConst" %>
<link rel="StyleSheet" href="/koh/css/kohRegist.css" type="text/css">
<html:html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>武士帳登録</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">
</head>

		<h1>武士帳</h1>
	<h2>武士登録者一覧でござる</h2><br>

	<body>


	<!-- User検索 -->
	<logic:notEmpty name="<%=SystemConst.SESSION_KEY.KOH_USER_LIST%>" property="kohUserList">
		<table >

					<tr align="left">
						<td width="10%">ID</td>
						<td width="10%">名前</td>

					</tr>

			<logic:iterate id="koh" name="<%=SystemConst.SESSION_KEY.KOH_USER_LIST%>" property="kohUserList" >

						<tr>
							<td nowrap="nowrap">
								<html:text name="koh" property="userId" style="width:150px;" indexed="true" readonly="true" />
							</td>
							<td nowrap="nowrap">
								<html:text name="koh" property="userPassword" style="width:150px;" indexed="true" readonly="true" />
							</td>

						</tr>
			</logic:iterate>

		</table>
	</logic:notEmpty>

<br>

	<br>

			<ul type="disc">
	<li><a href="/koh/pages/parts/menu.jsp">メニュー画面へ行きもうし候</a></li>
			</ul>

	</body>
</html:html>
