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
                    <div class="accordion-head">
                        <div class="title">
                            <span class="title-name">Java Programming</span>   
                            <div class="menu">
                                <a href="titlePlus" data-toggle="modal" data-target="#titlePlusModal"><i class="fas fa-plus"></i></a>　
                                <a href="titleElps" data-toggle="modal" data-target="#titleElpsModal"><i class="fas fa-ellipsis-v"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="accordion" role="tablist">
                        <div class="card">
                            <div class="card-header" role="tab" data-toggle="collapse" href="#collapseOne" id="headingOne">
                                <div class="subTitle">
                                    <i class="fas fa-book fa-2x"></i>　
                                    <a>1일차 java 수업자료</a>
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

                <div class="card">
                    <div class="card-header" role="tab" id="headingTwo">
                        <div class="subTitle">
                            <i class="fas fa-edit fa-2x"></i>　
                            <a class="collapsed" data-toggle="collapse" href="#collapseTwo">
                            1일차 과제 
                            </a>
                            <div class="menu">
                                <a href="subElps" data-toggle="modal" data-target="#subElpsModal"><i class="fas fa-ellipsis-v"></i></a>
                            </div>
                        </div>
                    </div>
                    <div id="collapseTwo" class="collapse" role="tabpanel">
                    <div class="card-body">
                        -  1일차 과제<br>
                        ..<br>
                        .....<br>
                        <br><br>
                    </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header" role="tab" id="headingThree">
                    <div class="subTitle">
                        <i class="fas fa-video fa-2x"></i>　
                        <a class="collapsed" data-toggle="collapse" href="#collapseThree">
                            1일차 보충수업
                        </a>
                        <div class="menu">
                            <a href="subElps" data-toggle="modal" data-target="#subElpsModal"><i class="fas fa-ellipsis-v"></i></a>
                        </div>
                    </div>
                    </div>
                    <div id="collapseThree" class="collapse" role="tabpanel">
                    <div class="card-body">
                        -  1일차 보충수업 ...ㅋㄷㅋㄷ.<br>
                        <br>
                        ㅁ<br>
                        ㅁ<br>
                    </div>
                    </div>
                </div>

                <div class="card">
                        <div class="card-header" role="tab" id="headingFour">
                            <div class="subTitle">
                                <i class="fas fa-vote-yea fa-2x"></i>　
                                <a class="collapsed" data-toggle="collapse" href="#collapseFour">
                                1일차 투표
                                    </a>
                                <div class="menu">
                                    <a href="subElps" data-toggle="modal" data-target="#subElpsModal"><i class="fas fa-ellipsis-v"></i></a>
                                </div>
                            </div>
                        </div>
                        <div id="collapseFour" class="collapse in" role="tabpanel">
                        <div class="card-body">
                            - 1일 차 투표--<br>
                            <input type="checkbox"/> 참
                            <input type="checkbox"/> 불    
                        </div>
                        </div>
                    </div>
                      </div><!--.accordion end -->
                  </div><!--offset -->
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