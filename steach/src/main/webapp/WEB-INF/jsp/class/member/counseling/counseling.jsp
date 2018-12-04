<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>상담일지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/steach/resources/css/header/class-header.css">
    <link rel="stylesheet" href="/steach/resources/css/class/member/counseling/counseling.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-default">
        <div class="navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="pull-left home"><a href="#"><i class="fas fa-home"></i></a></li>
                <li class="pull-left myClassName"><a href="#">클래스명</a></li>
                <li class="classCurriculum"><a href="#">커리큘럼</a></li>
                <li class="dropdown classCourse">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">수업</a>
                    <ul class="dropdown-menu">
                        <li><a href="#">과제제출</a></li>
                    </ul>
                </li>
                <li class="dropdown classUser">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">사용자</a>
                    <ul class="dropdown-menu">
                        <li><a href="#">출결현황</a></li>
                        <li class="divider"></li>
                        <li><a href="#">조별활동</a></li>
                    </ul>
                </li>
                <li class="nbsp"> </li>
                <li class="pull-right dropdown myNotification">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fas fa-user"></i></a>
                    <ul class="dropdown-menu myNotificationMenu">
                        <li><a href="#">마이페이지</a></li>
                        <li class="divider"></li>
                        <li><a href="#">마이드라이브</a></li>
                        <li class="divider"></li>
                        <li><a href="#">로그아웃</a></li>
                    </ul>
                </li>
                <li class="pull-right myInformation"><a href="#"><i class="fas fa-bell"></i></a></li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <div class="student-card">
            <div class="student-card-content">
                <div class="card">
                    <div class="hang">
                        <div class="details"></div>
                    </div>
                    <div class="row student-img">
                        <img src="/steach/resources/images/class/group/pl.png" width="180" height="180" alt="학생 프로필 사진"/>
                        <h1>조성일</h1>
                    </div>
                </div>
                <ul class="student-info">
                    <li><i class="fas fa-phone"></i>　010-3403-9303</li>
                    <li><i class="fas fa-envelope"></i>　cho30629@naver.com</li>
                    <li class="student-address"><i class="fas fa-location-arrow"></i><span>　경기도 고양시 덕양구 고양동 195-4</span></li>
                </ul>
            </div>
        </div>
        <div id="accordion" class="panel-group">
            <h3 class="counselings">상담일지
                <i class="fas fa-plus addCounseling" data-toggle="modal" data-target="#addCounselingModal"></i>
            </h3>
            <c:forEach var="counseling" items="${counselingList}">
	            <div class="panel">
	                <div class="panel-heading">
	                    <h4 class="panel-title">
	                        <a href="#panelBody${counseling.counselingNo}" ondragstart="return false" onselectstart="return false" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion">
	                            <span class="counseling-date-title" >${counseling.counselingTitle}</span>
	                            <input class="title-update-form" type="text" value="${counseling.counselingTitle}">
	                        </a>
	                    </h4>
	                </div>
	                <div id="panelBody${counseling.counselingNo}" class="panel-collapse collapse collapsed">
	                    <div class="panel-body">
	                        <p class="counseling-date-content" style="white-space: pre-line;">${counseling.counselingContent}</p>
	                        <textarea class="content-update-form">${counseling.counselingContent}</textarea>
	                        <div class="counseling-modify-remove-btn">
	                            <br>
	                            <button class="btn btn-default remove-counseling" data-index="${counseling.counselingNo}">삭제</button>
	                            <button class="btn btn-default modify-counseling" data-index="${counseling.counselingNo}">수정</button>
	                        </div> 
	                        <div class="counseling-modify-btn-div" style="display: none;">
	                            <button class="btn btn-default on-modify-counseling" data-index="${counseling.counselingNo}">수정</button>
	                        </div>
	                    </div>
	                </div>
	            </div>
            </c:forEach>
        </div>
    </div>

     <!-- Modal -->
     <div class="modal fade" id="addCounselingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="counselingTitle">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h3 class="modal-title" id="myModalLabel"><i class="fas fa-comment"></i>
                        <input class="writeform-counseling-title" type="text" placeholder="상담 제목"></h3>
                    </div>
                    <hr>
                    <div class="counselingContent clearfix">
                        <h4 class="modal-title"> <i class="fas fa-comments"></i>　상담 내용</h4>
                        <div class="counselinContent-div clearfix">
                        	<textarea class="writeform-counseling-content"></textarea>
                        </div>
                        <div class="write-btn-div">
                            <button class="btn btn-default write-counseling">등록</button>
                        </div>    
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    	// + 모달 오픈시 상담 제목 입력란 포커스
    	$('#addCounselingModal').on('shown.bs.modal', function() {
    		$(".writeform-counseling-title").focus();
    	});
    	
    	// 상담 등록
    	$("body").on("click", ".write-counseling", function(e) {
			e.preventDefault();
			var addCounselingTitle = $(this).parents(".counselingContent").siblings(".counselingTitle").find(".modal-title").find(".writeform-counseling-title").val();
			var addCounselingContent = $(this).parents(".write-btn-div").siblings(".counselinContent-div").find(".writeform-counseling-content").val();
			
			$.ajax({
				url: "/steach/class/member/counseling/writeCounseling.do",
				data: {"classNo": 1, "studentId": 'chos', "counselingWriter": "csi", "counselingTitle": addCounselingTitle, "counselingContent": addCounselingContent}
			})
			.done(function(result) {
				console.log(result);
				
				var html = "";
				
				html += '<div class="panel">' +
			                '<div class="panel-heading">' +
				                '<h4 class="panel-title">' +
				                    '<a href="#panelBody' + result + '" ondragstart="return false" onselectstart="return false" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion">' +
				                    '<span class="counseling-date-title">' + addCounselingTitle + '</span>' +  
				                    '<input class="title-update-form" type="text" value="' + addCounselingTitle + '">' +
				                    '</a>' + 
				                '</h4>' + 
				            '</div>' + 
				            '<div id="panelBody' + result + '" class="panel-collapse collapse collapsed">' +
				                '<div class="panel-body">' +
				                    '<p class="counseling-date-content" style="white-space: pre-line">' + addCounselingContent + '</p>' +
				                    '<textarea class="content-update-form">' + addCounselingContent + '</textarea>' +
				                    '<div class="counseling-modify-remove-btn">' +
				                        '<br>' +
				                        '<button class="btn btn-default remove-counseling" data-index="' + result + '">삭제</button>' +
				                        '<button class="btn btn-default modify-counseling" data-index="' + result + '">수정</button>' +
				                    '</div>' +
				                    '<div class="counseling-modify-btn-div" style="display: none;">' +
				                    	'<button class="btn btn-default on-modify-counseling" data-index="' + result + '">수정</button>' +
				                    '</div>' +
				                '</div>' +
				            '</div>' +
				        '</div>';
				
				$(".counselings").after(html);
				$(".modal").modal("hide");
	    		$(".writeform-counseling-title").val("");
	    		$(".writeform-counseling-content").val("");
			});
    	});
    	
    	// 상담 수정
    	$("body").on("click", ".modify-counseling", function() {
			$(".counseling-date-title").show();
			$(".title-update-form").hide();
			$(".counseling-date-content").show();
			$(".content-update-form").hide();
			$(".counseling-modify-remove-btn").show();
			$(".counseling-modify-btn-div").hide();
			
			$(this).parents(".panel-collapse").siblings(".panel-heading").find(".panel-title").find(".accordion-toggle").find(".counseling-date-title").hide();
			$(this).parents(".panel-collapse").siblings(".panel-heading").find(".panel-title").find(".accordion-toggle").find(".title-update-form").show();
			$(this).parents(".panel-body").find(".counseling-date-content").hide();
			$(this).parents(".panel-body").find(".content-update-form").show();
			$(this).parents(".counseling-modify-remove-btn").hide();
			$(this).parents(".counseling-modify-remove-btn").siblings(".counseling-modify-btn-div").show();
			$(".title-update-form").focus();
		});
    	
    	$("body").on("click", ".on-modify-counseling", function() {
    		var modifyNo = $(this).attr("data-index");
			var modifyTitle = $(this).parents(".panel-collapse").siblings(".panel-heading").find(".panel-title").find(".accordion-toggle").find(".title-update-form").val();
			var modfiyContent = $(this).parents(".panel-body").find(".content-update-form").val();
			
			$(this).parents(".panel-collapse").siblings(".panel-heading").find(".panel-title").find(".accordion-toggle").find(".counseling-date-title").text(modifyTitle);
			$(this).parents(".panel-body").find(".counseling-date-content").text(modfiyContent);
			
			$.ajax({
				url: "/steach/class/member/counseling/modifyCounseling.do",
				data: {"counselingNo": modifyNo, "counselingTitle": modifyTitle, "counselingContent": modfiyContent}
			})
			.done(function(result) {
				$(".counseling-date-title").show();
				$(".title-update-form").hide();
				$(".counseling-date-content").show();
				$(".content-update-form").hide();
				$(".counseling-modify-remove-btn").show();
				$(".counseling-modify-btn-div").hide();
				
				console.log(result);
			}); 
		});
    	
    	$("body").on("click", ".panel-heading", function() {
			$(".counseling-date-title").show();
			$(".title-update-form").hide();
			$(".counseling-date-content").show();
			$(".content-update-form").hide();
			$(".counseling-modify-remove-btn").show();
			$(".counseling-modify-btn-div").hide();
		});
    	
    	$("body").on("click", ".title-update-form", function(e) {
			e.preventDefault();
			e.stopPropagation();
		});
    	
        $(document).mousedown(function (e) {
            var container = $('#accordion');
            if( container.has(e.target).length === 0){
    			$(".counseling-date-title").show();
    			$(".title-update-form").hide();
    			$(".counseling-date-content").show();
    			$(".content-update-form").hide();
    			$(".counseling-modify-remove-btn").show();
    			$(".counseling-modify-btn-div").hide();
            }
        }); 
    	
    	// 상담 삭제
    	$("body").on("click", ".remove-counseling", function() {
    		var counselingNo = $(this).attr("data-index");
    		
    		$(this).parents(".panel").remove();
    		
			$.ajax({
				url: "/steach/class/member/counseling/removeCounseling.do",
				data: {"counselingNo": counselingNo}
			})
			.done(function(result) {
				console.log(result);
			});
		});
    	
        $('ul.nav li.dropdown').hover(function () {
            $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeIn(200);
        }, function () {
            $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeOut(200);
        });
    </script>
</body>
</html>