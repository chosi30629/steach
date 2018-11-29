<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>curriculum</title>


<!-- header import -->
<c:import url="/WEB-INF/jsp/header/classHeader.jsp" />

<!-- css -->

<link href="/steach/resources/css/class/curriculum/curriculum.css" rel="stylesheet"/>
<!-- <link rel="stylesheet" href="/steach/resources/scrollbarPlugin/jquery.mCustomScrollbar.css" />
<script src="/steach/resources/scrollbarPlugin/jquery.mCustomScrollbar.concat.min.js"></script> -->


<!-- fullcalendar -->	
<link href='/steach/resources/fullcalendar-3.9.0/fullcalendar.css' rel='stylesheet' />
<link href='/steach/resources/fullcalendar-3.9.0/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src="/steach/resources/fullcalendar-3.9.0/lib/moment.min.js"></script>	
<script src="/steach/resources/fullcalendar-3.9.0/fullcalendar.min.js"></script>	
<script src="/steach/resources/fullcalendar-3.9.0/locale-all.js"></script>	

	<script src="/steach/resources/js/jquery-dateformat.js"></script>


<!-- <script src="/steach/resources/fullcalendar-3.9.0/demos/test.js"></script> -->



</head>
<!-- style= "height: 100vh; overflow: hidden;" -->
<body >

	<div id="a" class="container-fluid">
		<div class="row">
			<!-- bg -->
			<div class="bg-section"></div>
			<div class="bg-button">
				<button id="prev" type="button" class="btn"><</button>
				<button id="next" type="button" class="btn">></button>

			</div>

			<div class="col-md-8 col-md-offset-2">

				<div class="accordion" role="tablist">
					<!-- calendar -->
					<div class="card">
						<div class="card-header" role="tab" id="headingOne">
							<div class="title">
								<a data-toggle="collapse" href="#collapseOne">수업계획표</a>
							</div>
						</div>

						<div id="collapseOne" role="tabpanel" class="collapse in">
							<div class="card-body">
								<div id="calendar"></div>
								<div class="calendar-setting">
									<button type="button" class="btn">저장</button>
									<button type="button" class="btn">초기화</button>
								</div>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-header" role="tab" id="headingTwo">
							<div class="title">
								<a data-toggle="collapse" href="#collapseTwo">자리배치도</a>
							</div>
						</div>

						<div id="collapseTwo" role="tabpanel" class="collapse in">
							<div class="card-body">
								<!-- seat-->
								<div class="seat-section">
							
								</div>
								<div class="seat-setting">
									<button type="button" class="btn" onclick="javascript:location.href='<c:url value="/class/curriculum/seat.do"/>'">수정하기</button> 
								</div>
							</div>
						</div>
					</div>
				</div>
    
 
			</div>

		</div>
	</div>

	  <script>
	  
	/*   $(function(){
	  		$("body").mCustomScrollbar({theme:"rounded-dark"});
	  }) */
	
	  

      /* full Calendar */
      var cal = "";
	  var eventArray = [];
      var initialLocaleCode = 'ko';
	
		  /* schedule list 불러오기  */
			$(function(){
				 $.ajax({
					  url:"<c:url value='selectSchbyCNo.do?classNo=1'/>"
				  }).done(function(data){
					  console.log(data);
					  for(var i=0; i<data.length;i++){
					  	eventArray.push(data[i]);
					  }
					  calendar();
				  });
				
			})
	  
			function calendarList(){
				 $.ajax({
					  url:"<c:url value='selectSchbyCNo.do?classNo=1'/>"
				  }).done(function(data){
					  console.log(data);
					  for(var i=0; i<data.length;i++){
					  	eventArray.push(data[i]);
					  }
					 	
				  });
		 	 }
			
			
			

        /*bg */
        var i =1; 
        $("#prev").click(function(){
            if(i>1){
                i--;
                $(".bg-section").css({
                    "background":"url(/steach/resources/images/class/curriculum/bg"+i+".jpg)"
                });
            }
        });
        $("#next").click(function(){
            if(i<9){
                i++;
                $(".bg-section").css({
                    "background":"url(/steach/resources/images/class/curriculum/bg"+i+".jpg)"
                });
            }
        });
		


 
        
        
   		function calendar(){
 			//console.log(eventArray);
            
 			cal = $('#calendar').fullCalendar(
            
          {
            header: {
              left: 'prev,next today',
              center: 'title',
              right: 'month,agendaWeek,listMonth'
            },         
            navLinks: true, // can click day/week names to navigate views
      		eventColor:'#043E3F',
           // weekNumbers: true,
            //weekNumbersWithinDays: true,
            //weekNumberCalculation: 'ISO',
            locale: initialLocaleCode,
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            selectable:true,
       		/* event 등록하기 */ 
            select:function(start,end,jsEvent,view){
            	console.log(jsEvent);
                var obj={};
                var title = prompt("제목 입력하세요");
                var description = prompt("내용을 입력하세요");
                if(title){
                  obj.title = title;
                  obj.description = description;
                  obj.start = start.format();
                  obj.end = end.format();                  
				
                  if(obj.start.length>10){
                	  obj.allDay="false";
                  } else{
                	  obj.allDay="true";
                  }
        
                 /* 등록했을 경우!!  */
                 /*  */
                 $.ajax({
                  	 url:"<c:url value='insertSchedule.do'/>",
                	 data:obj
                 }).done(function(id){
                	// alert(id);
                	obj.id=id;
                	$("#calendar").fullCalendar('renderEvent',obj);
                 }).fail(function(){
                	 alert("안됬다...ㅠ")
                 })
                 
               
                }
	
            },
            events: 
            	 function(start,end,timezone,callback){
            		callback(eventArray); 
            	
            },
            /* description 가져오기 */
            eventRender: function (event, element, view) {
                element.find('.fc-title').append('<div class="hr-line-solid-no-margin"></div><span style="font-size: 10px">'+event.description+'</span></div>');
            },
            eventClick: function(event){
              // console.dir(event);
               var result = confirm("삭제하시겠습니까?");
               if(result){ 
            	   
            	   $.ajax({
            		   url:"<c:url value='deleteSchedule.do'/>",
            		   data:"id="+event.id
            	   }).done(function(){
            			alert("삭제됨");
            	   }).fail(function(){
            		   alert("삭제안됬죵..")
            	   });
                //화면에서제거
                $("#calendar").fullCalendar('removeEvents',event._id);
               }
               
            },
            eventDrop:function(event){
            	console.dir(event);
            	//console.dir(event.start.format());
            	//console.dir(event.end.format());
            	$.ajax({
            		url:"<c:url value='updateScheduleDate.do'/>",
            		data:{start:event.start.format(),end:event.end.format(),id:event.id}
            	}).done(function(){
            	}).fail(function(){
            		alert("안됬습니다..")
            	})
            },
            eventResizeStop:function(event){
            	console.dir(event);
            }

          }
          
          );
      
        };
        
    </script>
</body>
</html>