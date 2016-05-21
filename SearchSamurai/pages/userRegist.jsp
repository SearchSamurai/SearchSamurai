<%@ page contentType="text/html; charset=Windows-31J" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ page import="jp.co.koh.common.constants.SystemConst" %>
<%@ page import="jp.co.koh.common.constants.JspConst" %>
<link rel="StyleSheet" href="/koh/css/kohRegist.css" type="text/css">

<html:html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>���m��</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">
		<SCRIPT type="text/javascript">
		<!--
		 //�l�����͂���Ȃ���Γo�^�{�^�������Ȃ��p�Ɏd�l�ύX
		 // �t�B�[���h���ύX���ꂽ�ꍇ�ɏ�������֐�
		function fieldChanged(){
		     var userId = getField("userId");
		     var password = getField("userPassword");
		     var disabled = true;

		     if (userId.value.length > 0 && userPassword.value.length > 0) {
		         disabled = false;
		     }

		    var login = getField("login");
		     if (disabled) {
		         login.setAttribute("disabled", "disabled");
		     }
		     else {
		         login.removeAttribute("disabled");
		     }
		 }

		 // �t�B�[���h���擾����֐�
		 function getField(fieldName){
		      var field = document.getElementById(fieldName);
		     if (field == undefined) {
		         throw new Error("�v�f��������܂���: " + fieldName);
		     }
		     return field;
		 }
		// -->
		</SCRIPT>
	</head>
	<body onload="fieldChanged();">
	<html:form action="/UserRegistAction" method="POST">
			<div style="text-align:center">
				<h1>���m��</h1>
				<h2>�V���m�o�^</h2><br>
				<h3>�o�^����ID�ƃp�X���[�h����͂��ꂽ��</h3>
			</div>
			<!-- css���g�p���Ă݂� -->
				<br>

				<div class="message_area" align="center">
						<!-- �o���f�[�V�����G���[ -->
					<html:errors />
							<logic:notEmpty name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request">
								<bean:write name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request" /><br>
							</logic:notEmpty>
				</div>

			<div style="text-align:center">ID</div><br>

			<div style="text-align:center"><input type=text name="userId" value="" id="userId" onkeyup="fieldChanged();" onchange="fieldChanged();"/></div><br>

			<div style="text-align:center">�p�X���[�h</div><br>

			<div style="text-align:center"><input type=password name="userPassword" value="" id="userPassword" onkeyup="fieldChanged();" onchange="fieldChanged();"/></div><br>

			<div style="text-align:center"><input type="submit" value="�o�^" id="login"></div>

	</html:form>
	</body>
</html:html>