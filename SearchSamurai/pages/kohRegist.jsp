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
		<html:form action="/KohRegistCheckAction" method="POST">
			<div style="text-align:center">
			<h1>���m��</h1>
			<h2>���m�o�^�ł�����</h2><br>
			</div>

				<!-- css���g�p���Ă݂� -->
				<p>
				<div class="message_area" align="center">
					<!-- �o���f�[�V�����G���[ -->
					<html:errors />
						<!-- �o�^�ł������ID�d���̏ꍇ -->
						<logic:notEmpty name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request">
							<bean:write name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request" /><br>
						</logic:notEmpty>
				</div>
	<br>
	<!-- �o�^��� -->
		<table border="1"  align="center"><caption>���m��o�^����</caption>
			<tr><td> ID </td><td> <html:text property="bushiId"/> </td></tr>
			<tr><td> ���O </td><td> <html:text property="name"/> </td></tr>
			<tr><td> �N�� </td><td> <html:text property="age"/> </td></tr>
			<tr><td> ������ </td><td> <html:text property="bushiGroup"/> </td></tr>
			<tr><td> �o�g�n  </td><td> <html:text property="birthPlace"/> </td></tr>
			<tr><td> �P�� </td><td> <html:text property="unitPrice"/> </td></tr>
			<tr><td> ���ӕ��� </td><td><select name="weapon" style=width:173px>
					<option value="��">��</option>
					<option value="�|">�|</option>
					<option value="��">��</option>
					<option value="�e">�e</option>
				</select> </td></tr>

		</table>
	<br>
		<div style="text-align:center">
			<html:submit property="submit" value=" �o�^ " />
	<br>
		<!-- �����N�����Ă݂܂��� -->
			<ul  style="list-style-type:none;">
				<li><a href="/koh/pages/kohSearch.jsp">���m�� ������ʂ֍s����������</a><br></li>

				<li><a href="/koh/pages/parts/menu.jsp">���j���[��ʂ֍s����������</a></li>
			</ul>
		</div>
		</html:form>
	</body>
</html:html>
