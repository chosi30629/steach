<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
        crossorigin="anonymous">
    <link rel="stylesheet" href="/steach/resources/css/class/group/group-activity.css">
    <link rel="stylesheet" href="/steach/resources/css/header/class-header.css">
    <link rel="stylesheet" href="/steach/resources/css/class/group/group-main.css">
    <link rel="stylesheet" href="/steach/resources/css/class/group/animate.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="/steach/resources/js/class/group/wow.min.js"></script>
    <title>GroupMain</title>
</head>
<body>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="pull-left home"><a href="#"><i class="fas fa-home"></i></a></li>
                <li class="pull-left myClassName"><a href="#">클래스명클래스명클래스명클래스명클래스명클래스명클래스명</a></li>
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
                        <li><a href="#">출결현황</a></li>
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
                        <li><a href="#">마이드라이브</a></li>
                        <li class="divider"></li>
                        <li><a href="#">로그아웃</a></li>
                    </ul>
                </li>
                <li class="pull-right myInformation"><a href="#"><i class="fas fa-bell"></i></a></li>
            </ul>
        </div>
    </nav>
    <div class="container clearfix">
        <h3 class="group-main-title">
            &nbsp;<i class="fas fa-users"></i>&nbsp;&nbsp;조별 활동
        </h3>
        <div class="wrap alt">
            <p><textarea name="students" id="students" cols="40" rows="15" readonly></textarea></p>
            <div class="groups text-center clearfix">
                <div class="wrapper">
                    <div class="menu">
                        <ul class="menu__list">
	                        <li class="menu__list__item"><a href="#" class="init">초기화</a></li>
	                        <li class="menu__list__item random-li" data-toggle="modal" data-target="#randomModal"><a class="doRandom" href="#">랜덤 조 편성</a></li>
                        </ul>
                    </div>
                    <div class="button">
                        <span class="button__line"></span>
                        <span class="button__line"></span>
                        <span class="button__line"></span>
                    </div>
                </div>
                <div id="studentList" class="clearfix">
                	<ul class="studentList student-list clearfix text-center" style="width: 70% !important; padding: 0 0 0 0; list-style-type: none; display: inline-block;">
                		<c:forEach var="student" items="${studentList}" varStatus="loop">
	                		<li class="ui-state-default clearfix" style="margin: 0 15px; background-image: url('/steach/resources/images/class/group/p1.jpg');">
	                			<span class="student-name">${student.groupMemberId}</span>
	                		</li>
                		</c:forEach>
                	</ul>
                </div>
                <ul class="connectedSortables parentDrop clearfix" style="display: none;">
                	<%-- <c:forEach var="group" items="${groupList}" varStatus="loop">
	                    <li class="parentDrag">
	                        <div class="listTitle">
	                            <div class="listSubject">
	                                ${group.groupName}
	                            </div>
	                        </div>
	                        <ul class="connectedSortable childDrop">
	                            　				
 							<c:forEach var="member" items="${groupList[loop.index].groupMember}">    
 	                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p1.jpg');">
	                                <span class="student-name">${member.name}</span>
	                            </li> 
	                        </c:forEach>      
	                        </ul>
	                        <div>　</div>
	                    </li>
                    </c:forEach> --%>
                </ul>
            </div>
        </div>
    </div>
    <div class="demo" style="display:none;">
        <div class="demo__colored-blocks">
            <div class="demo__colored-blocks-rotater">
                <div class="demo__colored-block"></div>
                <div class="demo__colored-block"></div>
                <div class="demo__colored-block"></div>
            </div>
            <div class="demo__colored-blocks-inner"></div>
            <div class="demo__text">Stitch</div>
        </div>
        <div class="demo__inner">
            <svg class="demo__numbers" viewBox="0 0 100 100">
                <defs>
                    <path class="demo__num-path-1" d="M40,28 55,22 55,78" />
                    <path class="demo__num-join-1-2" d="M55,78 55,83 a17,17 0 1,0 34,0 a20,10 0 0,0 -20,-10" />
                    <path class="demo__num-path-2" d="M69,73 l-35,0 l30,-30 a16,16 0 0,0 -22.6,-22.6 l-7,7" />
                    <path class="demo__num-join-2-3" d="M28,69 Q25,44 34.4,27.4" />
                    <path class="demo__num-path-3" d="M30,20 60,20 40,50 a18,15 0 1,1 -12,19" />
                </defs>
                <path class="demo__numbers-path" d="M-10,20 60,20 40,50 a18,15 0 1,1 -12,19 
Q25,44 34.4,27.4
l7,-7 a16,16 0 0,1 22.6,22.6 l-30,30 l35,0 L69,73 
a20,10 0 0,1 20,10 a17,17 0 0,1 -34,0 L55,83 
l0,-61 L40,28" />
            </svg>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="randomModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="randomTitle">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h3 class="modal-title" id="myModalLabel">&nbsp;<i class="fas fa-users-cog"></i>&nbsp;&nbsp;랜덤 조 편성</h3>
                    </div>
                    <br>
                    <div class="randomContent clearfix">
                        <div class="input-group">
                            <input class="numgroups form-control" type="integer" value="" placeholder="조별 학생 수"/>
                            <span class="input-group-btn">
                                <button class="btn btn-default onRandom">편성</button>
                            </span>
                        </div><!-- /input-group -->
                        <h5>※ 랜덤 편성 후 조정 가능합니다.</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        // wow.js
        new WOW().init();
        
        // 클래스 멤버 textarea(랜덤 설정 해주는 곳)에 뿌리기
        if(${groupNo} != 0) {
        	$("#studentList, .parentDrop").toggle();
        }
        var students = "";
        
		<c:forEach var="student" items="${classMember}" varStatus="loop">
			students += "${student.user.name}" + "[" + "${student.id}" + "]"; 
			<c:if test="${loop.last == false}">
				students += "\n"; 
			</c:if>
		</c:forEach>
		
		$("#students").text(students);
		
		// 그룹 뿌려주기
		group();
		function group() {
			var group = "";
			<c:forEach var="group" items="${groupList}" varStatus="loop">
				group += '<li class="parentDrag" data-index="${group.groupNo}">'
		            + '<div class="listTitle">'
		            +     '<div class="listSubject">'
		            +         '${group.groupName}'
		            +     '</div>'
		            + '</div>'
		            + '<ul class="connectedSortable childDrop">'
		                　		+ '　'
		           	+ ' <c:forEach var="member" items="${groupList[loop.index].groupMember}">  '  
		                　		+      '<li class="ui-state-default clearfix" data-groupNo="${member.groupNo}" data-index="${member.groupMemberNo}" data-order="${member.groupMemberOrder}" style="background-image: url(/steach/resources/images/class/group/p1.jpg);">'
		                　		+         '<span class="student-name">${member.name}</span>'
		                　		+     '</li>'
		            + ' </c:forEach>'  
		            + '</ul>'
		            + '<div>　</div>'
		            + '</li>'
	    	</c:forEach>
			$(".parentDrop").html(group);
		};
        
        $(function () {
            $(".childDrop").sortable({
                connectWith: ".childDrop",
                placeholder: "ui-state-highlight",
                update: function(event, ui) {
					$(this).children().each(function(index) {
						$(this).attr("data-order", (index + 1)).addClass("updated");
					});
					
					saveNewMemberOrders();
				}
            }).disableSelection();
        });
        
        // 조별 인원 위치 변경 데이터베이스 저장
        function saveNewMemberOrders() {
			var map = new Map();
        	
			$(".updated").each(function() {
        		map.set($(this).attr("data-index"), [$(this).attr("data-order"), $(this).parents(".parentDrag").attr("data-index")]);
        		$(this).removeClass("updated");
			}); 

            var orders = {};
			
            map.forEach(function(value, key) {
            	orders[key] = value;
            });
            
         	$.ajax({
        		url: "/steach/class/group/modifyMemberOrder.do",
        		data: {"orders": JSON.stringify(orders)},
        		success: function(response) {
					console.log(response);
				}
        	});
        }
        
        // 랜덤 조 편성
        $(".doRandom").on("click", function() {
        	$(".numgroups").val("");
		});
        
        $('.onRandom').on('click', function(e) {
            e.preventDefault();
            if ($(".numgroups").val() == '') {
                alert("학생 수를 입력하십시오.");
                return false;
            }
            
            $("#studentList").remove();
            $(".parentDrop").show();
            
            $(".button").click();
            $("#randomModal").modal("hide");

            $("body").css("background", "#32386D");
            $(".demo").css("display", "block");
            $(".container").css("display", "none");

            setTimeout(function () {
                $(".container").css("display", "block");
                $("body").css("background", "none");
                $(".demo").css("display", "none");
            }, 3640);

			
            $.ajax({
            	url: "/steach/class/group/randomGroup.do",
            	data: {
            		groupSize: $(".numgroups").val(),
            		classNo: 1
            	}
            })
            .done(function(result) {
				console.log(result);
				
				var html = "";
				for (let i = 0; i < result.length; i++) {
					let group = result[i];
					html += '<li class="parentDrag wow wobble" data-index="' + group.groupNo + '">'
			             + '<div class="listTitle">'
			             +     '<div class="listSubject">'
			             +         group.groupName
			             +     '</div>'
			             + '</div>'
			             + '<ul class="connectedSortable childDrop">'
			                　		 + '　';
					
			        var groupMemberList = group.groupMember;
			        for (let k = 0; k < groupMemberList.length; k++) {
			        	groupMemberList[k]     		
			            html += '<li class="ui-state-default clearfix" data-groupNo="' + groupMemberList[k].groupNo + '" data-index="' + groupMemberList[k].groupMemberNo + '" data-order="' + groupMemberList[k].groupMemberOrder + '" style="background-image: url(/steach/resources/images/class/group/p1.jpg);">'
			          		 +         '<span class="student-name">' + groupMemberList[k].name + '</span>'
			                　			 +     '</li>';
			        }
			        html +=  '</ul>'
			             + '<div>　</div>'
			             + '</li>';
				}
				
				console.log("-----------------------------");
				console.log(html)
				console.log("88888888888888888888888888888888888888888888888888888888888888888888888888");
				$(".parentDrop").prepend(html);
	            
	            $(function () {
	                $(".childDrop").sortable({
	                    connectWith: ".childDrop",
	                    placeholder: "ui-state-highlight",
	                    update: function(event, ui) {
	    					$(this).children().each(function(index) {
	    						$(this).attr("data-order", (index + 1)).addClass("updated");
	    					});
	    					
	    					saveNewMemberOrders();
	    				}
	                }).disableSelection();
	            });
            
	            $(".parentDrag:nth-child(1n) .childDrop").addClass("wow rotateInDownLeft");
	            $(".parentDrag:nth-child(2n) .childDrop").addClass("wow rotateInDownRight");
	            $(".parentDrag:nth-child(3n) .childDrop").addClass("wow slideInLeft");
	            $(".parentDrag:nth-child(4n) .childDrop").addClass("wow slideInRight");
	            $(".parentDrag:nth-child(5n) .childDrop").addClass("wow rotateInUpLeft");
	            $(".parentDrag:nth-child(6n) .childDrop").addClass("wow rotateInUpRight");
			}); 
        });
        
        // 초기화
        $(".init").click(function(e) {
            e.preventDefault();
            
            if(confirm("정말로 조를 초기화하시겠습니까?") == false) {
                return false;
            }
            
            $(".button").click();
            $(".parentDrop").empty();
            
            $(function() {
                $(".childDrop").sortable({
                    connectWith: ".childDrop",
                    placeholder: "ui-state-highlight"
                }).disableSelection();
            });
        });

        // function to trigger animation
        document.querySelector('.button').addEventListener('click', () => {
        document.querySelector('.menu__list')
            .classList.toggle('menu__list--animate');
        });

        $('ul.nav li.dropdown').hover(function () {
            $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeIn(200);
        }, function () {
            $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeOut(200);
        });

        $("body").on("click", ".listTitle", function() {
            location.href = "groupActivity.do";
        });
        
        $("a[href='lecture']").click(function(){
        	location.href="<c:url value='/class/lecture/lecture.do'/>";
        })
        
         $("a[href='member']").click(function(){
        	location.href="<c:url value='/class/member/member.do'/>";
        })
    </script>
</body>
</html>