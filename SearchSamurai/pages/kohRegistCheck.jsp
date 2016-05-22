<%@ page contentType="text/html; charset=UTF-8" %>
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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>武士帳登録</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">
	</head>
	<body>
	<html:form action="/KohRegistAction" method="POST">
	<h1>武士帳</h1>
	<h2>武士登録確認画面</h2><br>

	<table >

					<tr align="left">
						<td width="10%">ID</td>
						<td width="10%">名前</td>
						<td width="10%">年齢</td>
						<td width="10%">所属</td>
						<td width="10%">出身</td>
						<td width="10%">単価</td>
						<td width="10%">武器</td>
					</tr>

	<logic:iterate id="koh" name="<%=SystemConst.SESSION_KEY.KOH_REGIST_ACTION_FORM%>" property="kohRegistCheckList" >
						<tr>
							<td nowrap="nowrap">
								<html:text name="koh" property="bushiId" style="width:150px;" indexed="true" readonly="true" />
							</td>
							<td nowrap="nowrap">
								<html:text name="koh" property="name" style="width:150px;" indexed="true" readonly="true" />
							</td>
							<td nowrap="nowrap">
								<html:text name="koh" property="age" style="width:150px;" indexed="true" readonly="true" />
							</td>
							<td nowrap="nowrap">
								<html:text name="koh" property="bushiGroup" style="width:150px;" indexed="true" readonly="true" />
							</td>
							<td nowrap="nowrap">
								<html:text name="koh" property="birthPlace" style="width:150px;" indexed="true" readonly="true" />
							</td>
							<td nowrap="nowrap">
								<html:text name="koh" property="unitPrice" style="width:150px;" indexed="true" readonly="true" />
							</td>
							<td nowrap="nowrap">
								<html:text name="koh" property="weapon" style="width:150px;" indexed="true" readonly="true" />
							</td>
						</tr>
					</logic:iterate>
						</table>

						<br>
						上記内容で登録します。宜しければ登録を押し申し候。<br>
					<html:submit property="submit" value=" 登録 " />
						<br>


	</html:form>
	</body>
</html:html>
