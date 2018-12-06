<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">  
<link rel="stylesheet" href="/steach/resources/css/header/class-header.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">  
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<nav class="navbar navbar-default">
        <div class="navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="pull-left home"><a href="#"><i class="fas fa-home"></i></a></li>
                <li class="pull-left myClassName"><a href="#">클래스명</a></li>
                <li class="classCurriculum"><a href="<c:url value='/class/curriculum/curriculum.do'/>">커리큘럼</a></li>
                <li class="dropdown classCourse">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">수업</a>
                    <ul class="dropdown-menu">
                        <li><a href="<c:url value='/class/lecture/homework.do'/>">과제제출</a></li>
                    </ul>
                </li>
                <li class="dropdown classUser">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">사용자</a>
                    <ul class="dropdown-menu">
                        <li><a href="<c:url value='/class/attend/attend.do'/>">출결현황</a></li>
                        <li class="divider"></li>
                        <li><a href="<c:url value='/class/group/groupMain.do'/>">조별활동</a></li>
                    </ul>
                </li>
                <li class="nbsp"> </li>
                <li class="pull-right dropdown myNotification">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fas fa-user"></i></a>
                    <ul class="dropdown-menu myNotificationMenu">
                        <li><a href="#">마이페이지</a></li>
                        <li class="divider"></li>
                        <li><a href="<c:url value="/drive/drive.do"/>">마이드라이브</a></li>
                        <li class="divider"></li>
                        <li><a href="#">로그아웃</a></li>
                    </ul>
                </li>
                <li class="pull-right myInformation"><a href="#"><i class="fas fa-bell"></i></a></li>
            </ul>
        </div>
    </nav>
 	<div class="row text-center">
		<h1>보충수업</h1>
	</div>
	<div class="col-md-1">
	</div>
	<div class="col-md-8">

	   <video src="" width="1200" height="800" autoplay="autoplay"
	   	   style="visibility: hidden; display: none;"></video>
	   <div style="visibility: hidden; width: 0; height: 0; display: none;">
	       <canvas id="canvas" width="1200" height="800"></canvas>
	   </div>
		<div class="row">
			<img id="target" width="1200" height="800" style="display: inline;" />
			<div style="display: inline-block;"></div>
		</div>
	</div>	
	<div class="col-md-3">
		<div>채팅방</div>
	</div>
    <script src="https://cdn.WebRTC-Experiment.com/getScreenId.js"></script>
    <script>
	    const video = document.querySelector('video');
	    const canvas = document.querySelector('#canvas');
	    var ctx = canvas.getContext('2d');
	    var options = {
	        video : true,
	        audio : true
	    };
		
	 	// 아이피 관리 해야함
		var ws = new WebSocket("wss://192.168.0.82:8443/steach/screen");
		ws.onopen = function() {
			console.log("Openened connection to websocket");
		}
		
		ws.onmessage = function(msg) {
			var target = document.getElementById("target");
			url = window.URL.createObjectURL(msg.data);
			target.onload = function() {
				window.URL.revokeObjectURL(url);
			};
			target.src = url;
		}
		
	    getScreenId((error, sourceId, screenConstraints) => {
	    if (error === 'not-installed') return alert('The extension is not installed');
	    if (error === 'permission-denied') return alert('Permission is denied.');
	    if (error === 'not-chrome') return alert('Please use chrome.');
	
	    navigator.mediaDevices.getUserMedia(screenConstraints)
	        .then(stream => {
	        	video.srcObject = stream;
	            video.autoplay = true;
	            video.controls = true;
	            video.play();
	        })
	        .catch(err => {
	            console.log(err);
	        });
	    });
	
	    timer = setInterval(function() {
	        ctx.drawImage(video, 0, 0, 1200, 800);
	        var data = canvas.toDataURL('image/jpeg', 1.0);
	        newblob = convertToBinary(data);
	        ws.send(newblob);
	    }, 250);
	    
	    function convertToBinary(dataURI) {
			// convert base64 to raw binary data held in a string
			// doesn't handle URLEncoded DataURIs
			var byteString = atob(dataURI.split(',')[1]);
	
			// separate out the mime component
			var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0]
	
			// write the bytes of the string to an ArrayBuffer
			var ab = new ArrayBuffer(byteString.length);
			var ia = new Uint8Array(ab);
			for (var i = 0; i < byteString.length; i++) {
				ia[i] = byteString.charCodeAt(i);
			}
	
			// write the ArrayBuffer to a blob, and you're done
			var bb = new Blob([ab]);
			return bb;
		}
	    
	 	// 해더 링크
	   	$("a[href='lecture']").click(function(){
			location.href="<c:url value='/class/lecture/lecture.do'/>";
	    })
	    
	     $("a[href='member']").click(function(){
	    	location.href="<c:url value='/class/member/member.do'/>";
	    })
	    
	     // 헤더 드랍다운 효과
	    $('ul.nav li.dropdown').hover(function() {
	    $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeIn(200);
	    }, function() {
	        $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeOut(200);
	    });
	    
    </script>
</body>
</html>