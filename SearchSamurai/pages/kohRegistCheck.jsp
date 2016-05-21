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
		<title>���m���o�^</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">
	</head>
	<body>
	<html:form action="/KohRegistAction" method="POST">
	<h1>���m��</h1>
	<h2>���m�o�^�m�F���</h2><br>

	<table >

					<tr align="left">
						<td width="10%">ID</td>
						<td width="10%">���O</td>
						<td width="10%">�N��</td>
						<td width="10%">����</td>
						<td width="10%">�o�g</td>
						<td width="10%">�P��</td>
						<td width="10%">����</td>
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
						��L���e�œo�^���܂��B�X������Γo�^�������\����B<br>
					<html:submit property="submit" value=" �o�^ " />
						<br>


	</html:form>
	</body>
</html:html>
