<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>STEACH</title>
<!-- favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="/steach/resources/favicon/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/steach/resources/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/steach/resources/favicon/favicon-16x16.png">
	<link rel="manifest" href="/steach/resources/favicon/site.webmanifest">
	<link rel="mask-icon" href="/steach/resources/favicon/safari-pinned-tab.svg" color="#5bbad5">
	<meta name="msapplication-TileColor" content="#da532c">
	<meta name="theme-color" content="#ffffff">
<!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css"> -->
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css'
	rel='stylesheet' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/steach/resources/css/user/home.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body class="welcome">
	<span id="splash-overlay" class="splash"></span>
	<span id="welcome" class="z-depth-4"></span>

	<header class="navbar-fixed"> <nav class="row black darken-3">
	<div class="col s12">
		<div class="steach">
			<h2 id="steachTitle" style="visibility: hidden">STEACH</h2>
		</div>
		<section class="typing">
		<h2 id="writer"></h2>
		</section>
	</div>
	</nav> </header>

	<main class="valign-wrapper">
		<div class="login" style="display:none"> 
		<div class="scalable" style="height: 195px" id="login-scalable">
			<form id="loginForm" method="post">
				<input type="email" class="form-control" id="login-email" name="id"
					placeholder="Email 아이디"> <input type="password"
					class="form-control" id="login-password" name="password"
					placeholder="비밀번호">
				<button class="btn btn-primary btn-lg btn-block" id="login">로그인</button>
			</form>
			<div class="bottom">
				<a href="#" id="register">회원가입</a> <a href="#" id="forgot">비밀번호
					찾기</a>
			</div>
		</div>
		<div class="scalable" style="height: 0px" id="register-scalable">
			<form id="signupForm" method="post" enctype="multipart/form-data">
				<input type="email" class="form-control" id="register-email"
					name="id" placeholder="Email 아이디">
				<p class="msg" id="ckIdMsg"></p>
				<input type="text" class="form-control" id="register-name"
					name="name" placeholder="이름">
				<p class="msg" id="ckNameMsg"></p>
				<div id="drop">
					<a href="#"> <img id="profile" class="media-object"
						src="/steach/resources/images/main/profile.jpg" alt="프로필" />
					</a>
				</div>
				<br>
				<div class="fileBox text-center">
					<label for="uploadBtn" class="btn_file">프로필 사진 등록</label> <input
						type="file" name="uploadFile" id="uploadBtn" class="uploadBtn" />
				</div>
				<input type="password" class="form-control" id="register-password"
					name="password" placeholder="비밀번호">
				<p class="msg" id="ckPassMsg"></p>
				<input type="password" class="form-control"
					id="register-passwordchk" name="passwordchk" placeholder="비밀번호 확인">
				<p class="msg" id="ckPasschkMsg"></p>
				<button class="btn btn-success btn-lg btn-block" id="signup">회원가입</button>
			</form>
			<div class="bottom">
				<a href="#" class="signinlink">로그인</a>
			</div>
		</div>
		<div class="scalable" style="height: 0px" id="findpass-scalable">
			<form id="findpassForm" method="post">
				<input type="text" class="form-control" name="name" id="find-name"
					placeholder="이름"> <input type="text" class="form-control"
					name="id" id="find-email" placeholder="Email 아이디">
				<button class="btn btn-link btn-block" id="findpass">비밀번호
					찾기</button>
			</form>
			<input type="password" class="form-control" id="curpassword"
				placeholder="임시 비밀번호">
			<p class="msg" id="cktempMsg"></p>
			<form id="modipassForm" method="post">
				<input type="password" class="form-control" name="password"
					id="modipassword" placeholder="변경할 비밀번호">
				<p class="msg" id="cktemppassMsg"></p>
				<input type="password" class="form-control" id="modipasswordchk"
					placeholder="변경할 비밀번호 확인">
				<p class="msg" id="cktemppasschkMsg"></p>
				<button class="btn btn-success btn-lg btn-block" id="changepass">비밀번호
					변경</button>
			</form>
			<div class="bottom">
				<a href="#" class="signinlink">로그인</a>
			</div>
		</div>
	</div>
		
	</main>


	<footer class="page-footer black darken-3">
	<div class="footer-copyright black darken-3">
		<div class="container">
			<time datetime="{{ site.time | date: '%Y' }}">&copy; 2018
			STEACH 안규영 | 김해동 | 박한준 | 조성일 </time>
		</div>
	</div>
	</footer>
	
	



	<script>
    $(document).ready(function () {
      $("#login").prop("disabled", false);


      $("#register").click(function () {
        $("#login-scalable").height(0);
        $("#register-scalable").height(490);
      });

      $(".signinlink").click(function () {
        var path = $(this).parent().parent().attr('id');
        console.dir(path);
        $("#login-scalable").height(200);
        if (path == 'register-scalable') {
          $("#register-scalable").height(0);
        } else {
          $("#findpass-scalable").height(0);
        }
      });

  	
      $("#forgot").click(function () {
        $("#login-scalable").height(0);
        $("#findpass-scalable").height(420);
      });
      
    });
    
    
    $("#signupForm").submit(function(e){
		e.preventDefault();
		if($("#register-email").val() == "") {
			$("#ckIdMsg").html("<span style='color: red; line-height: 0px;'>아이디를 입력하세요.</span>");
            $("#register-email").focus();
            return false;
		}
		if($("#register-name").val() == "") {
			$("#ckNameMsg").html("<span style='color: red; line-height: 0px;'>이름을 입력하세요.</span>");
            $("#register-name").focus();
            return false;
		}
		
		if($("#register-password").val() == "") {
			$("#ckPassMsg").html("<span style='color: red; line-height: 0px;'>비밀번호를 입력하세요.</span>");
            $("#register-password").focus();
            return false;
		}
		if($("#register-passwordchk").val() == "") {
			$("#ckPasschkMsg").html("<span style='color: red; line-height: 0px;'>비밀번호를 확인하세요.</span>");
            $("#register-passwordchk").focus();
            return false;
		}
		if(signup.idConfirm == 1) {
            $("#register-email").focus();
			return false;
		}
		if(signup.passConfirm == 1) {
            $("#register-password").focus();
			return false;
		}
		if(signup.passChkConfirm == 1) {
            $("#register-passwordchk").focus();
			return false;
		}
		var formData = new FormData($("#signupForm")[0]);
		$.ajax({
			url:"/steach/user/signUp.do",
			method : "POST",
			enctype : 'multipart/form-data',
			contentType : false,
			processData: false,
			data: formData
			
		}).done(function(){
			$("#login-scalable").height(200);
	        $("#register-scalable").height(0);
	        $("#register-email").val("")
			$("#register-name").val("")
			$("#register-password").val("")
			$("#register-passwordchk").val("")
			$("#profile").attr("src","/steach/resources/images/main/profile.jpg")
			$(".msg").html("")
			swal("가입이 완료되었습니다. 로그인 후 이용해주세요.");
		})
	});
    
	$("#login").on("click", function(e) {
		e.preventDefault();
		var id = $("#loginForm").find("input[name='id']").val();
		var password = $("#loginForm").find("input[name='password']").val();
		
		$.ajax({
			url: "/steach/login/login.do",
			data: {id: id, password: password},
			type: "post"
		})
		.done(function(user) {
			console.log(user);
			if(user == "") {
				alert("아아디 또는 비밀번호를 잘못 입력하셨습니다.");

				return;
			} else {
				swal("로그인 되었습니다.");
				location.href = "/steach/main/main.do";

			}
		})
	});
    

    $("#findpassForm").submit(function(e){
    	e.preventDefault();
    	console.log($(this).serialize());
    	console.log($(this))
    	var findpassname = $("#find-name").val()
    	var findpassid = $("#find-email").val()
    	
    	
    	
    	//////////////////////////////////////////
    	$.ajax({
			url: "/steach/login/checkpassId.do",
			data: $(this).serialize()
		})
		.done(function(result) {
			console.log(result)
			if(result == "0") {
				swal("입력하신 정보에 해당하는 아이디가 없습니다.", "error")
				$("#find-name").focus();
			} else {
				$.ajax({
		    		url:"/steach/login/sendMail.do",
		    		data:{
		    			id:findpassid,
		    			name:findpassname
		    		}
		    	}).done(function(){
		    		swal('임시 비밀번호가 이메일로 전송되었습니다. \n비밀번호 변경을 진행해주세요','success');
		    	})
			}
		})

    });
    
 	// 임시비밀번호 확인
	$("#curpassword").on("input", function() {
		var id = $("#register-email").val();
		var temppass = $("#curpassword").val();
		console.log(temppass)
		$.ajax({
			url: "/steach/login/temppasschk.do",
			data: {
				password: temppass	
			}
		})
		.done(function(check) {
			if(check == "0") {
				/* alert("임시비밀번호를 확인해주세요") */
				$("#cktempMsg").html("<span style='color: red; line-height: 0px;'>임시비밀번호를 확인해주세요.</span>");
				return false;
			} else {
				/* alert("임시비밀번호가 일치합니다") */
				$("#cktempMsg").html("<span style='color: green; line-height: 0px;'>임시비밀번호가 일치합니다.</span>");
			}
		});
	});
 	
 	
	// 변경비밀번호 입력
	$("#modipassword").on("input", function() {
		var password = $("#modipassword").val();
		var passwordchk = $("#modipasswordchk").val();
		
		if(password.length < 8 || password.length > 16) {
			$("#cktemppassMsg").html("<span style='color: red; line-height: 0px;'>비밀번호를 8~16자까지 입력해주세요.</span>");

			return false;
		} else {
			$("#cktemppassMsg").html("<span style='color: green; line-height: 0px;'>사용 가능한 비밀번호입니다.</span>");
		}
		
		if(password != passwordchk) {
			$("#cktemppasschkMsg").html("<span style='color: red; line-height: 0px;'>비밀번호를 재확인해주세요.</span>");

			return false;
		}
	});
	
	// 변경비밀번호 확인 입력
	$("#modipasswordchk").on("input", function() {
		var password = $("#modipassword").val();
		var passwordchk = $("#modipasswordchk").val();
		
		if(password == passwordchk) {
			$("#cktemppasschkMsg").html("<span style='color: green; line-height: 0px;'>비밀번호가 확인되었습니다.</span>");
			signup.passChkConfirm = 0;
		} else {
			$("#cktemppasschkMsg").html("<span style='color: red; line-height: 0px;'>비밀번호가 일치하지 않습니다.</span>");
			signup.passChkConfirm = 1;

			return false;
		}
	});
 	
 	$("#modipassForm").submit(function(e){
 		var id=$("#find-email").val();
 		var name=$("#find-name").val();
 		var password=$("#modipassword").val();
 		e.preventDefault();
 		
 		$.ajax({
 			url:"/steach/login/modipass.do",
 			data:{
 				id:id,
 				password:password
 			}
 		}).done(function(){
 			$("#login-scalable").height(200);
	        $("#findpass-scalable").height(0);
	        $("#find-email").val("")
			$("#find-name").val("")
			$("#modipassword").val("")
			$("#modipasswordchk").val("")
			$(".msg").html("")
 			
 			
 			
 			
 			swal("비밀번호가 변경되었습니다.","로그인화면에서 로그인해주세요.");
 		})
 		
 	})
    


    // 확장자 제한
    function checkFile(f) {
      // files로 해당 파일 정보 얻기
      var file = f.files;

      // file[0].name 은 파일명
      // 정규식으로 확장자 체크
      if (!/(gif|jpg|jpeg|png)$/i.test(file[0].name)) {
        swal('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
        return false;
      } else {
        return;
      }
    }

    // 파일
    $("input[type='file']").change(function (e) {
      if (checkFile(this) == false) {
        return;
      }

      var fileReader = new FileReader();
      var conf = null;
      fileReader.readAsDataURL(e.target.files[0]);

      fileReader.onload = function (e) {
        document.getElementById('profile').src = e.target.result;
      }
    });
    // 파일 드래그 앤 드롭
    var drop = document.getElementById('drop');
    var fileInput = document.getElementById('uploadBtn');

    drop.ondragover = drop.ondragenter = function (e) {
      e.preventDefault();
    };

    drop.ondrop = function (e) {
      fileInput.files = e.dataTransfer.files;
      e.preventDefault();
    };
    
    
    var signup = {
			idConfirm : "1",
			nameConfirm : "1",
			passConfirm : "1",
			passChkConfirm : "1",
		}

	// 아이디 입력
	$("#register-email").on("input", function() {
		var id = $("#register-email").val();
		
		var idReg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		if(!idReg.test(id)) {
			$("#ckIdMsg").html("<span style='color: red; line-height: 0px;'> 올바른 이메일 형식을 입력해주세요.</span>");
			signup.idConfirm = 1;
			console.log("1??" + signup.idConfirm)
			return false;
		} else {
			$("#ckIdMsg").html(
					"<span style='color: green; line-height: 0px;'>사용 가능한 이메일입니다.　</span>"
			);
			signup.idConfirm = 0;
			console.log("0???" + signup.idConfirm)
		}
        
		$.ajax({
			url: "/steach/user/checkId.do",
			data: {id: id}
		})
		.done(function(check) {
			if(check == "0") {
				$("#ckIdMsg").html("<span style='color: green; line-height: 0px;'>사용 가능한 아이디입니다.</span>");
				signup.idConfirm = 0;
			} else {
				$("#ckIdMsg").html("<span style='color: red; line-height: 0px;'>중복된 아이디입니다.</span>");
				signup.idConfirm = 1;
				return false;
			}
		});
	});

	
	// 비밀번호 입력
	$("#register-password").on("input", function() {
		var password = $("#register-password").val();
		var passwordchk = $("#register-passwordchk").val();
		
		if(password.length < 8 || password.length > 16) {
			$("#ckPassMsg").html("<span style='color: red; line-height: 0px;'>비밀번호를 8~16자까지 입력해주세요.</span>");
			signup.passConfirm = 1;

			return false;
		} else {
			$("#ckPassMsg").html("<span style='color: green; line-height: 0px;'>사용 가능한 비밀번호입니다.</span>");
			signup.passConfirm = 0;
		}
		
		if(password != passwordchk) {
			$("#ckPasschkMsg").html("<span style='color: red; line-height: 0px;'>비밀번호를 재확인해주세요.</span>");
			signup.passChkConfirm = 1;

			return false;
		}
	});
	
	// 비밀번호 확인 입력
	$("#register-passwordchk").on("input", function() {
		var password = $("#register-password").val();
		var passwordchk = $("#register-passwordchk").val();
		
		if(password == passwordchk) {
			$("#ckPasschkMsg").html("<span style='color: green; line-height: 0px;'>비밀번호가 확인되었습니다.</span>");
			signup.passChkConfirm = 0;
		} else {
			$("#ckPasschkMsg").html("<span style='color: red; line-height: 0px;'>비밀번호가 일치하지 않습니다.</span>");
			signup.passChkConfirm = 1;

			return false;
		}
	});
    
	
	
	/* ui !! */
	 $(function() {
	var textOpts = ["    ","Welcome","STEACH"],
		timeOut,
		len = textOpts.length,
		$writer = $('#writer'), 
		currentValue = 0, charVal = 0,
		cursor = '<span class="cursor">|</span>',
		lengths = [];

		$.each(textOpts, function( index, value ) {
		     lengths.push( value.length );
	  	});
		
		function typeAnimationIt() {
			var humanize = Math.round(Math.random() * (200 - 30)) + 30;
      humanize = 200
			timeOut = setTimeout(function() {
				charVal++;
				var	txtLen = lengths[currentValue],
					type = textOpts[currentValue].substring(0, charVal);
				$writer.html(type + cursor);
				typeAnimationIt();
				if(charVal == txtLen) {
					clearTimeout(timeOut);
					if(currentValue < len - 1) {
						setTimeout(function() {
							typeAnimationDelete();
						}, 1000);
					}
				}
			}, humanize);
		}



		function typeAnimationDelete() {
			var humanize = Math.round(Math.random() * (200 - 30)) + 30;
			timeOut = setTimeout(function() {
				charVal--;
				var	type = textOpts[currentValue].substring(0, charVal);
				$writer.html(type + cursor);
				typeAnimationDelete();
				if(charVal == 0) {
					clearTimeout(timeOut);
					currentValue++;
					setTimeout(function() {
						typeAnimationIt();
					}, 1000);
				}
			}, humanize);
		}

		typeAnimationIt();
});
      


	$(function(){
        setTimeout(function(){
          $(".typing").css({background:"none"})
          $("#writer").css({"fontSize":"30px",transform:"translate(-846px, -144px)",transition:"2s"});
          
      
        },10000) 
  
        
         setTimeout(function(){
          $("#writer").css({"visibility":"hidden"});
        
        },10600)  
      
        setTimeout(function(){
          $("#steachTitle").css({"visibility":"visible"});
  		  $(".login").fadeIn(500);
        },12300) 

      })
	
    
  </script>
</body>
</html>