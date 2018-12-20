<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>STEACH</title>
<!-- header import -->
<c:import url="/WEB-INF/jsp/header/classHeader.jsp" />

<!-- vote draggable -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- date-time-picker css -->
<link rel="stylesheet"
	href="/steach/resources/Datetime-Picker-Plugin/dist/jquery.datetimepicker.css" />
<!-- date-time-picker js -->
<script
	src="/steach/resources/Datetime-Picker-Plugin/dist/jquery.datetimepicker.min.js"></script>

<!-- dateFormat js  -->
<script src="/steach/resources/js/jquery-dateformat.js"></script>

<!-- swAlert.js -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.css">
<link rel="stylesheet"
 	href="/steach/resources/css/class/lecture/animate.css"/>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.js"></script>

<!-- css -->
<link rel="stylesheet"
	href="/steach/resources/css/class/lecture/lecture.css" />
	
<!-- file uploader  -->	

<link rel="stylesheet" href="/steach/resources/Customizable-File-Input-Button/fileinput.css"/>
<script src="/steach/resources/Customizable-File-Input-Button/fileinput.js"></script>	
	
<!-- progress bar -->
<script src="/steach/resources/ProgressBar-Plugin/simple-skillbar.js"></script>	
<style>
</style>
</head>
<body>
	<!-- lecture -->
	<div id="formModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">
						<i class="far fa-edit"></i> 등록하기
					</h4>
				</div>
				<div class="modal-body">
					<form id="bForm" enctype="multipart/form-data"
						class="form-horizontal">
						<input type="hidden" name="classNo" value="${clazz.classNo}">
						<input type="hidden" name="lecNo" />
						<div class="form-group">
							<label for="inputType" class="col-sm-2 control-label">분류</label>
							<div class="col-sm-10">
								<select id="inputType" name="pNo" class="form-control"
									style="width: 25%">
									<option value="1">자료</option>
									<option value="2">과제</option>
									<option value="3">보충수업</option>
									<option value="4">투표</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputTitle" class="col-sm-2 control-label">제목</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputTitle"
									name="title" placeholder="제목을 입력해주세요">
							</div>
						</div>
						<div class="form-group">
							<label for="inputContent" class="col-sm-2 control-label">내용</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="inputContent" rows="3"
									style="resize: none" name="content"></textarea>
							</div>
						</div>

						<!-- 자료,과제   -->
						<div id="form-option-file" class="form-group">
							<label for="attachFile" class="col-sm-2 control-label">파일첨부</label>
							<div class="col-sm-10">
								<input type="file" id="localAttachFile" name="attach"
									style="display: none" multiple> <input type="file"
									id="driveAttachFile" style="display: none" multiple>
								<div id="file-icon">
									<i class='fas fa-paperclip' id="localAttach"></i> <i
										class='fab fa-google-drive' id="driveAttach"></i>
								</div>
							</div>
						</div>

						<!-- 투표  -->
						<div id="form-option-vote" class="form-group"
							style="display: none">
							<label for="vote" class="col-sm-2 control-label">투표내용</label>
							<div class="col-sm-10">
								<div class="vote-list sortable"></div>
								<div class="vote-add">
									<a onclick="doAddOption()"><i class="fas fa-plus-circle"></i><span>
											추가하기</span></a>
								</div>
							</div>
						</div>
						<!-- 과제 ,투표 -->
						<div id="form-option-deadline" class="form-group"
							style="display: none">
							<label id="magamText" for="deadlineText"
								class="col-sm-2 control-label">마감일</label> <label id="suupText"
								for="deadlineText" class="col-sm-2 control-label"
								style="display: none">수업시간</label>
							<div class="col-sm-10">
								<input type="hidden" name="deadline">
								<div id="deadline"></div>
								<div id="deadlineText" style="display: none"></div>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button id="formBtn" type="button" class="btn btn-primary">등록하기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<script>
		console.log(new Date());
		$("#localAttach").click(function() {
			$("#localAttachFile").click();
		});

		$("#driveAttach").click(function() {
			$("#driveAttachFile").click();
		})
	</script>


	<div class="container-fluid">
		<div class="row">	<!-- style="border:1px solid red" -->
			<div class="col-md-2"><!-- class alarm"  -->
				<!-- <div class='alarmTitle'>
					<span>곧 마감되는 과제</span>
				</div>
				<div class='alarmContext'>
				</div> -->
			
				
			</div>
			<div class="col-md-8">
				<!-- create button -->
					<div class="create">
						<c:if test="${user.id == clazz.master}">
							<button class="create-btn">CREATE</button>
						</c:if>
					</div>
			 	<!-- subject title -->
			<%-->	<c:forEach var="sb" items="${list.subjectList}">
					<div class="accordion-head">
						<div class="title">
							<span class="title-name">${sb.subject}</span>
							<div class="menu">
								<a href="titlePlus" data-toggle="modal"
									data-target="#titlePlusModal"> <i class="fas fa-plus"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="titleElps" data-toggle="modal"
									data-target="#titleElpsModal" data-id="titleElps${sb.lecNo}">
									<i class="fas fa-ellipsis-v"></i>
								</a>
							</div>
						</div>
						<!-- title end -->
					</div>
					<!-- acc-head end -->

					<!-- board  -->
					<c:forEach var="b" items="${list.boardList}">
						<c:if test="${b.lecNo==sb.lecNo}">
							<div class="accordion" role="tablist">
								<div class="card">
									<div class="card-header" role="tab" data-toggle="collapse"
										href="#collapse${b.boardNo}" id="heading${b.boardNo}">
										<div class="subTitle">
											<i class="fas fa-book fa-2x"></i> <a>${b.title}</a>
											<div class="menu">
												<a href="subElps" data-toggle="modal"
													data-target="#subElpsModal"> <i
													class="fas fa-ellipsis-v"></i>
												</a>
											</div>
										</div>
									</div>

									<div id="collapse${b.boardNo}" roll="tabpanel"
										class="collapse in">
										<div class="card-body">
											<div class="subTitle-time">
												<span>${b.regDate} 작성됨</span>
												<c:if test="${b.pNo eq 2 or b.pNo eq 4}">
													<span style="float:right"> <i class="fas fa-check"></i> ${b.deadline} 까지</span>
												</c:if>
											</div>
											<div class="subTitle-context">


												<div class="row">
													<div class="col-md-8">
														<span>${b.content}</span>
													</div>

													<c:if test="${b.pNo eq 4}">
														<div class="col-md-8">
															<div id="vote${b.boardNo}" class="vote-content">
																<div class='radio'>
																	<label> <input type='radio' name='vt' value=''>닭갈비
																		</label>
																	<div class="progressbar" style="display:none">
																		<span id="option1" class="vote-result-list" data-width="84" data-background="#FFC107">84%</span>
																	</div>
																</div>
																<div class='radio'>
																	<label> <input type='radio' name='vt' value=''>양념통닭
																	</label>
																	<div class="progressbar" style="display:none">
																		<span id="option1" class="vote-result-list" data-width="64" data-background="blue">64%</span>
																	</div>
																</div>
																<div class='radio'>
																	<label> <input type='radio' name='vt' value=''>치즈불닭
																	</label>
																	<div class="progressbar" style="display:none">
																		<span id="option1" class="vote-result-list" data-width="33" data-background="tomato">33%</span>
																	</div>
																</div>
																<div class='radio'>
																	<label> <input type='radio' name='vt' value=''>피자
																	</label>
																	<div class="progressbar" style="display:none">
																		<span id="option1" class="vote-result-list" data-width="26" data-background="red">26%</span>
																	</div>
																</div>

															</div>
															<div class="col-md-8">
																<div class="vote-button">
																	<button class="btn btn-primary" onclick="voteDo(${b.boardNo})">투표하기</button>
																	<button class="btn btn-primary" onclick="voteView(${b.boardNo})">결과보기</button>
																</div>
															</div>
														</div>
													</c:if>
												
													<c:if test="${b.pNo ne 1 and b.pNo ne 3}">
														<div class="count col-md-4">
															<div class="col-md-6">
																<div class="submit-cnt-number">1</div>
																<div class="submit-cnt-text">제출자 수</div>
															</div>
															<div class="col-md-6">
																<div class="total-cnt-number">28</div>
																<div class="total-cnt-text">총 인원수</div>
															</div>
														</div>
													</c:if>
													
												</div>



											</div>
											
											<!-- 업로드 파일 : 자료, 과제, 보충수업  -->
											<c:if test="${b.pNo ne 4}">
												<div class="subTitle-attach">
													<div class="row">
														<div class="col-md-6">
															<span><i class="fas fa-download"></i>　asdklfj.jpg</span>
														</div>
													</div>
												</div>
											</c:if>
											
											<c:if test="${b.pNo eq 1}">
												<div class="subTitle-upload">
													<div class="row">
														<div class="col-md-12">
															<span><i class="fas fa-upload"></i></span>
															<form>
															<input type="file" multiple>
															<div class="upload-button">
															<button class="btn btn-primary">제출하기</button>  
															
															</div>
															</form> 
														</div>
													</div>
												</div>
											</c:if>
											
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach> --%>

			</div>
			<!-- col end -->
		</div>
		<!--row end -->
		
		<div style="margin-top:100px">
		</div>
	</div>
	<!--container end . -->

	<!-- title ellipsis 모달 -->
	<div class="modal fade" id="titleElpsModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<ul class="modal-ul">
						<li><a onclick="editSubject()">주제명 변경</a></li>
						<li><a onclick="deleteLecture()">삭제하기</a></li>
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
						<li><a onclick="editBoard()">수정하기</a></li>
						<li><a onclick="deleteBoard()">삭제하기</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<script>
			
		/* Data loading */
		var classNo = "${clazz.classNo}";
		var master ="${clazz.master}";
		var userId = "${user.id}";
		var lecNo = 0;
		var boardNo = 0;
		var deadline = "";

		/* stringBuffer */
		var StringBuffer = function() {
			this.buffer = new Array();
		};
		StringBuffer.prototype.append = function(str) {
			this.buffer.push(str);
			return this;
		};
		StringBuffer.prototype.toString = function() {
			return this.buffer.join("");
		};

		/* eventPropagation 해제 accordion 때문에 !! */
		$(document).on("click", "a", function(e) {
			e.stopPropagation();
		});

		/* class 번호에 해당 하는 전체 리스트 불러오기 */
		$(function() {
			/* file uploader */
			
			list(); 
			/*vote soartable set */
			$(".sortable").sortable();
			$(".sortable").disableSelection();


		});
		
		

		/* MODAL */

		/* modal 동적 로딩 :: 모달 클릭 시 해당 lecNo,bNo 넣어주기  */
		$(document).on("click", "a[id='titlePlus']", function(e) {
			lecNo = $(this).data("lecno");
			$("#bForm").find("input[class='form-control']").val("");
			$("#bForm").find("textarea").val("");
			$(".vote-list").children().remove();
		});

		$(document).on("click", "a[id='subElps']", function(e) {
			//console.log($(this).data("boardno"));
			boardNo = $(this).data("boardno");
			$("#subElpsModal >.modal-dialog").css({
				left : e.clientX,
				top : e.clientY
			});
		});

		/* 주제명 변경, 삭제 */
		$(document).on("click", "a[id='titleElps']", function(e) {
			//console.log($(this).data("lecno"));
			lecNo = $(this).data("lecno");
			$("#titleElpsModal >.modal-dialog").css({
				left : e.clientX,
				top : e.clientY
			});
		});

		/* list 만들기 ajax 가즈아!!! */
		function list() {
		
			$.ajax({
				url : "<c:url value='lectureList.do'/>",
				data:{classNo:classNo}
			}).done(
				function(data) {
					var boardList = data.list.boardList;
					var subjectList = data.list.subjectList;
					var voteList = data.list.voteList;
					var voteCount = data.list.voteCount; 
					var voteResult = data.list.voteResult;
					var hwCount = data.list.hwCount;
					var fileList = data.list.fileList;
					var alarmList = data.list.alarmList;
					//console.log(fileList);
					var html = new StringBuffer();
					/* 주제  list */
					for (let i = 0; i < subjectList.length; i++) {
						html.append("<div class='accordion-head'>");
						html.append("<div class='title'>");
						html.append("<span class='title-name' id='subject"+subjectList[i].lecNo+"'>"+subjectList[i].subject+"</span>");
						html.append("<div class='menu'>");
						if(master==userId){
							html.append("<a id='titlePlus' data-toggle='modal' data-target='#formModal' data-lecNo='"+subjectList[i].lecNo+"'>");
							html.append("<i class='fas fa-plus'></i></a>&nbsp;&nbsp;&nbsp;&nbsp;");
							html.append("<a id='titleElps' data-toggle='modal' data-target='#titleElpsModal' data-lecNo='"+subjectList[i].lecNo+"'>");
							html.append("<i class='fas fa-ellipsis-v'></i></a>");
						}
						html.append("</div>"); //menu end 
						html.append("</div>"); //title end 
						html.append("</div>"); //acc-head end 

						
						/* board list */
						for (let j = 0; j < boardList.length; j++) {
							if (boardList[j].lecNo == subjectList[i].lecNo) {
								html.append("<div class='accordion' role='tablist'>");
								html.append("<div class='card'>");
								html.append("<div class='card-header' role='tab' data-toggle='collapse' aria-expanded='false'");
								html.append("href='#collapse"+boardList[j].boardNo+"'");
								html.append("id='heading"+boardList[j].boardNo+"'>");
								html.append("<div class='subTitle'>");
								/* 아이콘 변경 */
								switch (parseInt(boardList[j].pNo)) {
								case 1:
									html.append("<i class='fas fa-book fa-2x'></i>");
									break;
								case 2:
									html.append("<i class='fas fa-edit fa-2x'></i>");
									break;
								case 3:
									html.append("<i class='fas fa-video fa-2x'></i>");
									break;
								case 4:
									html.append("<i class='fas fa-vote-yea fa-2x'></i>");
									break;
								}//sw end 

								html.append("&nbsp;&nbsp;<span>"+boardList[j].title+"</span>");
								html.append("<div class='menu'>");
								if(master==userId){
									html.append("<a id='subElps' data-toggle='modal' data-target='#subElpsModal' data-boardNo='"+boardList[j].boardNo+"'>");
									html.append("<i class='fas fa-ellipsis-v'></i></a>");
								}
								html.append("</div>"); // menu end 
								html.append("</div>"); //subtitle end
								html.append("</div>"); //card header end 

								
								html.append("<div id='collapse"+boardList[j].boardNo+"' roll='tabpanel' class='collapse'>");
								html.append("<div class='card-body'>");
								html.append("<div class='subTitle-time'>");
								html.append("<span>"+$.format.date(boardList[j].regDate,pattern = "yyyy-MM-dd HH:mm:ss")+" 작성됨</span>");
								
								/* 마감일 */
								if(boardList[j].pNo == 2 || boardList[j].pNo == 4){
									html.append("<span style='float:right'> <i class='fas fa-check'></i> "+ $.format.date(boardList[j].deadline,pattern="yyyy-MM-dd HH:mm:ss") +" 까지</span>");
								}
								
								html.append("</div>")//subTitle-time end 

								html.append("<div class='subTitle-context'>");
								html.append("<div class='row'>")
								html.append("<div class='col-md-8'>");
								html.append("<span>"+ boardList[j].content+"</span>");
								html.append("</div>");//col-md-8 end 	

								/* vote */
								if(boardList[j].pNo == 4 ){
									html.append("<div class='col-md-8'>");
									html.append("<div class='vote-content'>");
									html.append("<form id='vrForm"+boardList[j].boardNo+"'>");
									
									/* 반복되야 할 부분 */
									for(var v=0; v < voteList.length; v++){
										if(voteList[v].boardNo == boardList[j].boardNo){
											html.append("<div class='radio'>");
											html.append("<label id='vote"+voteList[v].boardNo+"-"+voteList[v].selectNo+"'>");
											html.append("<input type='radio' name='selectedNo' value='"+voteList[v].selectNo+"'");
											
											/* 마감일지났으면  다 disabled */
										 	if(boardList[j].deadline < new Date()){
												html.append("disabled");
											}
											 
										 	else{
												/*투표했으면 selected disabled */
												for(var vr=0;vr <voteResult.length;vr++){
													if(voteResult[vr].id==userId && voteResult[vr].boardNo==voteList[v].boardNo && voteResult[vr].selectedNo == voteList[v].selectNo){
														html.append("checked disabled");
													} else if (voteResult[vr].id==userId && voteResult[vr].boardNo==voteList[v].boardNo && voteResult[vr].selectedNo != voteList[v].selectNo){
														html.append("disabled");	
													} 
												}
										 	}
											
													
											html.append(">"+voteList[v].selectName+"</input>");
										/* 	html.append("<div class='vote-progressbar'>test</div>") */
											html.append("</label>");
											html.append("</div>"); // radio end  
										}//if end
									}	//for end 
									
									html.append("</form>")
									html.append("</div>")// vote-content end 
									html.append("<div class='col-md-8'>");
									html.append("<div class='vote-button'>");
									/* 현재시간이 마감일보다 크면 결과보기 나오게하기   */
									
									if (boardList[j].deadline > new Date()){
										html.append("<button class='btn btn-primary' onclick='voteDo("+boardList[j].boardNo+")'>투표하기</button>　");	
									} else {
										html.append("<button class='btn btn-primary' onclick='voteView("+boardList[j].boardNo+","+boardList[j].memCnt+")'>결과보기</button>");							
									}
									
									html.append("</div>");// vote-button end 
									html.append("</div>");//col-md-8 end 
									html.append("</div>");//outer col-md -8 end 
									
								}
								
								/* 투표 제출자  */
								if(boardList[j].pNo==4){
									html.append("<div class='count col-md-4'>");
									html.append("<div class='col-md-6'>");									
									html.append("<div class='submit-cnt-number'>");
									/* 게시글에 따른 count */
				
								 	for(var vc=0;vc<voteCount.length;vc++){
										if(voteCount[vc].boardNo == boardList[j].boardNo ){
											html.append(voteCount[vc].count );
 										} 
									}
									
									
									
									html.append("</div>");									
									html.append("<div class='submit-cnt-text'>투표 수</div>");									
									html.append("</div>");// col-md-6 end 									
									html.append("<div class='col-md-6'>");
									html.append("<div class='total-cnt-number'>"+boardList[j].memCnt+"</div>");									
									html.append("<div class='total-cnt-text'>총 인원수</div>");	
									html.append("</div>");// col-md-6 end 									
									html.append("</div>");//col-md-4 end 									
								} /* 투표 제출자 END */
								
								
								/*과제 제출자!! */
								if(boardList[j].pNo==2){
									html.append("<div class='count col-md-4'>");
									html.append("<div class='col-md-6'>");									
									html.append("<div class='submit-cnt-number'>");
									/* 게시글에 따른 count */
				
									for(var hc=0;hc<hwCount.length;hc++){
										if(hwCount[hc].boardNo == boardList[j].boardNo ){
											html.append(hwCount[hc].count );
 										} 
									}
									
									html.append("</div>");									
									html.append("<div class='submit-cnt-text'>제출자 수</div>");									
									html.append("</div>");// col-md-6 end 									
									html.append("<div class='col-md-6'>");
									html.append("<div class='total-cnt-number'>"+boardList[j].memCnt+"</div>");									
									html.append("<div class='total-cnt-text'>총 인원수</div>");	
									html.append("</div>");// col-md-6 end 									
									html.append("</div>");//col-md-4 end 									
								}
								
								
								html.append("</div>")//row end
								html.append("</div>")//context end 
					
								
								/* 파일 첨부 */
								if(boardList[j].pNo != 4 ){
																		
									html.append("<div class='subTitle-attach'>");
									html.append("<div class='row'>");
									html.append("<div class='col-md-12'>");
									html.append("<span><i class='fas fa-download'></i></span>");
									for(var f=0;f<fileList.length;f++){
										if(boardList[j].boardNo==fileList[f].boardNo){
										 	html.append("<a href='/local_img/class/${clazz.classNo}_${clazz.className}/"+boardList[j].boardNo+"_"+boardList[j].title+"/"+fileList[f].fileName+"' download>"+fileList[f].fileName+"</a>&nbsp;&nbsp;"); 
										
										}
									}
									html.append("</div>");//col-md-6 end
									html.append("</div>");//row end
									html.append("</div>");//attach end 
									
									
								}
								
								/* 업로드 */
								if(boardList[j].pNo == 2 ) {
									if(boardList[j].deadline > new Date()){
										html.append("<div class='subTitle-upload'>");
										html.append("<div class='row'>");
										html.append("<div class='col-md-12'>");
										html.append("<span><i class='fas fa-upload'></i></span>");
										html.append("<form id='submitForm"+boardList[j].boardNo+"' enctype='multipart/form-data'>");
										html.append("<input type='hidden' name='classNo' value='"+classNo+"'>");
										html.append("<input type='hidden' name='boardNo' value='"+boardList[j].boardNo+"'>");
										html.append("<input type='hidden' name='id' value='"+userId+"'>");
										html.append("<input class='uploader' name='submitFiles' type='file' multiple>");
										html.append("<div class='hwContent'><i class='far fa-comment'></i> <input type='text' class='form-control' name='hwContent' placeholder='제출 시 남길 말을 입력해주세요' autocomplete='off' style='width:80%;display:inline-block;margin-left:10px;'></div>");
										html.append("<div class='upload-button'>"); 
										html.append("<button type='button' class='btn btn-primary' onclick='doSubmit("+boardList[j].boardNo+")'>제출하기</button>");
										html.append("</div>");//uploadbuttn end
										html.append("</form>");
										html.append("</div>");//12 end 
										html.append("</div>");//row end
										html.append("</div>");//upload end
	 								} else {
	 									html.append("<div><span style='color:red'>제출 시간이 종료되었습니다.</span></div>")
	 								}
								}
							
								html.append("</div></div></div></div>");
								
								
								
							}//if end 
						}//inner for end  
					}//outer for end 

						$(".create").after(html.toString());
						
						$('.uploader').fileinput({
							  multipleText: '{0} files',
							  showMultipleNames: true,
							  buttonClass: 'btn btn-danger',
							});
						
						/*alarm list 불러오기 */
						/*
						html= new StringBuffer();
						for(var al=0;al<alarmList.length;al++){
							html+="<p><span>"+$.format.date(alarmList[al].deadline, pattern="yyyy-MM-dd HH:mm:ss")+"까지 </span><br>"
							html+="<span> - </span>"
							html+="<span>"+alarmList[al].title+"</span></p>"
						}
						$(".alarmContext").append(html.toString()); */
						
						
					}).fail(function() {
				alert("list ajax loading fail ")
			});
		} // ajax list

		/* subject */
		/* subject 등록 */

		$(".create-btn").click(function(e) {
		
			swal({
				title : '주제추가',
				input : 'text',
				inputPlaceholder : "예) Java Programming",
				inputValidator : function(value) {
					return !value && '주제를 입력하세요'
				}
			}).then(function(text) {
				/* 주제 만들기 ajax */
				
				$.ajax({
					url : "<c:url value='insertLecture.do'/>",
					data : {
						"classNo" : classNo,
						"subject" : text.value,
						"master":master
					}
				}).done(function() {
					swal({
						type : 'success',
						html : text.value + " 주제가 생성되었습니다."
					});
					$(".accordion-head").remove();
					$(".accordion").remove();
					list();
				})
			})

		});

		/* subject 수정 */
		function editSubject() {
			//alert("글번호:"+lecNo);
			/* 해당 글의 주제 가져오기 !! */
			$(".modal").modal('hide');
			var subject = $("#subject" + lecNo).html();
			//alert(subject);
			swal({
				title : "주제명 변경",
				input : "text",
				inputValue : subject,
				inputValidator : function(value) {
					return !value && '주제를 입력하세요'
				}
			}).then(function(text) {
				/* 주제 변경 ajax */

				$.ajax({
					url : "<c:url value='updateSubject.do'/>",
					data : {
						"classNo" : classNo,
						"subject" : text.value,
						"lecNo" : lecNo
					}
				}).done(function() {
					swal({
						type : 'success',
						html : text.value + " 주제명이 변경되었습니다."
					});
					$(".accordion-head").remove();
					$(".accordion").remove();
					list();

				})
			})

		}

		/* subject 삭제  */
		function deleteLecture() {
			$(".modal").modal('hide');
			swal({
				title : '주제를 삭제하시겠습니까?',
				text : "주제명: " + $("#subject" + lecNo).html(),
				type : 'warning',
				showCancelButton : true,
				confirmButtonColor : '#3085d6',
				cancelButtonColor : '#d33',
				confirmButtonText : 'Yes'
			}).then(function(result) {

				if (result.value) {
					$.ajax({
						url : "<c:url value='deleteLecture.do'/>",
						data : "lecNo=" + lecNo
					}).done(function() {
						swal('주제가 삭제되었습니다.', "", 'success');
						$(".accordion-head").remove();
						$(".accordion").remove();
						list();

					})
				}
			})
		}

		/*  BOARD */
		/* board 등록  */

		/* insert board */
		$("#formBtn").click(function() {
			/* 넘길 데이터 포멧하기 .. */
			var pNo = parseInt($("select[name='pNo']").val());
	
			$("input[name='lecNo']").val(lecNo);
			
			
			/*자료, 보충수업 deadline param 전송 X하기 */
			if(pNo==1 ||pNo==3) $("input[name='deadline']").attr({disabled:"disabled"});	
			
			$("input[name='deadline']").val(deadline);
			/* textarea */
			var str = $("textarea[name='content']").val();
			str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			$("textarea[name='content']").val(str);

			var formData = new FormData($("#bForm")[0]);
			
			$.ajax({
				url : "<c:url value='insertLectureBoard.do'/>",
				method : "POST",
				enctype : 'multipart/form-data',
				contentType : false,
				processData : false,
				data : formData
			}).done(function(boardNo) {
				if(pNo==4){
					//투표시 insert 하기~~ 
					var voteSize = $("input[name='select_name']").length;
					var voteValue = new Array(voteSize);
					var obj = {}; 
					obj.boardNo={};
					obj.selectNo={};
					obj.selectName={};
					for(var i=0; i<voteSize; i++){
						obj.boardNo[i]= boardNo;
						obj.selectNo[i]= i+1;
						/* voteValue[i] = $("input[name='select_name']")[i].value; */
						obj.selectName[i]= $("input[name='select_name']")[i].value;
					}	
			
					$.ajax({
						url:"<c:url value='insertVoteList.do'/>",
						data:obj 
					}).done(function(){
						formEnd();
					}).fail(function(){
					});		
				} else {
					formEnd();		
				}
			}).fail(function() {
			})
		});
		
		function formEnd(){
			$(".modal").modal('hide');
			$(".accordion-head").remove();
			$(".accordion").remove();
			/* ajax 수행 후 deadline 활성화 */
			$("input[name='deadline']").removeAttr("disabled");	
			$("input[type='file']").val("");
			
			list();
		}
		

		/* board delete */
		function deleteBoard() {
			//alert(boardNo);
			$.ajax({
				url : "<c:url value='deleteLecutreBoard.do'/>",
				data : {
					"boardNo" : boardNo
				}
			}).done(function() {
				$(".modal").modal('hide');
				$(".accordion-head").remove();
				$(".accordion").remove();
				list();

				swal({
					position : 'center-center',
					type : 'success',
					title : 'Success!!',
					showConfirmbutton : false,
					timer : 1500
				});
			})
		}

		/* board 수정 */
		function editBoard() {
			//alert(boardNo)
			$(".modal").modal('hide');

			//data 넣어주기 .. 
			$.ajax({
				url : "<c:url value='selectLectureBoardByBNo.do'/>",
				data : {"boardNo":boardNo}
			}).done(
					function(data) {
						console.log(data);
						$("select[name='pNo'] option:eq("+data.pNo+")").prev().attr({
									"selected" : "selected"
						});
						alert($("select[name='pNo'] option:eq("+ data.pNo+")").prev().val());
						$("#formModal").modal('show');
					})

		}

		/* date time picker loading */
		$("#deadline").datetimepicker({
			date : new Date(),
			viewMode : 'YMDHM',
			onDateChange : function() {
				deadline = this.getValue();
			}
		});

		/* date-pick */
		$(".ok").click(
				function() {
					$("#deadlineText").html($.format.date(deadline, pattern = "yyyy-MM-dd HH:mm")).toggle();
					$("#deadline").toggle();
				});

		/* date-pick toggle */
		$("#deadlineText").click(function() {
			$("#deadline").toggle();
			$("#deadlineText").toggle();
		})
		
		
		/* form-option */
		$("#inputType").change(function() {
			switch (parseInt(this.value)) {
			case 1:
				/* 자료 option file */
				$("#form-option-file").css({
					display : "block"
				});
				$("#form-option-deadline, #form-option-vote").css({
					display : "none"
				});
				break;
			case 2:
				/* 과제 option file , deadline */
				$("#form-option-deadline, #form-option-file").css({
					display : "block"
				});
				$("#form-option-vote").css({
					display : "none"
				});
				break;
			case 3:
				/* 보충수업 option file*/
				$("#form-option-file").css({
					display : "block"
				});
				$("#form-option-deadline, #form-option-vote").css({
					display : "none"
				});
				break;
			case 4:
				/* 투표 option vote ,deadline */
				$("#form-option-deadline,#form-option-vote").css({
					display : "block"
				});
				$("#form-option-file").css({
					display : "none"
				});
				break;
			}
		});

		/* VOTE */

		function doAddOption() {
			var html = new StringBuffer();

			html.append("<div class='radio ui-state-default' >");
			html.append("<i class='fas fa-grip-vertical fa'></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")
			html.append("<label>");
			html.append("<input type='radio' disabled>");
			html.append("<input type='text' name='select_name' placeholder='내용을 입력하세요' size='40'/>");
			html.append(" <a><span><i class='fas fa-times'></i></span></a>")
			html.append("</label>");
			html.append("</div>");

			$(".vote-list").append(html.toString());
		}

		/* vote list remove */
		$(document).on("click", ".radio > label > a", function() {
			$(this).parent().parent().remove();
		})
		
		
		/*vote 결과 넘기기 */ 
		function voteDo(boardNo){
			var obj={};
			//alert(boardNo);
			/* 선택번호 */
			var selectedNo = $("#vrForm"+boardNo).serializeArray();
			//console.log(selectedNo[0].value);
			//console.log(userId);
			//console.log(boardNo);
			obj.boardNo=boardNo;
			obj.selectedNo=selectedNo[0].value;
			obj.id=userId;
			$.ajax({
				url:"<c:url value='insertVote.do'/>",
				data:obj
			}).done(function(){
				Swal({
					  title: "투표가 완료되었습니다!",
			 		  animation: false, 
					  customClass: 'animated bounce',
					  position:'center-center',
	        		  type:'success',
	        		  showConfirmbutton:false,
	        		  timer:1500
					});
				$(".accordion-head").remove();
				$(".accordion").remove();
				list();
					
			}).fail(function(){
			})
			
		}
		
		function voteView(boardNo,memCnt){
				
			 $.ajax({
				url:"<c:url value='voteResult.do'/>",
				data:{boardNo:boardNo}
			}).done(function(data){
				console.log(data);
				for(var i =0; i<data.length; i++){
					console.log(data[i].count)
					var html="";
					html="<div class='vote-progressbar' data-width='";
			 		html+=((data[i].count == 0 ? 1 : data[i].count/memCnt*100));
			 		html+="'>"+data[i].count+"명</div>";
					$("#vote"+boardNo+"-"+(i+1)).after(html);					
				}//for end 
				$('.vote-progressbar').simpleSkillbar({
					height:20
				});			
			}); 
			
		}
		
		
		function doSubmit(boardNo){
			var formData = new FormData($("#submitForm"+boardNo)[0]);
			
			$.ajax({
				url:"<c:url value='doSubmitHomework.do'/>",
				method : "POST",
				enctype : 'multipart/form-data',
				contentType : false,
				processData : false,
				data : formData
			}).done(function(data){
				if(data=="empty") alert("파일이 없습니다.");
				
				Swal({
					  title: "과제 제출이 완료되었습니다!",
			 		  animation: false, 
					  customClass: 'animated bounce',
					  position:'center-center',
	        		  type:'success',
	        		  showConfirmbutton:false,
	        		  timer:1500
					});
				$(".accordion-head").remove();
				$(".accordion").remove();
				list();
				
				
				
			}).fail(function(){
			})
  

		}
		
	</script>
</body>
</html>