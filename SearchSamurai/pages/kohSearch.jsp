<%@ page contentType="text/html; charset=MS932" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ page import="jp.co.koh.common.constants.SystemConst" %>
<%@ page import="jp.co.koh.form.KohSearchActionForm" %>
<%@ page import="com.ibatis.common.resources.Resources" %>
<%@ page import="com.ibatis.sqlmap.client.SqlMapClient" %>
<%@ page import="com.ibatis.sqlmap.client.SqlMapClientBuilder" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.Reader" %>
<link rel="StyleSheet" href="/koh/css/kohSearch.css" type="text/css">
<script type="text/javascript" src="/koh/js/kohSearch.js" charset="MS932"></script>


<html:html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>武士帳</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">
	</head>

	<body>

	<div id="wrapper">
		<h1>武士帳</h1>
		<h2>武士検索にて候</h2>
		<br>
			<h3>検索条件を入力されたし</h3>
	</div>

	<div id="wrapper">
		<html:form action="/KohSearchAction" method="POST">

       		<tr>
      			<td>齢<br></td>
        		<td>
       		 	<html:text property="ageFrom" size="20" maxlength="3" value=""/></td>
        		<td>～</td>
        		<td><html:text property="ageTo" size="20" maxlength="3" value=""/></td>
       		 	<td>歳</td>
      	     </tr>
			 <br><br><br>

       		 <tr>
        		<td>所属<br></td>
					<html:select property="groupList" style="width:173px">
						<html:options collection="<%=SystemConst.SESSION_KEY.KOH_GROUP_LIST%>" property="groupList"/>
					</html:select>
			</tr>
			<br><br><br>

       		<tr>
        		<td>単価<br></td>
        		<td><html:text property="unitPriceFrom" size="20" maxlength="9" value=""/></td>
        		<td>～</td>
	        	<td><html:text property="unitPriceTo" size="20" maxlength="9" value=""/></td>
	        	<td>円</td>
	        </tr>
			<br><br><br>

	        <tr>
	        	<td>武器<br></td>
	        	<td>
					<html:select property="weaponList" style="width:173px">
						<html:options collection="<%=SystemConst.SESSION_KEY.KOH_WEAPON_LIST%>" property="weaponList"/>
					</html:select>
				</td>
	        </tr>
	        <br><br><br>

			<td>並べ替えにて候<br></td>
			<td>※検索前でも検索後でも設定可能にて候<br></td>

	        <select name="sortFlag" style="width:173px">
				<option value="0"></option>
				<option value="1">登録日時が新しい順にて候</option>
				<%--<option value="2">テスト</option>--%>
			</select>
			<br><br><br>

			<html:submit property="submit" value=" 検索 " />

			<INPUT type="button" onClick="clearFormAll()" value=" 検索条件初期化にて候 "/>

			<pre>
				<div id="characterAnimation" class="asciiArt_area" style=width:1000px;height:120px;>
⊂二二二（ ＾ω＾）二⊃							⊂二二二（ ＾ω＾）二⊃
         |      /       ﾌﾞｰ---ﾝwwwwww			                         |      /       ﾌﾞｰ---ﾝwwwwww
        （  ヽノ								（  ヽノ
           ﾉ>ノ							 		   ﾉ>ノ
   三     レﾚ			  			                   三     レﾚ
				</div>
			</pre>


			<%--検索結果件数 --%>
			<logic:notEmpty name="searchCnt" scope="request" >
				<div id="wrapper2">
					<logic:equal name="searchCnt" value="0" scope="request">
					検索条件に該当する武士は見当たりませぬ<br><br>
					</logic:equal>
				</div>


				<logic:notEqual name="searchCnt" value="0" scope="request">
					<div id="wrapper2">
						<b><bean:write name="searchCnt" scope="request"  /></b>件の該当する武士を以下に示し申し候
						<br><br><br>
					</div>

					<div id="wrapper2">
						<%--ページャー--%>
						<% int pageNo = ((KohSearchActionForm) request.getAttribute(SystemConst.SESSION_KEY.KOH_SEARCH_ACTION_FORM)).getPages(); %>
						<logic:iterate id="koh" name="KohSearchActionForm" property="allpages" indexId="i">
							<% if (pageNo == i.intValue()) { %>
							<bean:write name="koh" />
							<% } else { %>
							<html:link action="/KohSearchAction.do" indexed="true"  name="<%=SystemConst.SESSION_KEY.KOH_SEARCH_ACTION_FORM%>"
								property="kohSearchListMap" indexId="pages">
							<bean:write name="koh" />
							</html:link>
							<% } %>
						</logic:iterate>
					</div>
					<br>


				</logic:notEqual>
			</logic:notEmpty>
		</html:form>

	</div>
		<html:form action="/KohSearchAction" method="POST">

			<logic:notEmpty name="<%=SystemConst.SESSION_KEY.KOH_SEARCH_ACTION_FORM%>" property="kohSearchList">

				<table class="input_koh" width="10%" align="center">

					<tr align="center">
						<td width="10%">ID</td>
						<td width="10%">名前</td>
						<td width="10%">年齢</td>
						<td width="10%">所属</td>
						<td width="10%">出身</td>
						<td width="10%">単価</td>
						<td width="10%">武器</td>
						<td width="10%">登録日時</td>
					</tr>


					<logic:iterate id="koh" name="<%=SystemConst.SESSION_KEY.KOH_SEARCH_ACTION_FORM%>" property="kohSearchList" >
						<tr>
							<td nowrap="nowrap" align="center">
								<html:text name="koh" property="bushiId" style="width:50px;" indexed="true" readonly="true"/>
							</td>
							<td nowrap="nowrap" align="center">
								<html:text name="koh" property="name" style="width:100px;" indexed="true" readonly="true" />
							</td>
							<td nowrap="nowrap" align="center">
								<html:text name="koh" property="age" style="width:80px;" indexed="true" readonly="true" />
							</td>
							<td nowrap="nowrap" align="center">
								<html:text name="koh" property="bushiGroup" style="width:80px;" indexed="true" readonly="true" />
							</td>
							<td nowrap="nowrap" align="center">
								<html:text name="koh" property="birthPlace" style="width:100px;" indexed="true" readonly="true" />
							</td>
							<td nowrap="nowrap" align="center">
								<html:text name="koh" property="unitPrice" style="width:80px;" indexed="true" readonly="true" />
							</td>
							<td nowrap="nowrap" align="center">
								<html:text name="koh" property="weapon" style="width:60px;" indexed="true" readonly="true" />
							</td>
							<td nowrap="nowrap" align="center">
								<html:text name="koh" property="instDate" style="width:220px;" indexed="true" readonly="true" />
							</td>
						</tr>
					</logic:iterate>
				</table>
				<br>
			</logic:notEmpty>

			<div id="wrapper3">
				<%--各画面へのリンク --%>
				<ul type="disc">
					<li><a href="/koh/pages/kohRegist.jsp">武士帳 登録画面へ行きもうし候</a></li>
				</ul>
				<ul type="disc">
					<li><a href="/koh/pages/parts/menu.jsp">メニュー画面へ行きもうし候</a></li>
				</ul>
			</div>
		</html:form>

	</body>

</html:html>
