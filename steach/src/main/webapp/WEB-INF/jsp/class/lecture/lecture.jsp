<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수업 페이지</title>
<!-- header import -->
<c:import url="/WEB-INF/jsp/header/classHeader.jsp" />

<!-- css -->
<link rel="stylesheet"
	href="/steach/resources/css/class/lecture/lecture.css" />
	
	
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
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.js"></script>

</head>
<body>
	<!-- lecture -->



	<!-- form modal 구현해아함!! -->
	<div id="formModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">
						등록하기
					</h4>
				</div>
				<div class="modal-body">
					<form id="bForm" enctype="multipart/form-data" class="form-horizontal">
						<input type="hidden" name="lecNo"/>
						<div class="form-group">
							<label for="inputType" class="col-sm-2 control-label">분류</label>
							<div class="col-sm-10">
								<select id="inputType" name="pNo" class="form-control" style="width:25%">
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
								<input type="text" class="form-control" id="inputTitle" name="title"
									placeholder="예) n일차 수업자료입니다.">
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
								<input type="file" id="localAttachFile" name="attach" style="display: none">
								<input type="file" id="driveAttachFile" style="display: none">
								<i class='fas fa-paperclip' id="localAttach"></i> <i
									class='fab fa-google-drive' id="driveAttach"></i>
							</div>
						</div>

						<!-- 과제 ,투표 -->
						<div id="form-option-deadline" class="form-group" style="display:none">
							<label id="magamText" for="deadlineText" class="col-sm-2 control-label">마감일</label>
							<label id="suupText" for="deadlineText" class="col-sm-2 control-label" style="display:none">수업시간</label>
							<div class="col-sm-10">
								<input type="hidden" name="deadline">
								<div id="deadline"></div>
								<div id="deadlineText" style="display:none"></div>
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
			$("#localAttach").click(function(){
				$("#localAttachFile").click();
			});
			
			$("#driveAttach").click(function(){
				$("#driveAttachFile").click();
			})
		</script>


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<!-- create button -->
				<div class="create">
					<!--data-toggle="modal" data-target="#createModal-->
					<button class="create-btn">CREATE</button>
				</div>

			<%--   <!-- subject title -->
                    <c:forEach var="sb" items="${list.subjectList}">
                    	<div class="accordion-head">
                    		<div class="title">
                    			<span class="title-name">${sb.subject}</span>
                    			<div class="menu">
                    				<a href="titlePlus" data-toggle="modal" data-target="#titlePlusModal">
                    					<i class="fas fa-plus"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
                    					<a href="titleElps" data-toggle="modal" data-target="#titleElpsModal" data-id="titleElps${sb.lecNo}">
                    					<i class="fas fa-ellipsis-v"></i></a>　
                    			</div>
                    		</div><!-- title end -->
                    	</div><!-- acc-head end -->
           	 		
           	 		<!-- board  -->
           	 		<c:forEach var="b" items="${list.boardList}">
           	 			<c:if test="${b.lecNo==sb.lecNo}">
	                    	<div class="accordion" role="tablist">
	                    		<div class="card">
	                    			<div class="card-header" role="tab" data-toggle="collapse" 
	                    				  href="#collapse${b.boardNo}" 
	                    				  id="heading${b.boardNo}">
	                    				 <div class="subTitle">
	                                    	<i class="fas fa-book fa-2x"></i>　
	                    					<a>${b.title}</a>
	                    					<div class="menu">
	                    						<a href="subElps" data-toggle="modal" data-target="#subElpsModal">
	                    							<i class="fas fa-ellipsis-v"></i>
	                    						</a>
	                    					</div>
	                    				</div>
	                    			</div>
	                    			
	                    			<div id="collapse${b.boardNo}" roll="tabpanel" class="collapse in">
	                    				<div class="card-body">
	                    					<div class="subTitle-time">
	                    						<span>${b.regDate} 작성됨</span>
	                    					</div>
	                    					<div class="subTitle-context">
	                    						<span>${b.content}</span>
	                    					</div>
	                    					<div class="subTitle-attach">
			                                    <span><i class="fas fa-paperclip"></i></span>
			                                    <span><i class="fab fa-google-drive"></i></span>
		                                	</div>
	                    				</div>
	                    			</div>
	                    		</div>
                    			</div>
                    		</c:if>
                    	</c:forEach> 
                    </c:forEach>  --%>

			</div>
			<!-- col end -->
		</div>
		<!--row end -->
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
	
		$(function(){
	  		 list();
	  	});
	  	
	  	var lecNo = 0; 
	  	var boardNo=0;
	  /* modal 동적 로딩 */
	    
	    $(document).on("click","a[id='titlePlus']",function(e){
	    	lecNo = $(this).data("lecno");
	    	 $("#bForm").find("input[class='form-control']").val("");
	    	 $("#bForm").find("textarea").val("");
	    });
	    
	  
	    $(document).on("click","a[id='subElps']",function(e){
	    	//console.log($(this).data("boardno"));
	    	boardNo= $(this).data("boardno");
	    	
	    	$("#subElpsModal >.modal-dialog").css({
	            left:e.clientX,top:e.clientY
	        });
	    });

		/* 등록 폼 */
		var deadline=""
		/* date time picker loading */
		$("#deadline").datetimepicker({
			date: new Date(),
			viewMode:'YMDHM',
			onDateChange:function(){
				deadline = this.getValue();
			}
		});
	
		/* date-pick */
	 	$(".ok").click(function(){
			$("#deadlineText").html($.format.date(deadline,pattern="yyyy-MM-dd HH:mm")).toggle();
			$("#deadline").toggle();
		});
		 
		/* date-pick toggle */ 
		$("#deadlineText").click(function(){
			$("#deadline").toggle();
			$("#deadlineText").toggle();
		})
		/* form-option */
		$("#inputType").change(function(){
			switch(parseInt(this.value)){
				case 1: $("#form-option-deadline").css({display:"none"}); break;
				case 2: $("#form-option-deadline").css({display:"block"}); break;
				case 3: $("#form-option-deadline").css({display:"block"}); break;
				case 4: $("#form-option-deadline").css({display:"block"}); break;
			}	
		});
		
		/* insert board */
		$("#formBtn").click(function(){
			/* 넘길 데이터 포멧하기 .. */
			$("input[name='lecNo']").val(lecNo);
			$("input[name='deadline']").val($("#deadlineText").html());
			
			/* textarea */
			//var str = $("textarea[name='content']").val();
			//str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			//$("textarea[name='content']").val(str);
			
			
			var formData = new FormData($("#bForm")[0]);
			
			$.ajax({
				url : "<c:url value='insertLectureBoard.do'/>",
				method : "POST",
				enctype : 'multipart/form-data',
				contentType : false,
				processData : false,
				data : formData
			}).done(function(){
				$(".modal").modal('hide');
				$(".accordion-head").remove();
    			$(".accordion").remove();
    			list();
			}).fail(function(){
				alert(2)
			})

		})
		
		/* board delete */
		function deleteBoard(){
			//alert(boardNo);
			$.ajax({
				url:"<c:url value='deleteLecutreBoard.do'/>",
				data:{"boardNo":boardNo}
			}).done(function(){
				$(".modal").modal('hide');
				$(".accordion-head").remove();
    			$(".accordion").remove();
    			list();
				
				swal({
        			position:'center-center',
        			type:'success',
        			title:'Success!!',
        			showConfirmbutton:false,
        			timer:1500
        		});
			})
		}
	
		function editBoard(){
			//alert(boardNo)
			$(".modal").modal('hide');
			
			//data 넣어주기 .. 
			$.ajax({
				url:"<c:url value='selectLectureBoardByBNo.do'/>",
				data:"boardNo="+boardNo
			}).done(function(data){
				console.log(data);	
				
				
				$("select[name='pNo'] option:eq("+data.pNo+")").prev().attr({"selected":"selected"});
				
				alert($("select[name='pNo'] option:eq("+data.pNo+")").prev().val());
				
				
				
				$("#formModal").modal('show');
			})
			
			
		}
		
		
		
		

      	function editSubject(){
      		//alert("글번호:"+lecNo);
      		/* 해당 글의 주제 가져오기 !! */
      		$(".modal").modal('hide');
      		var subject = $("#subject"+lecNo).html();
      		//alert(subject);
      		swal({
      			title:"주제명 변경",
      			input:"text",
      			inputValue:subject,
      			inputValidator:function(value) {
          		  return !value && '주제를 입력하세요'
          	  	}
          	}).then(function (text) {
        		/* 주제 변경 ajax */
        		var classNo= 1
        		
        		$.ajax({
        			url:"<c:url value='updateSubject.do'/>",
        			data:{"classNo":classNo,"subject":text.value,"lecNo":lecNo}
        		}).done(function(){
        			swal({
                	    type: 'success',
                	    html: text.value +" 주제명이 변경되었습니다."
                	  });
        			$(".accordion-head").remove();
        			$(".accordion").remove();
        			list();
        			
        		})
        	})
      
      		}
      	
      	
      	/* 주제 삭제  */
      	function deleteLecture(){
      		$(".modal").modal('hide');
      		swal({
      		  title: '주제를 삭제하시겠습니까?',
      		  text: "주제명: " + $("#subject"+lecNo).html(),
      		  type: 'warning',
      		  showCancelButton: true,
      		  confirmButtonColor: '#3085d6',
      		  cancelButtonColor: '#d33',
      		  confirmButtonText: 'Yes'
      		}).then( function(result){
     
      		  if (result.value) {
      		    $.ajax({
      		    	url:"<c:url value='deleteLecture.do'/>",
      		    	data:"lecNo="+lecNo
      		    }).done(function(){
      		    	swal(
        		   			'주제가 삭제되었습니다.',
        		   			"",
        		      		'success'
        		   	 );
      		    	$(".accordion-head").remove();
          			$(".accordion").remove();
          			list();  
        			
      		    })
      		  }
      		})		
      	}
      

      	
      	/* 주제명 변경, 삭제 */
        $(document).on("click","a[id='titleElps']",function(e){
        	//console.log($(this).data("lecno"));
        	lecNo=$(this).data("lecno");
        	$("#titleElpsModal >.modal-dialog").css({
                left:e.clientX,top:e.clientY
            });
        });
      	
	
      	
	    /* stringBuffer */
	    var StringBuffer = function() {
		    this.buffer = new Array();
		};
			StringBuffer.prototype.append = function(str) {
			    this.buffer.push(str);
			    return this;
		};
			StringBuffer.prototype.toString = function(){
			    return this.buffer.join("");
		};
		
		
		/* list 만들기 ajax 가즈아!!! */
		function list(){
			$.ajax({
        		url:"<c:url value='lectureList.do'/>"
        	}).done(function(data){
        		//alert("잘됬어!");
        		//console.log(data);
        		var boardList = data.list.boardList;
        		var subjectList = data.list.subjectList;
     			console.log(boardList)
        		var html= new StringBuffer();
	        		
        			for(let i=0; i < subjectList.length; i++){
	        			html.append("<div class='accordion-head'>");
		        		html.append("<div class='title'>");
		        		html.append("<span class='title-name' id='subject"+subjectList[i].lecNo+"'>"+subjectList[i].subject+"</span>");
		        		html.append("<div class='menu'>");
		        		html.append("<a id='titlePlus' data-toggle='modal' data-target='#formModal' data-lecNo='"+subjectList[i].lecNo+"'>");
		        		html.append("<i class='fas fa-plus'></i></a>&nbsp;&nbsp;&nbsp;&nbsp;");
		        		html.append("<a id='titleElps' data-toggle='modal' data-target='#titleElpsModal' data-lecNo='"+subjectList[i].lecNo+"'>");
		        		html.append("<i class='fas fa-ellipsis-v'></i></a></div></div></div>");
		        		
		        		for(let j=0; j < boardList.length; j++){
		        			if(boardList[j].lecNo == subjectList[i].lecNo){
		        				html.append("<div class='accordion' role='tablist'>");
				        		html.append("<div class='card'>");
				        		html.append("<div class='card-header' role='tab' data-toggle='collapse' aria-expanded='false'");
				        		html.append("href='#collapse"+boardList[j].boardNo+"' ");
				        		html.append("id='heading"+boardList[j].boardNo+"'>");
				        		html.append("<div class='subTitle'>");
				        		/* 아이콘 변경 */
				        		switch(parseInt(boardList[j].pNo)){
				        			case 1:html.append("<i class='fas fa-book fa-2x'></i>"); break;
				        			case 2:html.append("<i class='fas fa-edit fa-2x'></i>"); break;
				        			case 3:html.append("<i class='fas fa-video fa-2x'></i>"); break;
				        			case 4:html.append("<i class='fas fa-vote-yea fa-2x'></i>");break;
				        		}//sw end 
				        		
				        		
				        		html.append("&nbsp;&nbsp;<a>"+boardList[j].title+"</a>");
				        		html.append("<div class='menu'>");
				        		html.append("<a id='subElps' data-toggle='modal' data-target='#subElpsModal' data-boardNo='"+boardList[j].boardNo+"'>");
				        		html.append("<i class='fas fa-ellipsis-v'></i></a></div></div></div>");
				        		html.append("<div id='collapse"+boardList[j].boardNo+"' roll='tabpanel' class='collapse'>");
				        		html.append("<div class='card-body'>");
				        		html.append("<div class='subTitle-time'>");
				        		html.append("<span>"+$.format.date(boardList[j].regDate, pattern="yyyy-MM-dd HH:mm:ss")+" 작성됨</span></div>");
				        		html.append("<div class='subTitle-context'>");
				        		html.append("<span style='white-space:pre'>"+boardList[j].content+"</span></div>");
				        		html.append("<div class='subTitle-attach'>")
				        		html.append("<span><i class='fas fa-paperclip'></i></span>");
				        		html.append("<span><i class='fab fa-google-drive'></i></span>");
				        		html.append("</div></div></div></div></div>");
		        			}//if end 
		        		}//inner for end 
        			}//outer for end 
        			
        		$(".create").after(html.toString());
        		
        	}).fail(function(){
        		alert("안됬어..")
        	});
		}
		
		
		 /* eventPropagation 해제 accordion 때문에 !! */
	   	$(document).on("click","a", function(e){
	   		e.stopPropagation();
	   	}); 


        $(".create-btn").click(function(e){
        	var classNo = 1;
            swal({
            	  title: '주제추가',
            	  input: 'text',
            	  inputPlaceholder:"예) Java Programming",
            	  inputValidator:function(value) {
            		  return !value && '주제를 입력하세요'
            	  }
            	}).then(function (text) {
            		/* 주제 만들기 ajax */
            		$.ajax({
            			url:"<c:url value='insertLecture.do'/>",
            			data:{"classNo":classNo,"subject":text.value}
            		}).done(function(){
            			swal({
                    	    type: 'success',
                    	    html: text.value +" 주제가 생성되었습니다."
                    	  });
            			$(".accordion-head").remove();
            			$(".accordion").remove();
            			list();
            		})
            	})
                    
        });

        
  
        
        

    </script>
</body>
</html>