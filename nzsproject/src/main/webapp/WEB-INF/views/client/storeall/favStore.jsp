<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">	
	#favStoreArea {margin-left: 10px; width: 1100px; }
	#favStoreArea .selectStore{margin:5px; padding:0; height:50px !important; width:auto; display: inline-block; float:left; }
	#favStoreArea .starDiv{padding:0; margin:0px; height:50px !important; display: inline-block; float:left;}
	#favStoreArea .starImg{ padding:0; margin: 0px; margin-left: 10px; width: 20px;display: inline-block; float:left;}
	#favStoreArea .imgDiv{padding:0; margin: 0px; width:auto; height:50px !important; margin-right: 10px;  margin-left: 10px; display: inline-block; float:left;}
	#favStoreArea .storeImg{padding:0; margin: 0px; width: 40px;display: inline-block; float:left;}
	#favStoreArea .nameDiv{padding:0;  margin: 0px; margin-left:10px;  height:50px !important; margin-top: 10px; width: 150px; display: inline-block; float:left;}	
	
</style>

<script type="text/javascript">
	$(function() {
		if('${login.c_num}'!=""){			
			$.ajax({
				url:"/storeall/favStore.do",  //전송 url
				type:"get",  // 전송 시 method 방식
				data:"c_num=${login.c_num}",  //폼전체 데이터 전송
				dataType:"json",
				success: function(result){							
					if(result != ""){
						$("#favStoreArea").append("<h4>즐겨 찾기 매장</h4>");
						$(result).each(function() {
							var si_image = this.si_image;
							var st_num = this.st_num;
							var st_name = this.st_name;										
							var div = $("<a>");
							div.attr("data-num",st_num);
							div.addClass("selectStore list-group-item");
							
							var starDiv=$("<div>");
							starDiv.addClass("starDiv");
							var starImg=$("<img>");
							starImg.attr("src","/resources/images/favorites.png");
							starImg.addClass("starImg");
							starDiv.append(starImg);
							
							var imgDiv=$("<div>");
							imgDiv.addClass("imgDiv");
							var storeImg=$("<img>");
							storeImg.addClass("storeImg");
							storeImg.attr("src","/uploadStorage/store/" + si_image);
							imgDiv.append(storeImg);
							
							var nameDiv=$("<div>");
							nameDiv.addClass("nameDiv");
							var storeName=$("<p>");
							storeName.addClass("stname");
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
		

