function regnoValidation(regno){
	// 주민번호 검증
	// 1 1 1 1 1 1 - 1 1 1 1 1 1        1(매직넘버)
	// * * * * * *   * * * * * *
	// 2+3+4+5+6+7 + 8+9+2+3+4+5 = 값1
	// 값1%11 = 값2
	// 11-값2 = 값3
	// 값3%10 = 최종값
	// if(최종값 == 매직넘버) 유효한 주민번호
	// else 무효한 주민번호
//	var dumy = regno.substr(0,1) *2 +
//	           regno.substr(1,1) *3 +
//	           regno.substr(2,1) *4 +
//	           regno.substr(3,1) *5 +
//	           regno.substr(4,1) *6 +
//	           regno.substr(5,1) *7 +
//	           regno.substr(7,1) *8 +
//	           regno.substr(8,1) *9 +
//	           regno.substr(9,1) *2 +
//	           regno.substr(10,1) *3 +
//	           regno.substr(11,1) *4 +
//	           regno.substr(12,1) *5;
	
	regno = regno.replace('-','');
	var sum = 0;
	var checkSum = '234567892345';
	for(var i=0; i<12; i++){
		sum += regno.charAt(i)*checkSum.charAt(i);
	}
	sum = sum%11;
	sum = 11-sum;
	sum = sum%10;
	if(sum == parseInt(regno.substr(12,1))){
		return true;
	}else{
		return false;
	}
}
// 포커드 이동
function setFocus(element){
	element.focus();
}

// 브라우져별 XMLHttpRequest 취득
function createXMLHttpRequest(){
	var xmlHttp;
	// IE에서 XMLHttpRequest 취득.
	if(window.ActiveXObject){
		xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
	}else{
		// IE 이외 브라우져에서 XMLHttpRequest 취득.
		xmlHttp = new XMLHttpRequest();
	}
	return xmlHttp;
}

// contextPath 취득
function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}
