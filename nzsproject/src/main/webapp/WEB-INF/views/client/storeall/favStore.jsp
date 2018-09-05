<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">

</style>

<script type="text/javascript">
	$(function() {
		if('${login.c_num}'!=""){			
			
			$.ajax({
				url:"/storeall/favStore.do",  //전송 url
				type:"get",  // 전송 시 method 방식
				data:"c_num=${login.c_num}",  //폼전체 데이터 전송
				dataType:"text",
				success: function(result){							
					if(result != ""){
						$("#favStoreArea").append("<h4>즐겨 찾기 매장</h4>");
						$(result).each(function() {
							var si_image = this.si_image;
							var st_num = this.st_num;
							var st_name = this.st_name;										
							var div = $("<div>");
							var starDiv=$("<div>");
							var starImg=$("<img>");
							starImg.attr("src","");
							starDiv.append(starImg);
							
							var imgDiv=$("<div>");
							var storeImg=$("<img>");
							storeImg.attr("src","/uploadStorage/store/" + si_image);
							imgDiv.append(storeImg);
							
							var nameDiv=$("<div>");
							var storeName=$("<p>");
							storeName.html(st_name);
							nameDiv.append(storeName);
							
							div.append(starDiv).append(imgDiv).append(nameDiv);
							$("#favStoreArea"). append(div);
						});
					}
				},
				error:function(){  //실행시 오류가 발생하였을 경우
					alert("시스템 오류 입니다. 관리자에게 문의하세요!!");							
				}
			});
			
			
		}
	})
</script>

<div id="favStoreArea">
	
</div>		
		

