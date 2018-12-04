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

<link href="/steach/resources/css/class/attend/attend.css"
	rel="stylesheet" />


<!-- swAlert.js -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.js"></script>

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
					<!-- title end -->
				</div>
				
			</div>
		</div>
	</div>

	<script>
	var id = "${user.id}";
	console.log(id)

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
                calendar += '<div class="attendContent" data-date="' + currentYear + '-' + currentMonth + '-' + dateNum + '"><p>지각 2</p><p>결석 1</p></div>' + '</td>';

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

    

var time = new Date();

var tt = (time.getHours()).toString();
var mm = (time.getMinutes().toString());

var curtime = tt+mm
console.log(typeof(curtime))
console.log(curtime);
if (curtime > 930) {              
	console.log("930보다 크다")
} else {
	console.log("930보다 작다")
}
        
    </script>
</body>
</html>