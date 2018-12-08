<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<script src="/steach/resources/js/class/curriculum/seat/canvas2image.js"></script>

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
						<p
							class="app-tools-tables-group-title tools-tables-left-guests-family-title">학생</p>
						<!-- list 학생 1 -->
						<!-- 불필요 data remove... test -->
						<ul
							class="app-tools-tables-group-family tools-tables-left-guests-family">
							<li data-nombre="김" data-apellidos="해동" data-seat-id=""
								class="app-tables-persona app-tables-persona-list tools-tables-left-guests-item">

								<span
								class="app-tables-guest-name tools-tables-left-guests-name  parent ">김
									해동</span> <i
								class="app-tables-guest-icon icon-tools fright relative icon-tools-avatar-guest-adult-small list-draggable"></i>
							</li>
						</ul>
						<ul
							class="app-tools-tables-group-family tools-tables-left-guests-family">
							<li	data-nombre="김" data-apellidos="병관" data-seat-id="" 
								class="app-tables-persona app-tables-persona-list tools-tables-left-guests-item">
								<span
								class="app-tables-guest-name tools-tables-left-guests-name  parent ">김
									병관</span> <i
								class="app-tables-guest-icon icon-tools fright relative icon-tools-avatar-guest-adult-small list-draggable"></i>
							</li>
						</ul>

						<ul
							class="app-tools-tables-group-family tools-tables-left-guests-family">
							<li data-nombre="박" data-apellidos="한준" data-seat-id="" 
							    class="app-tables-persona app-tables-persona-list tools-tables-left-guests-item">
								<span
								class="app-tables-guest-name tools-tables-left-guests-name  parent ">박
									한준 </span> <i
								class="app-tables-guest-icon icon-tools fright relative icon-tools-avatar-guest-adult-small list-draggable"></i>
							</li>
						</ul>
						<ul
							class="app-tools-tables-group-family tools-tables-left-guests-family">
							<li data-nombre="조" data-apellidos="성일" data-seat-id="" 
							    class="app-tables-persona app-tables-persona-list tools-tables-left-guests-item ">
								<span
								class="app-tables-guest-name tools-tables-left-guests-name  parent ">조
									성일</span> <i
								class="app-tables-guest-icon icon-tools fright relative icon-tools-avatar-guest-adult-small list-draggable"></i>
							</li>
						</ul>
						<ul
							class="app-tools-tables-group-family tools-tables-left-guests-family">
							<li data-nombre="안" data-apellidos="규영" data-seat-id=""
								class="app-tables-persona app-tables-persona-list tools-tables-left-guests-item ">
								<span
								class="app-tables-guest-name tools-tables-left-guests-name  parent ">안 규영</span>
								<i
								class="app-tables-guest-icon icon-tools fright relative icon-tools-avatar-guest-adult-small list-draggable"></i>
							</li>
						</ul>
						<ul
							class="app-tools-tables-group-family tools-tables-left-guests-family">
							<li data-nombre="이" data-apellidos="원재" data-seat-id=""
								class="app-tables-persona app-tables-persona-list tools-tables-left-guests-item ">
								<span
								class="app-tables-guest-name tools-tables-left-guests-name  parent ">이 원재</span>
								<i
								class="app-tables-guest-icon icon-tools fright relative icon-tools-avatar-guest-adult-small list-draggable"></i>
							</li>
						</ul>
						<ul
							class="app-tools-tables-group-family tools-tables-left-guests-family">
							<li data-nombre="박" data-apellidos="아란" data-seat-id=""
								class="app-tables-persona app-tables-persona-list tools-tables-left-guests-item ">
								<span
								class="app-tables-guest-name tools-tables-left-guests-name  parent ">박 아란</span>
								<i
								class="app-tables-guest-icon icon-tools fright relative icon-tools-avatar-guest-adult-small list-draggable"></i>
							</li>
						</ul>
						<ul
							class="app-tools-tables-group-family tools-tables-left-guests-family">
							<li data-nombre="오" data-apellidos="수진" data-seat-id=""
								class="app-tables-persona app-tables-persona-list tools-tables-left-guests-item ">
								<span
								class="app-tables-guest-name tools-tables-left-guests-name  parent ">오 수진</span>
								<i
								class="app-tables-guest-icon icon-tools fright relative icon-tools-avatar-guest-adult-small list-draggable"></i>
							</li>
						</ul>
						<ul
							class="app-tools-tables-group-family tools-tables-left-guests-family">
							<li data-nombre="이" data-apellidos="경" data-seat-id=""
								class="app-tables-persona app-tables-persona-list tools-tables-left-guests-item ">
								<span
								class="app-tables-guest-name tools-tables-left-guests-name  parent ">이 경</span>
								<i
								class="app-tables-guest-icon icon-tools fright relative icon-tools-avatar-guest-adult-small list-draggable"></i>
							</li>
						</ul>
						<ul
							class="app-tools-tables-group-family tools-tables-left-guests-family">
							<li data-nombre="조" data-apellidos="용제" data-seat-id=""
								class="app-tables-persona app-tables-persona-list tools-tables-left-guests-item ">
								<span
								class="app-tables-guest-name tools-tables-left-guests-name  parent ">조 용제</span>
								<i
								class="app-tables-guest-icon icon-tools fright relative icon-tools-avatar-guest-adult-small list-draggable"></i>
							</li>
						</ul>
						<ul
							class="app-tools-tables-group-family tools-tables-left-guests-family">
							<li data-nombre="박" data-apellidos="태환" data-seat-id=""
								class="app-tables-persona app-tables-persona-list tools-tables-left-guests-item ">
								<span
								class="app-tables-guest-name tools-tables-left-guests-name  parent ">박 태환</span>
								<i
								class="app-tables-guest-icon icon-tools fright relative icon-tools-avatar-guest-adult-small list-draggable"></i>
							</li>
						</ul>
						<ul
							class="app-tools-tables-group-family tools-tables-left-guests-family">
							<li data-nombre="나" data-apellidos="원석" data-seat-id=""
								class="app-tables-persona app-tables-persona-list tools-tables-left-guests-item ">
								<span
								class="app-tables-guest-name tools-tables-left-guests-name  parent ">나 원석</span>
								<i
								class="app-tables-guest-icon icon-tools fright relative icon-tools-avatar-guest-adult-small list-draggable"></i>
							</li>
						</ul>
						<ul
							class="app-tools-tables-group-family tools-tables-left-guests-family">
							<li data-nombre="방" data-apellidos="진웅" data-seat-id=""
								class="app-tables-persona app-tables-persona-list tools-tables-left-guests-item ">
								<span
								class="app-tables-guest-name tools-tables-left-guests-name  parent ">방 진웅</span>
								<i
								class="app-tables-guest-icon icon-tools fright relative icon-tools-avatar-guest-adult-small list-draggable"></i>
							</li>
						</ul>
					</div>


				</div>
			</div>
		</div>
		<div class="tools-tables-right-content">
			<div class="wrapper-tables-header-buttons main">

				<div class="tools-toggle">
					<span onclick="saveImage()"
						class="app-open-layer-pdf tools-toggle-item" data-section="main"><i
						class="icon-tools icon-tools-download icon-left"></i> Capture</span>
				</div>
			</div>
			<div class="app-tables-viewbox tools-tables-viewbox">
				<!-- 화면에 나오는 자리~~  -->
				<div id="result" class="app-tables-content tools-tables-content"></div>
				<div id="app-container-data" class="dnone"></div>



			</div>
		</div>

	</div>
	
	<image id="image"></image>

	




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
		var i=0;
		
		/*seat table size */
		const squareCommonHeight="50px";
		const square1SeatWidth="50px";
		const square2SeatWidth="100px";
		const square3SeatWidth="150px";
		const square4SeatWidth="200px";
		
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
            	  html+="<div style='margin: 0px 7px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s1'></div></div></div>";
            	  
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
            	  html+="<div style='margin: 0px 7px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s1'></div>";
            	  html+="<div style='margin: 0px 7px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s2'></div></div></div>";
	            	  
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
            	  html+="<div style='margin: 0px 7px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s1'></div>";
            	  html+="<div style='margin: 0px 7px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s2'></div>";
            	  html+="<div style='margin: 0px 7px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s3'></div></div></div>";
	            	  
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
            	  html+="<div style='margin: 0px 7px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s1'></div>";
            	  html+="<div style='margin: 0px 7px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s2'></div>";
            	  html+="<div style='margin: 0px 7px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s3'></div>";
            	  html+="<div style='margin: 0px 7px; float:left;opacity:1;' class='app-table-seat tools-tables-gridItem-seat ui-droppable' id='table"+i+"_s4'></div></div></div>";
            	  
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
		     	 html+= "<div class='flex'><div class='tools-tables-gridItem-table tools-tables-gridItem-square flex-va-center' style='height:px;width:px;'>";
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
                 /* clone 시 */
                //var lName= ui.helper.prevObject[0].parentElement.dataset.nombre; //성
                //var fName=ui.helper.prevObject[0].parentElement.dataset.apellidos;//이름
				//console.dir(ui);
                 var lName= ui.helper[0].parentElement.dataset.nombre;
                 var fName= ui.helper[0].parentElement.dataset.apellidos;
                 
              
                 ui.helper[0].parentElement.remove();
                 //alert(lName);
		
                 
                 var html= "<div class='app-tables-persona app-seated-guest' style='display: block;'>";
                     html+="<div class='tools-tables-gridItem-guest'>";
                     html+="<i class='app-tables-guest-icon icon-tools icon-tools-avatar-guest-adult-small-fulfilled list-draggable'></i></div>";
                     html+="<div class='app-tables-persona-name tools-tables-gridItem-guestName' title='"+lName+" "+fName+"' style='display:block;'>";
                     html+="<span>"+lName+"</span><span>"+fName+"</span></div></div>";
           
	                $(this).append(html);
	                $(ui.draggable).remove();
	                
	      
	                
	               /*  
	                $(".list-draggable").draggable({
	                    //helper:"clone",
	                    revert:"invalid",
	                    opacity:0.7,
	                    start:function(){
	                  	  $(".tools-tables-left-guests").css({"overflow-y":"unset"});
	                        $(this).addClass("shine");
	                    },
	                    stop:function(){
	                        $(this).removeClass("shine");
	                        $(".tools-tables-left-guests").css({"overflow-y":"auto"});   
	      
	                    }
	                }); */
                 }
             })

         }

         
         
         
         /* capture */
         function  saveImage(){
		  var canvas ="";
		  html2canvas($(".app-tables-viewbox"), {
		  onrendered: function(canvas) {
		  // canvas is the final rendered <canvas> element
		   document.getElementById("image").src = canvas.toDataURL();
		     //Canvas2Image.saveAsPNG(canvas);
		  }
		  });
		  //alert(document.getElementById("SavePart").innerHTML);
		}
    </script>
      

</body>
</html>