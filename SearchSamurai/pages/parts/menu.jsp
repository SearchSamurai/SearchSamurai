<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ page import="jp.co.koh.common.constants.SystemConst" %>
<%@ page import="jp.co.koh.common.constants.JspConst" %>
<link rel="StyleSheet" href="/koh/css/parts/menu.css" type="text/css">
<%
	String loginFlg = (String) request.getSession().getAttribute(SystemConst.SESSION_KEY.LOGIN_FLG);
%>


<html:html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>���m��</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">
	</head>
	<body>

	<html:form action="/LogoutAction" method="POST">
	<h1>���m��</h1>
	<h2>���j���[</h2>

	<ul type="disc">
		<li><a href="/koh/pages/kohSearch.jsp">���m�� ����</a><br><br></li>
		<li><a href="/koh/pages/kohRegist.jsp">���m�� �o�^</a><br><br></li>
		<li><a href="/koh/pages/kohDelete.jsp">���m�� �폜</a><br><br></li>
		<li><a href="/koh/pages/kohUserAll.jsp">���m�� �o�^�҈ꗗ</a><br><br></li>
		<li><a href="/koh/pages/kohjavascript.jsp">���m�� javascript���K�p</a><br><br></li>
	</ul>

		<html:submit property="submit" value="���O�A�E�g" />
	</html:form>
</body>
</html:html>