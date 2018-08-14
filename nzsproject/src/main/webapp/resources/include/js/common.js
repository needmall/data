﻿/**
* 함수명 : chkFile(파일명)
* 설명 : 이미지 파일 여부를 확인하기 위해 확장자 확인 함수.
*/
function chkFile(item) {
	/*
		배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우 -1반환) jQuert.inArray(찾을 값, 검색대상의 배열)
	  */
	/*	배열에 원소를 추가하는 메서드에는 .push()와 .unshift()가 있습니다.
	
		.push()는 배열의 맨 끝에, .unshift()는 배열의 맨 앞에 원소를 추가합니다.
	
		배열에서 원소를 제거/반환 하는 메서드에는 .pop()과 .shift()가 있습니다.
	
		.pop()은 마지막 원소를, .shift()는 맨 앞의 원소를 제거합니다.*/
	var ext = item.val().split('.').pop().toLowerCase();	
	if(jQuery.inArray(ext, ['gif','png','jpg','jpeg'])==-1){
		alert("이미지 파일만 업로드 할 수 있습니다.");
		return false;
	}else{
		return true;
	}
}

/* 새창 유효성*/
function chkData(item, msg){
	if($(item).val().replace(/\s/g,"")==""){
		alert(msg+" 입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	}else{
		return true;
	}
}
/* placeholder 유효성*/
function checkForm(item, msg){
	if($(item).val().replace(/\s/g,"")==""){
		$(item).attr("placeholder",msg+" 입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	}else{
		return true;
	}
}
/* formCheck(유효성 체크 대상, 출력 영역, 메시지 내용)*/
function fromCheck(main, item, msg) {
	if($(main).val().replace(/\s/g,"")==""){
		$(item).html(msg+" 입력해 주세요");
		$(main).val("");
		return false;		
	}else{
		return true;
	}
}

/*합수명 : getDateFormat(날짜 데이터)
 * 설명 : dataValue 의 값을 년-월-일 형식(예시: 2018-01-01)으로 반환.*/
function getDateFormat(dateValue){
	var year = dateValue.getFullYear();
	var month = dateValue.getMonth()+1;
	month = (month<10) ? "0"+month : month;
	
	var day = dateValue.getDate();
	day = (day<10) ? "0" +day : day;
	
	var result = year + "-" + month + "-" + day;
	return result;
}
