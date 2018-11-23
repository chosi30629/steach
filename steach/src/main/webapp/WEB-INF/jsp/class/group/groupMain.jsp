<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="container clearfix">
        <h3 class="group-main-title">
            &nbsp;<i class="fas fa-users"></i>&nbsp;&nbsp;조별 활동
        </h3>
        <div class="wrap alt">
            <p><textarea name="students" id="students" cols="40" rows="15" readonly>
박아란
이경
조용제
최창유
최원영
유병욱
김도훈
박한준
김해동
안규영
조성일
이원재
김차원
김세영
김병관
오수진
김은비
이승재
정인용
임유신
나원석
이득재
박태환
신득수
방진웅
이현규</textarea></p>
            <div class="groups text-center clearfix">
                <div class="wrapper">
                    <div class="menu">
                        <ul class="menu__list">
                        <li class="menu__list__item"><a href="#" class="init">초기화</a></li>
                        <li class="menu__list__item random-li" data-toggle="modal" data-target="#randomModal"><a href="#">랜덤 조 편성</a></li>
                        </ul>
                    </div>
                    <div class="button">
                        <span class="button__line"></span>
                        <span class="button__line"></span>
                        <span class="button__line"></span>
                    </div>
                </div>
                <ul class="connectedSortables parentDrop clearfix">
                    <li class="parentDrag">
                        <div class="listTitle">
                            <div class="listSubject">
                                1조
                            </div>
                        </div>
                        <ul class="connectedSortable childDrop">
                            　
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p1.jpg');">
                                <span class="student-name">나는이름이열글자입니</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p2.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p3.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p4.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p5.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                        </ul>
                        <div>　</div>
                    </li>
                    <li class="parentDrag">
                        <div class="listTitle">
                            <div class="listSubject">
                                1조
                            </div>
                        </div>
                        <ul class="connectedSortable childDrop">
                            　
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p1.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p2.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p3.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p4.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p5.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                        </ul>
                        <div>　</div>
                    </li>
                    <li class="parentDrag">
                        <div class="listTitle">
                            <div class="listSubject">
                                1조
                            </div>
                        </div>
                        <ul class="connectedSortable childDrop">
                            　
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p1.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p2.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p3.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p4.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p5.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                        </ul>
                        <div>　</div>
                    </li>
                    <li class="parentDrag">
                        <div class="listTitle">
                            <div class="listSubject">
                                1조
                            </div>
                        </div>
                        <ul class="connectedSortable childDrop">
                            　
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p1.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p2.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p3.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p4.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p5.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                        </ul>
                        <div>　</div>
                    </li>
                    <li class="parentDrag">
                        <div class="listTitle">
                            <div class="listSubject">
                                1조
                            </div>
                        </div>
                        <ul class="connectedSortable childDrop">
                            　
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p1.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p2.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p3.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p4.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p5.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                        </ul>
                        <div>　</div>
                    </li>
                    <li class="parentDrag">
                        <div class="listTitle">
                            <div class="listSubject">
                                1조
                            </div>
                        </div>
                        <ul class="connectedSortable childDrop">
                            　
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p1.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p2.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p3.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p4.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p5.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                        </ul>
                        <div>　</div>
                    </li>
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
                            <input class="numgroups form-control" type="integer" value="" placeholder="학생 수"/>
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

        // 트렐로 형식 드래그 앤 드롭
        $(function () {
            $(".childDrop").sortable({
                connectWith: ".childDrop",
                placeholder: "ui-state-highlight"
            }).disableSelection();
        });
        
        // 랜덤 조 편성
        $('.onRandom').on('click', function (e) {
            e.preventDefault();
            
            if ($(".numgroups").val() == '') {
                alert("학생 수를 입력하십시오.");
                return false;
            }
            
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

            var namespergroup = parseInt($('.numgroups').val()),
                allnames = $('textarea').val().split('\n'),
                allnameslen = allnames.length;

            var numgroups = Math.ceil(allnameslen / namespergroup);

            // $('.groups').empty();

            // for (i = 0; i < numgroups; i++) {
            //     $('.groups').append('<div class="group" id="group' + (i + 1) + '"><h2>' + (i + 1) + '조</h2></div>');
            // }
            $('.parentDrop').empty();

            for (i = 0; i < numgroups; i++) {
                $('.parentDrop').append(`<li class="parentDrag wow wobble clearfix" id=group${i + 1}>
                            <div class="listTitle clearfix">
                                <div class="listSubject clearfix">${i + 1}조</div>
                            </div>
                            <ul class="connectedSortable childDrop">
                            </ul>
                            </li>`);
            }
            
            $(".parentDrag:nth-child(1n) .childDrop").addClass("wow rotateInDownLeft");
            $(".parentDrag:nth-child(2n) .childDrop").addClass("wow rotateInDownRight");
            $(".parentDrag:nth-child(3n) .childDrop").addClass("wow slideInLeft");
            $(".parentDrag:nth-child(4n) .childDrop").addClass("wow slideInRight");
            $(".parentDrag:nth-child(5n) .childDrop").addClass("wow rotateInUpLeft");
            $(".parentDrag:nth-child(6n) .childDrop").addClass("wow rotateInUpRight");
            
            $(".childDrop").append('<span>　</span>');
            $('.childDrop').each(function () {
                for (j = 0; j < namespergroup; j++) {
                    var randname = Math.floor(Math.random() * allnames.length);
                    if (allnames[randname]) {
                        $(this).append('<li class="ui-state-default clearfix"><span class="student-name">' + allnames[randname] + '</span></li>');
                    }
                    allnames.splice(randname, 1);
                    console.log(allnames);
                }
            });
            // 트렐로 형식 드래그 앤 드롭
            $(function () {
                $(".childDrop").sortable({
                    connectWith: ".childDrop",
                    placeholder: "ui-state-highlight"
                }).disableSelection();
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
            $(".parentDrop").append(
                `<li class="parentDrag">
                        <div class="listTitle">
                            <div class="listSubject">
                                1조
                            </div>
                        </div>
                        <ul class="connectedSortable childDrop wow bounceIn">
                            　
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p1.jpg');">
                                <span class="student-name">나는이름이열글자입니</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p2.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p3.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p4.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p5.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                        </ul>
                        <div>　</div>
                    </li>
                    <li class="parentDrag">
                        <div class="listTitle">
                            <div class="listSubject">
                                1조
                            </div>
                        </div>
                        <ul class="connectedSortable childDrop wow bounceIn">
                            　
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p1.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p2.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p3.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p4.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p5.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                        </ul>
                        <div>　</div>
                    </li>
                    <li class="parentDrag">
                        <div class="listTitle">
                            <div class="listSubject">
                                1조
                            </div>
                        </div>
                        <ul class="connectedSortable childDrop wow bounceIn">
                            　
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p1.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p2.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p3.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p4.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p5.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                        </ul>
                        <div>　</div>
                    </li>
                    <li class="parentDrag">
                        <div class="listTitle">
                            <div class="listSubject">
                                1조
                            </div>
                        </div>
                        <ul class="connectedSortable childDrop wow bounceIn">
                            　
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p1.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p2.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p3.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p4.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p5.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                        </ul>
                        <div>　</div>
                    </li>
                    <li class="parentDrag">
                        <div class="listTitle">
                            <div class="listSubject">
                                1조
                            </div>
                        </div>
                        <ul class="connectedSortable childDrop wow bounceIn">
                            　
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p1.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p2.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p3.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p4.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p5.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                        </ul>
                        <div>　</div>
                    </li>
                    <li class="parentDrag">
                        <div class="listTitle">
                            <div class="listSubject">
                                1조
                            </div>
                        </div>
                        <ul class="connectedSortable childDrop wow bounceIn">
                            　
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p1.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p2.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p3.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p4.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                            <li class="ui-state-default clearfix" style="background-image: url('/steach/resources/images/class/group/p5.jpg');">
                                <span class="student-name">조성일</span>
                            </li>
                        </ul>
                        <div>　</div>
                    </li>`
            );
            // 트렐로 형식 드래그 앤 드롭
            $(function () {
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

        $(".listTitle").on("click", function() {
            location.href = "groupActivity.do";
        });
    </script>
</body>
</html>