<%@ page contentType="text/html; charset=Windows-31J" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ page import="jp.co.koh.common.constants.SystemConst" %>
<%@ page import="jp.co.koh.common.constants.JspConst" %>
<link rel="StyleSheet" href="/koh/css/top.css" type="text/css">

<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>���m��</title>
<link rel="shortcut icon" href="/koh/img/favicon.ico">
</head>
<body>

	<!-- ���C���w�b�_�[���� -->

				<jsp:include page="<%=JspConst.JSP_COMMON.HEADER%>" />

			<!-- ���C���w�b�_�[���������܂� -->

	<!-- �T�C�h�G���A���� -->

				<jsp:include page="<%=JspConst.JSP_COMMON.LOGIN%>" />

	<!-- �T�C�h�G���A���� �I��� -->

		<!-- �t�b�^�[���� -->

				<jsp:include page="<%=JspConst.JSP_COMMON.FOOTER%>" />

</body>
</html:html>