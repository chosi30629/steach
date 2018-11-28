<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>groupActivity</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">  
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.3/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" href="/steach/resources/css/class/group/group-activity.css">
    <link rel="stylesheet" href="/steach/resources/css/header/class-header.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.3/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="/steach/resources/js/jquery-dateformat.js"></script>
    <style type="text/css">
    .modal-backdrop {
    	position: fixed;
    }
    </style>
</head>
<body>
    <nav class="navbar navbar-default navbar-fixed-top">
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
    <div class="clearfix groupName">
        <h3>비트캠프 2조</h3>
    </div>
    <div class="wrapper clearfix">
        <ul class="connectedSortables parentDrop clearfix">
        	
        </ul>
        <div class="addList">
            <div class="addListBtn">+ 목록 추가</div>
            <div class="addListForm" style="display: none;">
                <textarea class='addListTextarea'>
                </textarea>
                <div>
                    <button class='btn btn-default onAddList'>
                        추가
                    </button>
                    <a>
                        <i class='fas fa-times addListCancel'>
                        </i>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal-div">

    </div>
    <section class="avenue-messenger">
        <div class="menu">
            <div class="items">
                <span>
                <a href="#" class="minimize" title="Minimize">&mdash;</a><br>
                <a href="#" class="plus" title="End Chat">&#10005;</a>
                </span>
            </div>
            <div class="chat-button"><i class="fas fa-caret-down"></i></div>
        </div>
        <div class="agent-face">
            <div class="half">
            <img class="agent circle" src="/steach/resources/images/class/group/pl.png" alt="Jesse Tino"></div>
        </div>
        <div class="chat">
            <div class="chat-title">
                <h1>조성일</h1>
            </div>
            <div class="messages">
                <div class="messages-content"></div>
            </div>
            <div class="message-box">
                <textarea type="text" class="message-input" placeholder="메시지를 입력하세요"></textarea>
                <button type="button" class="message-submit">
                    <i class="fas fa-arrow-circle-up"></i>
                </button>
            </div>
        </div>
    </section>

    <script>
		var $parentDrop = $(".parentDrop");
		var $modalDiv = $(".modal-div");
		var nextLastListOrder = 0;
		
    	// 리스트 및 카드 목록 표현
    	function listListAndCardList() {
			$.ajax({
				url: "/steach/class/group/groupActivityList.do"
			})
			.done(function(result) {
				var listList = result.listList;
				var cardList = result.cardList;
				
				nextLastListOrder = listList.length + 1;
				
				$parentDrop.empty();
				$modalDiv.empty();
				
 				for(var i = 0; i < listList.length; i++) {
					$parentDrop.append('<li class="parentDrag" data-index="' + listList[i].listNo + '" data-order="' + listList[i].listOrder + '">' + '<div class="listTitle"><div class="listSubject">' + listList[i].listTitle + '</div>' + '<span class="listSubjectForm" style="display: none;"><textarea class="modifyListForm">' + listList[i].listTitle + '</textarea><button class="btn btn-default btn-xs modifyListFormBtn">수정</button></span>' + '<div class="btn-group"><div class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>' + '<ul class="dropdown-menu" role="menu"> <li class="text-center"><a class="modifyList" href="#">수정</a></li><li class="divider"></li><li class="text-center"><a class="removeList" href="#">삭제</a></li></ul></div></div>' + '<ul class="connectedSortables childDrop" id="childDrop' + i + '">' + '　' + '</ul><div class="addCard">+ 카드 추가</div><div class="addCardForm" style="display: none;"><textarea class="addCardTextarea"></textarea><div><button class="btn btn-default onAddCard">추가</button><a><i class="fas fa-times addCardCancel"></i></a></div></div></li>');
					
					for(var j = 0; j < cardList.length; j++) {
						if(cardList[j].cardContent == null) {
							cardList[j].cardContent = "<a class='cardContent-null' href='#'>내용을 등록하세요.</a>";	
						}
						if(listList[i].listNo == cardList[j].listNo) {
							// $("#childDrop" + i).append('<li data-toggle="modal" data-target="#cardModal" data-listNo="' + cardList[j].listNo + '" data-index="' + cardList[j].cardNo + '" data-order="' +  cardList[j].cardOrder + '">' + cardList[j].cardTitle + '</li>');
							$("#childDrop" + i).append('<li data-toggle="modal" data-target="#cardModal' + j + '" data-listNo="' + cardList[j].listNo + '" data-index="' + cardList[j].cardNo + '" data-order="' +  cardList[j].cardOrder + '">' + cardList[j].cardTitle + '</li>');
							$modalDiv.append('<div class="modal fade" id="cardModal' + j + '" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-body"><div class="cardTitle clearfix"><button type="button" class="close" data-dismiss="modal" aria-label="Close" style="position: relative; z-index: 1;"><span aria-hidden="true">&times;</span></button><h3 class="modal-title" id="myModalLabel" style="position: relative; top: 13px;"><i class="far fa-credit-card"></i>　<span class="cardTitle-span">' + cardList[j].cardTitle + '</span><span class="cardTitleForm" style="display: none;"><input type="text" class="modifyCardForm" value="' + cardList[j].cardTitle + '"/></span> </h3><span style="float: right;">' + $.format.date(cardList[j].cardRegDate, "yyyy-MM-dd HH:mm:ss") + '</span></div><hr><div class="cardContent clearfix"><h4 class="modal-title"> <i class="far fa-sticky-note"></i>　내용<div class="btn-group" style="float: right;"><div class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div><ul class="dropdown-menu" role="menu"> <li class="text-center"><a id="modifyCard' + j + '" class="modifyCard" href="#">수정</a></li><li class="divider"></li><li class="text-center"><a class="removeCard" href="#">삭제</a><input type="hidden" class="removeCardNo" data-cardNo="' + cardList[j].cardNo + '"/></li></ul></div></h4><div class="clearfix cardContent-div"><span id="cardContent' + j + '" class="cardContent-span" style="white-space: pre-line;">' + cardList[j].cardContent + '</span></div><div class="clearfix cardContent-form" style="display: none;"><textarea id="cardContent-textarea' + j + '" class="cardContent-textarea">' + cardList[j].cardContent + '</textarea><div class="md-rv-bnt" style="float: right;"><button id="onModifyCardContent' + j + '" class="btn btn-default onModifyCardContent">수정</button><input type="hidden" class="cardNo" data-cardNo="' + cardList[j].cardNo + '"/></div></div></div><hr><div class="cardFile clearfix"><h4 class="modal-title"><i class="fas fa-paperclip"></i>　첨부 파일</h4><div class="attachbox" style="min-width: 568px; min-height: 80px; border: 1px solid #ccc; border-radius: 3px; margin-top: 10px; margin-bottom: 15px;"><div class="filebox"><div class="upload-name" disabled="disabled" style="overflow: scroll"></div><label for="my_filename"><i class="fas fa-hdd"></i></label><input type="file" id="my_filename" multiple class="upload-hidden"></div><div class="filebox"><div class="upload-name" disabled="disabled" style="overflow: scroll"></div><label for="drive_filename"><i class="fab fa-google-drive"></i></label><input type="file" id="drive_filename" multiple class="upload-hidden"></div></div></div><hr><div class="check-list"><h4 class="modal-title" style="margin-bottom: 10px;"><i class="far fa-check-square"></i>　체크리스트</h4><div class="checkbox-list"></div><div class="addChecklist clearfix" style="width: 100%; height: 37px; border-radius: 2px;"><h4 class="addChecklistBtn"; style="margin-left: 20px; float: right; font-size: 16px;">+ 체크리스트 추가&nbsp;</h4><div class="add-checklist-form clearfix" style="display: none;"><div class="input-group"><input type="text" class="form-control addChecklist-form" placeholder="체크리스트 추가"><span class="input-group-btn addChecklist-group"><button class="btn btn-default onAddChecklist" type="button">추가</button></span></div></div></div></div><hr><div class="cardComment"><h4 class="modal-title"><i class="far fa-comments"></i>&nbsp;&nbsp;&nbsp;댓글</h4><textarea class="comment-textarea" placeholder="댓글을 입력하세요."></textarea><button class="btn btn-default comment-insert-btn">등록</button> <table class="table"><tbody id="cardComment' + j + '" class="comment-table"></tbody></table></div></div></div></div></div>');
						}
						if($("#cardContent" + j).text() == "내용을 등록하세요.") {
							$("#modifyCard" + j).text("등록");
							$("#onModifyCardContent" + j).text("등록");
							$("#cardContent-textarea" + j).val("");
							$("#cardContent-textarea" + j).attr("placeholder", "내용을 입력하세요.");
						} else {
							$("#modifyCard" + j).text("수정");
							$("#onModifyCardContent" + j).text("수정");
						}
					}
				} 
				
				$(function () {
		            $(".childDrop").sortable({
		                connectWith: ".childDrop",
		                update: function(event, ui) {
							$(this).children().each(function(index) {
								$(this).attr("data-order", (index + 1)).addClass("updated");
								//console.log(index);
							});
							
							saveNewCardOrders();
						}
		            }).disableSelection();
		            
		            $(".parentDrop").sortable({
		                connectWith: ".parentDrop",
		                update: function(event, ui) {
							$(this).children().each(function(index) {
								if($(this).attr("data-order") != (index + 1)) {
									$(this).attr("data-order", (index + 1)).addClass("listUpdated");
								}
							});
							
							saveNewListOrders();
		                }	
		            }).disableSelection();
		        });
			});
		};
		
		listListAndCardList();

		// 카드 댓글 목록
		function commentList(commentCardNo) {
			$.ajax({
				url: "/steach/class/group/cardCommentList.do",
				data: {"cardNo": commentCardNo }
			})
			.done(function(result) {
				var commentList = "";
				
				for(var c = 0; c < result.length; c++) {
					commentList += "<tr><td><div>";
					commentList += result[c].cardCommentWriter + "&nbsp;&nbsp;<span>";
					commentList += $.format.date(result[c].cardCommentRegDate, "yyyy-MM-dd HH:mm:ss");
					commentList += "</span></div><div class='comment-content-div' style='white-space: pre-line;'>";
					commentList += result[c].cardCommentContent;
					commentList += "</div><input type='hidden' class='commentNo' value='" + result[c].cardCommentNo + "'/>";
					commentList += "<div class='comment-update-form' style='display: none;'><textarea class='modify-content'>" + result[c].cardCommentContent + "</textarea></div>";
					commentList += "<div class='comment-btn'><button class='btn btn-default btn-xs comment-delete-btn'>삭제</button>";
					commentList += "<button class='btn btn-default btn-xs comment-update-btn'>수정</button></div>";
					commentList += "<div class='comment-form-btn' style='display: none;'><button class='btn btn-default btn-xs comment-cancel-btn'>취소</button>";
					commentList += "<button class='btn btn-default btn-xs comment-onUpdate-btn'>수정</button></div></td></tr>";
				}
				
				$(".comment-table").html(commentList);
			});
		};
		
		// 카드 체크리스트 목록
		function checklist(commentCardNo) {
			$.ajax({
				url: "/steach/class/group/cardChecklistList.do",
				data: {"cardNo": commentCardNo }
			})
			.done(function(result) {
				var checklistList = "";
				
				for(var l = 0; l < result.length; l++) {
					checklistList += "<div class='checkbox'>";
					if(result[l].cardChecklistStatus == 0) {
						checklistList += "<label class='checklist-label' style='font-size: 1.5em; line-height: 25.3px; margin-top: 3px; margin-bottom: 3px;'>";
						checklistList += "<input type='checkbox' value=''/>";
					} else {
						checklistList += "<label class='checklist-label' style='font-size: 1.5em; line-height: 25.3px; margin-top: 3px; margin-bottom: 3px; text-decoration: line-through;'>";
						checklistList += "<input type='checkbox' value='' checked/>";
					}
					checklistList += "<span class='cr'><i class='cr-icon fa fa-check'></i></span>";
					checklistList += "<div class='check-title'>" + result[l].cardChecklistTitle + "</div>";
					checklistList += "</label><div class='input-group checklist-update-group' style='display: none;'><input type='text' class='form-control checklist-update-form' value='" + result[l].cardChecklistTitle + "'><span class='input-group-btn'><button class='btn btn-default onModifyChecklist' type='button'>수정</button></span></div>";
					checklistList += "<span class='checklist-controller' style='display: none;'><button class='btn btn-default btn-xs checklist-update'>수정</button><button class='btn btn-default btn-xs checklist-remove'>삭제</button></span><input type='hidden' class='checklist-no' value='" + result[l].cardChecklistNo + "'><input type='hidden' class='checklist-status' value='" + result[l].cardChecklistStatus + "'></div>";
				}
				
				$(".checkbox-list").html(checklistList);
			});
		};
		
		$("body").on("click", "li[data-toggle='modal']", function() {
			var commentCardNo = $(this).attr("data-index");
			commentList(commentCardNo);
			checklist(commentCardNo);
		});
		
		// 댓글 작성
		$("body").on("click", ".comment-insert-btn", function() {
			var commentModalId = $(this).parents(".modal").attr("id");
			var commentCardNo = $("li[data-target='#" + commentModalId + "']").attr("data-index");
			var addCommentContent = $(this).siblings(".comment-textarea").val();
			
			// addCommentContent = addCommentContent.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			
            if(addCommentContent == '') {
            	$(this).siblings(".comment-textarea").focus();
                return;
            }
			
			$.ajax({
				url: "/steach/class/group/addCardComment.do",
				data: {"cardNo": commentCardNo, "cardCommentWriter": 'chos', "cardCommentContent": addCommentContent}
			})
			.done(function(result) {
				console.log(result);
				$(".comment-textarea").val("");
				commentList(commentCardNo);
			});
		});
		
		// 댓글 수정
		$("body").on("click", ".comment-update-btn", function() {
			$(".comment-content-div").css("display", "block");
			$(".comment-update-form").css("display", "none");
			$(".comment-btn").css("display", "block");
			$(".comment-form-btn").css("display", "none");
			
			$(this).parent(".comment-btn").siblings(".comment-content-div").css("display", "none");
			$(this).parent(".comment-btn").siblings(".comment-update-form").css("display", "block");
			$(this).parent(".comment-btn").css("display", "none");
			$(this).parent(".comment-btn").siblings(".comment-form-btn").css("display", "block");
			$(".modify-content").focus();
		});
		
		$("body").on("click", ".comment-onUpdate-btn", function() {
			var commentModalId = $(this).parents(".modal").attr("id");
			var commentCardNo = $("li[data-target='#" + commentModalId + "']").attr("data-index");
			var cardCommentNo = $(this).parent(".comment-form-btn").siblings(".commentNo").val();
			var cardCommentContent = $(this).parent(".comment-form-btn").siblings(".comment-update-form").find(".modify-content").val();
			
            if(cardCommentContent == '') {
            	$(this).parent(".comment-form-btn").siblings(".comment-update-form").find(".modify-content").focus();
                return;
            }
            
			$.ajax({
				url: "/steach/class/group/modifyCardComment.do",
				data: {"cardCommentNo": cardCommentNo, "cardCommentContent": cardCommentContent}
			})
			.done(function(result) {
				console.log(result);
				commentList(commentCardNo);
			}); 
		});
		
		// 댓글 수정 취소
		$("body").on("click", ".comment-cancel-btn", function() {
			$(".comment-content-div").css("display", "block");
			$(".comment-update-form").css("display", "none");
			$(".comment-btn").css("display", "block");
			$(".comment-form-btn").css("display", "none");
		});
		
		// 댓글 삭제
		$("body").on("click", ".comment-delete-btn", function() {
			var commentModalId = $(this).parents(".modal").attr("id");
			var commentCardNo = $("li[data-target='#" + commentModalId + "']").attr("data-index");
			var cardCommentNo = $(this).parent(".comment-btn").siblings(".commentNo").val();
			
 			$.ajax({
				url: "/steach/class/group/removeCardComment.do",
				data: {"cardCommentNo": cardCommentNo}
			})
			.done(function(result) {
				console.log(result);
				commentList(commentCardNo);
			}); 
		});
		
		// 체크리스트 상태 변경
		$("body").on("click", ".checklist-label", function() {
			var commentModalId = $(this).parents(".modal").attr("id");
			var commentCardNo = $("li[data-target='#" + commentModalId + "']").attr("data-index");
			var checklistNo = $(this).siblings(".checklist-no").val();
			var checklistStatus = $(this).siblings(".checklist-status").val();
			
			if(checklistStatus == 0) {
				checklistStatus = 1;
			} else {
				checklistStatus = 0;
			}
 		$.ajax({
				url: "/steach/class/group/modifyChecklistStatus.do",
				data: {"cardChecklistNo": checklistNo, "cardChecklistStatus": checklistStatus}
			})
			.done(function(result) {
				console.log(result);
				checklist(commentCardNo);
			});
		});
		
		// 체크리스트 추가 시
        $("body").on("click", ".addChecklist", function() {
            $(this).find("h4").css("display", "none");
            $(this).find(".add-checklist-form").css("display", "block");
            $(".form-control").focus();
        });
		
		function addCheckList(onAddChecklist) {
			var checklistModalId = $(onAddChecklist).parents(".modal").attr("id");
			var checklistCardNo = $("li[data-target='#" + checklistModalId + "']").attr("data-index");
			var checklistTitle = $(onAddChecklist).parent(".input-group-btn").siblings(".form-control").val();

	   	 	if(checklistTitle == '') {
	   	 		$(onAddChecklist).parent(".input-group-btn").siblings(".form-control").focus();
                return;
            }
			 
            $(onAddChecklist).parent(".input-group-btn").siblings(".form-control").val("");

			$.ajax({
				url: "/steach/class/group/addChecklist.do",
				data: {"cardNo": checklistCardNo, "cardChecklistTitle": checklistTitle}
			})
			.done(function(result) {
				console.log(result);
				
				checklist(checklistCardNo);
				
	            $(".add-checklist-form").css("display", "none");
	            $(".addChecklistBtn").css("display", "block");
			});
		};
		
		$("body").on("click", ".onAddChecklist", function() {
			addCheckList(this);
		});
		
		// 체크리스트 추가폼에서 엔터 쳐도 체크리스트 추가
        $(document).on('keydown', '.addChecklist-form', function(e) {
            if (e.which == 13) {
            	var onAddChecklist = $(this).siblings(".input-group-btn").find(".onAddChecklist");
            	addCheckList(onAddChecklist);
            } 
        });
		
		// 체크리스트 수정/삭제 버튼 컨트롤
		$(document).on("mouseover", ".checkbox", function() {
			$(this).find(".checklist-controller").css("display", "inline");
			$(this).css("background-color", "#f5f5f5");
			$(this).on("mouseout", function() {
				$(this).find(".checklist-controller").css("display", "none");
				$(this).css("background-color", "white");
			});
		});
		
		// 체크리스트 삭제
		$(document).on("click", ".checklist-remove", function() {
			var checklistModalId = $(this).parents(".modal").attr("id");
			var checklistCardNo = $("li[data-target='#" + checklistModalId + "']").attr("data-index");
			var removeChecklistNo = $(this).parent(".checklist-controller").siblings(".checklist-no").val();
			
			$.ajax({
				url: "/steach/class/group/removeChecklist.do",
				data: {"cardChecklistNo": removeChecklistNo}
			})
			.done(function(result) {
				console.log(result);
				checklist(checklistCardNo);
			});
		});
		
		// 체크리스트 수정
		$(document).on("click", ".checklist-update", function(e) {
			$(".checklist-update-group").css("display", "none");
			$(".checklist-label").css("display", "inline-block");
			
			$(this).parents(".checklist-controller").find("button").css("display", "none");
			$(this).parents(".checklist-controller").siblings(".checklist-update-group").css("display", "table");
			$(this).parents(".checklist-controller").siblings(".checklist-label").css("display", "none");
			$(this).parents(".checklist-controller").siblings(".checklist-update-group").find(".checklist-update-form").focus();
		});
		
		function modifyChecklist(onModifyChecklist) {
			var checklistModalId = $(onModifyChecklist).parents(".modal").attr("id");
			var checklistCardNo = $("li[data-target='#" + checklistModalId + "']").attr("data-index");
			var updateChecklistNo = $(onModifyChecklist).parents(".checklist-update-group").siblings(".checklist-no").val();
			var updateChecklistTitle = $(onModifyChecklist).parent("span").siblings(".checklist-update-form").val();
			
			$.ajax({
				url: "/steach/class/group/modifyChecklist.do",
				data: {"cardChecklistNo": updateChecklistNo, "cardChecklistTitle": updateChecklistTitle}
			})
			.done(function(result) {
				console.log(result);
				checklist(checklistCardNo);
			});  
		};
		
		$(document).on("click", ".onModifyChecklist", function() {
			modifyChecklist(this);
		});
		
		// 체크리스트 수정폼에서 엔터 쳐도 체크리스트 수정
        $(document).on('keydown', '.checklist-update-form', function(e) {
            if (e.which == 13) {
            	var onModifyChecklist = $(this).siblings(".input-group-btn").find(".onModifyChecklist");
            	modifyChecklist(onModifyChecklist);
            } 
        });
		
        // 트렐로 형식 드래그 앤 드롭
        $(function () {
            $(".childDrop").sortable({
                connectWith: ".childDrop",
                update: function(event, ui) {
					$(this).children().each(function(index) {
						$(this).attr("data-order", (index + 1)).addClass("updated");
						//console.log(index);
					});
					
					saveNewCardOrders();
				}
            }).disableSelection();
            
            $(".parentDrop").sortable({
                connectWith: ".parentDrop",
                update: function(event, ui) {
					$(this).children().each(function(index) {
						if($(this).attr("data-order") != (index + 1)) {
							$(this).attr("data-order", (index + 1)).addClass("listUpdated");
						}
					});
					
					saveNewListOrders();
                }	
            }).disableSelection();
        });
        
        // 카드 위치 변경 데이터베이스 저장
        function saveNewCardOrders() {
			var map = new Map();
        	
			$(".updated").each(function() {
        		map.set($(this).attr("data-index"), [$(this).attr("data-order"), $(this).parents(".parentDrag").attr("data-index")]);
        		$(this).removeClass("updated");
			}); 

            var orders = {};
			
            map.forEach(function(value, key){
            	orders[key] = value;
            });
            
         	$.ajax({
        		url: "/steach/class/group/orderUpdate.do",
        		data: {"orders": JSON.stringify(orders)},
        		success: function(response) {
					console.log(response);
				}
        	}); 
        }
        
        // 리스트 위치 변경 데이터베이스 저장
        function saveNewListOrders() {
			var map = new Map();
			
        	$(".listUpdated").each(function() {
        		map.set($(this).attr("data-index"), $(this).attr("data-order"));
        		$(this).removeClass("listUpdated");
			}); 

            var listOrders = {};
			
            map.forEach(function(value, key){
            	listOrders[key] = value;
            });

            $.ajax({
        		url: "/steach/class/group/listOrderUpdate.do",
        		data: {"listOrders": JSON.stringify(listOrders)},
        		success: function(response) {
					console.log(response);
				}
        	});
        }
        
        // 빈 공간 클릭 시 폼 접기
        $(document).mousedown(function (e) {
            var container = $('.addCardForm');
            if( container.has(e.target).length === 0){
                $(".addCardForm").css("display", "none");
                $(".addCard").css("display", "block");
            }
        });
        $(document).mousedown(function (e) {
            var container = $('.listSubjectForm');
            if( container.has(e.target).length === 0){
                $(".listSubjectForm").css("display", "none");
                $(".listSubject").css("display", "inline");
            }
        });  
        $(document).mousedown(function (e) {
            var container = $('.addListForm');
            if( container.has(e.target).length === 0){
                $(".addListForm").css("display", "none");
                $(".addListBtn").css("display", "block");
            }
        });  
        $(document).mousedown(function (e) {
            var container = $('.cardTitleForm');
            var contn = $('.cardContent-form');
            if( container.has(e.target).length === 0 && contn.has(e.target).length === 0){
                $(".cardTitle-span").css("display", "inline");
                $(".cardTitleForm").css("display", "none");
                $(".cardContent-div").css("display", "block");
                $(".cardContent-form").css("display", "none");
                $(".btn-group").css("display", "block");
            }
        });  
        $(document).mousedown(function (e) {
            var container = $('.table');
            if( container.has(e.target).length === 0){
    			$(".comment-content-div").css("display", "block");
    			$(".comment-update-form").css("display", "none");
    			$(".comment-btn").css("display", "block");
    			$(".comment-form-btn").css("display", "none");
            }
        }); 
        $(document).mousedown(function (e) {
            var container = $('.add-checklist-form');
            if( container.has(e.target).length === 0){
	            $(".add-checklist-form").css("display", "none");
	            $(".addChecklistBtn").css("display", "block");
            }
        }); 
        $(document).mousedown(function (e) {
            var container = $('.checklist-update-group');
            if( container.has(e.target).length === 0){
    			$(".checklist-update-group").css("display", "none");
    			$(".checklist-label").css("display", "inline-block");
    			$(".checklist-controller").find("button").css("display", "block");
            }
        }); 
        
        // + 카드 추가 버튼 누를 시
        function addCardArea(addCardBtn) {
            $(".addCard").css("display", "block");
            $(addCardBtn).css("display", "none");
            $(".addCardForm").css("display", "none");
            $(addCardBtn).siblings(".addCardForm").css("display", "block");
            $(".addCardForm textarea").val('');
            $(".addCardForm textarea").focus();
        };       

        $("body").on("click", ".addCard", function(e) {
            addCardArea(this);
            // 스크롤바 맨 아래로
            document.querySelector("body").scrollIntoView(false);
        });
        
        // 추가(카드) 버튼 누를 시
        function onAddCard(addCardBtn) {
        	var listNoOfAddCard = $(addCardBtn).parents(".parentDrag").attr("data-index");
            var content = $(addCardBtn).parent().siblings("textarea").val();
            var lastCardOrder = parseInt($(addCardBtn).parents(".parentDrag").find(".childDrop").find("li:last-child").attr("data-order")) + 1;
            
            if(isNaN(lastCardOrder)) {
            	lastCardOrder = 1;
            }
            
            if(content == '') {
                $(addCardBtn).parent().siblings("textarea").focus();
                return;
            }
			
            $(addCardBtn).parent().parent().siblings(".childDrop").append("<li data-toggle='modal' data-target='#cardModal'>" + content + "</li>");
            $(".addCardForm").css("display", "none");
            $(".addCard").css("display", "block");  
            
            $.ajax({
            	url: "/steach/class/group/addCard.do",
            	data: {"listNo" : listNoOfAddCard, "cardTitle": content, "cardOrder": lastCardOrder}
            })
            .done(function(result) {
				console.log(result);

	            listListAndCardList();
			}); 
		};
        
		// 카드 추가
        $("body").on("click", ".onAddCard", function(e) {
        	onAddCard(this);
        });    
        
     	// 카드 추가폼에서 엔터 쳐도 카드 추가
        $(document).on('keydown', '.addCardTextarea', function(e) {
            if (e.which == 13) {
            	var addCardFormBtn = $(this).siblings("div").find(".onAddCard");
            	onAddCard(addCardFormBtn);
            } 
        });
     	
        // 취소(카드) 버튼 누를 시
        $("body").on("click", ".addCardCancel", function(e) {
            $(".addCardForm").css("display", "none");
            $(".addCard").css("display", "block");
        });    
		
        // 카드내용 Null 일시 자동 수정 버튼 클릭 
        $("body").on("click", ".cardContent-null", function(e) {
        	e.preventDefault();
			$(".modifyCard").click();
		});
        
        // ... 카드 수정 버튼 누를 시
        $("body").on("click", ".modifyCard", function(e) {
            $(".cardTitle-span").css("display", "inline");
            $(".cardTitleForm").css("display", "none");
            $(".cardContent-form").css("display", "none");
            $(".cardContent-div").css("display", "block");
            
            $(this).parents(".btn-group").css("display", "none");
            $(this).parents(".cardContent").siblings(".cardTitle").find(".modal-title").find(".cardTitleForm").css("display", "inline");
            $(this).parents(".cardContent").siblings(".cardTitle").find(".modal-title").find(".cardTitle-span").css("display", "none");
            $(this).parents("h4.modal-title").siblings(".cardContent-form").css("display", "block");
            $(this).parents("h4.modal-title").siblings(".cardContent-div").css("display", "none");
            
            $(".modifyCardForm").focus();
        }); 
        
        // 수정(카드) 버튼 누를 시
        $("body").on("click", ".onModifyCardContent", function(e) {
            var modifyCardNo = $(this).siblings(".cardNo").attr("data-cardno");
            var modifyCardTitle = $(this).parents(".cardContent").siblings(".cardTitle").find(".modal-title").find(".cardTitleForm").find(".modifyCardForm").val();
            var modifyCardContent = $(this).parent(".md-rv-bnt").siblings(".cardContent-textarea").val();
            var modalId = $(this).parents(".modal").attr("id");
            
 	        $(this).parents(".cardContent-form").siblings(".modal-title").find(".btn-group").find(".dropdown-menu").find(".text-center").find(".modifyCard").text("수정");
            $(this).text("수정");
 	        
            if(modifyCardTitle == '') {
            	$(this).parents(".cardContent").siblings(".cardTitle").find(".modal-title").find(".cardTitleForm").find(".modifyCardForm").focus();
                return;
            }
            
            if(modifyCardContent == '') {
            	$(this).parent(".md-rv-bnt").siblings(".cardContent-textarea").focus();
                return;
            }
            
            $(this).parents(".cardContent-form").siblings(".modal-title").find(".btn-group").css("display", "block");
            $(this).parents(".cardContent").siblings(".cardTitle").find(".modal-title").find(".cardTitle-span").text(modifyCardTitle);
            $(this).parents(".cardContent-form").siblings(".cardContent-div").find(".cardContent-span").text(modifyCardContent);
	        
            $("li[data-target='#" + modalId + "']").text(modifyCardTitle);
            
            $.ajax({
            	url: "/steach/class/group/modifyCard.do",
            	data: {"cardNo": modifyCardNo, "cardTitle": modifyCardTitle, "cardContent": modifyCardContent}
            }).done(function(result) {
	            console.log(result);
	            
	            $(".cardTitle-span").css("display", "inline");
	            $(".cardTitleForm").css("display", "none");
	            $(".cardContent-form").css("display", "none");
	            $(".cardContent-div").css("display", "block");
			}); 
        });  
        
        // 카드 삭제 버튼 누를 시
        $("body").on("click", ".removeCard", function (e) {
			e.preventDefault();
        	var removeCardNo = $(this).siblings(".removeCardNo").attr("data-cardno");
			
			$.ajax({
            	url: "/steach/class/group/removeCard.do",
            	data: {"cardNo": removeCardNo}
			})
			.done(function(result) {
				console.log(result);
				
				$(".modal").modal("hide");
				
	            listListAndCardList();
	            
			});
		});
        
        // … 리스트 수정 버튼 누를 시        
        $("body").on("click", ".modifyList", function(e) {
            $(".listSubjectForm").css("display", "none");
            $(".listSubject").css("display", "inline");
            $(this).parents(".listTitle").find(".listSubjectForm").css("display", "inline");
            $(this).parents(".listTitle").find(".listSubject").css("display", "none");
            
            $(".listSubjectForm textarea").focus();
        });    

        // 수정(리스트) 버튼 누를 시
        $("body").on("click", ".modifyListFormBtn", function(e) {
        	updateList(this);
        });  

        // 리스트 수정폼에서 엔터 쳐도 리스트 수정
        $(document).on('keydown', '.modifyListForm', function(e) {
            if (e.which == 13) {
            	console.log("asdf");
            	var modifyListFormBtn = $(this).siblings(".modifyListFormBtn")
            	updateList(modifyListFormBtn);
            } 
        });
		
        function updateList(btn) {
	        var modifyListNo = $(btn).parents(".parentDrag").attr("data-index");
	        
	        var modifyListTitle = $(btn).siblings(".modifyListForm").val();
	        
	        if(modifyListTitle == '') {
	        	$(btn).siblings(".modifyListForm").focus();
	            return;
	        }
	        
	        $(btn).parents(".listTitle").find(".listSubject").text(modifyListTitle);
			
	        $.ajax({
	        	url: "/steach/class/group/modifyList.do",
	        	data: {"listNo": modifyListNo, "listTitle": modifyListTitle}
	        }).done(function(result) {
	            console.log(result);
	            
	            listListAndCardList();
	            
	            $(".listSubjectForm").css("display", "none");
	            $(".listSubject").css("display", "inline");
			});
        }
        
        // + 리스트 추가 버튼 누를 시
        function addListArea(addListBtn) {
            $(".addList").css("display", "block");
            $(addListBtn).css("display", "none");
            $(".addListForm").css("display", "none");
            $(addListBtn).siblings(".addListForm").css("display", "block");
            $(".addListForm textarea").val('');
            $(".addListForm textarea").focus();
        };       

        $("body").on("click", ".addListBtn", function(e) {
            addListArea(this);
        });
     	
        // 추가(리스트) 버튼 누를 시
        function addList(onAddList) {
        	var content = $(onAddList).parent().siblings("textarea").val();
            var groupNo = "${listList[0].groupNo}";
        	
            if(content == '') {
                $(onAddList).parent().siblings("textarea").focus();
                return;
            }

            $(".addListBtn").css("display", "block");
            $(".addListForm").css("display", "none");
            $(".parentDrop").append(` <li class="parentDrag">
                    <div class="listTitle">
                        <div class="listSubject">
                            ` + content + `
                        </div>
                        <div class="listSubjectForm" style="display: none;">
                            <textarea class='modifyListForm'>` + content + `</textarea><button class='btn btn-default btn-xs modifyListFormBtn'>수정</button>  
                        </div>
                        <div class="btn-group">
                            <div class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-ellipsis-h"></i>
                            </div>
                            <ul class="dropdown-menu" role="menu">
                                
                            </ul>
                        </div>
                    </div>
                    <ul class="connectedSortable childDrop">
    　
                    </ul>
                    <div class="addCard">+ 카드 추가</div>
                    <div class="addCardForm" style="display: none;">
                        <textarea class='addCardTextarea'>
                        </textarea>
                        <div>
                            <button class='btn btn-default onAddCard'>
                                추가
                            </button>
                            <a>
                                <i class='fas fa-times addCardCancel'>
                                </i>
                            </a>
                        </div>
                    </div>
                </li>`);
            
            function fnMove() {
                var offset = $(".addList").offset();
                $('html, body').animate({scrollLeft : offset.left}, 400);
            }
            fnMove();
            
			$.ajax({
				url: "/steach/class/group/addList.do",
				data: {"groupNo" : groupNo, "listTitle": content, "listOrder": nextLastListOrder}
			})
			.done(function(result) {
				console.log(result);
	            listListAndCardList();
			});
		};
        
        $("body").on("click", ".onAddList", function(e) {
        	addList(this);
        });   

        // 리스트 추가폼에서 엔터 쳐도 리스트 추가
        $(document).on('keydown', '.addListTextarea', function(e) {
            if (e.which == 13) {
            	var addListFormBtn = $(this).siblings("div").find(".onAddList");
            	addList(addListFormBtn);
            } 
        });
        
        // 취소(리스트) 버튼 누를 시
        $("body").on("click", ".addListCancel", function(e) {
            $(".addListForm").css("display", "none");
            $(".addListBtn").css("display", "block");
        }); 

        // 리스트 삭제
        $("body").on("click", ".removeList", function(e) {
            // $(this).parents(".parentDrag").remove();
            e.preventDefault();
            var removeListNo = $(this).parents(".parentDrag").attr("data-index");
            
            $.ajax({
            	url: "/steach/class/group/removeList.do",
            	data: {"listNo": removeListNo}
            })
            .done(function(result) {
				console.log(result);
				
	            listListAndCardList();
			}); 
        });

        // 카드 머리 꺾기
        // $("body").on("mousedown", ".childDrop > li", function() {
        //         $(this).css("transform", "skewY(3deg)");
        // });
        // $("body").on("mouseup", ".childDrop > li", function() {
        //     $(this).css("transform", "skewY(0deg)");
        // });

        /*  보완해야 할 점
            빈공간에서 드래그 시 스크롤 이동 기능 추가해야함
        */
        
        // 헤더 드랍다운 효과
        $('ul.nav li.dropdown').hover(function() {
        $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeIn(200);
        }, function() {
            $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeOut(200);
        });
        
        // 채팅
        var $messages = $('.messages-content'), d, h, m, i = 0;

        $(window).load(function() {
            $messages.mCustomScrollbar();
            // setTimeout(function() {
            //     fakeMessage();
            // }, 100);
        });

        function updateScrollbar() {
            $messages.mCustomScrollbar("update").mCustomScrollbar('scrollTo', 'bottom', {
                scrollInertia: 10,
                timeout: 0
            });
        };
        
        function setDate() {
            d = new Date()
            if (m != d.getMinutes()) {
                m = d.getMinutes();
                $('<div class="timestamp">' + d.getHours() + ':' + m + '</div>').appendTo($('.message:last'));
                $('<div class="checkmark-sent-delivered">&check;</div>').appendTo($('.message:last'));
                $('<div class="checkmark-read">&check;</div>').appendTo($('.message:last'));
            }
        };

        function insertMessage() {
            msg = $('.message-input').val();
            if ($.trim(msg) == '') {
                return false;
            }
            $('<div class="message message-personal">' + msg + '</div>').appendTo($('.mCSB_container')).addClass('new');
            setDate();
            $('.message-input').val(null);
            updateScrollbar();
                // setTimeout(function() {
                //     fakeMessage();
                // }, 1000 + (Math.random() * 20) * 100);
        }

        $('.message-submit').click(function() {
        	insertMessage();
        });

        $(".chat").on('keydown', function(e) {
            if (e.which == 13) {
                insertMessage();
                return false;
            } 
        });

        // var Fake = [
        //     'Hi there, I\'m Jesse and you?',
        //     'Nice to meet you',
        //     'How are you?',
        //     'Not too bad, thanks',
        //     'What do you do?',
        //     'That\'s awesome',
        //     'Codepen is a nice place to stay',
        //     'I think you\'re a nice person',
        //     'Why do you think that?',
        //     'Can you explain?',
        //     'Anyway I\'ve gotta go now',
        //     'It was a pleasure chat with you',
        //     'Time to make a new codepen',
        //     'Bye',
        //     ':)'
        // ];

        // function fakeMessage() {
        //     if ($('.message-input').val() != '') {
        //         return false;
        //     }
        //     $('<div class="message loading new"><figure class="avatar"><img src="http://askavenue.com/img/17.jpg" /></figure><span></span></div>').appendTo($('.mCSB_container'));
        //     updateScrollbar();

        //     setTimeout(function() {
        //         $('.message.loading').remove();
        //         $('<div class="message new"><figure class="avatar"><img src="http://askavenue.com/img/17.jpg" /></figure>' + Fake[i] + '</div>').appendTo($('.mCSB_container')).addClass('new');
        //         setDate();
        //         updateScrollbar();
        //         i++;
        //     }, 1000 + (Math.random() * 20) * 100);
        // };

        var chatSize = 0;

        $(".chat-button").on("click", function() {
            if(chatSize == 0) {
                $(".avenue-messenger").css("max-height", "85px").css("min-height", "85px");
                $(this).empty();
                $(this).append("<i class='fas fa-caret-up'></i>");
                chatSize = 1;
                return;
            }
            $(".avenue-messenger").css("max-height", "460px").css("min-height", "220px");
            $(this).empty();
            $(this).append("<i class='fas fa-caret-down'></i>");
            chatSize = 0;
            return;
        });

        // 파일첨부
        var filenames = [];
        $(document).ready(
            function() { 
                var fileTarget = $('.filebox .upload-hidden'); 
                fileTarget.on('change', function() {  
                    if(window.FileReader) {  
                        for(var i = 0; i < $(this)[0].files.length; i++ )
                        filenames.push($(this)[0].files[i].name + '<br>'); 
                    } 
                    
                    $(this).siblings('.upload-name').html('<h5>' + filenames + '</h5>'); 
                }); 
            }
        ); 
        
        // 해더 링크
       	$("a[href='lecture']").click(function(){
    		location.href="<c:url value='/class/lecture/lecture.do'/>";
	    })
	    
	     $("a[href='member']").click(function(){
	    	location.href="<c:url value='/class/member/member.do'/>";
	    })
    </script>
</body>
</html>