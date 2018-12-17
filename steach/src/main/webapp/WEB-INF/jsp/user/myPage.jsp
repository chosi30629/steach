<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" 
    		integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
    		crossorigin="anonymous">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/steach/resources/css/user/mypage.css">
    <link rel="stylesheet" href="/steach/resources/css/user/help_member.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="navbar-collapse">
		<ul class="nav navbar-nav">
			<li class="pull-left home"><a href="/steach/main/main.do"><i class="fas fa-home"></i></a></li>
			<li class="pull-left myClassName"><a href="#">STEACH</a></li>
			<li class="pull-right dropdown myNotification"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fas fa-user"></i></a>
				<ul class="dropdown-menu myNotificationMenu">
					<li><a href="#">마이페이지</a></li>
					<li class="divider"></li>
					<li><a href='<c:url value="/drive/drive.do"/>'>마이드라이브</a></li>
					<li class="divider"></li>
					<li><a href='<c:url value="/login/logout.do"/>'>로그아웃</a></li>
				</ul></li>
			<li class="pull-right myInformation"><a href="#"><i class="fas fa-bell"></i></a></li>
		</ul>
	</div>
	</nav>
	<div class="container" style="margin-top: 100px">
		<h3>MyPage</h3>
		<div class="member_basic_info">
			<div id="content" class="section_home">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<div class="sh_group" style="height: 300px">
								<div class="sh_header">
									<h2>
										<i class="fas fa-user"></i> 프로필
									</h2>
								</div>
								<div class="sh_content">
									<div id="drop" style="float: left; width: 40%; height: 250px;">
										<a href="#" style="margin: auto; width: 180px; height: 180px">
											<c:choose>
												<c:when test="${empty mypage.profile}">
													<img id="profile" class="media-object"
														src="/steach/resources/images/main/profile.jpg" alt="프로필"
														style="margin: auto; width: 180px; height: 180px" />
												</c:when>
												<c:otherwise>
													<img id="profile" class="media-object"
														src="${mypage.profilePath}" alt="프로필"
														style="margin: auto; width: 170px; height: 170px" />
												</c:otherwise>
											</c:choose>
										</a>
										<div class="fileBox" style="margin: auto; text-align: center">
											<label for="uploadBtn" class="btn_file">프로필 사진 수정</label>
											<input type="file" name="uploadFile" id="uploadBtn" class="uploadBtn" />
										</div>
									</div>
									<div id="profilecontent"
										style="padding-top: 20px; float: right; width: 60%; height: 250px;">
										<table class="table">
											<tr>
												<th>이름</th>
												<td>${mypage.name}</td>
											</tr>
											<tr>
												<td></td>
											</tr>
											<tr>
												<th colspan="2">자기소개</th>
											</tr>
											<tr style="display: none">
												<td colspan="2"><textarea style="width: 100%"></textarea>
													<button class="btn btn-default btn-sm">수정</button>
													<button class="btn btn-default btn-sm">취소</button></td>
											</tr>
											<tr>
												<td colspan="2"><textarea
														style="width: 100%; border: 0px">안녕하세요</textarea>
													<div style="float: right; padding-top: 5px;">
														<button class="btn btn-default btn-sm">수정</button>
														<button class="btn btn-default btn-sm">취소</button>
													</div></td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="sh_group" style="height: 300px">
								<div class="sh_header">
									<h2>
										<i class="fas fa-user"></i> 프로필
									</h2>
								</div>
								<div class="sh_content">
									<div id="profilecontent">
										<table class="table">
											<tr>
												<th>이메일아이디</th>
												<td>${mypage.id}</td>
											</tr>
											<tr>
												<th>비밀번호</th>
												<td>
													<button class="btn btn-default btn-sm active" id="modipassbtn">수정</button>
												</td>
											</tr>
											<tr>
												<th>휴대전화</th>
												<td class="phonenum1">
												<c:choose>
													<c:when test="${mypage.phone eq null}">
	        	                        			-　<button class="btn btn-default btn-sm active" id="modiphonebtn">등록</button></td>
												</c:when>
												<c:otherwise>
	        	                        		${mypage.phone}　<button class="btn btn-default btn-sm active" id="modiphonebtn">수정</button></td>
												</c:otherwise>
												</c:choose>
												<td class="phonenum2" style="display: none">
												<input type="text" class="inputphone" id="modiphonenum" placeholder="번호를 입력하세요"> 
												<c:choose>
													<c:when test="${mypage.phone eq null}">
														<button class="btn btn-default btn-xs active" id="modiphonecomplete">등록</button>
													</c:when>
													<c:otherwise>
														<button class="btn btn-default btn-xs active" id="modiphonecomplete">수정</button>
													</c:otherwise>
													</c:choose>
													<button class="btn btn-default btn-xs" id="modiphonecanclebtn">취소</button></td>
											</tr>
											<tr>
												<th>주소</th>
												<td class="addr1">
												<c:choose>
													<c:when test="${mypage.addr eq null}">
                                					-　<button class="btn btn-default btn-sm active" id="modiaddrbtn">등록</button></td>
												</c:when>
												<c:otherwise>
                                				${mypage.addr}　<button class="btn btn-default btn-sm active" id="modiaddrbtn">수정</button></td>
												</c:otherwise>
												</c:choose>
												<td class="addr2" style="display: none">
													<input type="text" class="inputaddr" id="modiaddr"placeholder="지역을 입력해주세요"> 
													<c:choose>
														<c:when test="${mypage.addr eq null}">
															<button class="btn btn-default btn-xs active" id="modiaddrcomplete">등록</button>
														</c:when>
														<c:otherwise>
															<button class="btn btn-default btn-xs active" id="modiaddrcomplete">수정</button>
														</c:otherwise>
													</c:choose>
													<button class="btn btn-default btn-xs" id="modiaddrcanclebtn">취소</button></td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="sh_group">
								<div class="sh_header">
									<h2>
										<i class="fas fa-book-reader"></i> 강의중인 클래스
									</h2>
								</div>
								<div class="sh_content">
									<c:choose>
										<c:when test="${empty teaching}">
											<p class="contxt">현재 강의중인 클래스가 없습니다.</p>
										</c:when>
										<c:otherwise>
											<table class="table">
												<thead>
													<tr>
														<th>클래스명</th>
														<th>과정기간</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="teach" items="${teaching }">
														<tr>
															<td><a href="#" data-no="${teach.classNo}">${teach.className}</a></td>
															<td class="time">${teach.beginDate}~
																${teach.endDate}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="sh_group">
								<div class="sh_header">
									<h2>
										<i class="fas fa-book-reader"></i> 수강중인 클래스
									</h2>
								</div>
								<div class="sh_content">
									<c:choose>
										<c:when test="${empty studying }">
											<p class="contxt">현재 수강중인 클래스가 없습니다.</p>

										</c:when>
										<c:otherwise>
											<table class="table">
												<thead>
													<tr>
														<th>클래스명</th>
														<th>과정기간</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="study" items="${studying }">
														<tr>
															<td><a href="#" data-no="${study.classNo}">${study.className}</a></td>
															<td class="time">${study.beginDate}~
																${study.endDate}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
    <div class="modal modal-center fade" id="modipassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-center" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalCenterTitle"><i class="fas fa-user-cog"></i> 비밀번호 변경하기</h4>

                </div>
                <div class="modal-body">
                    <input type="password" class="form-control" id="pwd1" style="width: 100%; margin-bottom:5px;" placeholder="현재 비밀번호">
                    <input type="password" class="form-control" id="pwd2" style="width: 100%; margin-bottom:5px;" placeholder="새로운 비밀번호">
                    <input type="password" class="form-control" id="pwd22" style="width: 100%" placeholder="새로운 비밀번호 확인">
                    <p id="password_message"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="submit_pwd">수정하기</button>
                    <button type="button" class="btn btn-link" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>


<script>
	var id = "${user.id}";
	var phone = "${mypage.phone}"
	
	var teaching = "${teaching}";
	console.log(teaching)
	var studying = "${studying}";
	console.dir(studying)


    $('ul.nav li.dropdown').hover(function () {
        $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeIn(200);
    }, function () {
        $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeOut(200);
    });

    $(document).ready(function () {
        $("#modipassbtn").on("click", function () {
            $("#modipassword").modal('toggle')
        });
    });

    $(function () {
        $("#datepicker1, #datepicker2").datepicker();
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
            setTimeout(function () {
              conf = confirm("수정하시겠습니까?");
              if (conf == false) { location.href = "myPage.do"; return; }

              var formData = new FormData();
              var inputFile = $("input[name='uploadFile']")
              console.log(inputFile)
              var files = inputFile[0].files;
//               var id = $("#userId").val();
              formData.append("uploadFile", files[0]);
              console.log(formData)
              $.ajax({
                url: "/steach/user/profileImg.do",
                processData: false,
                contentType: false,
                data: formData,
                type: "POST"
              })
                .done(function (result) {
                	alert("수정되었습니다.")
                  location.href = "myPage.do";
                });
            }, 10)
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
    
    $("#modiphonebtn").click(function(){
        $(".phonenum1").css("display", "none");
        $(".phonenum2").css("display", "block");
    });
    $("#modiphonecomplete").click(function(){
    	var num = $("#modiphonenum").val()
        
        $.ajax({
 			url:"/steach/user/phonenum.do",
 			data:{
 				id:id,
 				phone:num
 			}
 		})
        .done(function(){
        	$("#modiphonenum").val("")
            $(".phonenum2").css("display", "none");
            $(".phonenum1").html(num+'　<button class="btn btn-default btn-sm active" id="modiphonebtn">수정</button>')
            $(".phonenum1").css("display", "block");
        })
    });
    
    $("#modiphonecanclebtn").click(function(){
        $(".phonenum2").css("display", "none");
        $(".phonenum1").css("display", "block");
    })
    $("#modiaddrbtn").click(function(){
        $(".addr1").css("display", "none");
        $(".addr2").css("display", "block");
    });
    
    $("#modiaddrcomplete").click(function(){
    	var addr = $("#modiaddr").val()
        
        $.ajax({
 			url:"/steach/user/addr.do",
 			data:{
 				id:id,
 				addr:addr
 			}
 		})
        .done(function(){
        	$("#modiaddr").val("")
            $(".addr2").css("display", "none");
            $(".addr1").html(addr+'　<button class="btn btn-default btn-sm active" id="modiaddrbtn">수정</button>')
            $(".addr1").css("display", "block");
        })
    });
    
    $("#modiaddrcanclebtn").click(function(){
        $(".addr2").css("display", "none");
        $(".addr1").css("display", "block");
    })

	
    // 현재비밀번호 확인
    $("#pwd1").on("input", function() {
	var curpass = $("#pwd1").val();
		console.log(curpass)
		$.ajax({
			url : "/steach/user/passCheck.do",
			type:"post",
			data : {
				id:id,
				curpass:curpass
			}
		}).done(function(result) {
			console.log(result)
			if (result) {
				$("#password_message").html("<span style='color: green;'>비밀번호가 일치합니다.</span>")
			} else {
				$("#password_message").html("<span style='color: red;'>현재 비밀번호를 입력해주세요.</span>")
			}

		})

	});
 // 변경비밀번호 입력
	$("#pwd2").on("input", function() {
		var password = $("#pwd2").val();
		var passwordchk = $("#pwd22").val();
		if(password.length < 8 || password.length > 16) {
			$("#password_message").html("<span style='color: red;'>비밀번호를 8~16자까지 입력해주세요.</span>");

			return false;
		} else {
			$("#password_message").html("<span style='color: green;'>사용 가능한 비밀번호입니다.</span>");
		}
		
	});
	
	// 변경비밀번호 확인 입력
	$("#pwd22").on("input", function() {
		var password = $("#pwd2").val();
		var passwordchk = $("#pwd22").val();
		if(password == passwordchk) {
			$("#password_message").html("<span style='color: green;'>비밀번호가 확인되었습니다.</span>");
		} else {
			$("#password_message").html("<span style='color: red;'>비밀번호가 일치하지 않습니다.</span>");

			return false;
		}
	});
    
    // 비밀번호 수정하기
    $(document).on("click", '#submit_pwd', function () {
    	var pwd1 = $('#pwd1').val();
    	console.log(pwd1)
    	var pwd2 = $('#pwd2').val();
        var pwd22 = $('#pwd22').val();

    	if  ( !pwd1 )
        {
    		$("#password_message").html("<span style='color: red;'>현재 비밀번호를 입력해주세요.</span>");
	        $pwd1.focus();
	        return ;
	    }
    	if  ( !pwd2 )
        {
    		$("#password_message").html("<span style='color: red;'>새로운 비밀번호를 입력해주세요.</span>");
	        $pwd2.focus();
	        return ;
	    }
    	if  ( !pwd22 )
        {
    		$("#password_message").html("<span style='color: red;'>새로운 비밀번호를 한번더 입력해주세요.</span>");
	        $pwd22.focus();
	        return ;
	    }
    	$.ajax({
 			url:"/steach/user/modipass.do",
 			data:{
 				id:id,
 				password:pwd2
 			}
 		}).done(function(result){
 			$('#pwd1').val("");
 	    	$('#pwd2').val("");
 	        $('#pwd22').val("");
 	       $("#password_message").html("")
 	        $("#modipassword").modal("hide")

 		})
    });
    // 비번체크
    var passwordChkResult = false;
	var password1ChkResult = false;
    function check_password()
    {
    	var password = $('#pwd2').val();
        var old_password = $('#pwd1').val();

        // reset password1
        //$('#password1').val('');
        $("#password_message").text('');
        password1ChkResult = false;

        // check password
                    var pwdChk = chkPassword_change(password, "lucky23", old_password);
        
        passwordChkResult = pwdChk['flag'];
        password1ChkResult = pwdChk['flagR'];
        $("#password_message").text(pwdChk['msg']);
    }
    
    
/*     function mypage(){
    	var id = "${user.id}";
    	console.log(id);
    	$.ajax({
    		url:"/steach/user/myPage.do",
    		data:"id="+id
    	})
    	.done(function(result){
    		console.log(result)
    	})
    }
    mypage();
     */
</script>
</body>
</html>