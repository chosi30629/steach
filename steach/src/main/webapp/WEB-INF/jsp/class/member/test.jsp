<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/steach/resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
.vote-add {
	margin-top: 20px; display : inline;
	float: right;
	display: inline;
}

input[type='text'] {
	border: none;
	/* border-bottom: 1px solid purple; */
}

.radio input[type="text"]:focus {
	border: none;
	border-bottom: 1px solid purple;
}

textarea:focus, input:focus {
	outline: none;
}

.fa-grip-vertical{
	color:grey;
}
.fa-grip-vertical:hover{
	color:pink;
}
</style>
</head>
<body>
					<form id="bForm" action="aaa.do" enctype="multipart/form-data"
						class="form-horizontal">
	<div id="formModal" class="">
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
									name="title" placeholder="예) n일차 수업자료입니다.">
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
									style="display: none"> <input type="file"
									id="driveAttachFile" style="display: none"> <i
									class='fas fa-paperclip' id="localAttach"></i> <i
									class='fab fa-google-drive' id="driveAttach"></i>
							</div>
						</div>

						<!-- 투표  -->
						<div id="form-option-vote" class="form-group">
							<label for="vote" class="col-sm-2 control-label">투표내용</label>

								<div class="col-sm-10">
									<div class="vote-list sortable"></div>
									<div class="vote-add">
										<a onclick="doAddOption()"><i class="fas fa-plus-circle"></i>
											<span>추가하기</span></a>
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



				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button id="formBtn" type="submit" class="btn btn-primary">등록하기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
					</form>
	<!-- /.modal -->

	<script>
		var index = 0; 
		
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


		function doAddOption(){

			index++; 
			var html = new StringBuffer();
	
			html.append("<div class='radio ui-state-default' >");
			html.append("<i class='fas fa-grip-vertical fa'></i>&nbsp;")
			html.append("<label>");
			html.append("<input type='radio' disabled>");
			html.append("<input type='text' name='select_name' placeholder='내용을 입력하세요' size='48'/>");
			html.append(" <a data-id='"+index+"'><span><i class='fas fa-times'></i></span></a>")
			html.append("</label>");
			html.append("</div>");
		 
			$(".vote-list").append(html.toString());
			
		    $( ".sortable" ).sortable();
		    $( ".sortable" ).disableSelection();
		}
		
/* 		
		$("a").click(function(){
			alert($(this).data("id"));
		})
 */		
		$(document).on("click","label > a",function(){
			//alert($(this).data("id"));
			var index = $(this).data("id");
			
			$(this).parent().parent().remove();
		})
		
		
		  $( function() {
		    $( ".sortable" ).sortable();
		    $( ".sortable" ).disableSelection();
		  } );
	</script>
</body>
</html>