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
		<title>武士帳</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">
	</head>
	<body>

	<html:form action="/LogoutAction" method="POST">
	<h1>武士帳</h1>
	<h2>メニュー</h2>

	<ul type="disc">
		<li><a href="/koh/pages/kohSearch.jsp">武士帳 検索</a><br><br></li>
		<li><a href="/koh/pages/kohRegist.jsp">武士帳 登録</a><br><br></li>
		<li><a href="/koh/pages/kohDelete.jsp">武士帳 削除</a><br><br></li>
		<li><a href="/koh/pages/kohUserAll.jsp">武士帳 登録者一覧</a><br><br></li>
		<li><a href="/koh/pages/kohjavascript.jsp">武士帳 javascript練習用</a><br><br></li>
	</ul>

		<html:submit property="submit" value="ログアウト" />
	</html:form>
</body>
</html:html>