<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<link rel="stylesheet" href="/steach/resources/css/main/main.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="/steach/resources/Time-Selection-Popover-jQuery-Timepicker/dist/css/timepicker.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="/steach/resources/Time-Selection-Popover-jQuery-Timepicker/dist/js/timepicker.js"></script>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="navbar-collapse">
		<ul class="nav navbar-nav">
			<li class="pull-left home"><a href="#"><i
					class="fas fa-home"></i></a></li>
			<li class="pull-left myClassName"><a href="#">STEACH</a></li>
			<li class="pull-right dropdown myNotification"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"><i
					class="fas fa-user"></i></a>
				<ul class="dropdown-menu myNotificationMenu">
					<li><a href='<c:url value="/user/myPage.do"/>' id="mypage">마이페이지</a></li>
					<li class="divider"></li>
					<li><a href='<c:url value="/drive/drive.do"/>'>마이드라이브</a></li>
					<li class="divider"></li>
					<li><a href='<c:url value="/login/logout.do"/>'>로그아웃</a></li>
					<%--                         <li><a href="<c:url value="/login/logout.do"/>">로그아웃</a></li> --%>
				</ul></li>
			<li class="pull-right myInformation"><a href="#"><i
					class="fas fa-bell"></i></a></li>
			<li class="pull-right dropdown add"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"><i
					class="fas fa-plus"></i></a>
				<ul class="dropdown-menu addmenu">
					<li><a href="#" id="joinclass" data-toggle="modal"
						data-target="joincodeinput">수업 참여하기</a></li>
					<li class="divider"></li>
					<li><a id="addclass" data-toggle="modal">수업 만들기</a></li>
				</ul></li>
		</ul>
	</div>
	</nav>
	<div class="wrap" style="height: 750px; margin-top: 80px">
		<div class="teaching" style="height: 50%">
			<h3>강의중인 클래스</h3>
			<ul id="list-1">
				<c:forEach var="teach" items="${teaching }">
		
					<li>
						<div class="card--container">
							<div class="card--section"
								style="background-color: rgb(74, 202, 106);">
								<h1>
									<a href="#">${teach.className}</a>
								</h1>
								<p>${teach.beginDate}~${teach.endDate}</p>
							</div>
							<div class="card--details">
								<table>
									<tr>
										<td>Tourist Police</td>
										<td>1155</td>
									</tr>
									<tr>
										<td>Police</td>
										<td>191</td>
									</tr>
								</table>
							</div>
						</div>
					</li>
				</c:forEach>


			</ul>
		</div>
		<div class="studying" style="height: 50%">
			<h3>수강중인 클래스</h3>
			<ul id="list-2">
				<c:forEach var="study" items="${studying }">
					<c:choose>
						<c:when test='${study.master != user.id}'>
							<li>
								<div class="card--container">
									<div class="card--section"
										style="background-color: rgb(74, 202, 106);">
										<h1>
											<a href="#" data-no="${study.classNo}">${study.className}</a>
										</h1>
										<p>${study.beginDate}~ ${study.endDate}</p>
									</div>
									<div class="card--details">
										<table>
											<tr>
												<td>Tourist Police</td>
												<td>1155</td>
											</tr>
											<tr>
												<td>Police</td>
												<td>191</td>
											</tr>
										</table>
									</div>
								</div>
							</li>
						</c:when>
					</c:choose>
				</c:forEach>
				<!-- 				<li> -->
				<!-- 					<div class="card--container culture"> -->
				<!-- 						<div class="card--section" style="background-color: red;"> -->
				<!-- 							<h1> -->
				<!-- 								<a href="#">빼액</a> -->
				<!-- 							</h1> -->
				<!-- 							<p>Thai</p> -->
				<!-- 						</div> -->
				<!-- 						<div class="card--details"> -->
				<!-- 							<p>English is widely spoken in tourist-friendly areas.</p> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</li> -->
				<!-- 				<li> -->
				<!-- 					<div class="card--container"> -->
				<!-- 						<div class="card--section" style="background-color: #6936E0;"> -->
				<!-- 							<h1> -->
				<!-- 								<a href="#">집에가자</a> -->
				<!-- 							</h1> -->
				<!-- 							<p>2018-11-11~2018-11-11</p> -->
				<!-- 						</div> -->
				<!-- 						<div class="card--details"> -->
				<!-- 							<table> -->
				<!-- 								<tr> -->
				<!-- 									<td>Tourist Police</td> -->
				<!-- 									<td>1155</td> -->
				<!-- 								</tr> -->
				<!-- 							</table> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</li> -->

			</ul>
		</div>


	</div>

	<!-- Modal -->
	<div class="modal modal-center fade" id="joincodeinput" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalCenterTitle">수업 참여하기</h4>
				</div>
				<div class="modal-body">
					<p>선생님으로부터 수업 코드를 받아 여기에 입력하세요.</p>
					<form id="joinclassForm" method="post">
						<input type="hidden" name="id" value="${user.id }">
						<input type="hidden" name="classNo" id="classNo"> 
						<input type="text" class="form-control" id="classkey" style="width: 100%" placeholder="수업 코드">
				</div>
				<div class="modal-footer">
					<button class="btn btn-link">참여하기</button>
					<a class="btn btn-default" data-dismiss="modal">취소</a>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal modal-center fade" id="createclass" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalCenterTitle">클래스 개설하기</h4>

				</div>
				<div class="modal-body">
					<form id="createclassForm" method="post">
						<div class="form-group">
							<label for="usrname"><i class="fas fa-book"></i> 클래스 이름</label> <input
								type="text" class="form-control" name="className" id="usrname"
								placeholder="클래스 이름">
						</div>
						<div class="form-group">
							<label for="subtitle"><i class="fas fa-book"></i> 클래스 설명</label>
							<input type="text" class="form-control" name="classSubname"
								id="subtitle" placeholder="클래스 설명">
						</div>
						<div class="form-group">
							<input type="hidden" name="master" value="${user.id}">
							<div></div>
						</div>
						<div class="form-group">
							<label for="datepicker1"><i class="fas fa-calendar-alt"></i>수업기간</label>
							<p>
								<input class="datepick" type="text" name="beginDate"
									id="datepicker1" placeholder="시작일"> ~ <input
									class="datepick" type="text" name="endDate" id="datepicker2"
									placeholder="종료일">
							</p>
						</div>
						<div class="form-group">
							<label for="usrname"><i class="far fa-clock"></i>수업기간</label>
							<p>
								<input class="datepick" type="text" name="startTime"
									id="timepicker1" placeholder="시작시간"> ~ <input
									class="datepick" type="text" name="endTime" id="timepicker2"
									placeholder="종료시간">
							</p>
						</div>
						<div class="form-group">
							<label for="psw"><i class="fas fa-key"></i> 클래스 고유번호</label> <input
								type="text" class="form-control" name="classKey" id="serial"
								readonly>
						</div>
				</div>
				<div class="modal-footer">
					<a class="btn btn-default" id="cancle" data-dismiss="modal">취소</a>
					<button class="btn btn-link">개설하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	var teaching = "${teaching}";
	console.log(teaching)
	var studying = "${studying}";
	console.log(studying.master)

	$('ul.nav li.dropdown').hover(function() {
		$(this).find('.dropdown-menu').stop(true, true).delay(10).fadeIn(200);
	}, function() {
		$(this).find('.dropdown-menu').stop(true, true).delay(10).fadeOut(200);
	});

	$(document).ready(function() {
		$("#joinclass").on("click", function() {
			$("#joincodeinput").modal('toggle')
		});
		$("#addclass").on("click", function() {
			$("#createclass").modal('toggle')
		});

	});

	$(function() {
		$("#datepicker1, #datepicker2").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		$("#timepicker1").timepicker();
		$("#timepicker2").timepicker();

	});

	$("#list-1, #list-2").sortable({}).disableSelection();

	// 클래스 개설하기 버튼 클릭시 랜덤키 생성
	$("#addclass")
			.click(
					function() {
						var serial = "";
						var result = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
						for (var i = 0; i < 6; i++) {
							serial += result.charAt(Math.floor(Math.random()
									* result.length));
						}
						console.log(serial)
						$("#serial").attr("value", serial)
					});

	$("#createclassForm").submit(function(e) {
		e.preventDefault();
		console.log($(this).serialize());

		$.ajax({
			url : "/steach/class/createClass.do",
			data : $(this).serialize()
		}).done(function() {
			alert("success");
		});
	});
	var joinkey = "";
	$("#classkey").on("input", function() {
		var joincode = $("#classkey").val();
		console.log(joincode)
		$.ajax({
			url : "/steach/class/findClass.do",
			data : "classKey=" + joincode
		}).done(function(result) {
			if (result) {
				console.log(result)
				joinkey = result
				console.log(joinkey.classNo)
				$("#classNo").attr("value", joinkey.classNo)
			} else {
				alert("없음")
			}

		})

	});
	// 	console.log(joinkey)

	$("#joinclassForm").submit(function(e) {
		e.preventDefault();
		console.log($(this).serialize());
		$.ajax({
			url : "/steach/class/joinClass.do",
			data : $(this).serialize(),
			type : "POST"
		}).done(function() {
			$("#classkey").val("");
			alert("클래스에 가입되었습니다")
		})

	});
	
	
	/* 수강 중인 클래스 이동 */
	$(document).on("click","a",function(){
		var cNo = $(this).data("no");
		alert(cNo);
		location.href="<c:url value='/class/curriculum/curriculum.do?classNo="+cNo+"'/>";
	})
</script>
</body>
</html>