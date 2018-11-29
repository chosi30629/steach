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
<link rel="stylesheet" href="/steach/resources/scrollbarPlugin/jquery.mCustomScrollbar.css" />
<script src="/steach/resources/scrollbarPlugin/jquery.mCustomScrollbar.concat.min.js"></script>


<!-- fullcalendar -->	
<link href='/steach/resources/fullcalendar-3.9.0/fullcalendar.css' rel='stylesheet' />
<link href='/steach/resources/fullcalendar-3.9.0/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src="/steach/resources/fullcalendar-3.9.0/lib/moment.min.js"></script>	
<script src="/steach/resources/fullcalendar-3.9.0/fullcalendar.min.js"></script>	
<script src="/steach/resources/fullcalendar-3.9.0/locale-all.js"></script>	
<script src="/steach/resources/fullcalendar-3.9.0/demos/test.js"></script>


</head>

<body style= "height: 100vh; overflow: hidden;">

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
	  
	  $(function(){
	  		$("body").mCustomScrollbar({theme:"rounded-dark"});
	  })
	  
	  
        /*  header js */
        $('ul.nav li.dropdown').hover(function() {
            $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeIn(200);
        }, function() {
            $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeOut(200);
        });

        /*bg */
        var i =1; 
        $("#prev").click(function(){
            if(i>1){
                i--;
                $(".bg-section").css({
                    "background":"url(/steach/resources/images/class/curriculum/bg"+i+".jpg)"
                });
            }
        })
        $("#next").click(function(){
            if(i<9){
                i++;
                $(".bg-section").css({
                    "background":"url(/steach/resources/images/class/curriculum/bg"+i+".jpg)"
                });
            }
        })



        /* accordion */
        $('.collapse').collapse();

        /* full Calendar */
        var cal = "";
        var initialLocaleCode = 'ko';
        $(document).ready(function() {
            console.log(eventArray);

            cal = $('#calendar').fullCalendar(
              
          {
            header: {
              left: 'prev,next today',
              center: 'title',
              right: 'month,agendaWeek,listMonth'
            },
            defaultDate: '2018-11-15',
            navLinks: true, // can click day/week names to navigate views
      
           // weekNumbers: true,
            weekNumbersWithinDays: true,
            weekNumberCalculation: 'ISO',
            locale: initialLocaleCode,
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            selectable:true,
            select:function(start,end,jsEvent,view){
                var obj={};
                var title = prompt("제목 입력하세요");
                if(title){
                  obj.title = title;
                  obj.start = start;
                  obj.end = end;
                  eventArray.push(obj);
                }

                $("#calendar").fullCalendar('renderEvent',obj);
                console.log(eventArray)
                //console.log(eventArray.length)
                console.log(eventArray[eventArray.length-1].start._d);
                var m = eventArray[eventArray.length-1].start._d;
                console.log(m);
            },
            events: function(start,end,timezone,callback){
                callback(eventArray);
            },

            eventClick: function(event){
               var result = confirm("삭제하시겠습니까?");
               if(result){
              //eventArray에서 제거 
                const itemToFind = eventArray.find(function(item) {return item.title === event.title})
                const idx = eventArray.indexOf(itemToFind) 
                if (idx > -1) eventArray.splice(idx, 1);
                console.log(eventArray);
                
                //화면에서제거
                $("#calendar").fullCalendar('removeEvents',event._id);
               }
               
            },

          }
          
          );
      
        });
        
    </script>
</body>
</html>