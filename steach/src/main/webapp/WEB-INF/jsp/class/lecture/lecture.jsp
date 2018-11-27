<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수업 페이지</title>
<!-- header import -->
<c:import url="/WEB-INF/jsp/header/classHeader.jsp" />
<!-- css -->
<link rel="stylesheet" href="/steach/resources/css/class/lecture/lecture.css"/>

</head>
<body>
   <!-- lecture -->

    <!--menu modal -->
    <!-- title plus 모달 -->
    <div class="modal fade" id="titlePlusModal" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <ul class="modal-ul" style="width:200px">
                            <li><i class="fas fa-book"></i><a> 자료</a></li>
                            <li><i class="fas fa-edit"></i><a> 과제</a></li>
                            <li><i class="fas fa-vote-yea"></i><a> 투표</a></li>
                            <li><i class="fas fa-video"></i><a> 보충수업</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- title ellipsis 모달 -->
        <div class="modal fade" id="titleElpsModal" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <ul class="modal-ul">
                            <li><a>주제명 변경</a></li>
                            <li><a>삭제하기</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- subtitle ellipsis 모달 -->
        <div class="modal fade" id="subElpsModal" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <ul class="modal-ul">
                            <li><a>수정하기</a></li>
                            <li><a>삭제하기</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>    
        <!-- 주제 만들기 모달  -->
        <div class="modal fade" id="createModal" tabindex="-1" role="dialog" >
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div>
                                <h4>주제 추가</h4>
                                <input class="modal-text" type="text" placeholder="예) 자바 프로그래밍"
                                        maxlength=100 autocomplete="off">
                                <button class="modal-button" type="button">만들기</button>
                            </div>    
                        </div>
                    </div>     
                </div>
            </div><!-- modal end -->

        <!-- form modal 구현해아함!! -->
        <div class="modal fade" id="formModal" tabindex="-1" role="dialog" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <div>
                            <div class="form-title">과제</div>
                            <input class="modal-text" type="text" placeholder="예) 자바 프로그래밍"
                                    maxlength=100 autocomplete="off">
                            <button class="modal-button" type="button">만들기</button>
                        </div>    
                    </div>
                </div>     
            </div>
        </div>   


           
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <!-- create button -->
                    <div class="create"><!--data-toggle="modal" data-target="#createModal-->
                        <button class="create-btn" data-toggle="modal" data-target="#createModal">CREATE</button>
                    </div>
                    
                    <!-- subject title -->
                    <c:forEach var="sb" items="${subjectList}">
                    	<div class="accordion-head">
                    		<div class="title">
                    			<span class="title-name">${sb.subject}</span>
                    			<div class="menu">
                    				<a href="titlePlus" data-toggle="modal" data-target="#titlePlusModal">
                    					<i class="fas fa-plus"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
                    					<a href="titleElps" data-toggle="modal" data-target="#titleElpsModal">
                    					<i class="fas fa-ellipsis-v"></i></a>　
                    			</div>
                    		</div><!-- title end -->
                    	</div><!-- acc-headend -->
                    </c:forEach>

                 
                      
        
                      
        			 </div><!-- col end -->
                </div><!--row end -->
            </div><!--container end . -->
       
    
       

    <script>
      
        //lecture
        $('.collapse').collapse();

        $(".create-btn").click(function(e){
            $("#createModal >.modal-dialog").css({
                transform:"translateX(-50%)",
                left:"50%",top:"30%"
            });
        });

        $("a[href='titlePlus']").click(function(e){
            $("#titlePlusModal >.modal-dialog").css({
                left:e.clientX,top:e.clientY
            });
        });

        $("a[href='subElps']").click(function(e){
            $("#subElpsModal >.modal-dialog").css({
                left:e.clientX,top:e.clientY
            });
        });

        $("a[href='titleElps']").click(function(e){
            $("#titleElpsModal >.modal-dialog").css({
                left:e.clientX,top:e.clientY
            });
        });

    </script>
</body>
</html>