<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ page import="jp.co.koh.common.constants.SystemConst"%>
<%@ page import="jp.co.koh.common.constants.JspConst"%>

<html:html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>���m��</title>
		<SCRIPT type="text/javascript">
		<!--
		 //�l�����͂���Ȃ���΃��O�C���{�^�������Ȃ��p�ɕύX
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
			//�����Ń��b�Z�[�W��\��
			myMsg = "�悭���Q��ꂽ,,,������҂��Ă�������,,,������i�@�O�ցO�j��";
			myCnt = 0;
			function myFunc(){
		     document.LoginActionForm.myFormMes.value = myMsg.substring( 0 , myCnt ) + "_";
		     myCnt = ( myCnt == myMsg.length ) ? 0 : myCnt+1;
			}
		// -->
		</SCRIPT>

	</head>
	<body onload="fieldChanged();">
	<html:form action="/LoginAction" method="POST">
		<div style="text-align:center">
			<h1>���m��</h1>
				<h2>���O�C��</h2>
				<!-- �����Ń��b�Z�[�W���o�� -->
			<p><input type="text" size="50" name="myFormMes"></p>
			<script type="text/javascript"><!--
			setInterval("myFunc()",200);
			// -->
			</script>
				<p>ID�ƃp�X���[�h����͂��ꂽ��</p>
		</div>


	<!-- action�ŃZ�b�g�������b�Z�[�W -->
	<div style="text-align:center">
	<logic:notEmpty name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request">
		<bean:write name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request" />
	</logic:notEmpty>
	</div>
	<br>

		<div style="text-align:center">���mID</div><br>

		<div style="text-align:center"><input type=text name="userId" value="" id="userId" onkeyup="fieldChanged();" onchange="fieldChanged();"/></div><br>

		<div style="text-align:center">�p�X���[�h</div><br>

		<div style="text-align:center"><input type=password name="userPassword" value="" id="userPassword" onkeyup="fieldChanged();" onchange="fieldChanged();"/></div><br>

		<div style="text-align:center"><input type="submit" value="���O�C��" id="login"></div><br>


		<div style="text-align:center">���V�K�o�^�������<html:link href="<%=JspConst.JSP_FOWARD.USER_REGIST%>" >������</html:link></div>

	</html:form>
	</body>
</html:html>
