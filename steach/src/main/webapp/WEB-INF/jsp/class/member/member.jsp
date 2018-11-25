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

</head>
<body>
	<!-- 쪽지보내기  모달 -->
     <div class="modal fade" id="msgModal" tabindex="-1" role="dialog">
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
     <div class="modal fade" id="userElpsModal" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <ul class="modal-ul">
                        <li><a>반장위임</a></li>
                        <li><a>반장위임취소</a></li>
                        <li><a>내보내기</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>



        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <!-- 강사 -->
                    <div class="user-title">
                        <span>강사</span>
                    </div>
                    <div class="user-info">
                        <div class="user-pic"></div>
                        <div class="user-name"><a href="#">안규영</a></div>
                        <div class="user-elps">
                            <a href="msgModal" data-toggle="modal" data-target="#msgModal"><i class="far fa-envelope"></i></a>　　
                        </div>
                     
                    </div><!--admin info end -->
                </div><!--col end-->
                
                
                <div class="col-md-8 col-md-offset-2">
                        <!-- 강사 -->
                        <div class="user-title">
                            <span>학생</span>
                        </div>
                        <div class="user-info">
                            <div class="user-pic"></div>
                            <div class="user-name">
                                <i class="fas fa-crown"></i>
                                <a href="#">박한준</a>
                            </div>
                            <div class="user-elps">
                                <a href="msgModal" data-toggle="modal" data-target="#msgModal"><i class="far fa-envelope"></i></a>　 
                                <a href="userElpsModal" data-toggle="modal" data-target="#userElpsModal"><i class="fas fa-ellipsis-v"></i></a>
                            </div>
                        </div><!--user info end -->
                        <div class="user-info">
                            <div class="user-pic"></div>
                            <div class="user-name"><a href="#">박아란</a></div>
                            <div class="user-elps">
                                <a href="msgModal" data-toggle="modal" data-target="#msgModal"><i class="far fa-envelope"></i></a>　
                                <a href="userElpsModal"  data-toggle="modal" data-target="#userElpsModal" ><i class="fas fa-ellipsis-v"></i></a>
                            </div>
                        </div><!--user info end -->

                        <div class="user-info">
                            <div class="user-pic"></div>
                            <div class="user-name"><a href="#">김해동</a></div>
                            <div class="user-elps">
                                <a href="msgModal"  data-toggle="modal" data-target="#msgModal"><i class="far fa-envelope"></i></a>　
                                <a href="userElpsModal"  data-toggle="modal" data-target="#userElpsModal"><i class="fas fa-ellipsis-v"></i></a>
                            </div>
                        </div><!--user info end -->

                        <div class="user-info">
                            <div class="user-pic"></div>
                            <div class="user-name"><a href="#">김병관</a></div>
                            <div class="user-elps">
                                <a href="msgModal"  data-toggle="modal" data-target="#msgModal"> <i class="far fa-envelope"></i></a>　
                                <a href="userElpsModal"  data-toggle="modal" data-target="#userElpsModal"><i class="fas fa-ellipsis-v"></i></a>
                            </div>
                        </div><!--user info end -->
                    </div><!--col end-->   
            </div><!--row end -->
        </div><!-- container end -->

    <script>
  
        /* modal */
        $("a[href='msgModal']").click(function(e){
            $("#msgModal > .modal-dialog").css({
                left:e.clientX,top:e.clientY
            });
        });

        $("a[href='userElpsModal']").click(function(e){
            $("#userElpsModal > .modal-dialog").css({
                left:e.clientX,top:e.clientY
            });
        });
    </script>
</body>
</html>