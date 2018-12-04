<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css' rel='stylesheet' />
  <link rel="stylesheet" href="/steach/resources/css/user/steach.css">
<!--   <script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/js/bootstrap.min.js'></script> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
<div class="login">
    <div class="scalable" style="height:195px" id="login-scalable">
    <form id="loginForm" method="post">
      <input type="email" class="form-control" id="login-email" name="id" placeholder="Email 아이디">
      <input type="password" class="form-control" id="login-password" name="password" placeholder="비밀번호">
      <button class="btn btn-primary btn-lg btn-block" id="login">로그인</button>
      </form>
      <div class="bottom">
        <a href="#" id="register">회원가입</a>　　<a href="#" id="forgot">비밀번호 찾기</a>
      </div>
    </div>
    <div class="scalable" style="height:0px" id="register-scalable">
    	<form id="signupForm" method="post" enctype="multipart/form-data">
      <input type="email" class="form-control" id="register-email" name="id" placeholder="Email 아이디">
      <p class="msg" id="ckIdMsg"></p>
      <input type="text" class="form-control" id="register-name" name="name" placeholder="이름">
      <p class="msg" id="ckNameMsg"></p>
      <div id="drop">
        <a href="#">
          <img id="profile" class="media-object" src="/steach/resources/images/main/profile.jpg" alt="프로필" />
        </a>
      </div>
      <br>
      <div class="fileBox text-center">
        <label for="uploadBtn" class="btn_file">프로필 사진 등록</label>
        <input type="file" name="uploadFile" id="uploadBtn" class="uploadBtn" />
      </div>
      <input type="password" class="form-control" id="register-password"  name="password" placeholder="비밀번호">
      <p class="msg" id="ckPassMsg"></p>   
      <input type="password" class="form-control" id="register-passwordchk" name="passwordchk" placeholder="비밀번호 확인">
      <p class="msg" id="ckPasschkMsg"></p>   
      <button class="btn btn-success btn-lg btn-block" id="signup">회원가입</button>
      </form>
      <div class="bottom">
        <a href="#" class="signinlink">로그인</a>
      </div>
    </div>
    <div class="scalable" style="height:0px" id="findpass-scalable">
    <form id="findpassForm" method="post">
      <input type="text" class="form-control" name="name" id="find-name" placeholder="이름">
      <input type="text" class="form-control" name="id" id="find-email" placeholder="Email 아이디">
      <button class="btn btn-link btn-block" id="findpass">비밀번호 찾기</button>
      </form>
      <input type="password" class="form-control" id="curpassword" placeholder="임시 비밀번호">
      <p class="msg" id="cktempMsg"></p>
      <form id="modipassForm" method="post">
      <input type="password" class="form-control" name="password" id="modipassword" placeholder="변경할 비밀번호">
      <p class="msg" id="cktemppassMsg"></p>
      <input type="password" class="form-control" id="modipasswordchk" placeholder="변경할 비밀번호 확인">
      <p class="msg" id="cktemppasschkMsg"></p>
      <button class="btn btn-success btn-lg btn-block" id="changepass">비밀번호 변경</button>
      </form>
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
// 		console.log(formData)
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
    	
    	$.ajax({
    		url:"/steach/login/sendMail.do",
    		data:$(this).serialize()
    	}).done(function(){
    		swal('임시 비밀번호가 이메일로 전송되었습니다. \n비밀번호 변경을 진행해주세요',"success");
    	}).fail(function(){
    		swal("입력하신 정보에 해당하는 아이디가 없습니다.", "error")
    		$("#find-name").focus();
    	})
      	/* swal("임시 비밀번호가 등록된 메일로 전송되었습니다."); */
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
    
    
    /* $("#changepass").click(function(){
      swal("비밀번호가 변경되었습니다.","로그인화면에서 로그인해주세요.");
    }); */


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
    
//  var idConfirmSwich = 1;	
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
    
    
  </script>
</body>
</html>