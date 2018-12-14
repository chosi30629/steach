<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	 <div id="tree2"></div>
	
<script>

var source = [ 
  	{"title": "${user.id}", "expanded": true, "path" : "C:\\drive\\"+"${user.id}" , "folder": true, "children": [
  ]}
  ]

$(function(){
			  $("#tree2").fancytree({
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
		        
		      extensions: ["childcounter"],
		      source: source,
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
//		     	  console.log("레이지노드!",node)
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
		        }//end fancytree click event
		      }); // end fancytree
		      
		      // For our demo: toggle auto-collapse mode:
		      $("input[name=autoCollapse]").on("change", function(e){
		        $.ui.fancytree.getTree().options.autoCollapse = $(this).is(":checked");
		      });
		    });

$(document).ready(function(){
	$.ajax({
		url : '<c:url value="/drive/cardUpload.do"/>',
	}).done(function(result){
		var node = $("#tree2").fancytree("getRootNode").children[0];
		var childlist = ${list};
		 	for(var i=0 ; i< childlist.length; i++){
			 	var e = childlist[i];
			 	var childNode = node.addChildren(e);
		 	}
	})
	
	$('#fancytreeModule').modal('show')
	
})

</script>
</body>
</html>