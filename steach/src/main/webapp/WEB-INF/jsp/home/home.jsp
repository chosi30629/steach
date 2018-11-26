<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css'
	rel='stylesheet' />
<link rel="stylesheet" href="/steach/resources/css/user/steach.css">
<!--   <script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/js/bootstrap.min.js'></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
body {
	background-image: url('/steach/resources/images/main/classroom.jpg');
	background-size: cover;
}

input {
	margin-top: 5px;
	margin-bottom: 15px;
}

button {
	margin-top: 15px;
}

div.scalable {
	transition: height 0.5s;
	overflow-y: hidden;
}

div.login {
	position: absolute;
	background: #ffffff;
	text-align: center;
	padding: 20px 20px 9px;
	border-radius: 4px;
	box-shadow: 0px 0px 15px 0px;
	width: 350px;
	height: auto;
	top: 50%;
	left: 50%;
	transform: translateY(-50%);
	/*     margin-left: -150px; */
}

div.bottom {
	font-size: 12px;
	margin-top: 12px;
}
</style>
</head>
<body>
	<div class="login">
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
				<div class="msg" id="ckIdMsg"></div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon"><i class="fas fa-lock"></i></span>
					<input id="passwordCk" type="password" class="form-control"
						name="passwordCk" placeholder="비밀번호 확인">
				</div>
				<div class="row" id="ConfirmPassMsg"></div>
				<input type="text" class="form-control" id="register-name"
					name="name" placeholder="이름">
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
				<div class="msg" id="ckMsg"></div>
				<input type="password" class="form-control"
					id="register-passwordchk" name="passwordchk" placeholder="비밀번호 확인">
				<div class="msg" id="ckMsg"></div>
				<button class="btn btn-success btn-lg btn-block" id="signup">회원가입</button>
			</form>
			<div class="bottom">
				<a href="#" class="signinlink">로그인</a>
			</div>
		</div>
		<div class="scalable" style="height: 0px" id="findpass-scalable">
			<input type="text" class="form-control" id="find-name"
				placeholder="이름"> <input type="text" class="form-control"
				id="find-email" placeholder="Email 아이디">

			<button type="button" class="btn btn-link btn-block" id="findpass">비밀번호
				찾기</button>
			<input type="password" class="form-control" id="curpassword"
				placeholder="현재 비밀번호"> <input type="password"
				class="form-control" id="modipassword" placeholder="변경할 비밀번호">
			<input type="password" class="form-control" id="modipasswordchk"
				placeholder="변경할 비밀번호 확인">
			<button class="btn btn-success btn-lg btn-block" id="changepass">비밀번호
				변경</button>
			<div class="bottom">
				<a href="#" class="signinlink">로그인</a>
			</div>
		</div>
	</div>
	<script>
    $(document).ready(function () {
      $("#login").prop("disabled", false);
//       $(".btn").click(function () {
//         $(".btn").prop("disabled", true);

//         setTimeout(function () {
//           $(".btn").prop("disabled", false);
//         }, 1000);
//       });

      $("#register").click(function () {
        $("#login-scalable").height(0);
        $("#register-scalable").height(470);
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
        $("#findpass-scalable").height(400);
      });
      
    });
    
    
    $("#signupForm").submit(function(e){
		e.preventDefault();
		var formData = new FormData($("#signupForm")[0]);
		
		$.ajax({
			url:"/steach/user/signUp.do",
			method : "POST",
			enctype : 'multipart/form-data',
			contentType : false,
			processData: false,
			data: formData
			
		}).done(function(){
			swal("가입이 완료되었습니다.");
			$("#login-scalable").height(200);
	        $("#register-scalable").height(0);
	        $("#register-email").val("")
			$("#register-name").val("")
			$("#register-password").val("")
			$("#register-passwordchk").val("")
			$("#profile").attr("src","/steach/resources/images/main/profile.jpg")
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
				alert("로그인 되었습니다.");
				location.href = "/steach/main/main.do";

			}
		})
	});
    

    $("#findpass").click(function(){
      swal("임시 비밀번호가 등록된 메일로 전송되었습니다.");
    });
    $("#changepass").click(function(){
      swal("비밀번호가 변경되었습니다.","로그인화면에서 로그인해주세요.");
    });


    // 확장자 제한
    function checkFile(f) {
      // files로 해당 파일 정보 얻기
      var file = f.files;

      // file[0].name 은 파일명
      // 정규식으로 확장자 체크
      if (!/(gif|jpg|jpeg|png)$/i.test(file[0].name)) {
        alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
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
        // setTimeout(function () {
        //   conf = confirm("수정하시겠습니까?");
        //   if (conf == false) { location.href = "myPage.do"; return; }

        //   var formData = new FormData();
        //   var inputFile = $("input[name='uploadFile']")
        //   var files = inputFile[0].files;
        //   var id = $("#userId").val();
        //   formData.append("uploadFile", files[0]);
        //   $.ajax({
        //     url: "/cocain/user/profileImg.do",
        //     processData: false,
        //     contentType: false,
        //     data: formData,
        //     type: "POST"
        //   })
        //     .done(function (result) {
        //       location.href = "myPage.do";
        //     });
        // }, 10)
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
    
//     var idConfirmSwich = 1;	
// 	var passConfirmSwich = 1;	
// 	var passCkConfirmSwich = 1;	
// 	var nicknameConfirmSwich = 1;	
// 	var emailConfirmSwich = 1;	
// 	var emailKeyConfirmSwich = 1;	

	// 아이디 입력
	$("#register-email").on("input", function() {
		var id = $("#register-email").val();
		
		var idReg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		if(!idReg.test(id)) {
			$("#ckIdMsg").html("<span style='color: red; line-height: 0px;'> 올바른 이메일 형식을 입력해주세요.</span>");
			emailConfirmSwich = 1;
			
			return false;
		} else {
			$("#ckIdMsg").html(
					"<span style='color: green; line-height: 0px;'>사용 가능한 이메일입니다.　</span>"
			);
			emailConfirmSwich = 0;
		}
        
		
		
		
        var idReg = /^[a-zA-Z0-9]{4,12}$/;
      
        if(!idReg.test(id)) {
        	$("#ckMsg").html("<span style='color: red; line-height: 0px;'>아이디는 영문, 숫자만 입력가능합니다.</span>");
        	idConfirmSwich = 1;

			return false;
		} else {
			idConfirmSwich = 0;
		}
        
		$.ajax({
			url: "checkId.do",
			data: {id: id}
		})
		.done(function(check) {
			if(check == "0") {
				$("#ckMsg").html("<span style='color: green; line-height: 25px;'>사용 가능한 아이디입니다.</span>");
				idConfirmSwich = 0;
			} else {
				$("#ckMsg").html("<span style='color: red; line-height: 25px;'>중복된 아이디입니다.</span>");
				idConfirmSwich = 1;

				return false;
			}
		});
	});

	$("#email").on("input", function() {
		var email = $("#email").val();
		
		var emailReg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		if(!emailReg.test(email)) {
			$("#ckEmailMsg").html("<span style='color: red; line-height: 25px;'>올바른 이메일 형식을 입력해주세요.</span>");
			emailConfirmSwich = 1;
			
			return false;
		} else {
			$("#ckEmailMsg").html(
					"<span style='color: green; line-height: 25px;'>사용 가능한 이메일입니다.　</span>"
			);
			$("#sendMail").removeClass("disabled");
			emailConfirmSwich = 0;
		}
	});
	
	// 비밀번호 입력
	$("#register-password").on("input", function() {
		var password = $("#register-password").val();
		var passwordchk = $("#register-passwordchk").val();
		
		if(password.length < 8 || password.length > 16) {
			$("#ckPassMsg").html("<span style='color: red; line-height: 25px;'>비밀번호를 8~16자까지 입력해주세요.</span>");
			passConfirmSwich = 1;

			return false;
		} else {
			$("#ckPassMsg").html("<span style='color: green; line-height: 25px;'>사용 가능한 비밀번호입니다.</span>");
			passConfirmSwich = 0;
		}
		
		if(password != passwordchk) {
			$("#ConfirmPassMsg").html("<span style='color: red; line-height: 25px;'>비밀번호를 재확인해주세요.</span>");
			passCkConfirmSwich = 1;

			return false;
		}
	});
	
	// 비밀번호 확인 입력
	$("#passwordCk").on("input", function() {
		var password = $("#password").val();
		var passwordCk = $("#passwordCk").val();
		
		if(password == passwordCk) {
			$("#ConfirmPassMsg").html("<span style='color: green; line-height: 25px;'>비밀번호가 확인되었습니다.</span>");
			passCkConfirmSwich = 0;
		} else {
			$("#ConfirmPassMsg").html("<span style='color: red; line-height: 25px;'>비밀번호가 일치하지 않습니다.</span>");
			passCkConfirmSwich = 1;

			return false;
		}
	});
    
    
    $("#singUp").on("click", function(e) {
		if($("#id").val() == "") {
			$("#ckMsg").html("<span style='color: red; line-height: 25px;'>아이디를 입력하세요.</span>");
            $("#id").focus();
            return false;
		}
		if($("#nickname").val() == "") {
			$("#ckNameMsg").html("<span style='color: red; line-height: 25px;'>이름을 입력하세요.</span>");
            $("#nickname").focus();
            return false;
		}
		if($("#password").val() == "") {
			$("#ckPassMsg").html("<span style='color: red; line-height: 25px;'>비밀번호를 입력하세요.</span>");
            $("#password").focus();
            return false;
		}
		if($("#passwordCk").val() == "") {
			$("#ConfirmPassMsg").html("<span style='color: red; line-height: 25px;'>비밀번호를 확인하세요.</span>");
            $("#passwordCk").focus();
            return false;
		}
		if(idConfirmSwich == 1) {
            $("#id").focus();
			return false;
		}
		if(passConfirmSwich == 1) {
            $("#password").focus();
			return false;
		}
		if(passCkConfirmSwich == 1) {
            $("#passwordCk").focus();
			return false;
		}
		if(nicknameConfirmSwich == 1) {
            $("#nickname").focus();
			return false;
		}
		if(emailConfirmSwich == 1) {
            $("#email").focus();
			return false;
		}	
		alert("가입되었습니다. 로그인 후 이용해주세요.");
	});
  </script>
</body>
</html>