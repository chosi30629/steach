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
<link rel="stylesheet" href="/steach/resources/css/class/member/member.css"/>
<link rel="stylesheet" href="/steach/resources/css/class/lecture/lecture.css"/>

</head>
<body>

<!-- modal 동적 생성하기 -->
	<c:forEach var="i" items="${studentList}">
    	 <!-- 쪽지보내기  모달 -->
	     <div class="modal fade" id="msgModal${i.memNo}" tabindex="-1" role="dialog">
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
	     <div class="modal fade" id="userElpsModal${i.memNo}" tabindex="-1" role="dialog">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-body">
	                    <ul class="modal-ul">
	                        <li><a href="#" onclick="doReader(${i.memNo})">반장위임</a></li>
	                        <li><a href="#" onclick="removeReader(${i.memNo})">반장위임취소</a></li>
	                        <li><a href="#" onclick="doBan(${i.memNo})">내보내기</a></li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	</c:forEach>


        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <!-- 강사 -->
                    <div class="user-title">
                        <span>강사</span>
                    </div>
                    <div class="user-info">
                        <div class="user-pic"></div>
                        <div class="user-name"><a href="#">${master.user.name}</a></div>
                        <div class="user-elps">
                            <!-- <a href="msgModal" data-toggle="modal" data-target="#msgModal"><i class="far fa-envelope"></i></a>　　 -->
                        </div>
                     
                    </div><!--admin info end -->
                </div><!--col end-->
                
                
                <div class="col-md-8 col-md-offset-2">
                        <!-- 강사 -->
                        <div class="user-title">
                            <span>학생</span>
                        </div>
                        
                        <c:forEach var="st" items="${studentList}"> 
						
	                        <div class="user-info">
	                            <div class="user-pic">${st.user.profile}</div>
	                            <div class="user-name">
	                            
	                            <!-- 반장일떄     <i class="fas fa-crown"></i> -->
	                                <a href="#">${st.user.name}</a>
	                            </div>
	                            <div class="user-elps">
	                                <a href="msgModal" data-toggle="modal" data-target="#msgModal${st.memNo}"><i class="far fa-envelope"></i></a>　 
	                                <a href="userElpsModal" data-toggle="modal" data-target="#userElpsModal${st.memNo}"><i class="fas fa-ellipsis-v"></i></a>
	                            </div>
	                            
	
	                            
	                        </div><!--user info end -->
                        </c:forEach>
                  
                    </div><!--col end-->   
                    
                    <div class="col-md-8 col-md-offset-2">
                    	 <div class="accordion" role="tablist">
                        <div class="card">
                            <div class="card-header" role="tab" id="headingOne">
                                <div class="subTitle">
                                    <i class="fas fa-book fa-2x"></i>　
                                    <a data-toggle="collapse" href="#collapseOne">1일차 java 수업자료</a>
                                    <div class="menu">
                                        <a href="subElps" data-toggle="modal" data-target="#subElpsModal"><i class="fas fa-ellipsis-v"></i></a>
                                    </div>
                                </div>
                            </div>

                            <div id="collapseOne"  role="tabpanel" class="collapse">
                            <div class="card-body">
                                <div class="subTitle-time">
                                    <span>2018-11-17 18:26:11 작성됨</span>
                                </div>
                                <div class="subTitle-context">
                                    <span>여기는 내용이나옵니다.</span>
                                </div>
                                <div class="subTitle-attach">
                                    <span><i class="fas fa-paperclip"></i></span>
                                    <span><i class="fab fa-google-drive"></i></span>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
            </div><!--row end -->
        </div><!-- container end -->

    <script>
  		
    
     /* modal */
     
        $("a[href='msgModal']").click(function(e){
        	var modal = $(this).attr("data-target");
        	$(modal).children(".modal-dialog").css({
        		left:e.clientX,
        		top:e.clientY
        	});
           /*  $("#msgModal > .modal-dialog").css({
                left:e.clientX,top:e.clientY
            }); */
      
        });

        $("a[href='userElpsModal']").click(function(e){
     
        	$("#userElpsModal > .modal-dialog").css({
                left:e.clientX,top:e.clientY
            });
        });
    
        /* button 기능 */
        function doReader(memNo){
        	alert(memNo);
        };
        
        function removeReader(id){
        	alert(id);
        };
        
        function doBan(id){
        	alert(id);
        };
    </script>
</body>
</html>