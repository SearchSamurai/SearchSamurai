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
		<title>���m���폜</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">
	</head>
	<body>
	<html:form action="/KohDeleteAction" method="POST">
	<h1>���m��</h1>
	<h2>���m�폜�m�F���</h2><br>


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

	<logic:iterate id="koh" name="<%=SystemConst.SESSION_KEY.KOH_DELETE_ACTION_FORM%>" property="kohDeleteList" >
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
						��L���e�ō폜���܂��B�X������΍폜�������\����B<br>
					<html:submit property="submit" value=" �폜 " />
						<br>


	</html:form>
	</body>
</html:html>
