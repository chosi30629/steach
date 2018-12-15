<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>header</title>
    <!-- favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="/steach/resources/favicon/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/steach/resources/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/steach/resources/favicon/favicon-16x16.png">
	<link rel="manifest" href="/steach/resources/favicon/site.webmanifest">
	<link rel="mask-icon" href="/steach/resources/favicon/safari-pinned-tab.svg" color="#5bbad5">
	<meta name="msapplication-TileColor" content="#da532c">
	<meta name="theme-color" content="#ffffff">
	
	
    <link rel="stylesheet" href="/steach/resources/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="/steach/resources/css/header/class-header.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-default">
        <div class="navbar-collapse" >
            <ul class="nav navbar-nav">
                <li class="pull-left home"><a href="/steach/main/main.do"><i class="fas fa-home"></i></a></li>
                <li class="pull-left myClassName"><a href="#">${clazz.className}</a></li>
                <li class="classCurriculum"><a href="<c:url value='/class/curriculum/curriculum.do?classNo=${clazz.classNo}'/>">커리큘럼</a></li>
                <li class="dropdown classCourse">
                    <a href="lecture" class="dropdown-toggle" data-toggle="dropdown">수업</a>
                    <ul class="dropdown-menu">
                        <li><a href="<c:url value='/class/lecture/homework.do?classNo=${clazz.classNo}'/>">과제제출</a></li>
                    </ul>
                </li>
                <li class="dropdown classUser">
                    <a href="member" class="dropdown-toggle" data-toggle="dropdown">사용자</a>
                    <ul class="dropdown-menu">
                        <li><a href="<c:url value='/class/attend/attend.do?classNo=${clazz.classNo}'/>">출결현황</a></li>
                        <li class="divider"></li>
                        <li><a href="<c:url value='/class/group/groupMain.do?classNo=${clazz.classNo}'/>">조별활동</a></li>
                    </ul>
                </li>
                <li class="nbsp"> </li>
                <li class="pull-right dropdown myNotification">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fas fa-user"></i></a>
                    <ul class="dropdown-menu myNotificationMenu">
                        <li><a href='<c:url value="/user/myPage.do"/>'>마이페이지</a></li>
                        <li class="divider"></li>
                        <li><a href='<c:url value="/drive/drive.do"/>'>마이드라이브</a></li>
                        <li class="divider"></li>
                        <li><a href='<c:url value="/login/logout.do"/>'>로그아웃</a></li>
                    </ul>
                </li>
                <li class="pull-right myInformation"><a href="#"><i class="fas fa-bell"></i></a></li>
                <li class="pull-right attend attendon" style="display: none"><a href="#" id="atton"><i class="fas fa-calendar-check"></i></a></li>
                <li class="pull-right attend attendoff" style="display: none"><a href="#" id="attoff"><i class="fas fa-door-open"></i></a></li>
                <li class="pull-right attend attendcomplete" style="display: none"><a href="#" id="attcomplete"><i class="fas fa-check"></i></a></li>
            </ul>
        </div>
    </nav>
</body>
<script>
    $('ul.nav li.dropdown').hover(function() {
        $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeIn(200);
    }, function() {
        $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeOut(200);
    });
   
       
    $("a[href='lecture']").click(function(){
    	location.href="<c:url value='/class/lecture/lecture.do?classNo=${clazz.classNo}'/>";
    })
    
     $("a[href='member']").click(function(){
    	location.href="<c:url value='/class/member/member.do?classNo=${clazz.classNo}'/>";
    })
 	
    var id = "${user.id}";
    console.log("id : " + id)
    var master = "${clazz.master}";
    console.log("master : " + master)
    var cno = "${clazz.classNo}";
    console.log("classNo : " + cno)

    
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
    /* if (id != master) {
		$(".attendon").css("display", "block");
	} */
    console.log("오늘날짜 : " + today)
    // 출석 결석 버튼 구분
    var offstatus;
	
    function attStatus(){
		if (id != master) {
    	$.ajax({
 			url:"/steach/class/attend/attendStatus.do",
 			data:{
 				id:id,
 				classNo:cno,
 				attendDate:today
 			}
 		}).done(function(result){
 			offstatus = result.offStatus;
//  			console.log(result)
// 			console.log(result.attendTime)
// 			console.log(result.offStatus)
//  			console.log((result.attendTime != "") && (result.offStatus != 'y'))
        	if(!result.attendTime){
	 			$(".attendon").css("display", "block");
        	}
        	else if((result.attendTime != "") && (result.offStatus != 'y')){
        		$(".attendoff").css("display", "block");
        	}
        	else if(result.offStatus =='y'){
        		$(".attendcomplete").css("display", "block");
        	}
        });
		}
    }
    attStatus();
    console.log(offstatus)
    
    var startTime = "${clazz.startTime}"
    var endTime = "${clazz.endTime}"
    var start = parseInt(startTime.replace(":", ""))+10
    var end = parseInt(endTime.replace(":", ""))
    var curtt = (time.getHours()).toString();
    var curmm = (time.getMinutes().toString());
    if (curmm < 10) {
        curmm = "0"+ curmm
    }
    var curtime = curtt+curmm
    console.log("현재시각 : " + curtime)
    
    // 출석
    var atcode;
    $("#atton").click(function(e){
//     	e.preventDefault();
    	if (curtime < start) {              
    		atcode = 1001
    	} else {
    		atcode = 1002
    	}
    	console.log(atcode)
    	$.ajax({
    		url:"/steach/class/attend/attendOn.do",
 			data:{
 				id:id,
 				classNo:cno,
 				attendDate:today,
 				gNo:atcode
 			}
    	}).done(function(){
				alert("출석되었습니다.")
 				$(".attendon").css("display", "none");
				$(".attendoff").css("display", "block");
    	})
    })
    
    // 퇴실
    $("#attoff").click(function(e){
    	if (curtime < end) {
    		atcode = 1003;
    		$.ajax({
        		url:"/steach/class/attend/attendearlyOff.do",
     			data:{
     				id:id,
     				classNo:cno,
     				attendDate:today,
     				gNo:atcode
     			}
        	}).done(function(){
        		alert("퇴실되었습니다.")
        		$(".attendcomplete").css("display", "none");
        		$(".attendoff").css("display", "none");
        	})
    	} else {
    		$.ajax({
        		url:"/steach/class/attend/attendOff.do",
     			data:{
     				id:id,
     				classNo:cno,
     				attendDate:today
     			}
        	}).done(function(){
        		alert("퇴실되었습니다.")
 				$(".attendcomplete").css("display", "block");
				$(".attendoff").css("display", "none");
        	})
    	}
    })
    
    
    
</script>

</html>