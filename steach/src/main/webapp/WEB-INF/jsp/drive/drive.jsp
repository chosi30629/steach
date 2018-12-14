<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>내 드라이브 - 구글 드라이브</title>
  <script src="/steach/resources/fancytree/lib/jquery.js"></script>
  <script src="/steach/resources/fancytree/lib/jquery-ui.custom.js"></script>
  <script src="/steach/resources/fancytree/src/jquery-ui-dependencies/jquery.fancytree.ui-deps.js"></script>
  <script src="/steach/resources/fancytree/src/jquery.fancytree.js"></script>
  <script src="/steach/resources/fancytree/src/jquery.fancytree.dnd5.js"></script>
  <script src="/steach/resources/fancytree/src/jquery.fancytree.childcounter.js"></script>
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
  <link href="/steach/resources/fancytree/src/skin-win8/ui.fancytree.css" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
  <link href="/steach/resources/fancytree/src/skin-win8/ui.fancytree.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
  <link rel="stylesheet" href="/steach/resources/css/drive/drive.css">


</head>

<body>
	
			
    <div class="realheader">
   		<div class="outheader">
       		<div class="imgheader">
       			<img class="headerimg" aria-hidden="true" src="https://www.gstatic.com/images/branding/product/1x/drive_48dp.png" srcset="https://www.gstatic.com/images/branding/product/1x/drive_48dp.png 1x, https://www.gstatic.com/images/branding/product/2x/drive_48dp.png 2x " style="width:40px;height:40px">    
      		</div>
     		<div class="textheader">&nbsp;구글 드라이브  </div>
		</div>
      
      	<form class="formrow">
	        <div class="fff" >
          		<button class="searchbtn">
      				<i class="fas fa-search"></i>
	          	</button>
	          <input type="search" placeholder="드라이브 검색">
	        </div>
      	</form>
      
      	<div style="margin-right: 10px; display: flex; flex-direction: row-reverse; align-items: center; width: 100%">
        	<div>
          		<i class="fas fa-sign-out-alt fa-2x" data-toggle="tooltip" data-placement="bottom" title="로그아웃"></i>
        	</div>
        	<div style="margin : 0 25px" >
        		<i class="fas fa-th fa-lg" data-toggle="tooltip" data-placement="bottom" title="스티치 app"  onclick="app()"></i>
        	</div>
      	</div>
    </div><!-- header 종결-->
    
     <!-- The Modal -->
<!--      <div id="myModal3" class="modal fade"> -->
<!--         Modal content -->
<!--         <div class="modal3 modal-content col-md-3">                                                    -->
<!--             <p><i class="fas fa-folder-plus fa-2x"></i>　폴더 추가하기</p> -->
<!--             <hr> -->
<!--             <p><i class="fas fa-file-upload fa-2x"></i>　파일 업로드</p> -->
<!--         </div> -->
   
<!--       </div> -->

  <div class="container-fluid">
      <div class="firstside col-md-2 sidebar">

        <div class="addBtnOuter" tabindex="-1" id="myBtn1" style="display:flex;">
          <div class="addBtn">
          </div>
          <div style="display : flex; align-items : center;">
            새로 만들기
          </div>
        </div>
 
           <!-- The Modal -->
           <div id="myModal1" class="modal fade">
       
            <!-- Modal content -->
            <div class="modal1 modal-content" style="width : 20%;">                                                   
                <div class="addFolder"><i class="emoji fas fa-folder-plus fa-2x"></i>　폴더 추가하기</div>
                <hr>
                <div class="addFile" data-toggle="modal" data-target=".fileUpload"><i class="fas fa-file-upload fa-2x"></i>　파일 업로드</div>
            </div>
       
          </div>

         <div id="tree">
         </div>
         
         <hr>
          <div class="icon">
           <div class="cloudicon">
             <i class="fas fa-cloud fa-lg"></i>
           </div>
           
           <div style="font-size: 13px;">
             <div>저장용량</div>
             <div class="progress">
                <div class="progress-bar" role="progressbar"  style="width: 10%;"></div>
              </div>
             <div>
             
               ${usableSpace} 중 732.7MB 사용중
              </div>
            </div> 
          </div>  
            
        </div>
        

        <div class="col-md-10" style="display: flex;height: 30px;">
          <div class="myBtn2outer" style="height: 30px;">
            <div id="myBtn2" tabindex="-1" style="height: 40px;">내 드라이브
                <div class="myBtn2icon">
                	<i class="fas fa-sort-down" style="
		                  display: flex;
		                  align-items: center;
		                  margin-left: 10px;
		                  margin-bottom: 5px;
              		"></i>
           		</div>
            </div>
          </div>
          
          <div style="display: flex; align-items: center; flex-direction : row-reverse; width: 100%;">
              <div class="infoCircle" data-toggle="tooltip" data-placement="bottom" title="세부정보">
                <i class="google fas fa-info-circle fa-lg"></i></div>
          </div>
        </div>  

     <div class="col-md-8 main" style="padding-right: 0px;">
            
          <!-- The Modal --> 
         <div id="myModal2" class="modal fade">
           	  <!-- Modal content -->
	          <div class="modal2 modal-content " style="width : 20%;">                                                   
	              <div class="addFolder"><i class="emoji fas fa-folder-plus fa-2x"></i>　폴더 추가하기</div>
	              <hr>
	              <div class="addFile"  data-toggle="modal" data-target=".fileUpload"><i class="fas fa-file-upload fa-2x"></i>　파일 업로드</div>
	          </div>
         </div><!-- 모달 -->
          
          <div style="margin-top: 20px;">
              <div class="table1">  
	                <div class="tableC" style="width: 40%; font-weight: 600;">제목</div>
	                <div class="tableC" style="width: 8%; font-weight: 600;  justify-content: center;">소유자</div>
	                <div class="tableC" style="width: 32%; font-weight: 600;  justify-content: center;">최종 수정 날짜</div>
	                <div class="tableC" style="width: 20%; font-weight: 600;  justify-content: center;">크기</div>
            	</div>
           </div>
           <div class="tableDiv">
              	<table class="ft table table-hover">
                <tbody></tbody>
             	 </table><!--내용 끝-->
            </div> <!-- tableDiv 종료-->
       </div><!-- main 태그 col-md-8 종료-->
            
         <!-- 우측 사이드바 관련태그 시작 -->
        <div class="detailside col-md-2 sidebar" style="width: 20%; padding-left: 0px; padding-right: 0px; bottom: 1px;">
                <div class="trClick">
                  <div class="TrIcon"><i class="emoji fas fa-folder fa-lg"></i></div>
                  <div class="TrName">내 드라이브</div>
                </div>
                <div class="trClickDetail">
                  <div>세부정보</div>
                  <div>활동</div>
                </div>
				
				<!--활동 로그 이벤트 -->
            <div class="trClickDetailContent">폴더를 추가하였습니다 <br> 
                <c:forEach var="item" items="${subFiles}">${item.getCanonicalPath()}, 
	                <jsp:useBean id="dateValue" class="java.util.Date"/>	
					<jsp:setProperty name="dateValue" property="time" value="${item.lastModified()}"/>
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${dateValue}" />
					<br>
					
					<c:choose>
						<c:when test="${item.isDirectory()==true}">폴더용량 : ${item.length()}</c:when>
						<c:otherwise>파일용량 : ${item.length()}</c:otherwise>
					</c:choose>
					<br><br>
                </c:forEach>
             </div><!-- 활동로그 -->
                
        </div><!-- right sidebar  우측 사이드바 관련태그 끝 -->

             <div class="myModal modal fade">
                <div class="modal4 modal-content col-md-3">                                                   
                    <p class="addFolderBefore">새폴더</p>
                    <p><input class="addTextBefore form-control" type="text" /></p>
                    <p style="display : flex;flex-direction: row-reverse;">
                      <button type="button" class="AfterCancle form-control" style="width:unset;">취소</button>
                      <button class="AfterMakeIt form-control" style="width:unset;">만들기</button>
                    </p>
                </div>
             </div>
  	</div><!-- 그리드 종결 태그 -->
  
  <!-- 컨텍스트 메뉴 관련 -->
  <ul class="contextmenu">
      <li><a href="#">색상바꾸기 (나중에)</a></li>
      <li><a href="#">이름 변경</a></li>
      <li><a href="#">공유 (미구현)</a></li>
      <li><a href="#">다운로드 (미구현)</a></li>
      <li><a href="#">삭제</a></li>
    </ul>
    <!-- 컨텍스트 메뉴 끝 -->
    
    <div class="myModal2 modal fade">
        <div class="modal4 modal-content col-md-3">                                                   
            <p>이름 바꾸기</p>
            <p><input class="changeNameText form-control" type="text" /></p>
            <p style="display : flex;flex-direction: row-reverse;">
	              <button type="button" class="AfterCancle form-control" style="width:unset;">취소</button>
	              <button class="AfterChange form-control" style="width:unset;">변경</button>
            </p>
        </div>
      </div>
      
      <!-- 파일 업로드 모달 -->
    <div class="fileUpload modal fade">
      	<div class="modal-content col-md-3">
			<form id="upload_form" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${user.id}"><br>
				<input type="file"  id="getfile" name="attach" multiple /><br>
				<button class="fButton">업로드</button>
			</form>
      	</div>    
    </div>
    
    <!-- 파일읽기 모달 -->
    <div id="fileReader" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body">
        <p></p>
        <img id="fileimage">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="download btn btn-primary">다운로드</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

 <script type="text/javascript">
 var firstload;
 var clickToLazy;
 var activeNode;
 var pathData;
 // 파일 업로드 ajax
	 	var nPath; 
		 function nowpath(result){
			nPath =	 result;
	 	}
	
		 $('.addFile').off("click").click(function(){
			 $('.modal').modal('hide');
		 
 $('.fButton').off("click").click(function() {
	 // Contextmenu 모달 숨기기
	 $(this).parent().parent().parent().modal('hide');
	 	
	 	var file = $("input[name='attach']");
		var files = $("input[name='attach']")[0].files;
		
		if(pathData == undefined){
			pathData = 'C:\\drive\\<c:out value='${user.id}'/>'
		}
		
		var fd = new FormData();
	 	// 현재 페이지의 path경로 가져올거야
	 	fd.append("path" , pathData);
		fd.append("id", $("input[name='id']").val());
		for (var i = 0 ; i< files.length; i++){
			fd.append("attach", files[i]);
		}//for
		
		$.ajax({
			url : '<c:url value="/drive/fileUpload.do"/>',
			data : fd,
			type : "POST",
			// fileupload 를 ajax로 전송하기 위한 설정
			// true 로 설정시 enctype = application/x-www-form-urlencoded 으로 설정되므로
			// enctype = multipart/form-data 로 하기위해서 하는 설정 false
			processData : false,
			contentType : false,
		}).done(function(result){
			
			var node  = $("#tree").fancytree("getActiveNode");
	    	if (!node) {
	    		node = clickToLazy;
	    		console.log("clilckToLazy",node);
	    	}
	    	if(node == undefined) {
	    		node = $("#tree").fancytree("getRootNode").children[0]
				console.log("getRootNode",node);
	    	}
	    	
	    	
			for(var i =0 ; i < result.length ; i++){
	    	node.addChildren({
	            title : result[i].title,
	            folder : result[i].folder,
	            data : {
	            	path : nPath+"\\"+result[i].title
	            }
	         });
			
	    	if(node.key != "_1"){
	    	node.load(true).done(function(){
	    		node.resetLazy();  
	    		node.setExpanded();
	    		});
	    	}
	    	
			EmojiAndFLengthLIST(result[i].list);
			}
			
			if($('tbody').children().length==0 && $('.ft').children().length==1 )
			{
		    $('.ft').append(
		   		 '<div class="picOuter" style="display: flex">'
		       	+	'<div class="allpicOuter">'
		    	+		'<div class="allpic">'
		        +			'<div class="pic1"></div>'
		   		+			'<div class="pic2"></div>'
		        +			'<div class="pictext">파일을 여기 끌어다 놓거나 <br>새로만들기 버튼을 사용하세요</div>'
		   		+		'</div>'
		        +	'</div>'
		        +'</div>')
		     }else{
		    	 $('.picOuter').remove();
		     }
			
		})
		return false;
	});
 
})
 // 파일업로드 끝
 
// 모달의 새로 만들기 버튼 클릭시를 구현할 거예요!
$('.addFolder').click(function(){
  	$(this).parent().parent().modal('hide');
  	
  		$('.myModal').modal({
  		  keyboard: true, 
  		  show: true,
  		}).css({
  		  display: 'flex',
  		  alignItems: 'center',
  		  flexDirection: 'column',
  		  justifyContent: 'center',
  		})
  		
  		$('.modal4').find('.addTextBefore').val("제목없는 폴더").select();
  		

 // esc 키다운시 modal4 비활성화
 $(document).on('keydown', function(e) { 
      if (e.keyCode == 27) 
      $('.myModal').modal('hide');
      $('.fileUpload').modal('hide');
  }); 
})

  //폴더만들기 모달의  생성버튼( .AfterMakeIt) 클릭시 
  //폴더이름의 클래스(.addTextBefore) 해당 모달의  input태그 내 value 를 가져와서 폴더 만들기 
    $('.AfterMakeIt').click(function(){
    	
    	// input창에 공백으로 폴더를 생성할경우 false 반환
    	if($(".addTextBefore").val() == "" || $(".addTextBefore").val().trim() == "" ){
    		alert("이름을 지어주세요!")
    		return false
    	}
    	console.log(nPath);
    	var node = $("#tree").fancytree("getActiveNode");
    	if (!node) node = $("#tree").fancytree("getRootNode").children[0];
    	if (node.folder==false) {
    		node = node.parent
    		console.log(node);
    	}
    	
    	var key = node.getKeyPath(false).split("/");
//     	console.log(key);
		var arrpatt= [];
		for(var i = 1; i< node.getKeyPath(false).split("/").length ; i++ ){			
    	arrpatt.push($("#tree").fancytree("getTree").getNodeByKey(node.getKeyPath(false).split("/")[i]).title);
		}
		
		var pat = "C:\\drive\\"
		var patt = arrpatt.join("\\");
// 		console.log(pat + patt);
		
    	var childNode = node.addChildren({
            title: $(".addTextBefore").val(),
            folder: true,
            data : {
            	path : pat+patt+"\\"+$(".addTextBefore").val()
            }
         });
    	
    	node.setExpanded = true;
    	
    //  path
    		 var arrPath = [];
    		 var keyPath = [];
            for(var i = 1 ; i< childNode.getKeyPath(false).split("/").length ; i++ ){
            	arrPath.push($("#tree").fancytree("getTree").getNodeByKey(childNode.getKeyPath(false).split("/")[i]).title)
            	keyPath.push($("#tree").fancytree("getTree").getNodeByKey(childNode.getKeyPath(false).split("/")[i]).key)
            }
             var path = arrPath.join('\\');
//              console.log(path);
             var kpath = keyPath.join('\\');
             var keyVal = kpath.substring(kpath.lastIndexOf('\\')+1 , kpath.length) // 마지막 \\ 찾아서 자르기
           
    // ajax 호출하기 makedir 폴더 생성
        	$.ajax({
        		url: '<c:url value="/drive/makedir.do" />',
        		data: {
        			path : path,
        			keyVal : keyVal
        			}
        	}).done(function(e){
    			$('tbody').append('<tr path-data="'+e.path+'">' 
	    		        +  '<td class="folderName"><div class="emoji fas fa-folder fa-lg"></div><span id="'+keyVal+'">'+e.title+'</span></td>'
	    		        +  '<td class="owner" class="text-center">'+e.path.split("\\")[2]+'</td>'
	    		        +  '<td class="date" class="text-center">'+e.lastModified+'</td>'
	    		        +  '<td class="val" class="text-center">-</td>'
	    		        +  '</tr>');
    	 		$('tbody').attr('data-path',  e.path.substring(0, e.path.lastIndexOf('\\')) )
        	})
        	
    	  $('.picOuter').remove();
          $('.addTextBefore').val('제목없는 폴더');
          $(this).parent().parent().parent().modal('hide');
        
      })//end 폴더 추가하기
  
//----------------- // 동적으로 만든 tr(폴더) 태그의 contextmenu 
      var tr;		// 우클릭한 tr의 $(this);
      var thi;  // 우클릭한 tr의 이름 (폴더명 and 파일명) ex) google.png
      var clickedTag;  //선택한 tr태그의 path-data 를 가져온다 (경로)
      var google; // 모달의 input창 value 기존값
      var googleval; // input창 value의 바뀐값
      var tree;	
      var find // 우클릭한 tr태그와 플러그인에서 같은 이름을 가진 것들을 찾는다.
      var needPath; //우클릭한 tr의 경로와 펜시트리에서 같은 경로를 가지고 있는것을 비교 // true일시  needPath 변수에 담음
      var thiResult;  // 파일이름  ex) google
      var thiResultEXT;  // 파일확장자 ex) .png
      var resultPath; // 
      var needNode;
      $('.contextmenu').children().eq(1).off('click').click(function(){
//     	  console.log("thi", thi);
			if(thi.indexOf('.') != -1){
    		 thiResult =  thi.substring(0 , thi.indexOf('.'));
    		 thiResultEXT = thi.substring(thi.indexOf('.') , thi.length);
    		 thi = thiResult;
				}
    	  		
        $('.myModal2').modal({
           keyboard: true, 
           show: true
         }).css({
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          justifyContent: 'center'
         }).find('.changeNameText').val(thi).select();
        
         googleval = $('.myModal2').find('.changeNameText').val();	// 모달의 input - value를 가져온다.  
         console.log("기존 이름",thi);	

         console.log("우클릭한 태그의 경로",clickedTag);	// ex ) C:\drive\parkhanjun\제목없는 폴더\google.png  
         
         if(thiResultEXT == undefined) thiResultEXT ="";
   		tree = $("#tree").fancytree("getTree");
   		console.log( (thi).trim())
   		find = tree.findAll(thi);
   		console.log("트리 경로찾을거야",find);
   		
   		for(var i =0; i < find.length ; i++){
//    			console.log(find[i].data.path);
//    			console.log(clickedTag);
//    			console.log(find[i].data.path == clickedTag)
   			if(find[i].data.path == clickedTag){
   				needPath = find[i].data.path;
   				needNode =find[i];
   			} // end if
   		}//end for
   				resultPath = needPath.substring(0 , needPath.lastIndexOf("\\")+1);
   		
   	  // 이름 바꾸기 변경 버튼 누를시 !!!!
        $('.myModal2').find('.AfterChange').off('click').click(function(){
     	   //changeNameText 
     	google = $(this).parent().parent().find('.changeNameText').val()
//      	console.log(google, thiResultEXT); // 바꿀 이름  + 확장자
     	if(google == "" || google.trim() == ""){
     		alert("이름을 지어주세요!")
     		return false;
     	}
     	if(thiResultEXT == undefined) thiResultEXT = "";	// 확장자가 없는것일(폴더) 경우 undefinedㄱ 
     	
 		$.ajax({
 			url: '<c:url value="/drive/rename.do" />',
 			data : {
 				path : thi+thiResultEXT,
 				title : resultPath+google+thiResultEXT 
 			}
 		}).done(function(result){
 			console.log(result);
 			EmojiAndFLengthLIST(result);
 			needNode.setTitle(google+thiResultEXT)
 			console.log(needNode.data.path);
 			needNode.data.path = resultPath+google+thiResultEXT
 		})

 		// 띄워진 모달창 숨김
        $(this).parent().parent().parent().modal('hide');
             })// 이름바꾸기 이벤트 끝
   		
      })
        
            //우클릭 메뉴 삭제 눌렀을때
            $('.contextmenu').children().eq(4).click(function(){
                console.log(clickedTag);  
            	
                tr.remove() // 우클릭한 태그 삭제
    			tree = $("#tree").fancytree("getTree"); // 트리 구조 불러오기
    			console.log(thi);
            	googleval = $('.myModal2').find('.changeNameText').val(thi);
            	find = tree.findAll(thi)	// 트리에서 thi를 가지고 있는 하위목록 가져오기
            	console.log(find)
    			for(var i =0 ; i < find.length ; i++)
    			{
    				console.log("클릭태그",clickedTag);
    				console.log("똑같",find[i].data.path);
    				if(clickedTag == find[i].data.path)
    				{
    					var needNode = find[i]
    					console.log("neeee", needNode);
    				}
    			}
    			tree.activateKey(needNode.key).remove();
                
                $.ajax({
            		url : '<c:url value="/drive/delete.do" />',
            		data : {path : clickedTag} 
            	}).done(function(result){
            		console.log(result);
            	})
        })
            
            
 	
       //contextmenu 동적생성 이벤트 tr태그(폴더) 한정 발생
       $(document).on('contextmenu', 'tr' , function(e){
    	tr = $(this);
        thi = $(this)[0].children[0].innerText;
        clickedTag = tr.attr('path-data');
        
    //Get window size:
    var winWidth = $(document).width();
    var winHeight = $(document).height();
    //Get pointer position:
    var posX = e.pageX;
    var posY = e.pageY;
    //Get contextmenu size:
    var menuWidth = $(".contextmenu").width();
    var menuHeight = $(".contextmenu").height();
    //Security margin:
    var secMargin = 10;
    //Prevent page overflow:
    if(posX + menuWidth + secMargin >= winWidth
    && posY + menuHeight + secMargin >= winHeight){
      //Case 1: right-bottom overflow:
      posLeft = posX - menuWidth - secMargin + "px";
      posTop = posY - menuHeight - secMargin + "px";
    }
    else if(posX + menuWidth + secMargin >= winWidth){
      //Case 2: right overflow:
      posLeft = posX - menuWidth - secMargin + "px";
      posTop = posY + secMargin + "px";
    }
    else if(posY + menuHeight + secMargin >= winHeight){
      //Case 3: bottom overflow:
      posLeft = posX + secMargin + "px";
      posTop = posY - menuHeight - secMargin + "px";
    }
    else {
      //Case 4: default values:
      posLeft = posX + secMargin + "px";
      posTop = posY + secMargin + "px";
    };
   
    //Display contextmenu css
    $(".contextmenu").css({
      "left": posLeft,
      "top": posTop
    })
    
    //contextmenu show
    $(".contextmenu").show();
      
       })//contextmenu 위치 및 css

      //Hide contextmenu
      $(document).click(function(){
        $(".contextmenu").hide();
      });

      //modal cancle button
    $('.AfterCancle').click(function(){
     $(this).parent().parent().parent().modal('hide');
    })

  //배경 우클릭 비활성화
$(document).contextmenu(function(e){
  return false;
})
//-----------------contextmenu 관련 끝 ---------------------

//-----------------------아이콘 관련 시작--------------
//부트스트랩 아이콘 툴팁
  $(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

      // 아이콘 css
$('.infoCircle').mouseover(function(){
          $(this).css('background-color' , '#f1f3f4');
          $('.google').css('opacity', 'unset');
        }).mouseleave(function(){
          $(this).css('background-color' , 'unset')
          $('.google').css('opacity', '0.66');
        })

        // 아이콘 css
  $('.infoCircle').click(function() {
      if($('.detailside').hasClass("leftgo")){
        $('.main ').attr('class', 'col-md-8 main').css("transition" , ".4s")
        $('.detailside').removeClass("leftgo")
        $('.infoCircle').css({
          'background-color' : '#e8f0fe'
        })
        
        $('.google').css({
          'color' : '#1967d2',
          'opacity' : 'unset'
        })
      }else{
        $('.main ').attr('class', 'col-md-10 main')
        $('.detailside').addClass("leftgo").css("transition" , ".4s")
        $('.infoCircle').css({
          'background-color' : 'unset'
        })
        $('.google').css({
          'color' : 'unset',
          'opacity' : '.66'
        })
      }
})//end infoCircle 아이콘 css
//-----------------------아이콘 관련 끝 -----------------------------

//------------------------------------------ 모달 관련 시작
  $btn1 = $('#myBtn1').offset();
  $btn2 = $('#myBtn2').offset();
  $btn3 = $('.fa-th').offset();
  
  $('.modal1').css({
    top :  $btn1.top+48,
    left : $btn1.left,  
  })
  $('.modal2').css({
    top : $btn2.top+35,
    left : $btn2.left
  })
  $('.modal3').css({
    top : $btn3.top+35,
    left : $btn3.left
  })
  

  // 모달버튼의 위치와 모달이뜨는 위치 계산
  $('#myBtn1').click(function(){
    $('#myModal1').modal({
            keyboard: true, 
            show: true
})
$(document).on('keydown', function(e) { 
      if (e.keyCode == 27) 
      $('#myModal1').modal('hide')
  }); 

  })
  // myBtn1 myModal1 open

  $('#myBtn2').click(function(){
    $('#myModal2').modal({
            keyboard: true, 
            show: true
})
$(document).on('keydown', function(e) { 
      if (e.keyCode == 27) 
      $('#myModal2').modal('hide')
  }); 
  })
   // myBtn2 myModal2 open

 $('.fa-th').click(function(){
    $('#myModal3').modal({
            keyboard: true, 
            show: true
})
$(document).on('keydown', function(e) { 
      if (e.keyCode == 27) 
      $('#myModal3').modal('hide')
  }); 
  })
  //------------------------------------------ 모달 과련 끝
  
var source = [ 
  	{"title": "${user.id}", "expanded": true, "path" : "C:\\drive\\"+"${user.id}" , "folder": true, "children": [
  ]}
  ]
  //fancytree 최초에 load
  // 태그중 id가 tree인것에 적용 됨
  $(function(){
	
	  $("#tree").fancytree({
//     	generateIds: true,
//         idPrefix: "test_", 
//     	autoCollapse: true, //자동 접기
        clickFolderMode: 4,
        selectMode: 1,
        icon: function(event, data) {
          return !data.node.isTopLevel();
        },
        activate: function(event, data) {
            $("#echoActive").text(data.node.title);
               
            if( data.node.url )
              window.open(data.node.url, data.node.target);
          },
          deactivate: function(event, data) {
            $("#echoSelected").text("-");
          },
        
      extensions: ["dnd5","childcounter"],
      source: source,
    dnd5: {
        // --- Drag-support:
        dragStart: function(node, data) {
          /* This function MUST be defined to enable dragging for the tree.
           * Return false to cancel dragging of node.
           * data.dataTransfer.setData() and .setDragImage() is available
           * here.
           */
//          data.dataTransfer.setDragImage($("<div>hurz</div>").appendTo("body")[0], -10, -10);
          return true;
        },
        dragDrag: function(node, data) {
          data.dataTransfer.dropEffect = "move";
        },
        dragEnd: function(node, data) {
        },
        
        // --- Drop-support:
        dragEnter: function(node, data) {
          // node.debug("dragEnter", data);
          data.dataTransfer.dropEffect = "move";
          // data.dataTransfer.effectAllowed = "copy";
          return true;
        },
        dragOver: function(node, data) {
          data.dataTransfer.dropEffect = "move";
          // data.dataTransfer.effectAllowed = "copy";
        },
        dragLeave: function(node, data) {
        },
        dragDrop: function(node, data) {
          /* This function MUST be defined to enable dropping of items on
           * the tree.
           */
          var transfer = data.dataTransfer;

          node.debug("drop", data);

          // alert("Drop on " + node + ":\n"
          //   + "source:" + JSON.stringify(data.otherNodeData) + "\n"
          //   + "hitMode:" + data.hitMode
          //   + ", dropEffect:" + transfer.dropEffect
          //   + ", effectAllowed:" + transfer.effectAllowed);

          if( data.otherNode ) {
            // Drop another Fancytree node from same frame
            // (maybe from another tree however)
            var sameTree = (data.otherNode.tree === data.tree);

            data.otherNode.moveTo(node, data.hitMode);
          } else if( data.otherNodeData ) {
            // Drop Fancytree node from different frame or window, so we only have
            // JSON representation available
            node.addChild(data.otherNodeData, data.hitMode);
          } else {
            // Drop a non-node
            node.addNode({
              title: transfer.getData("text")
            }, data.hitMode);
          }
          node.setExpanded();
        }
      },
      childcounter: {
        deep: false,
        hideZeros: true,
        hideExpanded: true
      },
      activate: function(event, data) {
    	 	// 클릭이 들어와 있을때
      },
    	  // 부분 로드 및 게으른(트랜지션 줄 수 있음) 폴더 구현할 수 있음 
      lazyLoad: function(event, data) {
    	  
    	  node = data.node;
    	  
//     	  console.log("레이지노드!",node)
    	  var path = node.data.path;
	    		 data.result =	 $.ajax({
				url : '<c:url value="/drive/detailFolder.do" />',
				data : {
					"path" : path
					},
			}).done(function(result){
			})
      }, // end lazyLoad 	
      loadChildren: function (event, data) {
        // update node and parent counters after lazy loading
    		            data.node.updateCounters();
      },
      keydown: function(event, data){
          switch( $.ui.fancytree.eventToString(data.originalEvent) ) {
          case "return":
          case "space":
            data.node.toggleExpanded();
            break;
          }
        },
        dblclick: function(event,data){
        	console.log(data.node.isExpanded());
        },
        click: function(event, data) {
        	console.dir(data.node);
    	 	var path = data.node.data.path
    	 	//파일업로드 경로주기
    	 	nowpath(path);
    	 	$.ajax({
    	 		url : '<c:url value="/drive/activateFolder.do" />', 
    	 		data : {
    	 			"path" : path
    	 			}
    	 	}).done(function(result){
				 //폴더 아이콘 처리와 파일 용량 처리
				 EmojiAndFLengthLIST(result);
				 
				 //!!!! 함수로 뺄 것 노가다 if
				if($('tbody').children().length==0 && $('.ft').children().length==1 )
						{
					    $('.ft').append(
					   		 '<div class="picOuter" style="display: flex">'
					       	+	'<div class="allpicOuter">'
					    	+		'<div class="allpic">'
					        +			'<div class="pic1"></div>'
					   		+			'<div class="pic2"></div>'
					        +			'<div class="pictext">파일을 여기 끌어다 놓거나 <br>새로만들기 버튼을 사용하세요</div>'
					   		+		'</div>'
					        +	'</div>'
					        +'</div>')
					     }else{
					    	 $('.picOuter').remove();
					     }
				 	
    	 	}) // end function done
        }//end fancytree click event
      }); // end fancytree
      
      // For our demo: toggle auto-collapse mode:
      $("input[name=autoCollapse]").on("change", function(e){
        $.ui.fancytree.getTree().options.autoCollapse = $(this).is(":checked");
      });
    });

	//!!!! (임의로 만든거) 로그아웃 버튼 누를시 트리 구조 불러옴 
		$('.fa-sign-out-alt').on('click', function(){		
			
			$.ajax({
				url : '<c:url value="/drive/test.do" />'
			}).done(function(result){
				console.log(result);
				var node = $("#tree2").fancytree("getRootNode").children[0];
				var childlist = ${list};
		 	 	
				 	for(var i=0 ; i< childlist.length; i++){
					 	var e = childlist[i];
					 	var childNode = node.addChildren(e);
				 	}
			})
			
			$('#fancytreeModule').modal('show')
			
		})
	
	
		
		
		
		//!!!!
	function nameChange() {	
	$('.changeNameText').on('keyup', function(){
		console.log($(this).val() == "")
		if($(this).val() == ""){
			alert("이름 입력하시오");
		}
	})
}
		
		// drive.do 처음 접속화면 리스트 표현
		// 유저 이름에 해당하는 리스트를 가져와서 뿌린다.
			function drive(){
				var node = $("#tree").fancytree("getRootNode").children[0];
				var childlist = ${list};
				var keyPath;
				var emoji;
		 	 	var length;
		 	 	
				 	for(var i=0 ; i< childlist.length; i++){
					 	var e = childlist[i];
// 					 	console.log(e.zzz);
					 	var childNode = node.addChildren(e);
					 		  keyPath = childNode.getKeyPath(false).split('/')[childNode.getKeyPath(false).split('/').length-1]

						 if(e.length < 1024)
					 	 {
		    	 			length = e.length +"Byte";
		    	 		 }
		    	 		 else if(e.length > 1024)
		    	 		 {
		    	 			length = Math.ceil(e.length/Math.pow(1024,1)) + "KB"
		    	 		 }
		    	 		 else if( e.length > 1048576)
		    	 		 {
		    	 			length = Math.round(e.length / Math.pow(1024,2)) + "MB"
		    	 		 }
		    	 		 else if( e.length > 1073741824)
		    	 		 {
		    	 			length = Math.round(e.length / Math.pow(1024,3)) + "GB"
		    	 		 }
				 
					 		 var choose;
		 						
			    	 		 switch(e.folder){
				 				case true : emoji='emoji fas fa-folder fa-lg';
				 				break;
				 				case false : 
				 					var extention = e.path.substring(e.path.lastIndexOf('\\')+1, e.path.length); // path마지막 부분 자르기 (타이틀)
				 					var ext = extention.substring(extention.lastIndexOf('.')+1 , extention.length); // 타이틀의 확장자 가져오기
				 					if(ext == 'bmp' || ext == 'jpg' || ext == 'jpeg' || ext == 'png') {emoji = 'img'; choose = e.zzz.path}
			 						if(ext == 'txt' || ext == 'text') {emoji='txt'; choose = e.line}
			 						if(ext == 'ppt' || ext == 'pptx') {emoji='ppt'; choose = ""}
			 						if(ext == 'xlsx') {emoji='xlsx'; choose =""}
				 					break;
				 				}
					 		 
					 $('tbody').append('<tr path-data ="'+e.path+'" id="'+keyPath+'">' 
			    		        +  '<td class="folderName"><div class="emoji '+emoji+'"></div><span id="">'+e.title+'</span></td>'
			    		        +  '<td class="owner" class="text-center">'+e.path.split("\\")[2]+'</td>'
			    		        +  '<td class="date" class="text-center">'+e.lastModified+'</td>'
			    		        +  '<td class="val" class="text-center">'+length+'</td>'
			    		        +  '<input type="hidden" class="eLine" value="'+choose+'">'
			    		        +  '</tr>');
					 $('tbody').attr('data-path',  childlist[0].path.substring(0, childlist[0].path.lastIndexOf('\\')) )
					 
						// 파일 업로드할때 필요한 현재페이지의 경로를 보내는 기능
					 	 	nowpath($('tbody').attr('data-path'));
				 }
				 
					
				 	if($('tbody').children().length==0 && $('.ft').children().length==1 )
							{
						    $('.ft').append(
						   		 '<div class="picOuter" style="display: flex">'
						       	+	'<div class="allpicOuter">'
						    	+		'<div class="allpic">'
						        +			'<div class="pic1"></div>'
						   		+			'<div class="pic2"></div>'
						        +			'<div class="pictext">파일을 여기 끌어다 놓거나 <br>새로만들기 버튼을 사용하세요</div>'
						   		+		'</div>'
						        +	'</div>'
						        +'</div>')
						     }else{
						    	 $('.picOuter').remove();
						     }//end if
			            }// end function drive  // 처음 리스트를 불러오는 역할
			            
			            $(document).ready(function(){
			            	drive();
			            })
			            
			            // 리스트(테이블)내 tr태그 클릭시(폴더) 하위폴더로 이동
			            	$(document).on('dblclick', 'tr' ,function(){
								pathData = $(this).attr('path-data');	// 클릭한 태그의 path-data 속성을 가져옴
								var isFolder = $(this).find('.emoji')[0].className.indexOf('fas fa-folder'); // 클릭한 태그의 클래스를 가져와서 폴더인지 아닌지 판단	
								console.log(pathData);
								// 파일 업로드할때 필요한 현재페이지의 경로를 보내는 기능
	 					 	 	nowpath(pathData);
	 					 	 	
								// emoji 속성을 보고 폴더인지 파악 -> indexOf가 -1 반환시	 //파일일시 읽어오는 역할 수행 
								var emojiTest = $(this).find('.emoji')[0].className;
								var title = $(this).find('span')[0].textContent // 파일의 제목
								
								$('.modal-body').children()[0].textContent = "";
								$('#fileimage').attr('src' , "").css({
									width : "",
									height : ""
								});
								if(isFolder == -1 && emojiTest == "emoji txt")
								{
									var eLine = $(this).find('.eLine').val() // 파일의 내용
									$('.modal-header > .modal-title')[0].innerText= title; // 모달에 제목 넣기
									$('.modal-body').children()[0].innerText= eLine; // 모달에 내용 넣기
									$('#fileReader').modal('show'); // 모달 보이기
								}
								else if(emojiTest == 'emoji img')
								{
									$.ajax({
										url : '<c:url value="/drive/imageRead.do" />',
										data : {
											path : pathData
										}
									}).done(function(result)
										{
										$('.modal-header > .modal-title')[0].innerText= title; // 모달에 제목 넣기
										$('#fileimage').attr('src' , result).css({
											width : 'auto',
											height : 'auto',
											maxWidth: '100%', 
										  	maxHeight: '100%'
										});
										$('#fileReader').modal('show'); // 모달 보이기
										})
								}else{
								$.ajax({
									url : '<c:url value="/drive/trClickToDetail.do" />',
									data : {
										path : pathData
									}
								}).done(function(result){
									console.dir(result);
									EmojiAndFLengthLIST(result);
									tree = $("#tree").fancytree("getTree")
									dbcNode = pathData.substring(pathData.lastIndexOf('\\')+1 , pathData.length);
									
									var findAll = tree.findAll(dbcNode);
									for(var i =0; i < findAll.length ; i++ ){
										if(findAll[i].data.path == pathData){
											clickToLazy = findAll[i];
											console.log(clickToLazy);
											clickToLazy.resetLazy();
											if(clickToLazy.isLazy() == true)	clickToLazy.lazyLoad();											
										}
									}

									
										//!!!! 오류 유발 수정 필요
									if($('tbody').children().length==0){
					    			    
					    			    $('.ft').append(
					    			   		 '<div class="picOuter" style="display: flex">'
					    			       	+	'<div class="allpicOuter">'
					    			    	+		'<div class="allpic">'
					    			        +			'<div class="pic1"></div>'
					    			   		+			'<div class="pic2"></div>'
					    			        +			'<div class="pictext">파일을 여기 끌어다 놓거나 <br>새로만들기 버튼을 사용하세요</div>'
					    			   		+		'</div>'
					    			        +	'</div>'
					    			        +'</div>').show()
					    			            }else{
					    			            	$('.ft > .picOuter').hide();
					    			            } //end 
									
									}) //end ajax function .done
								} //end else 폴더일시 수행
							 })//end function
			            	
			            
	 var fileIndex = 0;
    // 등록할 전체 파일 사이즈
    var totalFileSize = 0;
    // 파일 리스트
    var fileList = new Array();
    // 파일 사이즈 리스트
    var fileSizeList = new Array();
    // 등록 가능한 파일 사이즈 MB
    var uploadSize = 50;
    // 등록 가능한 총 파일 사이즈 MB
    var maxUploadSize = 500;

		$(function (){
        // 파일 드롭 다운
        fileDropDown();
    });
		
		 function fileDropDown(){
        var dropZone = $(".tableDiv");
        //Drag기능 
        dropZone.on('dragenter',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#E3F2FC');
        });
        dropZone.on('dragleave',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#FFFFFF');
        });
        dropZone.on('dragover',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#E3F2FC');
        });
        dropZone.on('drop',function(e){
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#FFFFFF');
            
            var files = e.originalEvent.dataTransfer.files;
            console.log(e.originalEvent.dataTransfer.files[0].path)
            console.log(files)
            if(files != null){
                if(files.length < 1){
                    alert("폴더 업로드 불가");
                    return;
                }
                selectFile(files)
            }else{
                alert("ERROR");
            }
        });
    }
		 
		 function selectFile(fileObject){
		        var files = null;
		 
		        if(fileObject != null){
		            // 파일 Drag 이용하여 등록시
		            files = fileObject;
		        }else{
		            // 직접 파일 등록시
		            files = $('#multipaartFileList_' + fileIndex)[0].files;
		        }
		 }

		 // 앱 아이콘 클릭시 메인으로 이동
		 function app() {
			 location.href = "/steach/main/main.do"
		 }
		 
		 // 모듈화 폴더리스트 생성과 용량 및 아이콘을 결정해줌
		 function EmojiAndFLengthLIST(result){
			 $('tbody').empty();
			 var emoji;
			 var length;
			 for(var i =0 ; i < result.length ; i++){
    	 		   var e = result[i];
	    	 		 
	    	 		 if(e.length < 1024){
	    	 			length = e.length +"Byte";
	    	 		 }
		    	 		 else if(e.length > 1024){
		    	 			length = Math.ceil(e.length/Math.pow(1024,1)) + "KB"
		    	 		 }
		    	 		 else if( e.length > 1048576){
		    	 			length = Math.round(e.length / Math.pow(1024,2)) + "MB"
		    	 		 }
		    	 		 else if( e.length > 1073741824){
		    	 			length = Math.round(e.length / Math.pow(1024,3)) + "GB"
		    	 		 }
			 
	    	 		var choose;
		 						
	    	 		 switch(e.folder){
		 				case true : emoji='emoji fas fa-folder fa-lg';
		 				break;
		 				case false : 
		 					var extention = e.path.substring(e.path.lastIndexOf('\\')+1, e.path.length); // path마지막 부분 자르기 (타이틀)
		 					var ext = extention.substring(extention.lastIndexOf('.')+1 , extention.length); // 타이틀의 확장자 가져오기
		 					if(ext == 'bmp' || ext == 'jpg' || ext == 'jpeg' || ext == 'png') {emoji = 'img'; choose = e.zzz.path}
	 						if(ext == 'txt' || ext == 'text') {emoji='txt'; choose = e.line}
	 						if(ext == 'ppt' || ext == 'pptx') {emoji='ppt'; choose = ""}
	 						if(ext == 'xlsx') {emoji='xlsx'; choose =""}
		 					break;
		 				}
	    	 		 
	    	 		
			 
	    	 		$('tbody').append('<tr path-data="'+e.path+'">' 
		    		        +  '<td class="folderName"><div class="emoji '+emoji+'"></div><span id="test_'+i+'">'+e.title+'</span></td>'
		    		        +  '<td class="owner text-center">'+e.path.split("\\")[2]+'</td>'
		    		        +  '<td class="date text-center">'+e.lastModified+'</td>'
		    		        +  '<td class="val text-center">'+length+'</td>'
		    		        +  '<input type="hidden" class="eLine" value="'+choose+'">'
		    		        +  '</tr>');
	    	 		$('tbody').attr('data-path',  result[0].path.substring(0, result[0].path.lastIndexOf('\\')) )
	    	 		console.log("ddddd",result[0].path.substring(0, result[0].path.lastIndexOf('\\')));
			 }//end for
			 
		 }// end function EmojiAndFLengthLIST
		 
		 $('.textheader').click(function(){
			 location.reload();
		 })
		 
</script>
</body>
</html>