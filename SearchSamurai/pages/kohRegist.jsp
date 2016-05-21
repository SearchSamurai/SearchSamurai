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
		<title>武士帳登録</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">
	</head>
	<body>
		<html:form action="/KohRegistCheckAction" method="POST">
			<div style="text-align:center">
			<h1>武士帳</h1>
			<h2>武士登録でござる</h2><br>
			</div>

				<!-- cssを使用してみる -->
				<p>
				<div class="message_area" align="center">
					<!-- バリデーションエラー -->
					<html:errors />
						<!-- 登録できたらとID重複の場合 -->
						<logic:notEmpty name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request">
							<bean:write name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request" /><br>
						</logic:notEmpty>
				</div>
	<br>
	<!-- 登録画面 -->
		<table border="1"  align="center"><caption>武士を登録し候</caption>
			<tr><td> ID </td><td> <html:text property="bushiId"/> </td></tr>
			<tr><td> 名前 </td><td> <html:text property="name"/> </td></tr>
			<tr><td> 年齢 </td><td> <html:text property="age"/> </td></tr>
			<tr><td> 所属隊 </td><td> <html:text property="bushiGroup"/> </td></tr>
			<tr><td> 出身地  </td><td> <html:text property="birthPlace"/> </td></tr>
			<tr><td> 単価 </td><td> <html:text property="unitPrice"/> </td></tr>
			<tr><td> 得意武器 </td><td><select name="weapon" style=width:173px>
					<option value="刀">刀</option>
					<option value="弓">弓</option>
					<option value="槍">槍</option>
					<option value="銃">銃</option>
				</select> </td></tr>

		</table>
	<br>
		<div style="text-align:center">
			<html:submit property="submit" value=" 登録 " />
	<br>
		<!-- リンクをつけてみました -->
			<ul  style="list-style-type:none;">
				<li><a href="/koh/pages/kohSearch.jsp">武士帳 検索画面へ行きもうし候</a><br></li>

				<li><a href="/koh/pages/parts/menu.jsp">メニュー画面へ行きもうし候</a></li>
			</ul>
		</div>
		</html:form>
	</body>
</html:html>
