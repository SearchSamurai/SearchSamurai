<%@ page contentType="text/html; charset=Windows-31J" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ page import="jp.co.koh.form.LoginActionForm" %>
<%@ page import="java.util.List" %>
<%@ page import="jp.co.koh.common.constants.SystemConst" %>
<%@ page import="jp.co.koh.common.constants.JspConst" %>
<link rel="StyleSheet" href="/koh/css/kohRegist.css" type="text/css">
<html:html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>���m��</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">

		<SCRIPT type="text/javascript">
<!--
//��ʂœ��̓`�F�b�N
function check(){
	var flag = 0;
	// �K�{�ɂ��鍀�ڂ�ݒ�
	if(document.LoginActionForm.userId.value == ""){
		flag = 1;
		//�󕶎��̏ꍇ��ʕ\��
		document.getElementById('testId').style.display="block";
	}else{
		 //���͂���Ă���Δ�\��
		 document.getElementById('testId').style.display = "none";
	}
	     //�󕶎��̏ꍇ��ʕ\��
		 if(document.LoginActionForm.userPassword.value == ""){
			flag = 1;
			document.getElementById('testPass').style.display="block";
		//���͂���Ă���Δ�\��
		} else {
			 document.getElementById('testPass').style.display = "none";
		}
	// �ݒ�I��
	if(flag == 1){
		//window.alert('�K�{���ڂɖ����͂�����܂���');
		countFlag = 1;

		return false; // ���M�𒆎~

	}else{
		return true; // ���M�����s
	}
}
	//�`�F�b�N�{�b�N�X�S�I���ƑS����
	function CheckboxChecked(check) {
            document.LoginActionForm.a.checked = check;
            document.LoginActionForm.b.checked = check;
	}
	//�w�i�F��ς��܂�
	function color(){
		document.bgColor = "#eeeeff"; // bgcolor�F�w�i�F
		document.fgColor = "#0080ff"; // text�F�����̊�{�F
		document.linkColor = "#ff0000"; // link�F�����N�����̐F
		document.vlinkColor = "#ff0000"; // vlink�F�����N�����̐F�i�A�N�Z�X�ς݂̃����N�j
		document.alinkColor = "#ff8000"; // alink�F�����N�����̐F�i�N���b�N�����u�Ԃ̐F�j
	}
	//�w�i�F��߂��܂�
	function color2(){
		document.bgColor = ""; // bgcolor�F�w�i�F
		document.fgColor = ""; // text�F�����̊�{�F
		document.linkColor = ""; // link�F�����N�����̐F
		document.vlinkColor = ""; // vlink�F�����N�����̐F�i�A�N�Z�X�ς݂̃����N�j
		document.alinkColor = ""; // alink�F�����N�����̐F�i�N���b�N�����u�Ԃ̐F�j
	}
	//�{�^���̐F��ς���
	function setColor(obj,col){
		obj.style.backgroundColor = col;
	}
	//�����Ń��b�Z�[�W��\��
	myMsg = "������i�@�O�ցO�j�񁽁�����i�@ �O�ցO�j��";
	myCnt = 0;
	function myFunc(){
     document.LoginActionForm.myFormMes.value = myMsg.substring( 0 , myCnt ) + "_";
     myCnt = ( myCnt == myMsg.length ) ? 0 : myCnt+1;
	}


// -->
</SCRIPT>

<!-- �摜�X���b�g�����������̂Ő؂蕪���� -->
<script type="text/javascript"><!--
				myImageCnt = 3;	// �摜�̐�
				myImage = new Array(	// �摜�t�@�C�����̐ݒ�
						//������� ���̉摜�p�X�����C�������瓮���܂����B
						//�ǂ����t���p�X�Ŏw�肵�Ă�����K�v���������悤�ł��B
						//���ƃV���b�t�����Ƀe�[�u���̕\��������Ȃ��悤�ɁA
						//�摜�T�C�Y��80px�~80px�ɓ��ꂵ�܂����B
				   "http://localhost:8080/koh/img/s_images.jpg",
				   "http://localhost:8080/koh/img/s_images2.jpg",
				   "http://localhost:8080/koh/img/s_images3.png"
				);
				myBuffer = new Array(myImageCnt);	// �摜�C���[�W�����[����o�b�t�@
				for(i=0; i<myImageCnt; i++){	// �摜�C���[�W���������Ɏ捞��
				    myBuffer[i] = new Image();
				    myBuffer[i].src = myImage[i];
				}

				myStartFlg = 0;	// �X�^�[�g�{�^���t���O (0:�����Ă��Ȃ� 1:�����Ă���)
				myStopFlg1 = 0;	// �{�^��1�t���O (-1:�����Ă��� 0�`n:�~�܂��Ă���)
				myStopFlg2 = 0;	// �{�^��2�t���O (-1:�����Ă��� 0�`n:�~�܂��Ă���)
				myStopFlg3 = 0;	// �{�^��3�t���O (-1:�����Ă��� 0�`n:�~�܂��Ă���)

				function myStart(){	// �{�^���������ꂽ
				    if (myStartFlg == 0){	// ���ɉ����Ă��Ȃ���΁A
				        myStartFlg = 1;	// �X�^�[�g!
				        myStopFlg1 = -1;	// �{�^��1��]!
				        myStopFlg2 = -1;	// �{�^��2��]!
				        myStopFlg3 = -1;	// �{�^��3��]!
				        myLoop();
				    }
				}

				function myLoop(){	// ��]�����郋�[�`��
				    if (myStopFlg1==-1||myStopFlg2==-1||myStopFlg3==-1){	// �܂��ǂ�����]���Ă��邩�H
				        if (myStopFlg1==-1){	// �{�^��1�͉�]���Ă��邩�H
				            myRnd = Math.floor(Math.random()*myImageCnt);	// ���������߂�
				            document.LoginActionForm.myFormImg1.src = myBuffer[myRnd].src;	// �����Ԗڂ̉摜��\������
				        }
				        if (myStopFlg2==-1){	// �{�^��2�͉�]���Ă��邩�H
				            myRnd = Math.floor(Math.random()*myImageCnt);	// ���������߂�
				            document.LoginActionForm.myFormImg2.src = myBuffer[myRnd].src;	// �����Ԗڂ̉摜��\������
				        }
				        if (myStopFlg3==-1){	// �{�^��3�͉�]���Ă��邩�H
				            myRnd = Math.floor(Math.random()*myImageCnt);	// ���������߂�
				            document.LoginActionForm.myFormImg3.src = myBuffer[myRnd].src;	// �����Ԗڂ̉摜��\������
				        }
				        setTimeout( "myLoop()" , 20 );	// ���邮���]������!
				    }else{
				        myStartFlg = 0;	// �S���~�܂���
				    }
				}

				function myStop1(){	// �{�^��1�������ꂽ
				    if (myStopFlg1 == -1){	// �{�^���P�͉�]���Ă��邩�H
				        myRnd = Math.floor(Math.random()*myImageCnt);	// ���������߂�
			            document.LoginActionForm.myFormImg1.src = myBuffer[myRnd].src;	// �����Ԗڂ̉摜��\������
				        myStopFlg1 = myRnd;	// �~�܂����摜�̔ԍ���ޔ�
				    }
				}

				function myStop2(){	// �{�^��2�������ꂽ
				    if (myStopFlg2 == -1){	// �{�^��2�͉�]���Ă��邩�H
				        myRnd = Math.floor(Math.random()*myImageCnt);	// ���������߂�
			            document.LoginActionForm.myFormImg2.src = myBuffer[myRnd].src;	// �����Ԗڂ̉摜��\������
				        myStopFlg2 = myRnd;	// �~�܂����摜�̔ԍ���ޔ�
				    }
				}

				function myStop3(){	// �{�^��3�������ꂽ
				    if (myStopFlg3 == -1){	// �{�^��3�͉�]���Ă��邩�H
				        myRnd = Math.floor(Math.random()*myImageCnt);	// ���������߂�
			            document.LoginActionForm.myFormImg3.src = myBuffer[myRnd].src;	// �����Ԗڂ̉摜��\������
				        myStopFlg3 = myRnd;	// �~�܂����摜�̔ԍ���ޔ�
				    }
				}
// --></script>

	</head>
	<body>
	<html:form action="/KohUserAllAction"  method="POST" onsubmit="return check()">
					<div style="text-align:center">
						<h1>���m��</h1>
						<h2>javascript���K�p����      pass�X�V�͂ł��܂�</h2><br>
					</div>
			<div class="message_area" align="center">
					<!-- �o���f�[�V�����G���[ -->
					<html:errors />
						<!-- �o�^�Ƃ��폜�Ƃ��ł�����Ƃł��Ȃ������� -->
						<logic:notEmpty name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request">
							<bean:write name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request" /><br>
						</logic:notEmpty>
			</div>

	<!-- ���͎��l���Ȃ��ꍇ�̃G���[�\�� javascript-->
					<div style="text-align:center">
						<p id="testId" style="display: none; color: red;"> �yID����͂��ĉ�����(javascript���K�p)�z</p>
						<p id="testPass" style="display: none; color: red;"> �ypass����͂��ĉ�����(javascript���K�p)�z</p>
					</div>
	<!-- User���� -->
	<table border="1" align="center"><caption>�X�V</caption>

			<tr><td> ID </td><td> <html:text  property="userId" /> <input type="checkbox" name="a" size=2></td></tr>

			<tr><td> pass </td><td> <html:text  property="userPassword" /> <input type="checkbox" name="b" size=2></td></tr>

	</table>
		<div style="text-align:center">
			<!-- Checkbox�I���e�X�g -->
			<INPUT  type="button" onClick="CheckboxChecked(true);" value="�ꊇ�I��">
			<INPUT  type="button" onClick="CheckboxChecked(false);" value="�S�Ė��I��">
				<br>
		 	<input type="submit" value="���M">
		 		<br>
		 	<!-- �w�i�F�ύX -->
		 	<INPUT  type="button" onClick="color();" value="�F�ς��܂�">
		 	<INPUT  type="button" onClick="color2();" value="�F�߂��܂�">
		 		<br>
		 	<!-- �{�^���̐F��ύX -->
		 	<input type="button" value="�{�^���F�ς��܂�" name="butt"style="background-color:#FBEFFB"
			onMouseover="setColor(this,'#04B404')" onMouseout="setColor(this,'#FBEFFB')">
			<input type="button" value="�{�^���F�ς��܂�yo" name="butt"style="background-color:#DF013A"
			onMouseover="setColor(this,'#81F7F3')" onMouseout="setColor(this,'#DF013A')">
				<br>
			<!-- �����Ń��b�Z�[�W���o�� -->
			<input type="text" size="30" name="myFormMes">
			<script type="text/javascript"><!--
			setInterval("myFunc()",200);
			// -->
			</script>

			<!-- �摜�X���b�g -->
			<table border="1" align="center" width="20%" height="20%" >
					<tr>
					<td align="center"  width="20%" height="20%" ><img src="/koh/img/s_images.jpg" name="myFormImg1"></td>
					<td align="center"  width="20%" height="20%" ><img src="/koh/img/s_images2.jpg" name="myFormImg2"></td>
					<td align="center"  width="20%" height="20%" ><img src="/koh/img/s_images3.png" name="myFormImg3"></td>
					</tr>
					<tr>
					<td align="center"  width="20%" height="20%" ><input type="button" value="STOP" onclick="myStop1()"></td>
					<td align="center"  width="20%" height="20%" ><input type="button" value="STOP" onclick="myStop2()"></td>
					<td align="center"  width="20%" height="20%" ><input type="button" value="STOP" onclick="myStop3()"></td>
					</tr>
					<tr>
					<td align="center" colspan="3">
					<input type="button" value="START" onclick="myStart()">
					</td>
					</tr>
					</table>


		</div>
				<br>
	</html:form>
	</body>
</html:html>