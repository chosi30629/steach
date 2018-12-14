<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/jsp/header/classHeader.jsp"/>
<link rel="stylesheet" href="/steach/resources/css/class/lecture/screen.css">
</head>
<body>
  	<div class="text-center">
        <h2 class="streaming-title">MySQL 보충수업</h2>
    </div>
    <div class="col-md-7" style="margin-left: 90px;">
        <div class="screen">
            <div class="case">
                <div class="webcam"></div>
                <div class="display">
                    <div class="app">
                        <video src="" width="1200" height="675" autoplay="autoplay"
                       		   style="visibility: hidden; display: none;"></video></video>
             		    <div style="visibility: hidden; width: 0; height: 0; display: none;">
				            <canvas id="canvas" width="1200" height="675"></canvas>
				        </div>
						<img id="target" width="1200" height="675" style="display: inline;" />
                    </div>
                </div>
            </div>
            <div class="keyboard-container">
                <div class="grey-area"></div>
            </div>
        </div>
    </div>
    <div class="col-md-4 mobile-div">
        <div class="mobile">
            <div class="chatBlock">
                <div class="chatRoom">
                    <ol class="chatList">

                    </ol>
                </div>
                <div class="chatFoo">
                    <div class="inputBlock">
                        <input id="msgInput" type="text" placeholder="메시지를 입력하세요." />
                        <p class="inputError error"></p>
                    </div>
                    <div class="icons plane">
                        <a class="onSend" href="#"><i class="fa fa-paper-plane" style="color: #ccc; position: relative; top: 14px; left: 20px;"></i></a>
                    </div>
                </div>
            </div>
        </div>
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
		
	 	// 화면공유를 위한 웹소켓
		var ws = new WebSocket("wss://192.168.0.82:8443/steach/screen");
// 		var ws = new WebSocket("wss://192.168.1.126:8443/steach/screen");
		ws.onopen = function() {
			console.log('연결 성공');
		}
		
		// 상대방에게 화면공유 시켜주기
		ws.onmessage = function(msg) {
			var target = document.getElementById("target");
			url = window.URL.createObjectURL(msg.data);
			target.onload = function() {
				window.URL.revokeObjectURL(url);
			};
			target.src = url;
		}
		
	    getScreenId((error, sourceId, screenConstraints) => {
	    if (error === 'not-installed') return;
	    if (error === 'permission-denied') return;
	    if (error === 'not-chrome') return;
	
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
	        ctx.drawImage(video, 0, 0, 1200, 675);
	        var data = canvas.toDataURL('image/jpeg', 1.0);
	        newblob = convertToBinary(data);
	        ws.send(newblob);
	    }, 250);
	    
	    function convertToBinary(dataURI) {
			var byteString = atob(dataURI.split(',')[1]);
	
			var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0]
	
			var ab = new ArrayBuffer(byteString.length);
			var ia = new Uint8Array(ab);
			for (var i = 0; i < byteString.length; i++) {
				ia[i] = byteString.charCodeAt(i);
			}
	
			var bb = new Blob([ab]);
			return bb;
		}
	    
	    // 헤더 드랍다운 효과
	    $('ul.nav li.dropdown').hover(function() {
	    $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeIn(200);
	    }, function() {
	        $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeOut(200);
	    });
	    
	 	// 채팅을 위한 웹소켓
       	var wss;
		$(document).ready(function() {
			$('input').blur(function () {
            	$('.plane').removeClass("act");
	        }).focus(function () {
	            $('.plane').addClass("act");
         	});
			
			wss = new WebSocket('wss://192.168.0.82:8443/steach/streamingChat.do');
// 			wss = new WebSocket('wss://192.168.1.126:8443/steach/streamingChat.do');
			wss.onopen = function() {
		        console.log('연결 성공');
		    };
		    wss.onmessage = function(evt) {
		    	var userName = evt.data.substring(0, evt.data.indexOf(","));
		    	var profilePath = evt.data.substring(evt.data.indexOf(",") + 1, evt.data.indexOf(":"));
		    	var messageContent = evt.data.substring(evt.data.indexOf(":") + 1);
		    	console.log(userName);
		    	console.log(profilePath);
		    	console.log(messageContent);

		    	setTimeout(function () {
                 $('.chatList').append('<img src="' + profilePath + '" width="20" height="20" style="border-radius: 100%; position: relative; top: -3px;"/><span>&nbsp;' + userName + '</span><li class="userResponse"><span>' + messageContent + ' </span></li>');
                 document.querySelector(".chatList").scrollIntoView(false);
                }, 10);
		    };
		    
		    wss.onerror = function(evt) {
		    	console.dir(evt.data)
		    };
		    
		    wss.onclose = function() {
		    	console.log("연결을 끊었습니다.");
		        console.log('close');
		    };
			
			$('.onSend').click(function() { 
				send(); 
			});
			
	        $('#msgInput').on('keydown', function (e) {
	            if (e.originalEvent.keyCode == 13) {

	                send();
	                return false;
	            }
	        });
		});
		
		function send() {
            var inputValue = "${user.name},${user.profilePath}:" + $('#msgInput').val();
	    	var messageContent = inputValue.substring(inputValue.indexOf(":") + 1);
            
            if (inputValue == null || inputValue == '') {
                $(this).addClass('focus');
                $('.inputError').addClass('act');
                $('.plane').addClass('err');
                setTimeout(function () {
                    $('#msgInput').removeClass('focus');
                    $('.inputError').removeClass('act');
                    $('.plane').removeClass('err');
                }, 10);
                document.querySelector(".chatList").scrollIntoView(false);
            }
            else {
                $('.inputSending').addClass('act');
                $('.chatList').append('<li class="userInput"><span>' + messageContent + ' </span></li>');
                $('.plane').addClass("sndng");
                setTimeout(function () {
                    $('.inputSending').removeClass('act');
                    $('#msgInput').val('');
                    $('.plane').removeClass("sndng");
                }, 10);
                document.querySelector(".chatList").scrollIntoView(false);
            }
            
		    wss.send(inputValue);
		}
    </script>
</body>
</html>