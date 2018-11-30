<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>내 드라이브 - Steach 드라이브</title>
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
        <div class="textheader">&nbsp;스티치 드라이브  
        </div>
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

      <!-- header 종결-->
    </div>
    
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
            <div class="modal1 modal-content col-md-3">                                                   
                <p class="addFolder"><i class="fas fa-folder-plus fa-2x"></i>　폴더 추가하기</p>
                <hr>
                <p class="addFile"><i class="fas fa-file-upload fa-2x"></i>　파일 업로드</p>
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
                <div class="myBtn2icon"><i class="fas fa-sort-down" style="
                  display: flex;
                  align-items: center;
                  margin-left: 10px;
                  margin-bottom: 5px;
              "></i></div>
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
            <div class="modal2 modal-content col-md-3">                                                   
                <p class="addFolder"><i class="fas fa-folder-plus fa-2x"></i>　폴더 추가하기</p>
                <hr>
                <p class="addFile"><i class="fas fa-file-upload fa-2x"></i>　파일 업로드</p>
            </div>
       
          </div>

          
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
              </table>
                
                
               
               
                          
                  <!--내용 끝-->
              </div> <!-- tableDiv 종료-->
            </div><!-- main 태그 col-md-8 종료-->
            
            
            <div class="detailside col-md-2 sidebar" style="width: 20%; padding-left: 0px; padding-right: 0px; bottom: 1px;">
                <div class="trClick">
                  <div class="TrIcon"><i class="fas fa-folder fa-lg"></i></div>
                  <div class="TrName">내 드라이브</div>
                </div>
                <div class="trClickDetail">
                  <div>세부정보</div>
                  <div>활동</div>
                </div>
				
				<!-- 작업중 -->
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
                </div>
                

              </div><!-- right sidebar -->

              <div class="myModal modal fade">
      
                <div class="modal4 modal-content col-md-3">                                                   
                    <p class="addFolderBefore">새폴더</p>
                    <p><input class="addTextBefore form-control" type="text" value="제목없는 폴더" /></p>
                    <p style="display : flex;flex-direction: row-reverse;">
                      <button type="button" class="AfterCancle form-control" style="width:unset;">취소</button>
                      <button class="AfterMakeIt form-control" style="width:unset;">만들기</button>
                    </p>
                </div>
                   
              </div>

  </div>  <!-- 그리드 종결 태그 -->
  <ul class="contextmenu">
      <li><a href="#">색상바꾸기 (나중에)</a></li>
      <li><a href="#">이름 변경 (완료)</a></li>
      <li><a href="#">공유 (미구현)</a></li>
      <li><a href="#">다운로드 (미구현)</a></li>
      <li><a href="#">삭제 (완료)</a></li>
    </ul>
    
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

 <script type="text/javascript">
 

 
 var inputModal = function() {
$('.myModal').modal({
  keyboard: true, 
  show: true,
}).css({
  display: 'flex',
  alignItems: 'center',
  flexDirection: 'column',
  justifyContent: 'center',
})    
};

// 새로 만들기 버튼 클릭시를 구현할 거예요!
$('.addFolder').click(function(){
  
  $(this).parent().parent().modal('hide');
  inputModal();

// 모달창은 autofocus 안먹혀서 따로 처리
function addTextBefore(e) {
  $('.addTextBefore').focus();
}
addTextBefore()
  
  // esc 키다운시 modal4 비활성화
  $(document).on('keydown', function(e) { 
      if (e.keyCode == 27) 
      $('.myModal').modal('hide') 
  }); 
})

  //새로만들기모달  .AfterMakeIt (폴더 만들기) 클릭시 
  //.addTextBefore 의 myModal 내의 input:value 를 가져와서 폴더 만들기 
  
    $('.AfterMakeIt').click(function(){
    	
    	// input창에 공백으로 폴더를 생성할경우 false 반환
    	if($(".addTextBefore").val() == "" || $(".addTextBefore").val().trim() == "" ){
    		alert("이름을 지어주세요!")
    		return false
    	}
    	
    	var node = $("#tree").fancytree("getActiveNode");
    	if (!node) node = $("#tree").fancytree("getRootNode").children[0];
    	
    	var childNode = node.addChildren({
            title: $(".addTextBefore").val(),
//             tooltip: $(".addTextBefore").val(),
            folder: true
         });
    	
    //  path
    		 var arrPath = [];
    		 var keyPath = [];
            for(var i = 1 ; i< childNode.getKeyPath(false).split("/").length ; i++ ){
            	arrPath.push($("#tree").fancytree("getTree").getNodeByKey(childNode.getKeyPath(false).split("/")[i]).title)
            	keyPath.push($("#tree").fancytree("getTree").getNodeByKey(childNode.getKeyPath(false).split("/")[i]).key)
            }
             var path = arrPath.join('\\');
             var kpath = keyPath.join('\\');
             var keyVal = kpath.substring(kpath.lastIndexOf('\\')+1 , kpath.length) // 마지막 \\ 찾아서 자르기
    	        console.log(path);
            	console.log(kpath);
            	console.log(keyVal);
            	// 
           
    // ajax 호출하기 makedir
        	
        	$.ajax({
        		url: '<c:url value="/drive/makedir.do" />',
        		data: {
        			path : path,
        			keyVal : keyVal
        			}
        	}).done(function(result){
    			console.log(result);
        		$('tbody').append('<tr class="ggg">' 
        		        +  '<td class="folderName"><i class="fas fa-folder fa-lg"></i><span id="'+result.keyVal+'">'+result.name+'</span></td>'
        		        +  '<td class="owner" class="text-center">'+result.patt.split("\\")[2]+'</td>'
        		        +  '<td class="date" class="text-center">'+result.modified+'</td>'
        		        +  '<td class="val" class="text-center">'+result.length+'</td>'
        		        +  '</tr>');
        	})
       	
    	
    	  $('.picOuter').css("display", "none");
          $('.addTextBefore').val('제목없는 폴더');
          $(this).parent().parent().parent().modal('hide');
        
        
      })//end 폴더 추가하기
  
//-----------------
      // 동적으로 만든 tr 태그의 contextmenu 
      var tr;
      var thi;
      var thii;
      var thiid;
      var google;
      var findData;
      var find
      var googleval;
      var tree;
      $('.contextmenu').children().eq(1).click(function(){
        $('.myModal2').modal({
           keyboard: true, 
           show: true
         }).css({
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          justifyContent: 'center'
         }).find('.changeNameText').val(thi);
        
        tree = $("#tree").fancytree("getTree");
         googleval = $('.myModal2').find('.changeNameText').val();
         console.log(googleval);
   		findData = tree.findAll(googleval)[0].data.id;
   		 console.log("findData",findData);
   		find = tree.findAll(googleval)[0];
      })
        $('.contextmenu').children().eq(4).click(function(){
        	tr.remove()
			tree = $("#tree").fancytree("getTree");
        	 googleval = $('.myModal2').find('.changeNameText').val(thi);
			console.log(googleval);        	 
			find = tree.findAll(thi)[0];
			tree.activateKey(find.key).remove();
           	
        })
       
      
       // 이름 바꾸기 변경 버튼 누를시
       $('.myModal2').find('.AfterChange').click(function(){
    	   
    	   
    	   //changeNameText 
    	google = $(this).parent().parent().find('.changeNameText').val()
    	
    	if(google == "" || google.trim() == ""){
    		alert("이름을 지어주세요!")
    		return false;
    	}
    	
		console.log("네가 찾는것이 이것이니",google);// span 내용이 뜸 , 예제용
       	
		
       // innertext 변경
       thii.text(google)
      
        
       if(findData == thiid){
    	   console.log(true);
    	   find.setTitle(google);
       }
       $(this).parent().parent().parent().modal('hide');
            })
         
      

 	
       //동적생성 태그 이벤트 
       $(document).on('contextmenu', 'tr' , function(e){
    	tr = $(this);
        thi = $(this)[0].children[0].innerText;
        thii = $(this).find('span');
        thiid = thii.attr('id');
        console.log(thiid);
        
       
        
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
      
       })

      //Hide contextmenu:
      $(document).click(function(){
        $(".contextmenu").hide();
      });


      //modal cancle button
    $('.AfterCancle').click(function(){
     $(this).parent().parent().parent().modal('hide');
    })

  // 우클릭 비활성화
$(document).contextmenu(function(e){
  return false;
})

  $(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

$('.infoCircle').mouseover(function(){
          $(this).css('background-color' , '#f1f3f4');
          $('.google').css('opacity', 'unset');
        }).mouseleave(function(){
          $(this).css('background-color' , 'unset')
          $('.google').css('opacity', '0.66');
        })

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
    
})


  $btn1 = $('#myBtn1').offset();
  $btn2 = $('#myBtn2').offset();
  $btn3 = $('.fa-th').offset();
//   console.log($btn1.top , $btn1.left)
  
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
  //
  
  var subfile = '${subFiles}';
  //fancytree 첫로드시 폴더 트리 구성 소스 ${subFiles}
// 	for(var ide in subfile){
// 		console.log(subfile);
// 	}
var sour = [ 
  	{"title": "${user.name}", "expanded": true, "folder": true, "children": [
//		  {"title": "예제용", "folder": true , data : {id : "test_0"} , "children": [
//			  {"title": "cups"},
//			  {"title": "httpd"},
//			  {"title": "init.d"}
//		  ]}
		
  ]}
  ]
  
  //fancytree 처음 load
  $(function(){
    // Attach the fancytree widget to an existing <div id="tree"> element
    // and pass the tree options as an argument to the fancytree() function:
    $("#tree").fancytree({
    	generateIds: true,
        idPrefix: "test_", 
//     	autoCollapse: true, 자동 접기
        clickFolderMode: 4,
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
      // titlesTabbable: true,
      source: sour,
    dnd5: {
        // autoExpandMS: 400,
        // preventForeignNodes: true,
        // preventNonNodes: true,
        // preventRecursiveMoves: true, // Prevent dropping nodes on own descendants
        // preventVoidMoves: true, // Prevent dropping nodes 'before self', etc.
        // scroll: true,
        // scrollSpeed: 7,
        // scrollSensitivity: 10,

        // --- Drag-support:

        dragStart: function(node, data) {
          /* This function MUST be defined to enable dragging for the tree.
           *
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
        deep: true,
        hideZeros: true,
        hideExpanded: true
      },
      activate: function(event, data) {
//        alert("activate " + data.node);
      },
      lazyLoad: function(event, data) {
        data.result = {url: "/steach/resources/fancytree/ajax-sub2.json"}
      },
      loadChildren: function(event, data) {
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
        }
      });
      // For our demo: toggle auto-collapse mode:
      $("input[name=autoCollapse]").on("change", function(e){
        $.ui.fancytree.getTree().options.autoCollapse = $(this).is(":checked");
      });
    });

//트리 구조 얻어옴
		$('.fa-sign-out-alt').on('click', function(){			
	  var tree = $("#tree").fancytree("getTree");
	  var d = tree.toDict(true);
   	  alert(JSON.stringify(d));
		})
	
		function nameChange() {	
	$('.changeNameText').on('keyup', function(){
		console.log($(this).val() == "")
		if($(this).val() == ""){
			alert("이름 입력하시오");
		}
	})
}
		

		$(document).ready(function(){
			            
				 node = $("#tree").fancytree("getRootNode").children[0];
				 var childlist = ${list};
				 for(var i=0 ; i< childlist.length; i++){
					 var e = childlist[i]
					 var childNode = node.addChildren(e);
					 console.log(e);
					 
					 $('tbody').append('<tr>' 
			    		        +  '<td class="folderName"><i class="fas fa-folder fa-lg"></i><span id="">'+e.title+'</span></td>'
			    		        +  '<td class="owner" class="text-center">'+e.path.split("\\")[2]+'</td>'
			    		        +  '<td class="date" class="text-center">'+e.lastModified+'</td>'
			    		        +  '<td class="val" class="text-center">'+e.length+'</td>'
			    		        +  '</tr>');
				 }
			            

				  if($('tbody').children().length==0){
				    
				    $('.ft').append(
				   		'<div class="picOuter">'
				       		 +'<div class="allpicOuter">'
				    		 +'<div class="allpic">'
				          	 +'<div class="pic1"></div>'
				   			 +'<div class="pic2"></div>'
				           	 +'<div class="pictext">파일을 여기 끌어다 놓거나 <br>새로만들기 버튼을 사용하세요</div>'
				   			 +'</div>'
				             +'</div>'
				         	 +'</div>')
				            $('.picOuter').css("display", "flex");
				            } //if
				 
				 
			            })

		 function app() {
			 location.href = "/steach/main/main.do"
		 }
		 
</script>
</body>
</html>