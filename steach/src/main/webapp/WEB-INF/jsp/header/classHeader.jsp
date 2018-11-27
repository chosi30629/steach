<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>header</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/steach/resources/css/header/class-header.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-default">
        <div class="navbar-collapse" >
            <ul class="nav navbar-nav">
                <li class="pull-left home"><a href="#"><i class="fas fa-home"></i></a></li>
                <li class="pull-left myClassName"><a href="#">클래스이름.</a></li>
                <li class="classCurriculum"><a href="<c:url value='/class/curriculum/curriculum.do'/>">커리큘럼</a></li>
                <li class="dropdown classCourse">
                    <a href="lecture" class="dropdown-toggle" data-toggle="dropdown">수업</a>
                    <ul class="dropdown-menu">
                        <li><a href="<c:url value='/class/lecture/homework.do'/>">과제제출</a></li>
                    </ul>
                </li>
                <li class="dropdown classUser">
                    <a href="member" class="dropdown-toggle" data-toggle="dropdown">사용자</a>
                    <ul class="dropdown-menu">
                        <li><a href="#">출결현황</a></li>
                        <li class="divider"></li>
                        <li><a href="<c:url value='/class/group/groupActivity.do'/>">조별활동</a></li>
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
</body>
<script>
    $('ul.nav li.dropdown').hover(function() {
        $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeIn(200);
    }, function() {
        $(this).find('.dropdown-menu').stop(true, true).delay(10).fadeOut(200);
    });
   
       
    $("a[href='lecture']").click(function(){
    	location.href="<c:url value='/class/lecture/lecture.do'/>";
    })
    
     $("a[href='member']").click(function(){
    	location.href="<c:url value='/class/member/member.do'/>";
    })
 
</script>

</html>