//検索条件リセットボタン押下時処理
function clearFormAll() {
		//formの0番目(検索条件入力部が0、検索結果表示部が1)を渡す
        clearForm(document.forms[0]);
}

function clearForm(form) {
	//検索条件入力部の長さ分だけループし、formにある要素を1つずつ渡す
    for(var i=0; i<form.elements.length; i++) {
        clearElement(form.elements[i]);
    }
}

function clearElement(element) {
	//要素の種類に応じてリセット処理を行う
    switch(element.type) {
        case "hidden":
        case "submit":
        case "reset":
        case "button":
        case "image":
            return;
        case "file":
            return;
        case "text":
        case "password":
        case "textarea":
            element.value = "";
            return;
        case "checkbox":
        case "radio":
            element.checked = false;
            return;
        case "select-one":
        case "select-multiple":
            element.selectedIndex = 0;
            return;
        default:
    }
}

//文字を一文字ずつ表示するアニメーション
var $text, $textCurrent, $counter;
window.onload = function () {
    $text = document.getElementById( "characterAnimation" ).firstChild.nodeValue;
    displayOneByOne();
}
function displayOneByOne() {
    $textCurrent = document.getElementById( "characterAnimation" ).firstChild.nodeValue;
    if( $textCurrent.length == $text.length ){
        document.getElementById( "characterAnimation" ).innerHTML = '';
        $counter = 0;
    }
    document.getElementById( "characterAnimation" ).innerHTML = $text.substr( 0, ++$counter ) + '<br />';
    setTimeout( 'displayOneByOne()', 5 );
}