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
<!-- main css -->
<link href="/steach/resources/css/class/curriculum/curriculum.css"
	rel="stylesheet" />

<!-- fullcalendar -->
<link href='/steach/resources/fullcalendar-3.9.0/fullcalendar.css'
	rel='stylesheet' />
<link href='/steach/resources/fullcalendar-3.9.0/fullcalendar.print.css'
	rel='stylesheet' media='print' />
<script src="/steach/resources/fullcalendar-3.9.0/lib/moment.min.js"></script>
<script src="/steach/resources/fullcalendar-3.9.0/fullcalendar.min.js"></script>
<script src="/steach/resources/fullcalendar-3.9.0/locale-all.js"></script>

<!-- swAlert.js -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.css"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.js"></script>

</head>

<body>

	<!-- calendar modal  -->
	<div id="formModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">
						<i class="far fa-edit"></i>&nbsp;&nbsp;일정 등록하기
					</h4>
				</div>
				<div class="modal-body">
					<form id="sForm" class="form-horizontal">
						<input type="hidden" name="classNo" value="${clazz.classNo}" />
						<div class="form-group">
							<label for="inputTitle" class="col-sm-2 control-label">제목</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputTitle"
									name="title" placeholder="예) 1주차 Java Programming "
									autocomplete="off" required>
							</div>
						</div>
						<div class="form-group">
							<label for="inputDescription" class="col-sm-2 control-label">설명</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputDescription"
									name="description" placeholder="예) 수업교재 : 이것이 자바다 1권  - 신용권 "
									autocomplete="off" />
							</div>
						</div>

						<div class="form-group">
							<label for="inputColor" class="col-sm-2 control-label">색상</label>
							<div class="col-sm-10">
								<select id="inputColor" name="color" class="form-control"
									style="width: 50%; color: red">
									<option value="#ff0000">■ red</option>
									<option value="#ff6347">■ tomato</option>
									<option value="#fa8072">■ salmon</option>
									<option value="#ffa500">■ orange</option>
									<option value="#ffff00">■ yellow</option>
									<option value="#00ff00">■ lime</option>
									<option value="#008000">■ green</option>
									<option value="#006400">■ darkgreen</option>
									<option value="#00ff7f">■ springgreen</option>
									<option value="#008080">■ teal</option>
									<option value="#00ffff">■ acua</option>
									<option value="#87ceeb">■ skyblue</option>
									<option value="#0000ff">■ blue</option>
									<option value="#00008b">■ darkblue</option>
									<option value="#000080">■ navy</option>
									<option value="#808080">■ gray</option>
									<option value="#000000">■ black</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="displayStart" class="col-sm-2 control-label">시작일</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="displayStart"
									name="start" placeholder="" readonly style="width: 50%" />
							</div>
						</div>

						<div class="form-group">
							<label for="displayEnd" class="col-sm-2 control-label">종료일</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="displayEnd"
									name="end" placeholder="" readonly style="width: 50%" />
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

	<script>
		/* color 선택 modal 색 적용하기 */
		$(function(){
			for(let i=0;i<$("#inputColor > option").length; i++){
				$("#inputColor > option:eq("+i+")").css({color:$("#inputColor > option:eq("+i+")").val()});
			}		
			
		});
		
		/* 색상 변경 시 color 적용하기 */
		$("#inputColor").on("change",function(){
			$("#inputColor").css({color:$("#inputColor option:selected").val()});
		});
	</script>


	<div class="container-fluid">
		<div class="row">
			<!-- bg -->
			<div class="bg-section"
			<c:if test="${clazz.bgName ne null}">
				style="background:url('/steach/resources/images/class/curriculum/bg/${clazz.bgName}'); background-size:cover;"
			</c:if>
			>
				<div class="bg-subTitle">
					<h1>${clazz.className}</h1>
					<h3>${clazz.classSubname}</h3>
				</div>
				<div class="bg-button" style="display:none">
				    <nav>
				        <ul class="bg-nav">
				          <li><a id="prev"><i class="fas fa-chevron-left"></i></a></li>
				          <li><a id="lock"><i class="fas fa-lock"></i></a></li>
				          <li><a id="next"><i class="fas fa-chevron-right"></i></a></li>
				        </ul>
				    </nav>
				</div>
			</div>
			

			<div class="col-md-8 col-md-offset-2">
				<div class="accordion" role="tablist">
					<!-- calendar -->
					<div class="card">
						<div class="card-header" role="tab" id="headingOne" data-toggle="collapse" href="#collapseOne">
							<div class="title" >
								<a >수업계획표</a>
							</div>
						</div>

						<div id="collapseOne" role="tabpanel" class="collapse in">
							<div class="card-body">
								<div id="calendar"></div>
								<div class="calendar-setting"></div>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-header" role="tab" id="headingTwo" data-toggle="collapse" href="#collapseTwo">
							<div class="title">
								<a >자리배치도</a>
							</div>
						</div>

						<div id="collapseTwo" role="tabpanel" class="collapse in">
							<div class="card-body">
								<!-- seat-->
								<div class="seat-section" 
									<c:choose>
										<c:when test="${clazz.seatName eq null}">
										style="background:url('/steach/resources/images/class/curriculum/empty-classroom.jpg'); background-size:cover;"
										</c:when>
										<c:otherwise>
										style="background:url('/local_img/class/${clazz.classNo}_${clazz.className}/seat.png');background-size:cover;"
										</c:otherwise>
									</c:choose>
								></div>
								<c:if test="${clazz.master == user.id }">
								<div class="seat-setting">
									<button type="button" class="btn btn-primary"
										onclick="javascript:location.href='<c:url value="/class/curriculum/seat.do?classNo=${clazz.classNo}"/>'">수정하기</button>
								</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>


			</div>

		</div>
	</div>

	<script>
 		
	var i = 1;
	var classNo="${clazz.classNo}";
	var master ="${clazz.master}";
	var user ="${user.id}";
	/*bg button event */
	
	if(master==id){
	    $(".bg-section").mouseenter(function(){
	    	$(".bg-button").css({display:"block"});
	    });
		   
	     $(".bg-section").mouseleave(function(){
	    	$(".bg-button").css({display:"none"});
	    });
	}
     
  
    $("#prev").click(function(){
        if(i>1){
            i--;
            $(".bg-section").css({
                "background":"url(/steach/resources/images/class/curriculum/bg/back"+i+".jpg)",
            	"background-size":"cover","-webkit-transition":"background 0.5s"
            });
        }
    });
    
    $("#next").click(function(){
        if(i<14){ 
            i++;
            $(".bg-section").css({
                "background":"url(/steach/resources/images/class/curriculum/bg/back"+i+".jpg)",
                "background-size":"cover","-webkit-transition":"background 0.5s"
            });
        }
    });

    $("#lock").click(function(){
    	//배경 파일 가져오기 
    	
    	//console.log($(".bg-section").css('background-image'))
    	
    	
    	var bgName = $(".bg-section").css('background-image');
    		// --> url("http://localhost:8002/steach/resources/images/class/curriculum/bg/back1.jpg")
		//console.log(bgName);
    	//url(" ") 제거 
    	bgName= bgName.replace('url("',"").replace('")',"");
    	//console.log("replaceBGNAME"+bgName);
    	
    	//마지막/기준으로 파일명 가져오기 
    	var index = bgName.lastIndexOf("/");
    	bgName = bgName.substring(index+1,bgName.length);
		
    	//console.log(bgName);
    	//console.log(classNo);
    	
    	
    	 $.ajax({
    		url:"<c:url value='updateBG.do'/>",
    		data:"classNo="+classNo+"&bgName="+bgName
    	}).done(function(){
    		swal({
    			position:'center-center',
    			type:'success',
    			title:'배너가 저장되었습니다.',
    			showConfirmbutton:false,
    			timer:1500
    		});
    	}).fail(function(){
    		alert(2)
    	}) 
    	
    });
    
    
	 	
      /* full Calendar */
      var cal = "";
	  var eventArray = [];
      var initialLocaleCode = 'ko';
	
		  /* schedule list 불러오기  */
			$(function(){
				 $.ajax({
					  url:"<c:url value='selectSchbyCNo.do'/>",
					 data:"classNo="+${clazz.classNo}
				  }).done(function(data){
					  //console.log(data);
					  for(var i=0; i<data.length;i++){
					  	eventArray.push(data[i]);
					  }
					  calendar(); 
	
				  });
				 
			});

     
        $("#formBtn").click(function(e){
        	obj={};
        	var formData =  $("#sForm").serializeArray();

			//console.dir(formData);
        	obj.classNo=formData[0].value;
			obj.title = formData[1].value;
        	obj.description = formData[2].value;
        	obj.color= formData[3].value;
        	obj.start= formData[4].value;
        	obj.end=formData[5].value;
        	
         	if(obj.start.length>10){
        		obj.allDay="false";
        	} else {
        		obj.allDay="true"
        	}    
         	
        	
             $.ajax({
           			 url:"<c:url value='insertSchedule.do'/>",
         	 		 data:obj
            }).done(function(id){
            	//alert(1)
          		$("#formModal").modal('hide');
          		$("#sForm").find("input[type='text']").val(""); 
         		obj.id=id;
         		$("#calendar").fullCalendar('renderEvent',obj);
           }).fail(function(){
         	 	alert("안됬다...ㅠ")
           })
    		 
        	
        })//btn end ;

        /* context menu disable*/
        $('#calendar:not(".fc-event")').on('contextmenu', function (e) {
            e.preventDefault()
        })    
        
 	function calendar(){

            /* 사용자 여부 check */
            
 			var isBool = false; 
 			if(master==user) isBool= true;
 				
 			cal = $('#calendar').fullCalendar({
	            header: {
	              left: 'prev,next today',
	              center: 'title',
	              right: 'month,agendaWeek,listMonth'
	            },  
	            navLinks: true, // can click day/week names to navigate views
	            locale: initialLocaleCode,
	            editable: isBool,
	            eventLimit: true, // allow "more" link when too many events
	            selectable:isBool, //강사 학생구분 
	       		/* event 등록하기 */ 
	            select:function(start,end,jsEvent,view){
	            	//console.log(jsEvent);
            	var obj={};
                $("input[name='start']").val(start.format());
                $("input[name='end']").val(end.format());
                $("#formModal").modal('show');
	            },
	            events: 
	            	 function(start,end,timezone,callback){
	            		callback(eventArray); 
	            	
	            },
	            /* description 가져오기 */
	            eventRender: function (event, element, view) {
	                element.find('.fc-title').append('<div class="hr-line-solid-no-margin"></div><span style="font-size: 10px">'+event.description+'</span></div>');
	            	
	                /*double click delete*/
	                element.bind('dblclick', function() {
	                	swal({
	 	            	   title: '일정을 삭제하시겠습니까?',
	 	            	   text: "이벤트 제목 :"+event.title,
	 	            	   type: 'warning',
	 	            	   showCancelButton: true,
	 	            	   confirmButtonColor: '#3085d6',
	 	            	   cancelButtonColor: '#d33',
	 	            	   confirmButtonText: 'Yes'
	 	            	 })
	 	            	 .then((result) => {
	 	            	   if (result.value) {
	 	            		   $.ajax({
	 		            		   url:"<c:url value='deleteSchedule.do'/>",
	 		            		   data:"id="+event.id
	 		            	   }).done(function(){
	 		            		   swal(
	 		    	            	       'Deleted!',
	 		    	            	       'Your file has been deleted.',
	 		    	            	       'success'
	 		    	            	     );
	 		            		   $("#calendar").fullCalendar('removeEvents',event._id);   
	 		            	   }).fail(function(){
	 		            		  // alert("err");
	 		            	   })//ajax end 
	 	            	   }//if end 
	 	            	 })
	                 });
	            },
	            /* click 삭제하기 */
	            eventClick: function(event){  
	             /*   swal({
	            	   title: '일정을 삭제하시겠습니까?',
	            	   text: "이벤트 제목 :"+event.title,
	            	   type: 'warning',
	            	   showCancelButton: true,
	            	   confirmButtonColor: '#3085d6',
	            	   cancelButtonColor: '#d33',
	            	   confirmButtonText: 'Yes'
	            	 })
	            	 .then((result) => {
	            	   if (result.value) {
	            		   $.ajax({
		            		   url:"<c:url value='deleteSchedule.do'/>",
		            		   data:"id="+event.id
		            	   }).done(function(){
		            		   swal(
		    	            	       'Deleted!',
		    	            	       'Your file has been deleted.',
		    	            	       'success'
		    	            	     );
		            		   $("#calendar").fullCalendar('removeEvents',event._id);   
		            	   }).fail(function(){
		            		   alert("err");
		            	   })//ajax end 
	            	   }//if end 
	            	 })//then end  */

	               
	            },
	            /* drag event 변경하기 */
	            eventDrop:function(event){
	            	$.ajax({
	            		url:"<c:url value='updateScheduleDate.do'/>",
	            		data:{start:event.start.format(),end:event.end.format(),id:event.id}
	            	}).done(function(){
	            	}).fail(function(){
	            		alert("err")
	            	})
	            },
	        	/* resize event */
	            eventResize: function( event, delta, revertFunc, jsEvent, ui, view ) {
	            	 //console.log(event.end.format())
					 //console.log(event.end)
	                // startDateOnStop = event.start.format();
	                 //endDateOnStop = event.end.format();
					$.ajax({
	            		url:"<c:url value='updateScheduleDate.do'/>",
	            		data:{start:event.start.format(),end:event.end.format(),id:event.id}
	            	}).done(function(){
	            	}).fail(function(){
	            		//alert("err")
	            	})

	            }
	          }
	          
	          );
	      
	        };
        
    </script>
</body>
</html>