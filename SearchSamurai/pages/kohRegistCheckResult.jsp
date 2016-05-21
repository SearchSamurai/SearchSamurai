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
		<title>���m������</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">
	</head>
	<body>
		<html:form action="/KohRegistAction" method="POST">
			<div style="text-align:center">
				<h1>���m��</h1>
				<h2>���m���ʉ�ʂł�����</h2><br>
			</div>
				<!-- css���g�p���Ă݂� -->
				<p>
			<div class="message_area" align="center">
						<!-- �o�^�Ƃ��폜�Ƃ��ł�����Ƃł��Ȃ������� -->
						<logic:notEmpty name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request">
							<bean:write name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request" /><br>
						</logic:notEmpty>
			</div>
			<div style="text-align:center">
				<!-- �����N�����Ă݂܂��� -->
					<ul  style="list-style-type:none;">
						<li><a href="/koh/pages/parts/menu.jsp">���j���[��ʂ֍s����������</a></li><br>
					</ul>
			</div>
		</html:form>
	</body>
</html:html>
