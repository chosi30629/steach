<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- header import -->
<c:import url="/WEB-INF/jsp/header/classHeader.jsp" />
<link rel="stylesheet"
	href="/steach/resources/css/class/lecture/homework.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">


				<!-- subject title -->
				<c:forEach var="i" items="${homework}">
					<div class="accordion-head">
						<div class="title">
							<span class="title-name">${i.lecture.subject}</span>
						</div>
						<!-- title end -->
					</div>

					<div class="accordion" role="tablist">
						<div class="card">
							<div class="card-header" role="tab" data-toggle="collapse"
								href="#collapse${i.boardNo}" id="heading${i.boardNo}">
								<div class="subTitle">
									<div class="row">
										<div class="col-md-9">
											<span class="homework-name">${i.title}</span>
										</div>
										<div class="col-md-3">
											<span>마감일 </span> <span class="homework-deadline">${i.deadline}</span>
										</div>
									</div>

								</div>
							</div>

							<div id="collapse${i.boardNo}" roll="tabpanel"
								class="collapse in">
								<div class="card-body">
									<div class="row">
										<div class="col-md-10 col-md-offset-1">
											<div class="submit-section">
												<span>제출자 수</span> <span>3</span> <span>/</span> <span>${i.memCnt}</span>
												<c:forEach var="j" items="${submit}">
													<c:if test="${i.boardNo==j.boardNo}">
														<div class="user-info">
															<div class="user-pic"></div>
															<div class="user-name">
																<a href="#"><span>${j.id}</span></a>
															</div>
															<div class="user-file">
																<a><span><i class="fas fa-paperclip"></i></span></a>
															</div>
														</div>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>


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

					2번과제 
					<div class="card">
						<div class="card-header" role="tab" data-toggle="collapse"
							href="#collapse" id="heading">
							<div class="subTitle">
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
								<div class="subTitle-time">
									<span> 작성됨</span>
								</div>
								<div class="subTitle-context">
									<div class="row"></div>
								</div>


								<div class="subTitle-attach">
									<div class="row">
										<div class="col-md-6">
											<span>subject1.txt <i class="fas fa-paperclip"></i></span>
											 <span><i class="fab fa-google-drive"></i></span>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div> -->
				-->




			</div>
			<!-- col end -->
		</div>
		<!--row end -->
	</div>
	<!--container end . -->

</body>
</html>