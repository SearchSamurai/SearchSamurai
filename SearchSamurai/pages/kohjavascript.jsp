<%@ page contentType="text/html; charset=UTF-8" %>
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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>武士帳</title>
		<link rel="shortcut icon" href="/koh/img/favicon.ico">

		<SCRIPT type="text/javascript">
<!--
//画面で入力チェック
function check(){
	var flag = 0;
	// 必須にする項目を設定
	if(document.LoginActionForm.userId.value == ""){
		flag = 1;
		//空文字の場合画面表示
		document.getElementById('testId').style.display="block";
	}else{
		 //入力されていれば非表示
		 document.getElementById('testId').style.display = "none";
	}
	     //空文字の場合画面表示
		 if(document.LoginActionForm.userPassword.value == ""){
			flag = 1;
			document.getElementById('testPass').style.display="block";
		//入力されていれば非表示
		} else {
			 document.getElementById('testPass').style.display = "none";
		}
	// 設定終了
	if(flag == 1){
		//window.alert('必須項目に未入力がありました');
		countFlag = 1;

		return false; // 送信を中止

	}else{
		return true; // 送信を実行
	}
}
	//チェックボックス全選択と全解除
	function CheckboxChecked(check) {
            document.LoginActionForm.a.checked = check;
            document.LoginActionForm.b.checked = check;
	}
	//背景色を変えます
	function color(){
		document.bgColor = "#eeeeff"; // bgcolor：背景色
		document.fgColor = "#0080ff"; // text：文字の基本色
		document.linkColor = "#ff0000"; // link：リンク文字の色
		document.vlinkColor = "#ff0000"; // vlink：リンク文字の色（アクセス済みのリンク）
		document.alinkColor = "#ff8000"; // alink：リンク文字の色（クリックした瞬間の色）
	}
	//背景色を戻します
	function color2(){
		document.bgColor = ""; // bgcolor：背景色
		document.fgColor = ""; // text：文字の基本色
		document.linkColor = ""; // link：リンク文字の色
		document.vlinkColor = ""; // vlink：リンク文字の色（アクセス済みのリンク）
		document.alinkColor = ""; // alink：リンク文字の色（クリックした瞬間の色）
	}
	//ボタンの色を変える
	function setColor(obj,col){
		obj.style.backgroundColor = col;
	}
	//自動でメッセージを表示
	myMsg = "⊂二二二（　＾ω＾）二⊃⊂二二二（　 ＾ω＾）二⊃";
	myCnt = 0;
	function myFunc(){
     document.LoginActionForm.myFormMes.value = myMsg.substring( 0 , myCnt ) + "_";
     myCnt = ( myCnt == myMsg.length ) ? 0 : myCnt+1;
	}


// -->
</SCRIPT>

<!-- 画像スロット処理が多いので切り分けた -->
<script type="text/javascript"><!--
				myImageCnt = 3;	// 画像の数
				myImage = new Array(	// 画像ファイル名の設定
						//原さんへ 下の画像パスだけ修正したら動きました。
						//どうやらフルパスで指定してあげる必要があったようです。
						//あとシャッフル時にテーブルの表示が崩れないように、
						//画像サイズを80px×80pxに統一しました。
				   "http://localhost:8080/koh/img/s_images.jpg",
				   "http://localhost:8080/koh/img/s_images2.jpg",
				   "http://localhost:8080/koh/img/s_images3.png"
				);
				myBuffer = new Array(myImageCnt);	// 画像イメージを収納するバッファ
				for(i=0; i<myImageCnt; i++){	// 画像イメージをメモリに取込む
				    myBuffer[i] = new Image();
				    myBuffer[i].src = myImage[i];
				}

				myStartFlg = 0;	// スタートボタンフラグ (0:動いていない 1:動いている)
				myStopFlg1 = 0;	// ボタン1フラグ (-1:動いている 0～n:止まっている)
				myStopFlg2 = 0;	// ボタン2フラグ (-1:動いている 0～n:止まっている)
				myStopFlg3 = 0;	// ボタン3フラグ (-1:動いている 0～n:止まっている)

				function myStart(){	// ボタンが押された
				    if (myStartFlg == 0){	// 既に押していなければ、
				        myStartFlg = 1;	// スタート!
				        myStopFlg1 = -1;	// ボタン1回転!
				        myStopFlg2 = -1;	// ボタン2回転!
				        myStopFlg3 = -1;	// ボタン3回転!
				        myLoop();
				    }
				}

				function myLoop(){	// 回転させるルーチン
				    if (myStopFlg1==-1||myStopFlg2==-1||myStopFlg3==-1){	// まだどこか回転しているか？
				        if (myStopFlg1==-1){	// ボタン1は回転しているか？
				            myRnd = Math.floor(Math.random()*myImageCnt);	// 乱数を求める
				            document.LoginActionForm.myFormImg1.src = myBuffer[myRnd].src;	// 乱数番目の画像を表示する
				        }
				        if (myStopFlg2==-1){	// ボタン2は回転しているか？
				            myRnd = Math.floor(Math.random()*myImageCnt);	// 乱数を求める
				            document.LoginActionForm.myFormImg2.src = myBuffer[myRnd].src;	// 乱数番目の画像を表示する
				        }
				        if (myStopFlg3==-1){	// ボタン3は回転しているか？
				            myRnd = Math.floor(Math.random()*myImageCnt);	// 乱数を求める
				            document.LoginActionForm.myFormImg3.src = myBuffer[myRnd].src;	// 乱数番目の画像を表示する
				        }
				        setTimeout( "myLoop()" , 20 );	// ぐるぐる回転させる!
				    }else{
				        myStartFlg = 0;	// 全部止まった
				    }
				}

				function myStop1(){	// ボタン1が押された
				    if (myStopFlg1 == -1){	// ボタン１は回転しているか？
				        myRnd = Math.floor(Math.random()*myImageCnt);	// 乱数を求める
			            document.LoginActionForm.myFormImg1.src = myBuffer[myRnd].src;	// 乱数番目の画像を表示する
				        myStopFlg1 = myRnd;	// 止まった画像の番号を退避
				    }
				}

				function myStop2(){	// ボタン2が押された
				    if (myStopFlg2 == -1){	// ボタン2は回転しているか？
				        myRnd = Math.floor(Math.random()*myImageCnt);	// 乱数を求める
			            document.LoginActionForm.myFormImg2.src = myBuffer[myRnd].src;	// 乱数番目の画像を表示する
				        myStopFlg2 = myRnd;	// 止まった画像の番号を退避
				    }
				}

				function myStop3(){	// ボタン3が押された
				    if (myStopFlg3 == -1){	// ボタン3は回転しているか？
				        myRnd = Math.floor(Math.random()*myImageCnt);	// 乱数を求める
			            document.LoginActionForm.myFormImg3.src = myBuffer[myRnd].src;	// 乱数番目の画像を表示する
				        myStopFlg3 = myRnd;	// 止まった画像の番号を退避
				    }
				}
// --></script>

	</head>
	<body>
	<html:form action="/KohUserAllAction"  method="POST" onsubmit="return check()">
					<div style="text-align:center">
						<h1>武士帳</h1>
						<h2>javascript練習用だお      pass更新はできます</h2><br>
					</div>
			<div class="message_area" align="center">
					<!-- バリデーションエラー -->
					<html:errors />
						<!-- 登録とか削除とかできたらとできなかったら -->
						<logic:notEmpty name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request">
							<bean:write name="<%=SystemConst.REQUEST_KEY.MESSAGE_INFO%>" scope="request" /><br>
						</logic:notEmpty>
			</div>

	<!-- 入力時値がない場合のエラー表示 javascript-->
					<div style="text-align:center">
						<p id="testId" style="display: none; color: red;"> 【IDを入力して下さい(javascript練習用)】</p>
						<p id="testPass" style="display: none; color: red;"> 【passを入力して下さい(javascript練習用)】</p>
					</div>
	<!-- User検索 -->
	<table border="1" align="center"><caption>更新</caption>

			<tr><td> ID </td><td> <html:text  property="userId" /> <input type="checkbox" name="a" size=2></td></tr>

			<tr><td> pass </td><td> <html:text  property="userPassword" /> <input type="checkbox" name="b" size=2></td></tr>

	</table>
		<div style="text-align:center">
			<!-- Checkbox選択テスト -->
			<INPUT  type="button" onClick="CheckboxChecked(true);" value="一括選択">
			<INPUT  type="button" onClick="CheckboxChecked(false);" value="全て未選択">
				<br>
		 	<input type="submit" value="送信">
		 		<br>
		 	<!-- 背景色変更 -->
		 	<INPUT  type="button" onClick="color();" value="色変えます">
		 	<INPUT  type="button" onClick="color2();" value="色戻します">
		 		<br>
		 	<!-- ボタンの色を変更 -->
		 	<input type="button" value="ボタン色変えます" name="butt"style="background-color:#FBEFFB"
			onMouseover="setColor(this,'#04B404')" onMouseout="setColor(this,'#FBEFFB')">
			<input type="button" value="ボタン色変えますyo" name="butt"style="background-color:#DF013A"
			onMouseover="setColor(this,'#81F7F3')" onMouseout="setColor(this,'#DF013A')">
				<br>
			<!-- 自動でメッセージを出す -->
			<input type="text" size="30" name="myFormMes">
			<script type="text/javascript"><!--
			setInterval("myFunc()",200);
			// -->
			</script>

			<!-- 画像スロット -->
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