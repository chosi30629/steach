<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/steach/resources/css/class/group/group-activity.css">
    <title>GroupMain</title>
	<c:import url="/WEB-INF/jsp/header/classHeader.jsp"/>
    <link rel="stylesheet" href="/steach/resources/css/class/group/group-main.css">
    <link rel="stylesheet" href="/steach/resources/css/class/group/animate.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="/steach/resources/js/class/group/wow.min.js"></script>
</head>
<body>
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
                <div id="studentList" class="clearfix" style="display: none;">
                	<ul class="studentList student-list clearfix text-center" style="width: 70% !important; padding: 0 0 0 0; list-style-type: none; display: inline-block;">
                		<c:forEach var="member" items="${classMember}" varStatus="loop">
	                		<li class="ui-state-default clearfix" style="margin: 0 15px; background-image: url('${member.user.profilePath}');">
	                			<span class="student-name">${member.user.name}</span>
	                		</li>
                		</c:forEach>
                	</ul>
                </div>
                <ul class="connectedSortables parentDrop clearfix" style="display: none;">
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
            <div class="demo__text">Steach</div>
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
        // wow.js 효과
        new WOW().init();
        
        // 클래스 번호
        var classNo = "${classNo}";        
        
        // 학생일 때 랜덤 조 편성 및 초기화 버튼 가리기
        <c:forEach var="studentId" items="${classMember}">
        	<c:if test="${user.id == studentId.id}">
	        	$(".wrapper").hide();
        	</c:if>
        </c:forEach>
        
        // 조가 편성되지 않았을 때 클래스 멤버들 보여주기
        if(parseInt("${groupCount}") != 0) {
        	$(".parentDrop").show();
        	$("#studentList").hide();
        } else {
        	$("#studentList").show();
        	$(".parentDrop").hide();
        }
        
     	// 클래스 멤버를 랜덤 조 편성 해주는 곳(textarea)에 설정
        var students = "";
		<c:forEach var="student" items="${classMember}" varStatus="loop">
			students += "${student.user.name}" + "[" + "${student.id}" + "]"; 
			<c:if test="${loop.last == false}">
				students += "\n"; 
			</c:if>
		</c:forEach>
		$("#students").text(students);
		
		// 편성된 그룹 화면에 설정 
		group();
		function group() {
			var group = "";
			<c:forEach var="group" items="${groupList}" varStatus="loop">
				group += '<li class="parentDrag" data-index="${group.groupNo}">'
		            + '<div class="listTitle">'
		            +     '<div class="listSubject text-center">'
		            +         '<span class="group-name"  contenteditable="true">${group.groupName}</span>'
		            +     '</div>'
		            +     '<div><button class="btn btn-default btn-sm modify-group-name" style="display: none; float: right;">입장</button></div>'
		            + '</div>'
		            + '<div class="groupNameForm text-center"><div class="input-group">'
		            + '<input type="text" class="form-control modify-group-name-input" value="${group.groupName}">'
		            + '<span class="input-group-btn"><button class="btn btn-default on-modify-group-name" type="button">수정</button></span></div></div>'
		            + '<ul class="connectedSortable childDrop">'
		                　		+ '　'
		           	+ ' <c:forEach var="member" items="${groupList[loop.index].groupMember}">  '  
		                　		+      '<li class="ui-state-default clearfix" data-groupNo="${member.groupNo}" data-index="${member.groupMemberNo}" data-order="${member.groupMemberOrder}" data-id="${member.groupMemberId}" style="background-image: url(${member.profilePath});">'
		                　		+		'<c:if test="${member.gNo == 3 && member.pNo == 1001}">'
		                　		+         '<span class="student-name"><i class="fas fa-crown"></i>${member.name}</span>'
		            +		'</c:if>'     		
		            +		'<c:if test="${member.gNo != 3 && member.pNo != 1001}">'
		                　		+         '<span class="student-name">${member.name}</span>'
		                　		+		'</c:if>'     	
		            + 		'<div class="commission-leader">조장 위임</div>'
		                　		+     '</li>'
		            + ' </c:forEach>'  
		            + '</ul>'
		            + '<div>　</div>'
		            + '</li>'
	    	</c:forEach>
			$(".parentDrop").html(group);
			$(".parentDrag").hide();
			$(".ui-state-default[data-id='${user.id}']").parents(".parentDrag").show();
			if("${clazz.master}" == "${user.id}") {
				$(".parentDrag").show();
			}
		};
        
		// 드래그 앤 드롭을 위한 함수(DB에 변경된 학생 위치 저장하는 함수 설정)
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
        
        // 조별 인원 위치 변경 시 DB에 저장
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
            
            $("#studentList").hide();
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
            		"groupSize": $(".numgroups").val(),
            		"classNo": classNo
            	}
            })
            .done(function(result) {
				console.log(result);
				
				var html = "";
				for (let i = 0; i < result.length; i++) {
					let group = result[i];
					html += '<li class="parentDrag wow wobble" data-index="' + group.groupNo + '">'
			             + '<div class="listTitle">'
			             +     '<div class="listSubject text-center">'
			             +         '<span class="group-name" contenteditable="true">' + group.groupName + '</span>'
			             +     '</div>'
			             +     '<div><button class="btn btn-default btn-sm modify-group-name" style="display: none; float: right;">입장</button></div>'
			             + '</div>'
			             + '<div class="groupNameForm text-center"><div class="input-group">'
			             + '<input type="text" class="form-control modify-group-name-input" value="' + group.groupName + '">'
			             + '<span class="input-group-btn"><button class="btn btn-default on-modify-group-name" type="button">수정</button></span></div></div>'
			             + '<ul class="connectedSortable childDrop">'
			                　		 + '　';
					
			        var groupMemberList = group.groupMember;
			        for (let k = 0; k < groupMemberList.length; k++) {
			        	groupMemberList[k]     		
			            html += '<li class="ui-state-default clearfix" data-groupNo="' + groupMemberList[k].groupNo + '" data-index="' + groupMemberList[k].groupMemberNo + '" data-order="' + groupMemberList[k].groupMemberOrder + '" style="background-image: url(' + groupMemberList[k].profilePath + ');">'
			          		 +         '<span class="student-name">' + groupMemberList[k].name + '</span>'
			          		 + 		'<div class="commission-leader">조장 위임</div>'
			                　			 +     '</li>';
			        }
			        html +=  '</ul>'
			             + '<div>　</div>'
			             + '</li>';
				}
				
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
        
        // 조 초기화
        $(".init").click(function(e) {
            e.preventDefault();
            
            if(confirm("정말로 조를 초기화하시겠습니까?") == false) {
                return false;
            }
            
            $(".button").click();
            
            $.ajax({
            	url: "/steach/class/group/initClassGroup.do",
               	data: {"classNo": classNo}
            })
            .done(function(result) {
				console.log(result);
	        	$("#studentList").show();
	        	$(".parentDrop").hide();
			});
        });

        // 랜덤 조 편성 시 카운터 애니메이션
        document.querySelector('.button').addEventListener('click', () => {
        document.querySelector('.menu__list')
            .classList.toggle('menu__list--animate');
        });
		
        // 조 이름에 마우스오버 시 입장 할 수 있는 버튼 보이기 
        $("body").on("mouseover", ".listTitle", function() {
            $(this).find("div").find(".modify-group-name").show();
            $(this).mouseleave(function() {
                $(this).find("div").find(".modify-group-name").hide();
            });
        });
        
     	// 해당 조 입장
        $("body").on("click", ".modify-group-name", function(e) {
        	var groupNo = $(this).parents(".parentDrag").attr("data-index");
            location.href = "groupActivity.do?classNo=${clazz.classNo}&groupNo=" + groupNo;
        });
        
        // 수정할 조 이름 설정 후 영역에서 나갈 시 조 이름 수정 
        $("body").on("blur", ".group-name", function(e) {
            var modifyGroupNo = $(this).parent().parent().parent().attr("data-index");
            $.ajax({
            	url: "/steach/class/group/modifyGroupName.do",
            	data: {"groupNo": modifyGroupNo, "groupName": $(this).html()}
            })
            .done(function(result) {
				console.log(result);
			}); 
        });
        
     	// 수정할 조 이름 설정 후 영역에서 엔터 시 조 이름 수정
        $("body").on("keydown", ".group-name", function(e) {
            var modifyGroupNo = $(this).parent().parent().parent().attr("data-index");
	        	if (e.keyCode === 13) {
	            $.ajax({
	            	url: "/steach/class/group/modifyGroupName.do",
	            	data: {"groupNo": modifyGroupNo, "groupName": $(this).html()}
	            })
	            .done(function(result) {
					console.log(result);
				}); 
	            $(this).blur();
	            return false;
       	 	}
        });
        
     	// 조원 우클릭 시
     	$("body").on("contextmenu", ".ui-state-default", function(e) {
     		e.preventDefault();
			$(this).find(".commission-leader").toggle();
		});
        
        $(document).mouseup(function (e) {
            var container = $('.ui-state-default');
            if (container.has(e.target).length === 0) {
                $(container).find(".commission-leader").hide();
            }
        });
     	
        // 조장 위임
        $("body").on("click", ".commission-leader", function(e) {
			var groupNo = $(this).parent().attr("data-groupno");
			var memberNo = $(this).parent().attr("data-index");
			var name = $(this).siblings(".student-name").text().trim();
			
			$("li[data-groupno='" + groupNo + "']").find("i").remove();
			$("li[data-index='" + memberNo + "']").find(".student-name").html("<i class='fas fa-crown'></i>" + name);
			$(this).hide();
			
			$.ajax({
				url: "/steach/class/group/commissionGroupLeader.do",
				data: {"groupNo": groupNo, "groupMemberNo": memberNo}
			})
			.done(function(result) {
				console.log(result);
			});
		});
        
     	// 헤더 드랍다운 효과
        $('ul.nav li.dropdown').hover(function () {
            $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeIn(200);
        }, function () {
            $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeOut(200);
        });

        // 그룹 메인 페이지 네이비게이션 고정
        $(".navbar").addClass("navbar-fixed-top");
    </script>
</body>
</html>