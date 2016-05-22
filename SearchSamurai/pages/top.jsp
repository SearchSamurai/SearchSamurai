<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ page import="jp.co.koh.common.constants.SystemConst" %>
<%@ page import="jp.co.koh.common.constants.JspConst" %>
<link rel="StyleSheet" href="/koh/css/top.css" type="text/css">

<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>武士帳</title>
<link rel="shortcut icon" href="/koh/img/favicon.ico">
</head>
<body>

	<!-- メインヘッダー部分 -->

				<jsp:include page="<%=JspConst.JSP_COMMON.HEADER%>" />

			<!-- メインヘッダー部分ここまで -->

	<!-- サイドエリア部分 -->

				<jsp:include page="<%=JspConst.JSP_COMMON.LOGIN%>" />

	<!-- サイドエリア部分 終わり -->

		<!-- フッター部分 -->

				<jsp:include page="<%=JspConst.JSP_COMMON.FOOTER%>" />

</body>
</html:html>