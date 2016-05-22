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
		<title>���m��</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">
	</head>

	<body>

	<div id="wrapper">
		<h1>���m��</h1>
		<h2>���m�����ɂČ�</h2>
		<br>
			<h3>������������͂��ꂽ��</h3>
	</div>

	<div id="wrapper">
		<html:form action="/KohSearchAction" method="POST">

       		<tr>
      			<td>��<br></td>
        		<td>
       		 	<html:text property="ageFrom" size="20" maxlength="3" value=""/></td>
        		<td>�`</td>
        		<td><html:text property="ageTo" size="20" maxlength="3" value=""/></td>
       		 	<td>��</td>
      	     </tr>
			 <br><br><br>

       		 <tr>
        		<td>����<br></td>
					<html:select property="groupList" style="width:173px">
						<html:options collection="<%=SystemConst.SESSION_KEY.KOH_GROUP_LIST%>" property="groupList"/>
					</html:select>
			</tr>
			<br><br><br>

       		<tr>
        		<td>�P��<br></td>
        		<td><html:text property="unitPriceFrom" size="20" maxlength="9" value=""/></td>
        		<td>�`</td>
	        	<td><html:text property="unitPriceTo" size="20" maxlength="9" value=""/></td>
	        	<td>�~</td>
	        </tr>
			<br><br><br>

	        <tr>
	        	<td>����<br></td>
	        	<td>
					<html:select property="weaponList" style="width:173px">
						<html:options collection="<%=SystemConst.SESSION_KEY.KOH_WEAPON_LIST%>" property="weaponList"/>
					</html:select>
				</td>
	        </tr>
	        <br><br><br>

			<td>���בւ��ɂČ�<br></td>
			<td>�������O�ł�������ł��ݒ�\�ɂČ�<br></td>

	        <select name="sortFlag" style="width:173px">
				<option value="0"></option>
				<option value="1">�o�^�������V�������ɂČ�</option>
				<%--<option value="2">�e�X�g</option>--%>
			</select>
			<br><br><br>

			<html:submit property="submit" value=" ���� " />

			<INPUT type="button" onClick="clearFormAll()" value=" ���������������ɂČ� "/>

			<pre>
				<div id="characterAnimation" class="asciiArt_area" style=width:1000px;height:120px;>
������i �O�ցO�j��							������i �O�ցO�j��
         |      /       �ް---�wwwwww			                         |      /       �ް---�wwwwww
        �i  �R�m								�i  �R�m
           �>�m							 		   �>�m
   �O     ���			  			                   �O     ���
				</div>
			</pre>


			<%--�������ʌ��� --%>
			<logic:notEmpty name="searchCnt" scope="request" >
				<div id="wrapper2">
					<logic:equal name="searchCnt" value="0" scope="request">
					���������ɊY�����镐�m�͌�������܂���<br><br>
					</logic:equal>
				</div>


				<logic:notEqual name="searchCnt" value="0" scope="request">
					<div id="wrapper2">
						<b><bean:write name="searchCnt" scope="request"  /></b>���̊Y�����镐�m���ȉ��Ɏ����\����
						<br><br><br>
					</div>

					<div id="wrapper2">
						<%--�y�[�W���[--%>
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
						<td width="10%">���O</td>
						<td width="10%">�N��</td>
						<td width="10%">����</td>
						<td width="10%">�o�g</td>
						<td width="10%">�P��</td>
						<td width="10%">����</td>
						<td width="10%">�o�^����</td>
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
				<%--�e��ʂւ̃����N --%>
				<ul type="disc">
					<li><a href="/koh/pages/kohRegist.jsp">���m�� �o�^��ʂ֍s����������</a></li>
				</ul>
				<ul type="disc">
					<li><a href="/koh/pages/parts/menu.jsp">���j���[��ʂ֍s����������</a></li>
				</ul>
			</div>
		</html:form>

	</body>

</html:html>
