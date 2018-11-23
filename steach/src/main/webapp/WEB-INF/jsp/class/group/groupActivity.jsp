<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="pull-left home"><a href="#"><i class="fas fa-home"></i></a></li>
                <li class="pull-left myClassName"><a href="#">클래스명</a></li>
                <li class="classCurriculum"><a href="#">커리큘럼</a></li>
                <li class="dropdown classCourse">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">수업</a>
                    <ul class="dropdown-menu">
                        <li><a href="#">과제제출</a></li>
                    </ul>
                </li>
                <li class="dropdown classUser">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">사용자</a>
                    <ul class="dropdown-menu">
                        <li><a href="#">출결현황</a></li>
                        <li class="divider"></li>
                        <li><a href="#">조별활동</a></li>
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
            <li class="parentDrag">
                <div class="listTitle">
                    <div class="listSubject">
                        해야 할 일
                    </div>
                    <span class="listSubjectForm" style="display: none;">
                        <textarea class='modifyListForm'>해야 할 일</textarea><button class='btn btn-default btn-xs modifyListFormBtn'>수정</button>  
                    </span>
                    <div class="btn-group">
                        <div class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-ellipsis-h"></i>
                        </div>
                        <ul class="dropdown-menu" role="menu">
                            <li class="text-center"><a class="modifyList" href="#">수정</a></li>
                            <li class="divider"></li>
                            <li class="text-center"><a class="removeList" href="#">삭제</a></li>
                        </ul>
                    </div>
                </div>
                <ul class="connectedSortable childDrop">
                    　
                    <li data-toggle="modal" data-target="#cardModal">Item 2</li>
                    <li data-toggle="modal" data-target="#cardModal">Item 3</li>
                    <li data-toggle="modal" data-target="#cardModal">Item 4</li>
                    <li data-toggle="modal" data-target="#cardModal">Item 5</li>
                    <li data-toggle="modal" data-target="#cardModal">Item 2</li>
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
            </li>
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
    <div class="modal fade" id="cardModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="cardTitle clearfix">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="position: relative; z-index: 1;">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h3 class="modal-title" id="myModalLabel" style="position: relative; top: 13px;"><i class="far fa-credit-card"></i>　카드 제목</h3><span style="float: right;">2018-12-26</span>
                    </div>
                    <hr>
                    <div class="cardContent clearfix">
                        <h4 class="modal-title"> <i class="far fa-sticky-note"></i>　카드 내용</h4>
                        <div class="clearfix cardContent-div">
                         입니다.!!!
                        </div>
                        <div class="md-rv-bnt">
                            <br>
                            <button class="btn btn-default">수정</button>
                            <button class="btn btn-default">삭제</button>
                        </div>    
                    </div>
                    <hr>
                    <div class="cardFile clearfix">
                        <h4 class="modal-title"> 
                            <i class="fas fa-paperclip"></i>　첨부 파일
                        </h4>
                        <div class="attachbox" style="min-width: 568px; min-height: 80px; border: 1px solid #ccc; border-radius: 3px; margin-top: 10px; margin-bottom: 15px;">
                            <div class="filebox"> 
                                <div class="upload-name" disabled="disabled" style="overflow: scroll"></div>
                                <label for="my_filename">
                                    <i class="fas fa-hdd"></i>
                                </label> 
                                <input type="file" id="my_filename" multiple class="upload-hidden"> 
                            </div>
                            <div class="filebox"> 
                                <div class="upload-name" disabled="disabled" style="overflow: scroll"></div>
                                <label for="drive_filename">
                                    <i class="fab fa-google-drive"></i>
                                </label> 
                                <input type="file" id="drive_filename" multiple class="upload-hidden"> 
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="cardComment">
                        <h4 class="modal-title"><i class="far fa-comments"></i>&nbsp;&nbsp;&nbsp;카드 댓글</h4>
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td>
                                    <div>조성일&nbsp;&nbsp; 
                                    <span>2018-10-15 20:10:52</span></div>
                                    <div>이걸 자료라고 올린거여?ㅡㅡ;;이걸 자료라고 올린거여?ㅡㅡ;;이걸 자료라고 올린거여?ㅡㅡ;;이걸 자료라고 올린거여?ㅡㅡ;;이걸 자료라고 올린거여?ㅡㅡ;;</div></td>
                                </tr>
                                <tr>
                                    <td>
                                    <div>조성일&nbsp;&nbsp; 
                                    <span>2018-10-15 20:10:52</span></div>
                                    <div>이걸 자료라고 올린거여?ㅡㅡ;;</div></td>
                                </tr>
                                <tr>
                                    <td>
                                    <div>조성일&nbsp;&nbsp; 
                                    <span>2018-10-15 20:10:52</span></div>
                                    <div>이걸 자료라고 올린거여?ㅡㅡ;;</div></td>
                                </tr>
                                <tr>
                                    <td>
                                    <div>조성일&nbsp;&nbsp; 
                                    <span>2018-10-15 20:10:52</span></div>
                                    <div>이걸 자료라고 올린거여?ㅡㅡ;;</div></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
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
                <button type="submit" class="message-submit">
                    <i class="fas fa-arrow-circle-up"></i>
                </button>
            </div>
        </div>
    </section>

    <script>
        // 트렐로 형식 드래그 앤 드롭
        $(function () {
            $(".childDrop").sortable({
                connectWith: ".childDrop"
            }).disableSelection();
            $(".parentDrop").sortable({
                connectWith: ".parentDrop"
            }).disableSelection();
        });

        // 빈 공간 클릭 시 폼 접기
        $(document).mousedown(function (e){
            var container = $('.addCardForm');
            if( container.has(e.target).length === 0){
                $(".addCardForm").css("display", "none");
                $(".addCard").css("display", "block");
            }
        });
        $(document).mousedown(function (e){
            var container = $('.listSubjectForm');
            if( container.has(e.target).length === 0){
                $(".listSubjectForm").css("display", "none");
                $(".listSubject").css("display", "inline");
            }
        });  
        $(document).mousedown(function (e){
            var container = $('.addListForm');
            if( container.has(e.target).length === 0){
                $(".addListForm").css("display", "none");
                $(".addListBtn").css("display", "block");
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
            e.preventDefault();
            addCardArea(this);
            // 스크롤바 맨 아래로
            document.querySelector("body").scrollIntoView(false);
        });
        
        // 추가(카드) 버튼 누를 시
        $("body").on("click", ".onAddCard", function(e) {
            var content = $(this).parent().siblings("textarea").val();
            
            if(content == '') {
                $(this).parent().siblings("textarea").focus();
                return;
            }

            $(this).parent().parent().siblings(".childDrop").append("<li data-toggle='modal' data-target='#cardModal'>" + content + "</li>");
            $(".addCardForm").css("display", "none");
            $(".addCard").css("display", "block");
        });    
        
        // 취소(카드) 버튼 누를 시
        $("body").on("click", ".addCardCancel", function(e) {
            $(".addCardForm").css("display", "none");
            $(".addCard").css("display", "block");
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
            var modifyListContent = $(this).siblings(".modifyListForm").val();
            $(this).parents(".listTitle").find(".listSubject").text(modifyListContent);

            $(".listSubjectForm").css("display", "none");
            $(".listSubject").css("display", "inline");
        });  

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
        $("body").on("click", ".onAddList", function(e) {
            var content = $(this).parent().siblings("textarea").val();
            
            if(content == '') {
                $(this).parent().siblings("textarea").focus();
                return;
            }
            
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
                            <li class="text-center"><a class="modifyList" href="#">수정</a></li>
                            <li class="divider"></li>
                            <li class="text-center"><a class="removeList" href="#">삭제</a></li>
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

            $(".addListBtn").css("display", "block");
            $(".addListForm").css("display", "none");
            
            function fnMove() {
                var offset = $(".addList").offset();
                $('html, body').animate({scrollLeft : offset.left}, 400);
            }
            fnMove();

            $(".childDrop").sortable({
                connectWith: ".childDrop"
            }).disableSelection();
            $(".parentDrop").sortable({
                connectWith: ".parentDrop"
            }).disableSelection();

        });   

        // 취소(리스트) 버튼 누를 시
        $("body").on("click", ".addListCancel", function(e) {
            $(".addListForm").css("display", "none");
            $(".addListBtn").css("display", "block");
        }); 

        // 리스트 삭제
        $("body").on("click", ".removeList", function() {
            $(this).parents(".parentDrag").remove();
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

            $(window).on('keydown', function(e) {
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
    </script>
</body>
</html>