<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자리배치 페이지</title>
<!-- header import -->
<c:import url="/WEB-INF/jsp/header/classHeader.jsp" />  

<link rel="stylesheet"
	href="/steach/resources/css/class/curriculum/seat1.css" />
<link rel="stylesheet"
	href="/steach/resources/css/class/curriculum/seat2.css" />
<!-- <script src="/steach/resources/js/jquery/jquery-2.1.0.min.js"></script>  -->
<script src="/steach/resources/js/jquery/jquery-ui.js"></script>
<!-- <script src="/steach/resources/js/bootstrap.js"></script>
 -->
<!-- 화면저장 canvas2 -->

<script src="/steach/resources/js/class/curriculum/seat/html2canvas4.js"></script>
<script src="/steach/resources/js/class/curriculum/seat/canvas2image.js"></script>
<script src="/steach/resources/js/download.js"></script>

<style>
.tools-tables-gridItem:hover .tools-tables-gridItem-settings {
	display: block !important;
}

</style>

</head>
<body>

	<div class="wrapper-tools-tables wrapper-tools-tables--dfp-enabled">
		<div id="app-tools-grid-menu" class="tools-tables-left ">

			<div class="tools-tables-left-content separator">
				<p class="tools-tables-left-title">테이블 추가하기</p>
				<div class="pure-g mt20 va-flex-middle">
					<!-- 테이블 추가 -->
					<div class="pure-u-1-5 text-center"></div>

					<!-- 사람있는 테이블  -->
					<div class="pure-u-1-5 text-center">
						<a data-toggle="modal" data-target="#seat-modal"> <i
							class="app-create-table icon-tools icon-tools-table-2 pointer text-center"
							></i>
						</a>
					</div>

					<div class="pure-u-1-5 text-center"></div>

					<!-- 사람없는 테이블  -->
					<div class="pure-u-1-5 text-center">
						<a data-toggle="modal" data-target="#no-seat-modal"> <i
							class="app-create-table icon-tools icon-tools-table-5 pointer text-center"
							></i>
						</a>
					</div>
				</div>
			</div>

			<div class="tools-tables-left-content">
				<div class="tools-tables-left-guests app-tables-guest-list">
					<div class="app-tools-tables-group">
						<p class="app-tools-tables-group-title tools-tables-left-guests-family-title">학생</p>
		
		
						<c:forEach var="st" items="${memberList}">
							<!-- 성이름 자르기  -->
							<c:set var="name" value="${st.user.name}"/>
							<c:set var="length" value="${fn:length(st.user.name)}"/>
									
							<ul
								class="app-tools-tables-group-family tools-tables-left-guests-family">
								<li data-nombre="${fn:substring(name,0,1)}" data-apellidos="${fn:substring(name,1,length)}" data-seat-id=""
									class="app-tables-persona app-tables-persona-list tools-tables-left-guests-item">
	
									<span
									class="app-tables-guest-name tools-tables-left-guests-name  parent ">${st.user.name}(${st.user.id})</span> <i
									class="app-tables-guest-icon icon-tools fright relative icon-tools-avatar-guest-adult-small list-draggable"></i>
								</li>
							</ul>
						</c:forEach>
					</div>


				</div>
			</div>
		</div>
		<div class="tools-tables-right-content">
			<div class="wrapper-tables-header-buttons main">

				<div class="tools-toggle">
					<span onclick="saveImage()"
					class="app-open-layer-pdf tools-toggle-item" data-section="main">
					<i class="far fa-arrow-alt-circle-down"></i> Capture</span>
				</div>
			</div>
			<div class="app-tables-viewbox tools-tables-viewbox">
				<!-- 화면에 나오는 자리~~  -->
				<div id="result" class="app-tables-content tools-tables-content"></div>
				<div id="app-container-data" class="dnone"></div>



			</div>
		</div>

	</div>
	
	

	<!-- 자리있는 seat - modal -->
	<div tabindex="-1" role="dialog" aria-hidden="false" class="modal fade"
		id="preview-modal">
		<div class="modal-dialog modal-fullsize">
			<div class="modal-content">
				<div class="modal-header modal-headerTools">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<p class="modal-headerTools-title">미리보기</p>
				</div>
					<div class="modalAddTable__content">
						<div class="pure-g">
							<img id="image"></img> 
						</div>
						
						<form id="seatForm" method="post">
							<input type="hidden" name="seat-data" id="seatData"/>
						</form>
					</div>
					<div class="modalAddTable__footer">
						<button type="button" class="btn-flat red" value="Add"
							onclick="doDownload()">파일로 저장하기</button>
						<button type="button" class="btn-flat red" value="Add"
							onclick="saveToServer()">SAVE</button>
					</div>
			</div>
		</div>

	</div>
	
















	<!-- 자리있는 seat - modal -->
	<div tabindex="-1" role="dialog" aria-hidden="false" class="modal fade"
		id="seat-modal">
		<div class="modal-dialog">
			<div class="modal-content modalAddTable">
				<div class="modal-header modal-headerTools">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<p class="modal-headerTools-title">Add table</p>
				</div>
				<form name="seat-form" id="seat-form">
					<div class="modalAddTable__content">
						<div class="pure-g">
							<div class="pure-u-1-4">
								<i class="icon-tools icon-tools-table-1side"></i>
							</div>
							<div class="pure-u-3-4">
								<div class="input-group-line">
									<span class="input-group-line-label">Table name</span> <input
										name="tableName" type="text" value="" placeholder="Table name"
										data-msgerror="You must select a name." required="">
								</div>
								<div class="input-group-line input-group-naked">
									<br>
									<span class="input-group-line-label">Seats</span>
									<div class="mt5">
										<input type="number" name="seat" min="1" max="4" value="1">
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="modalAddTable__footer">
						<button type="button" class="btn-flat red" value="Add "
							onclick="createTable()">Save</button>
						
					</div>
				</form>
			</div>
		</div>

	</div>

	<!-- 자리없는seat - modal -->
	<div tabindex="-1" role="dialog" aria-hidden="false" class="modal fade"
		id="no-seat-modal">
		<div class="modal-dialog">
			<div class="modal-content modalAddTable">
				<div class="modal-header modal-headerTools">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<p class="modal-headerTools-title">Add table</p>
				</div>
				<form name="no-seat-form" id="no-seat-form">
					<div class="modalAddTable__content">
						<div class="pure-g">
							<div class="pure-u-1-4">
								<i class="icon-tools icon-tools-table-5"></i>
							</div>
							<div class="pure-u-3-4">
								<div class="input-group-line">
									<span class="input-group-line-label">Table name</span> <input
										name="tableName" type="text" value="" placeholder="Table name"
										data-msgerror="You must select a name." required="">
								</div>
								

							</div>
						</div>
					</div>
					<div class="modalAddTable__footer">
						<button type="button" class="btn-flat red" value="Add "
							onclick="createEmptyTable()">Save</button>
					</div>
				</form>
			</div>
		</div>

	</div>
	




	<script>
		/* data 구조화  */
		
		/* 동적 생성 테이블의 index */
		//var classNo = "${clazz.classNo}";
		var i=0;
		
		/*seat table size */
		/* const squareCommonHeight="50px";
		const square1SeatWidth="50px";
		const square2SeatWidth="100px";
		const square3SeatWidth="150px";
		const square4SeatWidth="200px";
		 */
		 const squareCommonHeight="100px";
			const square1SeatWidth="100px";
			const square2SeatWidth="200px";
			const square3SeatWidth="300px";
			const square4SeatWidth="400px";
	
		/* create table original position */
		const tableCommonTop="45px";
		const tableEmptyLeft="30px";
		const table1SeatLeft="150px";
		const table2SeatLeft="307px";
		const table3SeatLeft="474px";
		const table4SeatLeft="720px";
	
		
	
	
        /* 좌석 생성 */ 
		function createTable(){
			var formData = $("#seat-form").serializeArray();
			//formData[0].value  -- table Name ..
			//formData[1].value  -- table seat.. 
			var tName = formData[0].value;
			var seat =  parseInt(formData[1].value);
			
			if(seat){
				switch(seat){
					case 1: seat1(tName); break; 
					case 2: seat2(tName); break; 
					case 3: seat3(tName); break; 
					case 4: seat4(tName); break; 	
				}
			} else {
				
			}
			$("#seat-modal").modal('hide');
			 $("#seat-form").find("input[name='tableName']").val("");
			$(".ui-draggable").draggable();
            dropApply(); 		
		}
		
        function seat1(tName){
        	/* 생성 테이블 index ++ */
        	i++;
              var html = "<div id='table"+i+"' class='app-mesa-item tools-tables-gridItem ui-draggable' style='position:absolute;visibility:visible;top:"+tableCommonTop+";left:"+table1SeatLeft+";' data-name='"+tName+"'>";
            	  html+= "<div class='tools-tables-gridItem-settings app-table-settings' style='display: none;'>";
            	  html+= "<div class='app-table-remove mb15' data-id='table"+i+"'>";
            	  html+= "<i class='icon-tools icon-tools-tables-trash'></i><i class='icon-tools icon-tools-tables-trash-hover dnone'></i></div>";
            	  html+="<div class='app-table-edit mb15' data-id='table"+i+"'>";
            	  html+="<i class='icon-tools icon-tools-tables-edit'></i><i class='icon-tools icon-tools-tables-edit-hover dnone'></i></div></div>";
            	  html+="<div class='tools-tables-gridItem-table tools-tables-gridItem-square' style='height:"+squareCommonHeight+"; width:"+square1SeatWidth+";'>";
            	  html+="<div class='tools-tables-gridItem-squareLabel' id='table"+i+"'>&nbsp;"+tName+"&nbsp;</div></div>";
            	  html+="<div style='height:34px; margin-top:-4px;'>";
            	  html+="<div style='margin: -22px 16px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s1'></div></div></div>";
            	  
 	  		$("#result").append(html);
/*  	  	$(".ui-draggable").draggable();
            dropApply(); */ 	 
        }
        
        
        
        /* delete */
       
        $(document).on("click",".icon-tools-tables-trash",function(){
        	alert("a");
        });
        
        
        function seat2(tName){
        	/* 생성 테이블 index ++ */
        	i++;
              var html = "<div id='table"+i+"' class='app-mesa-item tools-tables-gridItem ui-draggable' style='position:absolute;visibility:visible;top:"+tableCommonTop+";left:"+table2SeatLeft+";' data-name='"+tName+"'>";
            	  html+= "<div class='tools-tables-gridItem-settings app-table-settings' style='display: none;'>";
            	  html+= "<div class='app-table-remove mb15' data-id='table"+i+"'>";
            	  html+= "<i class='icon-tools icon-tools-tables-trash'></i><i class='icon-tools icon-tools-tables-trash-hover dnone'></i></div>";
            	  html+="<div class='app-table-edit mb15' data-id='table"+i+"'>";
            	  html+="<i class='icon-tools icon-tools-tables-edit'></i><i class='icon-tools icon-tools-tables-edit-hover dnone'></i></div></div>";
            	  html+="<div class='tools-tables-gridItem-table tools-tables-gridItem-square' style='height:"+squareCommonHeight+"; width:"+square2SeatWidth+";'>";
            	  html+="<div class='tools-tables-gridItem-squareLabel' id='table"+i+"'>&nbsp;"+tName+"&nbsp;</div></div>";
            	  html+="<div style='height:34px; margin-top:-4px;'>";
            	  html+="<div style='margin: -22px 16px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s1'></div>";
            	  html+="<div style='margin: -22px 16px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s2'></div></div></div>";
	            	  
	 	  		$("#result").append(html);
	 	  	/* 	$(".ui-draggable").draggable();
	            dropApply();  */	 
        }
        function seat3(tName){
        	/* 생성 테이블 index ++ */
        	i++;
              var html = "<div id='table"+i+"' class='app-mesa-item tools-tables-gridItem ui-draggable' style='position:absolute;visibility:visible;top:"+tableCommonTop+";left:"+table3SeatLeft+";' data-name='"+tName+"'>";
            	  html+= "<div class='tools-tables-gridItem-settings app-table-settings' style='display: none;'>";
            	  html+= "<div class='app-table-remove mb15' data-id='table"+i+"'>";
            	  html+= "<i class='icon-tools icon-tools-tables-trash'></i><i class='icon-tools icon-tools-tables-trash-hover dnone'></i></div>";
            	  html+="<div class='app-table-edit mb15' data-id='table"+i+"'>";
            	  html+="<i class='icon-tools icon-tools-tables-edit'></i><i class='icon-tools icon-tools-tables-edit-hover dnone'></i></div></div>";
            	  html+="<div class='tools-tables-gridItem-table tools-tables-gridItem-square' style='height:"+squareCommonHeight+"; width:"+square3SeatWidth+";'>";
            	  html+="<div class='tools-tables-gridItem-squareLabel' id='table"+i+"'>&nbsp;"+tName+"&nbsp;</div></div>";
            	  html+="<div style='height:34px; margin-top:-4px;'>";
            	  html+="<div style='margin: -22px 16px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s1'></div>";
            	  html+="<div style='margin: -22px 16px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s2'></div>";
            	  html+="<div style='margin: -22px 16px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s3'></div></div></div>";
	            	  
	 	  		$("#result").append(html);
	 	/*   		$(".ui-draggable").draggable();
	            dropApply();  */	 
	        }
		
        function seat4(tName){
        	/* 생성 테이블 index ++ */
        	i++;
              var html = "<div id='table"+i+"' class='app-mesa-item tools-tables-gridItem ui-draggable' style='position:absolute;visibility:visible;top:"+tableCommonTop+";left:"+table4SeatLeft+";' data-name='"+tName+"'>";
            	  html+= "<div class='tools-tables-gridItem-settings app-table-settings' style='display: none;'>";
            	  html+= "<div class='app-table-remove mb15' data-id='table"+i+"'>";
            	  html+= "<i class='icon-tools icon-tools-tables-trash'></i><i class='icon-tools icon-tools-tables-trash-hover dnone'></i></div>";
            	  html+="<div class='app-table-edit mb15' data-id='table"+i+"'>";
            	  html+="<i class='icon-tools icon-tools-tables-edit'></i><i class='icon-tools icon-tools-tables-edit-hover dnone'></i></div></div>";
            	  html+="<div class='tools-tables-gridItem-table tools-tables-gridItem-square' style='height:"+squareCommonHeight+"; width:"+square4SeatWidth+";'>";
            	  html+="<div class='tools-tables-gridItem-squareLabel' id='table"+i+"'>&nbsp;"+tName+"&nbsp;</div></div>";
            	  html+="<div style='height:34px; margin-top:-4px;'>";
            	  html+="<div style='margin: -22px 16px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s1'></div>";
            	  html+="<div style='margin: -22px 16px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s2'></div>";
            	  html+="<div style='margin: -22px 16px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s3'></div>";
            	  html+="<div style='margin: -22px 16px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s4'></div></div></div>";
            	  
	 	  		$("#result").append(html);
	/*  	  		$(".ui-draggable").draggable();
	            dropApply(); 	 */ 
        }
		
     
        
		/* 공석 생성 */
		function createEmptyTable(){
			var formData =$("#no-seat-form").serializeArray();
			console.log(formData);
			var tName = formData[0].value;	
			
			seatEmpty(tName);
			$("#no-seat-modal").modal('hide');
			$(".ui-draggable").draggable();
            dropApply(); 
		}
	
		function seatEmpty(tName){
			/* table name index 추가 */
			i++;
			
			 var html = "<div id='table"+i+"' class='app-mesa-item tools-tables-gridItem flexItem ui-draggable' style='position:absolute;visibility:visible;top:"+tableCommonTop+";left:"+tableEmptyLeft+";' data-name='"+tName+"'>";
		       	 html+= "<div class='tools-tables-gridItem-settings app-table-settings' style='display: none;'>";
		       	 html+= "<div class='app-table-remove mb15' data-id='table"+i+"'>";
		       	 html+= "<i class='icon-tools icon-tools-tables-trash'></i><i class='icon-tools icon-tools-tables-trash-hover dnone'></i></div>";
		       	 html+= "<div class='app-table-edit mb15' data-id='table"+i+"'>";
		       	 html+= "<i class='icon-tools icon-tools-tables-edit'></i><i class='icon-tools icon-tools-tables-edit-hover dnone'></i></div></div>";
		     	 html+= "<div class='flex'><div class='tools-tables-gridItem-table tools-tables-gridItem-square flex-va-center' style='min-height:100px;min-width:100px;'>";
		     	 html+= "<div class='tools-tables-gridItem-squareLabel' id='table"+i+"_label'>"+tName+"</div></div></div></div>";
	
		        $("#result").append(html);
		        $("#no-seat-form").find("input").val("");
		        $("#no-seat-modal").modal('hide');
			
			
		}
	
        
         /* draggable  list icon drag!! */
         $(function(){
             $(".ui-draggable").draggable();
             /* list 에서 드래그하기 :clone(드래그 시 남아있음 )*/
              $(".list-draggable").draggable({
                  //helper:"clone",
                  revert:"invalid",
                  opacity:0.7,
                  start:function(){
                	  $(".tools-tables-left-guests").css({"overflow-y":"unset","z-index":"99999"});
                      $(this).addClass("shine");
                  },
                  stop:function(){
                      $(this).removeClass("shine");
                      $(".tools-tables-left-guests").css({"overflow-y":"auto","z-index":"1"});   
    
                  }
              });
         });
		
         function dropApply(){
             $(".ui-droppable").droppable({
             accept:$(".list-draggable"),
             drop:function(event,ui){
            	 
            	/*  if($(this).children().size()!=0){
            		 return;
            	 }
            	  */
                 /* clone 시 */
                //var lName= ui.helper.prevObject[0].parentElement.dataset.nombre; //성
                //var fName=ui.helper.prevObject[0].parentElement.dataset.apellidos;//이름
				//console.dir(ui);
                 
                /* 성 + 이름 붙이기 */
                 var lName= ui.helper[0].parentElement.dataset.nombre;
                 var fName= ui.helper[0].parentElement.dataset.apellidos;
                 
              	/* list 에서 제거하기 */
                 ui.helper[0].parentElement.remove();
                  
                 var html= "<div class='app-tables-persona app-seated-guest' style='display: block;'>";
                     html+="<div class='tools-tables-gridItem-guest'>";
                 /*     html+="<i class='app-tables-guest-icon icon-tools icon-tools-avatar-guest-adult-small-fulfilled list-draggable'></i></div>"; */
                 	 html+="<div class='profile' style='background:url(/steach/resources/images/common/default.jpg);background-size:cover;z-index:99999999999999999999'></div></div>";
                     html+="<div class='app-tables-persona-name tools-tables-gridItem-guestName' title='"+lName+" "+fName+"' style='display:block;'>";
                     html+="<span>"+lName+fName+"</span></div></div>";
           
	                $(this).append(html);
	              $(this).css({border:"none"}); 
	               console.log($(this).children().size());
	         
	               /*  $(ui.draggable).remove(); */
	      
                 }
             })

         }
		
         /* table 삭제. */
         $(document).on("click",".icon-tools-tables-trash-hover",function(e){
        	 
        	 
        	 
        	 
        	 /* table 삭제 */
        	 $(this).parents().parents()[1].remove();
         });
         
         /* table 수정. --미구현 ..  */
          $(document).on("click",".icon-tools-tables-edit-hover",function(e){
        	 alert(2);
         });
         
         
         
    
         
 	     var canvasData ="";
         /* capture */
         function saveImage(){
       		$("#preview-modal").modal('show'); 	 	 
		 
		  html2canvas($(".app-tables-viewbox"), {
		  	onrendered: function(canvas) {
		   	$("#image").attr("src",canvas.toDataURL("image/png"));
		  		canvasData = canvas.toDataURL("image/png");	
		  	}			
		  });
		}
         
        function doDownload(){
        	/*file download */
        	download($("#image").attr("src"),"자리배치도.png","image/png");

        	
        }
        function saveToServer(){   	
        	//var seatData = $("#seatData").val(canvasData);
     	
        	//console.log($("#seatData").val());
        	$.ajax({
        		url:"<c:url value='seatSetting.do'/>",
        		type:"POST",
  			  	dataType:"text",
  			 	data:{
  				  base64data:canvasData
  			  }
        	}).done(function(data){
        		alert(1);
        	})
        	
        	
        }
         
        
    </script>
      

</body>
</html>