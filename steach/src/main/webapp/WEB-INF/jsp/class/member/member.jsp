<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 페이지</title>

<!-- header import -->
<c:import url="/WEB-INF/jsp/header/classHeader.jsp" />
<!-- css -->
<link rel="stylesheet"
	href="/steach/resources/css/class/member/member.css" />

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>

	<!-- modal 동적 생성하기 -->
	<c:forEach var="i" items="${studentList}">
		<!-- 쪽지보내기  모달 -->
		<div class="modal fade" id="msgModal${i.memNo}" tabindex="-1"
			role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<ul class="modal-ul">
							<li><a>쪽지보내기</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- 사용자 등급 변경  모달 -->
		<div class="modal fade" id="userElpsModal${i.memNo}" tabindex="-1"
			role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<ul class="modal-ul">
							<c:choose>
								<c:when test="${i.pNo eq 1001}">
									<li><a href="#" onclick="removeReader(${i.memNo})">반장위임취소</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="#" onclick="doReader(${i.memNo})">반장위임</a></li>
								</c:otherwise>						
							</c:choose>
									<li><a href="#" onclick="doIgnore(${i.memNo})">내보내기</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>


	<div class="container-fluid">
		<div class="row">
				<!-- 강사 -->
			<div class="col-md-8 col-md-offset-2">
				<div class="user-title">
					<span>강사</span>
				</div>
				<div class="user-info">
					<div class="user-pic"></div>
					<div class="user-name">
						<a href="#">${master.user.name} (${master.user.id})</a>
					</div>
					<div class="user-elps">
						<a href="msgModal" data-toggle="modal" data-target="#msgModal${master.classNo}"><i class="far fa-envelope">&nbsp;&nbsp;&nbsp;&nbsp;</i></a>
					</div>

				</div>
				<!--admin info end -->
			</div>
			<!--col end-->

			<!-- 학생 page  -->
			<div class="col-md-8 col-md-offset-2">
				<div class="user-title">
					<span>학생</span>
				</div>
				<div class="accordion" role="tablist">
					<%-- <c:forEach var="st" items="${studentList}">
						<div class="card">
							<div class="card-header" role="tab" href="#collapse${st.memNo}"
								data-toggle="collapse">
								<div class="user-info">
									<div class="user-pic">${st.user.profile}</div>
									<div class="user-name">
										<c:if test="${st.pNo eq 1001}">
											<i class="fas fa-crown"></i>
										</c:if>
										<a href="#">${st.user.name} (${st.id})</a>
									</div>
									<div class="user-elps">
										<a href="msgModal" data-toggle="modal"
											data-target="#msgModal${st.memNo}"><i
											class="far fa-envelope"></i></a>　<a href="userElpsModal"
											data-toggle="modal" data-target="#userElpsModal${st.memNo}"><i
											class="fas fa-ellipsis-v"></i></a>
									</div>
								</div>
							</div><!-- card header end  -->
								<!-- user-info End -->

							<div id="collapse${st.memNo}" role="tabpanel" class="collapse in">
								<div class="card-body">
									<div class="user-detail">
										<span><i class="fas fa-map-marker-alt"></i>　
											  ${st.user.addr}
										</span>
										<span><i class="fas fa-phone"></i>　
										${st.user.phone}
										</span>
									</div>
								
								</div>
							</div>
						</div>
					</c:forEach> --%>
				</div>
				<!-- acco end  -->
			</div>
		</div>
		<!--row end -->
	</div>
	<!-- container end -->

	<script>
	  /* stringBuffer */
	    var StringBuffer = function() {
		    this.buffer = new Array();
		};
			StringBuffer.prototype.append = function(str) {
			    this.buffer.push(str);
			    return this;
		};
			StringBuffer.prototype.toString = function(){
			    return this.buffer.join("");
		};
		
		
	
  		/* accordion */
    	 $('.collapse').collapse();
     	/* modal */
     	
     	
     	
     	$(document).on("click","a[href='msgModal']",function(e){
     		var modal = $(this).attr("data-target");
        	$(modal).children(".modal-dialog").css({
        		left:e.clientX,
        		top:e.clientY
        	});
     	});
     	
     	$(document).on("click","a[href='userElpsModal']",function(e){
     		var modal = $(this).attr("data-target");
        	$(modal).children(".modal-dialog").css({
        		left:e.clientX,
        		top:e.clientY
        	});
     	});
       /*  $("a[href='msgModal']").click(function(e){
        	var modal = $(this).attr("data-target");
        	$(modal).children(".modal-dialog").css({
        		left:e.clientX,
        		top:e.clientY
        	});
     
      
        }); */

       /*  $("a[href='userElpsModal']").click(function(e){
        	var modal = $(this).attr("data-target");
        	$(modal).children(".modal-dialog").css({
        		left:e.clientX,
        		top:e.clientY
        	});
        });
     */
        
        
        
        /* button 기능 */
        function doReader(memNo){
    	 	$(".modal").hide();
        	$.ajax({
        		url:"<c:url value="doReader.do"/>",
        		data:"memNo="+memNo
        	}).done(function(data){
        		$(".accordion").children().remove();
        		swal({
        			position:'center-center',
        			type:'success',
        			title:'Success!!',
        			showConfirmbutton:false,
        			timer:1500
        		});
        		studentList();
        		
        	});
        };
        
        function removeReader(memNo){
        	$(".modal").hide();
        	$.ajax({
        		url:"<c:url value="removeReader.do"/>",
        		data:"memNo="+memNo
        	}).done(function(data){
        		$(".accordion").children().remove();
        		swal({
        			position:'center-center',
        			type:'success',
        			title:'Success!!',
        			showConfirmbutton:false,
        			timer:1500
        		});
        		studentList();
        		
        	});
        };
        
        function doIgnore(memNo){
        	$(".modal").hide();
        	$.ajax({
        		url:"<c:url value="doIgnore.do"/>",
        		data:"memNo="+memNo
        	}).done(function(data){
        		$(".accordion").children().remove();
        		swal({
        			position:'center-center',
        			type:'success',
        			title:'Success!!',
        			showConfirmbutton:false,
        			timer:1500
        		});
        		studentList();
        		
        	});
        };
        

      


        /* page 호출 시 list 출력 */
        $(function(){
        	studentList();
        })
        
         function studentList(){
        	$.ajax({
        		url:"<c:url value="studentList.do"/>"
        	}).done(function(data){
        		var html = new StringBuffer();
        			
        		for(let i of data){
        			html.append("<div class='card'>");
        		    html.append("<div class='card-header' role='tab' href='#collapse"+i.memNo+"' data-toggle='collapse'>");
        		    html.append("<div class='user-info'>");
        		    html.append("<div class='user-pic'>"+i.user.profile+"</div>");
        		    html.append("<div class='user-name'>");
        		    
        		    if(i.pNo==1001){
        		    	html.append("<i class='fas fa-crown'></i>");
        		    }
        			html.append(" <a href='#'>"+i.user.name+" ("+i.user.id+")</a></div>");
        			html.append("<div class='user-elps'>");
        			html.append("<a href='msgModal' data-toggle='modal' data-target='#msgModal"+i.memNo+"'>");
        			html.append("<i class='far fa-envelope'></i></a>");
        			html.append("　<a href='userElpsModal' data-toggle='modal' data-target='#userElpsModal"+i.memNo+"'>");
        			html.append("<i class='fas fa-ellipsis-v'></i></a></div></div></div>");
        			html.append("<div id='collapse"+i.memNo+"' role='tabpanel' class='collapse'>");
        			html.append("<div class='card-body'>");
        			html.append("<div class='user-detail'>");
        			html.append("<span><i class='fas fa-map-marker-alt'></i>"+i.user.addr+"</span>");
        			html.append("<span><i class='fas fa-phone'></i>"+i.user.phone+"</span>");
        			html.append("</div></div></div></div>");
        	    
        		    
        		}
        		$(".accordion").append(html.toString());
        		
        	});
        } 
        

        /* a tag 클릭시 링크 이동하기 */
      	$(document).on("click",".user-name > a",function(e){
      		e.stopPropagation();
      	}) 
      	
    </script>
</body>
</html>