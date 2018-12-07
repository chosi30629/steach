<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Class MainPage</title>




<!-- header import -->
<c:import url="/WEB-INF/jsp/header/classHeader.jsp" />

<!-- css -->

<link href="/steach/resources/css/class/attend/attend.css" rel="stylesheet" />

<!-- swAlert.js -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.js"></script>
<script src="/steach/resources/js/jquery-dateformat.js"></script>

</head>
<!-- style= "height: 100vh; overflow: hidden;" -->
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="accordion" role="tablist">
					<div class="card">
						<div class="card-header" role="tab" id="headingOne">
							<div class="title">
								<a data-toggle="collapse" href="#collapseOne">출결현황</a>
							</div>
						</div>
						<div id="collapseOne" role="tabpanel" class="collapse in">
							<div class="card-body">
								<div id="kCalendar"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<!-- Modal -->
<div class="modal fade" id="dailyattend" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="dailyattTitle"></h4>
      </div>
      <div class="modal-body" id="dailyattContent">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

	<script>
	var id = "${user.id}";
// 	console.log(id)
	var masterid = "${clazz.master}"
	console.log(master)
	var teacherlist = "${teacherAttend}"
// 	console.log(teacherlist)

	function kCalendar(id, date) {
        var kCalendar = document.getElementById(id);

        if (typeof (date) !== 'undefined') {

            date = date.split('-');
            date[1] = date[1] - 1;
            date = new Date(date[0], date[1], date[2]);

        } else {
            var date = new Date();
        }

        var currentYear = date.getFullYear();
        //년도를 구함

        var currentMonth = date.getMonth() + 1;
        //연을 구함. 월은 0부터 시작하므로 +1, 12월은 11을 출력

        var currentDate = date.getDate();
        //오늘 일자.

        date.setDate(1);
        var currentDay = date.getDay();
        //이번달 1일의 요일은 출력. 0은 일요일 6은 토요일

        var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
        var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
        if ((currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0)
            lastDate[1] = 29;
        //각 달의 마지막 일을 계산, 윤년의 경우 년도가 4의 배수이고 100의 배수가 아닐 때 혹은 400의 배수일 때 2월달이 29일 임.

        var currentLastDate = lastDate[currentMonth - 1];
        var week = Math.ceil((currentDay + currentLastDate) / 7);
        //총 몇 주인지 구함.

        if (currentMonth != 1)
            var prevDate = currentYear + '-' + (currentMonth - 1) + '-' + currentDate;
        else
            var prevDate = (currentYear - 1) + '-' + 12 + '-' + currentDate;
        //만약 이번달이 1월이라면 1년 전 12월로 출력.

        if (currentMonth != 12)
            var nextDate = currentYear + '-' + (currentMonth + 1) + '-' + currentDate;
        else
            var nextDate = (currentYear + 1) + '-' + 1 + '-' + currentDate;
        //만약 이번달이 12월이라면 1년 후 1월로 출력.


        if (currentMonth < 10)
            var currentMonth = '0' + currentMonth;
        //10월 이하라면 앞에 0을 붙여준다.

        var calendar = '';

        calendar += '<div id="header">';
        calendar += '			<span><a href="#" class="button left" onclick="kCalendar(\'' + id + '\', \'' + prevDate + '\')"><</a></span>';
        calendar += '			<span id="date">' + currentYear + '년 ' + currentMonth + '월</span>';
        calendar += '			<span><a href="#" class="button right" onclick="kCalendar(\'' + id + '\', \'' + nextDate + '\')">></a></span>';
        calendar += '		</div>';
        calendar += '		</div>';
        calendar += '		<table align="center" border="0" cellspacing="0" cellpadding="0">';
        calendar += '			<caption>' + currentYear + '년 ' + currentMonth + '월 달력</caption>';
        calendar += '			<thead>';
        calendar += '				<tr>';
        calendar += '				  <th class="sun" scope="row">일</th>';
        calendar += '				  <th class="mon" scope="row">월</th>';
        calendar += '				  <th class="tue" scope="row">화</th>';
        calendar += '				  <th class="wed" scope="row">수</th>';
        calendar += '				  <th class="thu" scope="row">목</th>';
        calendar += '				  <th class="fri" scope="row">금</th>';
        calendar += '				  <th class="sat" scope="row">토</th>';
        calendar += '				</tr>';
        calendar += '			</thead>';
        calendar += '			<tbody>';

        var dateNum = 1 - currentDay;

        for (var i = 0; i < week; i++) {
            calendar += '			<tr>';
            for (var j = 0; j < 7; j++ , dateNum++) {
                if (dateNum < 1 || dateNum > currentLastDate) {

                    calendar += '<td class="' + dateString[j] + '"> </td>';
                    continue;
                }
                calendar += '<td class="' + dateString[j] + '">' + '<div class="dateNum" style="height:20px"><a href="#">' + dateNum + '</a></div>'
                if (dateNum < 10)
                    dateNum = '0' + dateNum;
                // calendar += '<div class="attendContent" id="'+ currentYear +'-'+ currentMonth +'-'+ dateNum + '"><p></p><p></p></div>' + '</td>';
                calendar += '<div class="attendContent" data-toggle="modal" data-target="#dailyattend" data-date="' + currentYear + '-' + currentMonth + '-' + dateNum + '">'
                
                
                
                
                calendar += '</div>' + '</td>';

            }

        }

        calendar += '			</tbody>';
        calendar += '		</table>';

        kCalendar.innerHTML = calendar;
        
        var time = new Date();
        var curY = time.getFullYear();
        var curM = time.getMonth() + 1;
        var curD = time.getDate();
        var today;

        if (curD < 10) {
            today = "" + curY + "-" + curM + "-0" + curD;
        } else {
            today = "" + curY + "-" + curM + "-" + curD;
        }
        $('div[data-date="' + today + '"]').parent().css("background-color", "#fcf8e3");
        
    }

    kCalendar('kCalendar');
	
    
    function attendData (){
   		if(id == master){
		$.ajax({
			url: "/steach/class/attend/attendlistTeacher.do",
			data: {
				classNo:cno
			}
		}).done(function(result){
			console.log(result)
			var atdata = '';
			for (var i = 0; i < result.length; i++) {
				atdata = '<p class="teach">지각 '+result[i].attendLate+'</p><p class="teach">조퇴 '+result[i].attendEarly+'</p><p class="teach">결석 '+result[i].attendOff+'</p>'
				$('div[data-date="' + result[i].attendDate + '"]').html(atdata)
			}
		})
    	}
   		else {
   			$.ajax({
   				url: "/steach/class/attend/attendlistStudent.do",
   				data: {
   					classNo:cno,
   					id:id
   				}
   			}).done(function(result){
   				console.log(result)
   				var atdata = '';
   				for (var i = 0; i < result.length; i++) {
   					if (result[i].attendLate == 1) {
   						atdata = '<p class="stlate"><span>지각</span></p>'
   					}
   					else if (result[i].attendOn == 1) {
   						atdata = '<p class="ston"><span>출석</span></p>'
   					}
   					else if (result[i].attendEarly == 1) {
   						atdata = '<p class="stearly"><span>조퇴</span></p>'
   					}
   					else if (result[i].attendOff == 1) {
   						atdata = '<p class="stoff"><span>결석</span></p>'
   					}
   					
   					/* atdata = '<p>지각 '+result[i].attendLate+'</p><p>조퇴 '+result[i].attendEarly+'</p><p>결석 '+result[i].attendOff+'</p>' */
   					$('div[data-date="' + result[i].attendDate + '"]').html(atdata)
   				}
   			})
   		}
   	}
    attendData()
    
	/* $(".attendContent").click(function(){
		var tttt = $(this).attr("data-date")
		$("#dailyattTitle").text(tttt +"  출석부")
		console.log(tttt)
		$.ajax({
   				url: "/steach/class/attend/attendStudentContent.do",
   				data: {
   					classNo:cno,
   					id:id,
   					attendDate:tttt
   				}
   			}).done(function(result){
//    				console.log(result)
//    				console.log(typeof(result.gno))
   				var dailyat = '';
   				switch (result.gno) {
				case 1001:
					dailyat = "출석"
					break;
				case 1002:
					dailyat = "지각"
					break;
				case 1003:
					dailyat = "조퇴"
					break;
				case 1004:
					dailyat = "결석"
					break;
				}
   				console.log("퇴실시간 : " + $.format.date(result.offTime, "HH:mm"))
   				console.log("퇴실시간2: " + result.offTime)
   				if (!result.offTime) {
   					
					result.offTime = "-"					
				}
   				$("#dailyattContent").html("<h3>"+dailyat + "</h3><p>출석시간 : "+$.format.date(result.attendTime, "HH:mm")+"</p><p>퇴실시간 : "+$.format.date(result.offTime, "HH:mm")+"</p>")
   			})
		
	}) */
	
	$(".attendContent").click(function(){
		var tttt = $(this).attr("data-date")
		console.log(tttt)
		$("#dailyattTitle").text(tttt +"  출석부")
		$.ajax({
			url:"/steach/class/attend/attendTeacherContent.do",
			data:{
				classNo:cno,
				attendDate:tttt
			}
		}).done(function(result){
			var latelist = result.list.atlate;
			var earlylist = result.list.atearly;
			var offlist = result.list.atoff;
			
			var late = "";
			var early = "";
			var off = "";
			
			if (latelist!="") {
				for (var i = 0; i < latelist.length; i++) {
					late += latelist[i].user[0].name + ", "
				}
			}
			var latename = late.substring(0, late.length-2)
// 			console.log("지각 : "+latename)
// 			console.log(latename.length)
			
			if (earlylist!="") {
				for (var i = 0; i < earlylist.length; i++) {
					early += earlylist[i].user[0].name + ", "
				}
			}
			var earlyname = early.substring(0, early.length-2)
// 			console.log("조퇴 : "+earlyname) 
// 			console.log(earlyname.length) 
			
			if (offlist!="") {
				for (var i = 0; i < offlist.length; i++) {
					off += offlist[i].user[0].name + ", "
				}
			}
			var offname = off.substring(0, off.length-2)
			console.log("결석 : "+offname)
			console.log(offname.length)
			
			var atnamelist = "";
			if (latename.length != 0) {
				atnamelist += '<p>지각 : ' + latename + '</p>'
			}
			if (earlyname.length != 0) {
				atnamelist += '<p>조퇴 : ' + earlyname + '</p>'
			}
			if (offname.length != 0) {
				atnamelist += '<p>결석 : ' + offname + '</p>'
			}
			
			
			$("#dailyattContent").html(atnamelist)
			
		})
	})

        
    </script>
</body>
</html>