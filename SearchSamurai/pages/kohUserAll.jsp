<%@ page contentType="text/html; charset=Windows-31J" %>
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
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>���m���o�^</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">
</head>

		<h1>���m��</h1>
	<h2>���m�o�^�҈ꗗ�ł�����</h2><br>

	<body>


	<!-- User���� -->
	<logic:notEmpty name="<%=SystemConst.SESSION_KEY.KOH_USER_LIST%>" property="kohUserList">
		<table >

					<tr align="left">
						<td width="10%">ID</td>
						<td width="10%">���O</td>

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
	<li><a href="/koh/pages/parts/menu.jsp">���j���[��ʂ֍s����������</a></li>
			</ul>

	</body>
</html:html>
