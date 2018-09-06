/**
* 함수명 : chkFile(파일명)
* 설명 : 이미지 파일 여부를 확인하기 위해 확장자 확인 함수.
*/
function chkFile(item) {
   /*
      배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우 -1반환) jQuert.inArray(찾을 값, 검색대상의 배열)
     */
   /*   배열에 원소를 추가하는 메서드에는 .push()와 .unshift()가 있습니다.
   
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

/* 숫자 범위 유효성 검사 
 * 요소, 메시지, 최소값, 최대값
 * */
function chkNumber(item, msg, min, max) {
   var number = $(item).val() * 1;
   if(number < min){
      alert(msg + " " + min + "보다 작을 수 없습니다.");
      $(item).val("");
      $(item).focus();
      return false;
   }
   
   if (number > max) { 
      alert(msg + " " + max + "보다 클수 없습니다.");
      $(item).val("");
      $(item).focus();
      return false;
   } else{
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
function formCheck(main, item, msg) {
   if($(main).val().replace(/\s/g,"")==""){
      $(item).html(msg+" 입력해 주세요").css("color","red");
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

/* 배열 : 유효성 체크 시 필요한 정규식으로 배열을 초기화.
 * pattern = [아이디, 비밀번호, 핸드폰번호]
 * 함수명 : inputVerify(배열 인덱스번호, 비교할 값, 출력영역)
 *  */
var pattern = [
   "((?=.*[a-zA-Z])(?=.*[0-9]).{6,10})",
   "((?=.*[a-zA-Z])(?=.*[0-9!@#$%^&*]).{8,12})",
   "^\\d{3}-\\d{3,4}-\\d{4}",
   "^\\d{3}-\\d{2}-\\d{5}"];
function inputVerify(index, data, printarea){
   var data_regExp = new RegExp(pattern[index]);
   var match = data_regExp.exec($(data).val());
   if(match==null){
      $(printarea).html("입력값이 형식에 맞지 않습니다. 다시 입력해주세요.");
      $(data).val("");
      return false;
   } else {
      return true;
   }
}

   //클래스명만 주면 자동으로 3자리 마다 콤마찍음
   /*ex) <span class="format-money">20000</span>원
     
   jQuery('.format-money').text(function() {
       jQuery(this).text(
           jQuery(this).text().format()
       );
   });
   
   결과 20,000원*/
   //숫자 타입에서 쓸 수 있도록 format() 함수 추가
Number.prototype.format = function(){
    if(this==0) return 0;
   
    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');
   
    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
   
    return n;
};
   
   //문자열 타입에서 쓸 수 있도록 format() 함수 추가
String.prototype.format = function(){
    var num = parseFloat(this);
    if( isNaN(num) ) return "0";
   
    return num.format();
};

