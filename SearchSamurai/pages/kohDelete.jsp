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
		<title>���m���o�^</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">
	</head>
	<body>
	<html:form action="/KohDeleteCheckAction" method="POST">
	<h1>���m��</h1>
	<h2>���m�폜�ł�����</h2><br>

	<!-- css���g�p���Ă݂� -->
	<p>
	<div class="message_area">
					<!-- �o���f�[�V�����G���[ -->
					<html:errors />
						<!-- ID�d���̏ꍇ -->
						<logic:notEmpty name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request">
							<bean:write name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request" /><br>
						</logic:notEmpty>
	</div>
	</p>
	<br>
	<!-- �폜��� -->
	<table border="1"><caption>�폜���������m��ID��I�ь�</caption>
	<tr><td> ID </td><td> <html:text property="bushiId"/> </td></tr>

	</table>
	<br>
		<html:submit property="submit" value=" �폜 " />
	<br>
	<!-- �����N�����Ă݂܂��� -->
		<ul type="disc">
	<li><a href="/koh/pages/kohSearch.jsp">���m�� ������ʂ֍s����������</a></li>
		</ul>
		<ul type="disc">
	<li><a href="/koh/pages/parts/menu.jsp">�o�^��ʂ֍s����������</a></li>
		</ul>
		<ul type="disc">
	<li><a href="/koh/pages/parts/menu.jsp">���j���[��ʂ֍s����������</a></li>
		</ul>
	</html:form>
	</body>
</html:html>
