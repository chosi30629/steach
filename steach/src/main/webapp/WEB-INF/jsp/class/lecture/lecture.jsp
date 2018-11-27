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
<link rel="stylesheet" href="/steach/resources/css/class/lecture/lecture.css"/>
<!-- dateFormat js  -->
<script src="/steach/resources/js/jquery-dateformat.js"></script>
<!-- swAlert.js -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.js"></script>

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
       <!--  <div class="modal fade" id="createModal" tabindex="-1" role="dialog" >
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
            </div>modal end -->

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
                        <button class="create-btn">CREATE</button>
                    </div>
                    
                 <%--    <!-- subject title -->
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
                    </c:forEach> --%>

        			 </div><!-- col end -->
                </div><!--row end -->
                <button id="btn">눌러보삼</button>
            </div><!--container end . -->
       
    
       

    <script>
      	$(function(){
      		list()
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
        		console.log(data);
        		var boardList = data.list.boardList;
        		var subjectList = data.list.subjectList;
     			console.log(boardList)
        		var html= new StringBuffer();
	        		
        			for(let i=0; i < subjectList.length; i++){
	        			html.append("<div class='accordion-head'>");
		        		html.append("<div class='title'>");
		        		html.append("<span class='title-name'>"+subjectList[i].subject+"</span>");
		        		html.append("<div class='menu'>");
		        		html.append("<a href='titlePlus' data-toggle='modal' data-target='#titlePlusModal'>");
		        		html.append("<i class='fas fa-plus'></i></a>&nbsp;&nbsp;&nbsp;&nbsp;");
		        		html.append("<a href='titleElps' data-toggle='modal' data-target='#titleElpsModal'>");
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
				        		
				        		
				        		html.append("<a>"+boardList[j].title+"</a>");
				        		html.append("<div class='menu'>");
				        		html.append("<a href='subElps' data-toggle='modal' data-target='#subElpsModal'>");
				        		html.append("<i class='fas fa-ellipsis-v'></i></a></div></div></div>");
				        		html.append("<div id='collapse"+boardList[j].boardNo+"' roll='tabpanel' class='collapse'>");
				        		html.append("<div class='card-body'>");
				        		html.append("<div class='subTitle-time'>");
				        		html.append("<span>"+$.format.date(boardList[j].regDate, pattern="yyyy-MM-dd HH:mm:ss")+" 작성됨</span></div>");
				        		html.append("<div class='subTitle-context'>");
				        		html.append("<span>"+boardList[j].content+"</span></div>");
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
        
      /*   $("#btn").click(function(){
        	$.ajax({
        		url:"<c:url value='lectureList.do'/>"
        	}).done(function(data){
        		//alert("잘됬어!");
        		console.log(data);
        		var boardList = data.list.boardList;
        		var subjectList = data.list.subjectList;
     			console.log(boardList)
        		var html= new StringBuffer();
	        		
        			for(let i=0; i < subjectList.length; i++){
	        			html.append("<div class='accordion-head'>");
		        		html.append("<div class='title'>");
		        		html.append("<span class='title-name'>"+subjectList[i].subject+"</span>");
		        		html.append("<div class='menu'>");
		        		html.append("<a href='titlePlus' data-toggle='modal' data-target='#titlePlusModal'>");
		        		html.append("<i class='fas fa-plus'></i></a>&nbsp;&nbsp;&nbsp;&nbsp;");
		        		html.append("<a href='titleElps' data-toggle='modal' data-target='#titleElpsModal'>");
		        		html.append("<i class='fas fa-ellipsis-v'></i></a></div></div></div>");
		        		
		        		for(let j=0; j < boardList.length; j++){
		        			if(boardList[j].lecNo == subjectList[i].lecNo){
		        				html.append("<div class='accordion' role='tablist'>");
				        		html.append("<div class='card'>");
				        		html.append("<div class='card-header' role='tab' data-toggle='collapse' ");
				        		html.append("href='#collapse"+boardList[j].boardNo+"' ");
				        		html.append("id='heading"+boardList[j].boardNo+"'>");
				        		html.append("<div class='subTitle'>");
				        		/* 아이콘 변경 */
				        	/*	
				        		switch(parseInt(boardList[j].pNo)){
				        			case 1:html.append("<i class='fas fa-book fa-2x'></i>"); break;
				        			case 2:html.append("<i class='fas fa-edit fa-2x'></i>"); break;
				        			case 3:html.append("<i class='fas fa-video fa-2x'></i>"); break;
				        			case 4:html.append("<i class='fas fa-vote-yea fa-2x'></i>");break;
				        		}
				        		
				        		
				        		html.append("<a>"+boardList[j].title+"</a>");
				        		html.append("<div class='menu'>");
				        		html.append("<a href='subElps' data-toggle='modal' data-target='#subElpsModal'>");
				        		html.append("<i class='fas fa-ellipsis-v'></i></a></div></div></div>");
				        		html.append("<div id='collapse"+boardList[j].boardNo+"' roll='tabpanel' class='collapse in'>");
				        		html.append("<div class='card-body'>");
				        		html.append("<div class='subTitle-time'>");
				        		html.append("<span>"+boardList[j].regDate+" 작성됨</span></div>");
				        		html.append("<div class='subTitle-context'>");
				        		html.append("<span>"+boardList[j].content+"</span></div>");
				        		html.append("<div class='subTitle-attach'>")
				        		html.append("<span><i class='fas fa-paperclip'></i></span>");
				        		html.append("<span><i class='fab fa-google-drive'></i></span>");
				        		html.append("</div></div></div></div></div>");
		        			}
	
		        		}
		        		
		        		
        			}
        			
        			$(".create").after(html.toString());
        		
        	}).fail(function(){
        		alert("안됬어..")
        	})
        	
        })

         */
        
        
        
           /*  $("#createModal >.modal-dialog").css({
                transform:"translateX(-50%)",
                left:"50%",top:"30%"
            }); */

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
                    	  })
            		})
            	})
                    
        });

        
        /* modal 동적 로딩 */
        
        $(document).on("click","a[href='titlePlus']",function(e){
        	$("#titlePlusModal >.modal-dialog").css({
                left:e.clientX,top:e.clientY
            });
        });
        
        $(document).on("click","a[href='subElps']",function(e){
        	$("#subElpsModal >.modal-dialog").css({
                left:e.clientX,top:e.clientY
            });
        });
        
        $(document).on("click","a[href='titleElps']",function(e){
        	$("#titleElpsModal >.modal-dialog").css({
                left:e.clientX,top:e.clientY
            });
        });
        
        
        
    /*     $("a[href='titlePlus']").click(function(e){
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
        }); */

    </script>
</body>
</html>