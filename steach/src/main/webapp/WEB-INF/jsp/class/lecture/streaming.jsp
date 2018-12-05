<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">  
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<div class="container">
		<div class="row text-center">
			<h1>보충수업</h1>
		</div>
		<video id="live" width="320" height="240" autoplay="autoplay"
			style="visibility: hidden; display: none;"></video>
		<div style="visibility: hidden; width: 0; height: 0; display: none;">
			<canvas width="320" id="canvas" height="240"></canvas>
		</div>
		<div class="row">
			<img id="target" width="800" height="800" style="display: inline;" />
			<div style="display: inline-block;"></div>
		</div>
	</div>
	<script type="text/javascript">
		var video = document.querySelector('#live');
		var canvas = document.querySelector('#canvas');
		var ctx = canvas.getContext('2d');
		var options = {
			video : true,
			audio : false
		};
		
		// 아이피 관리 해야함
		var ws = new WebSocket("wss://192.168.0.82:8443/steach/livevideo");
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
		// use the chrome specific GetUserMedia function
		navigator.mediaDevices.getUserMedia(options).then(function(stream) {
			video.srcObject = stream;
			video.play();
		}, function(err) {
			console.log("Unable to get video stream!")
		});

		timer = setInterval(function() {
			ctx.drawImage(video, 0, 0, 320, 240);
			var data = canvas.toDataURL('image/jpeg', 1.0);
			newblob = convertToBinary(data);
			ws.send(newblob);
		}, 100);

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
	</script>
</body>
</html>