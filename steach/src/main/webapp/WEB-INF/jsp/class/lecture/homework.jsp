<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- header import -->
<%-- <c:import url="/WEB-INF/jsp/header/classHeader.jsp" /> --%>
<!-- Header -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/steach/resources/css/header/class-header.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<link rel="stylesheet"
	href="/steach/resources/css/class/lecture/homework.css">
</head>
<body>
	<!-- header  -->
	<nav class="navbar navbar-default">
		<div class="navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="pull-left home"><a href="#"><i
						class="fas fa-home"></i></a></li>
				<li class="pull-left myClassName"><a href="#">클래스이름.</a></li>
				<li class="classCurriculum"><a
					href="<c:url value='/class/curriculum/curriculum.do'/>">커리큘럼</a></li>
				<li class="dropdown classCourse"><a href="lecture"
					class="dropdown-toggle" data-toggle="dropdown">수업</a>
					<ul class="dropdown-menu">
						<li><a href="<c:url value='/class/lecture/homework.do'/>">과제제출</a></li>
					</ul></li>
				<li class="dropdown classUser"><a href="member"
					class="dropdown-toggle" data-toggle="dropdown">사용자</a>
					<ul class="dropdown-menu">
						<li><a href="#">출결현황</a></li>
						<li class="divider"></li>
						<li><a href="<c:url value='/class/group/groupMain.do'/>">조별활동</a></li>
					</ul></li>
				<li class="nbsp"></li>
				<li class="pull-right dropdown myNotification"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"><i
						class="fas fa-user"></i></a>
					<ul class="dropdown-menu myNotificationMenu">
						<li><a href="#">마이페이지</a></li>
						<li class="divider"></li>
						<li><a href="#">마이드라이브</a></li>
						<li class="divider"></li>
						<li><a href="#">로그아웃</a></li>
					</ul></li>
				<li class="pull-right myInformation"><a href="#"><i
						class="fas fa-bell"></i></a></li>
			</ul>
		</div>
	</nav>
	<!-- header end  -->	






	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">

				<!-- subject title -->
				<c:forEach var="board" items="${homework}">
					<div class="accordion-head">
						<div class="title">
							<span class="title-name">${board.lecture.subject}</span>
						</div>
						<!-- title end -->
					</div>

					<div class="accordion" role="tablist">
						<div class="card">
							<div class="card-header" role="tab" data-toggle="collapse"
								href="#collapse${board.boardNo}" id="heading${board.boardNo}">
								<div class="subTitle">
									<div class="row">
										<div class="col-md-9">
											<span class="homework-name">${board.title}</span>
										</div>
										<div class="col-md-3">
											<span>마감일 </span> <span class="homework-deadline">${board.deadline}</span>
										</div>
									</div>

								</div>
							</div>

							<div id="collapse${board.boardNo}" roll="tabpanel"
								class="collapse in">
								<div class="card-body">
									<div class="row">
										<div class="col-md-10 col-md-offset-1">
											<div class="submit-section">
												<span>제출자 수</span> <span>${board.count}</span> <span>/</span>
												<span>${board.memCnt}</span>
												<c:forEach var="j" items="${board.homework}">
													<c:if test="${board.boardNo==j.boardNo}">
														<div class="user-info">
															<div class="user-pic">${j.user.profile}</div>
															<div class="user-name">
																<a href="#"><span>${j.user.name}</span></a> Comment: <span>${j.hwContent}</span>
															</div>
															<div class="user-file">
																<a><span><i class="fas fa-paperclip"></i></span></a>
															</div>
														</div>
													</c:if>
												</c:forEach>
												<%--
												<c:forEach var="j" items="${submit}">
													<c:if test="${i.boardNo==j.boardNo}">
														<div class="user-info">
															<div class="user-pic">${j.user.profile}</div>
															<div class="user-name">
																<a href="#"><span>${j.user.name}</span></a> Comment: <span>${j.hwContent}</span>
															</div>
															<div class="user-file">
																<a><span><i class="fas fa-paperclip"></i></span></a>
															</div>
														</div>
													</c:if>
												</c:forEach>
												 --%>
											</div>
											<!--  unsubmit. -->
											<div class="unsubmit-section">
												<span>미제출자</span> <span>${board.memCnt-board.count}</span> <span>/</span>
												<span>${board.memCnt}</span>
												<div class="unsubmit-list">

													<table>

														<c:if test="${board.boardNo!=j.boardNo}">
															<c:forEach var="j" items="${board.homework}"
																varStatus="trCnt">
																
																
																<c:if test="${trCnt.first or trCnt.count%6 == 1}">
																	<tr>
																</c:if>
																<td>
																	<div class="user-info">
																		<div class="user-pic">${j.user.profile}</div>
																		<div class="user-name">
																			<a href="#"><span>${j.user.name}</span></a>
																		</div>
																	</div>
																</td>
																<c:if test="${trCnt.last or trCnt.count%6 == 0}">
																	</tr>
																</c:if>
															</c:forEach>
														</c:if>

													</table>
													<!-- 	<table>
														<tr>
															<td>
																<div class="user-info">
																	<div class="user-pic"></div>
																	<div class="user-name">
																		<a href="#"><span>박아란</span></a>
																	</div>
																</div>
															</td>
															<td>
																<div class="user-info">
																	<div class="user-pic"></div>
																	<div class="user-name">
																		<a href="#"><span>박아란</span></a>
																	</div>
																</div>
															</td>
															<td>
																<div class="user-info">
																	<div class="user-pic"></div>
																	<div class="user-name">
																		<a href="#"><span>박아란</span></a>
																	</div>
																</div>
															</td>

															<td>
																<div class="user-info">
																	<div class="user-pic"></div>
																	<div class="user-name">
																		<a href="#"><span>박아란</span></a>
																	</div>
																</div>
															</td>
															<td>
																<div class="user-info">
																	<div class="user-pic"></div>
																	<div class="user-name">
																		<a href="#"><span>박아란</span></a>
																	</div>
																</div>
															</td>

															<td>
																<div class="user-info">
																	<div class="user-pic"></div>
																	<div class="user-name">
																		<a href="#"><span>박아란</span></a>
																	</div>
																</div>
															</td>
														</tr>


													</table> -->
												</div>
												<!-- unsubmit list -->
											</div>
											<!--  unsubmit section  -->
										</div>
										<!-- col-md-10 end  -->
									</div>
									<!-- row end  -->
								</div>
								<!-- card body end  -->
							</div>
							<!-- collapse end  -->

						</div>
						<!-- card end  -->
					</div>
					<!-- accordion end  -->
				</c:forEach>
				<!-- acc-head end -->

				<!-- board  -->

				<!-- 	<div class="accordion" role="tablist">
					<div class="card">
						<div class="card-header" role="tab" data-toggle="collapse"
							href="#collapse" id="heading">
							<div class="subTitle">
								<div class="row">
									<div class="col-md-9">
										<span class="homework-name">3일차 과제</span>
									</div>
									<div class="col-md-3">
										<span>마감일 </span> <span class="homework-deadline">2018-11-12
											22:32:00</span>
									</div>
								</div>
								<a>과제이름</a>
								<div class="menu">
									<a href="subElps" data-toggle="modal"
										data-target="#subElpsModal"> <i class="fas fa-ellipsis-v"></i>
									</a>
								</div>
							</div>
						</div>

						<div id="collapse" roll="tabpanel" class="collapse in">
							<div class="card-body">
								<div class="row">
									<div class="col-md-10 col-md-offset-1">
										<div class="submit-section">
											<span>제출자 수</span> <span>3</span> <span>/</span> <span>28</span>
											<div class="user-info">
												<div class="user-pic"></div>
												<div class="user-name">
													<a href="#"><span>박아란</span></a>
												</div>
												<div class="user-file">
													<a><span><i class="fas fa-paperclip"></i></span></a>
												</div>
											</div>
											
										</div>
										<div class="unsubmit-section">
											<span>미제출자</span> <span>25</span> <span>/</span> <span>28</span>
											<div class="unsubmit-list">
												<table>
													<tr>
														<td>
															<div class="user-info">
																<div class="user-pic"></div>
																<div class="user-name">
																	<a href="#"><span>박아란</span></a>
																</div>
															</div>
														</td>
														<td>
															<div class="user-info">
																<div class="user-pic"></div>
																<div class="user-name">
																	<a href="#"><span>박아란</span></a>
																</div>
															</div>
														</td>
														<td>
															<div class="user-info">
																<div class="user-pic"></div>
																<div class="user-name">
																	<a href="#"><span>박아란</span></a>
																</div>
															</div>
														</td>
														<td>
															<div class="user-info">
																<div class="user-pic"></div>
																<div class="user-name">
																	<a href="#"><span>박아란</span></a>
																</div>
															</div>
														</td>

														<td>
															<div class="user-info">
																<div class="user-pic"></div>
																<div class="user-name">
																	<a href="#"><span>박아란</span></a>
																</div>
															</div>
														</td>
														<td>
															<div class="user-info">
																<div class="user-pic"></div>
																<div class="user-name">
																	<a href="#"><span>박아란</span></a>
																</div>
															</div>
														</td>

														<td>
															<div class="user-info">
																<div class="user-pic"></div>
																<div class="user-name">
																	<a href="#"><span>박아란</span></a>
																</div>
															</div>
														</td>
													</tr>

													<tr>
														<td>
															<div class="user-info">
																<div class="user-pic"></div>
																<div class="user-name">
																	<a href="#"><span>박아란</span></a>
																</div>
															</div>
														</td>
														<td>
															<div class="user-info">
																<div class="user-pic"></div>
																<div class="user-name">
																	<a href="#"><span>박아란</span></a>
																</div>
															</div>
														</td>
														<td>
															<div class="user-info">
																<div class="user-pic"></div>
																<div class="user-name">
																	<a href="#"><span>박아란</span></a>
																</div>
															</div>
														</td>
														<td>
															<div class="user-info">
																<div class="user-pic"></div>
																<div class="user-name">
																	<a href="#"><span>박아란</span></a>
																</div>
															</div>
														</td>
														<td>
															<div class="user-info">
																<div class="user-pic"></div>
																<div class="user-name">
																	<a href="#"><span>박아란</span></a>
																</div>
															</div>
														</td>
														<td>
															<div class="user-info">
																<div class="user-pic"></div>
																<div class="user-name">
																	<a href="#"><span>박아란</span></a>
																</div>
															</div>
														</td>
														<td>
															<div class="user-info">
																<div class="user-pic"></div>
																<div class="user-name">
																	<a href="#"><span>박아란</span></a>
																</div>
															</div>
														</td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>

				



			</div>
			<!-- col end -->
			</div>
			<!--row end -->
		</div>
		<!--container end . -->
	</div>
</body>

	<script>
	
	  /* header drop-down */
	   $('ul.nav li.dropdown').hover(function() {
	      $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeIn(200);
	  }, function() {
	      $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeOut(200);
	  });
	 
	     
	  $("a[href='lecture']").click(function(){
	  	location.href="<c:url value='/class/lecture/lecture.do'/>";
	  })
	  
	   $("a[href='member']").click(function(){
	  	location.href="<c:url value='/class/member/member.do'/>";
	  })
	  
	</script>
</html>