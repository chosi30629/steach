<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Homework</title>
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
											 <span class="homework-deadline"><i class="fas fa-check"></i>  <fmt:formatDate value='${board.deadline}' pattern='yyyy-MM-dd HH:mm:ss'/> 까지</span>
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
															<div class="user-pic" style='background:url("${j.user.profilePath}"); background-size:cover; background-position:center center'></div> 
															<div class="user-name">
																<a href="#"><span>${j.user.name}</span></a>
																<span><i class="far fa-comment"></i> ${j.hwContent}</span>
																
															</div>
															<div class="user-file">
																<span style="margin-right:40px;"><i class="far fa-clock"></i> <fmt:formatDate value='${j.regDate}' pattern='yyyy-MM-dd HH:mm:ss'/></span>
																<c:forEach var="f" items="${fileList}">
																	<c:if test="${j.hwNo==f.hwNo}">
																	<a title='${f.fileName}' href='/local_img/class/${clazz.classNo}_${clazz.className}/${board.boardNo}_${board.title}/homework/${f.id}/${f.fileName}' download ><span><i class="fas fa-paperclip"></i></span></a>
																	</c:if>
																</c:forEach>
															</div>
														</div>
													</c:if>
												</c:forEach>

											</div>
											<!--  unsubmit. -->
											<div class="unsubmit-section">
												<span>미제출자</span> <span>${board.memCnt-board.count}</span> <span>/</span>
												<span>${board.memCnt}</span>
												<div class="unsubmit-list">

													<table>
														<c:forEach var="j" items="${board.homework}"
															varStatus="trCnt">
															<c:if test="${board.boardNo!=j.boardNo}">

																<c:if test="${trCnt.first or trCnt.count%6 == 1}">
																	<tr>
																</c:if>
																<td>
																	<div class="user-info">
																		<div class="user-pic" style='background:url("${j.user.profilePath}"); background-size:cover; background-position:center center'></div>
																		<div class="user-name">
																			<a href="#"><span>${j.user.name}</span></a>
																		</div>
																	</div>
																</td>
																<c:if test="${trCnt.last or trCnt.count%6 == 0}">
																	</tr>
																</c:if>
															</c:if>
														</c:forEach>

													</table>

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


				<!-- col end -->
			</div>
			<!--row end -->
		</div>
		<!--container end . -->
	</div>
</body>

</html>