/**
 * 
 */
      
 
        //동적생성하기.. 
       // var i = 0; 

/*         $(".icon-tools-table-2").click(function(){
        	
             var title=prompt("제목")
            var seat = prompt("몇인석");
            switch(parseInt(seat)){
                case 1: seat1(title); break;
                case 2: seat2(title); break;
                case 3: seat3(title); break;
                case 4: seat4(title); break;
                default: alert("안됨"); return; 
            }
            $(".ui-draggable").draggable();
            dropApply(); 
        });*/

       /*  function seat1(title){
            i++;
            var html =`<div id="table${i}" class="app-mesa-item tools-tables-gridItem  ui-draggable" style="position: absolute; visibility: visible; top: 45px; left: 150px;" data-invitados="" data-numchairs="1" data-type="1side180" data-name="${title}" data-posx="471" data-posy="34">
                            <div class="tools-tables-gridItem-settings app-table-settings" style="display: none;">
                                <div class="app-table-remove mb15" data-id="table${i}">
                                    <i class="icon-tools icon-tools-tables-trash"></i>
                                    <i class="icon-tools icon-tools-tables-trash-hover dnone"></i>
                                </div>
                                <div class="app-table-edit mb15" data-id="table${i}">
                                    <i class="icon-tools icon-tools-tables-edit"></i>
                                    <i class="icon-tools icon-tools-tables-edit-hover dnone"></i>
                                </div>
                               
                            </div>
                            
                            <div class="tools-tables-gridItem-table tools-tables-gridItem-square" style="height:50px; width:50px;">
                                <div class="tools-tables-gridItem-squareLabel " id="table${i}">&nbsp;${title}&nbsp;</div>
                            </div>
                            <div style="height:34px; margin-top:-4px;">
                                <div style="margin: 0px 7px; float: left; opacity: 1;" class="app-table-seat tools-tables-gridItem-seat ui-droppable" id="table${i}_s1"></div>
                            </div>
                        </div>`

            $("#result").append(html);
           // $(".ui-draggable").draggable();
        } */

        //2인
       /*  function seat2(title){
           i++;
           var html = `<div id="table${i}" class="app-mesa-item tools-tables-gridItem  ui-draggable" style="position: absolute; visibility: visible; top: 45px; left: 307px;" data-invitados="" data-numchairs="2" data-type="1side180" data-name="${title}" data-posx="471" data-posy="34">
                            <div class="tools-tables-gridItem-settings app-table-settings" style="display: none;">
                                <div class="app-table-remove mb15" data-id="table${i}">
                                    <i class="icon-tools icon-tools-tables-trash"></i>
                                    <i class="icon-tools icon-tools-tables-trash-hover dnone"></i>
                                </div>
                                <div class="app-table-edit mb15" data-id="table${i}">
                                    <i class="icon-tools icon-tools-tables-edit"></i>
                                    <i class="icon-tools icon-tools-tables-edit-hover dnone"></i>
                                </div>

                            </div>
                            
                            <div class="tools-tables-gridItem-table tools-tables-gridItem-square" style="height:50px; width:100px;">
                                <div class="tools-tables-gridItem-squareLabel " id="table${i}_label">&nbsp;${title}&nbsp;</div>
                            </div>
                            <div style="height:34px; margin-top:-4px;">
                                <div style="margin: 0px 7px; float: left; opacity: 1;" class="app-table-seat tools-tables-gridItem-seat ui-droppable" id="table${i}_s2"></div>
                                <div style="margin: 0px 7px; float: left; opacity: 1;" class="app-table-seat tools-tables-gridItem-seat ui-droppable" id="table${i}_s1"></div>
                            </div>
                        </div>`
            $("#result").append(html);
           // $(".ui-draggable").draggable();
            
        }
        
        //3인 
        function seat3(title){
            i++;
            var html=`<div id="table${i}" class="app-mesa-item tools-tables-gridItem  ui-draggable" style="position: absolute; visibility: visible; top: 45px; left: 474px;" data-invitados="" data-numchairs="3" data-type="1side180" data-name="${title}" data-posx="242" data-posy="245">
                        <div class="tools-tables-gridItem-settings app-table-settings" style="display: none;">
                            <div class="app-table-remove mb15" data-id="table${i}">
                                <i class="icon-tools icon-tools-tables-trash"></i>
                                <i class="icon-tools icon-tools-tables-trash-hover dnone"></i>
                            </div>
                            <div class="app-table-edit mb15" data-id="table${i}">
                                <i class="icon-tools icon-tools-tables-edit"></i>
                                <i class="icon-tools icon-tools-tables-edit-hover dnone"></i>
                            </div>
                        
                        </div>
                        
                        <div class="tools-tables-gridItem-table tools-tables-gridItem-square" style="height:50px; width:150px;">
                            <div class="tools-tables-gridItem-squareLabel " id="table${i}_label">&nbsp;${title}&nbsp;</div>
                        </div>
                        <div style="height:34px; margin-top:-4px;">
                            <div style="margin: 0px 7px; float:left;" class="app-table-seat tools-tables-gridItem-seat ui-droppable" id="table${i}_s3"></div>
                            <div style="margin: 0px 7px; float:left;" class="app-table-seat tools-tables-gridItem-seat ui-droppable" id="table${i}_s2"></div>
                            <div style="margin: 0px 7px; float:left;" class="app-table-seat tools-tables-gridItem-seat ui-droppable" id="table${i}_s1"></div>
                        </div>
                    </div>`
                $("#result").append(html);
              //  $(".ui-draggable").draggable();

        }
        //4인
        function seat4(title){
            i++;
            var html = `<div id="table${i}" class="app-mesa-item tools-tables-gridItem  ui-draggable" style="position: absolute; visibility: visible; top: 45px; left: 720px;" data-invitados="" data-numchairs="4" data-type="1side180" data-name="${title}" data-posx="450" data-posy="180">
                            <div class="tools-tables-gridItem-settings app-table-settings" style="display: none;">
                                <div class="app-table-remove mb15" data-id="table${i}">
                                    <i class="icon-tools icon-tools-tables-trash"></i>
                                    <i class="icon-tools icon-tools-tables-trash-hover dnone"></i>
                                </div>
                                <div class="app-table-edit mb15" data-id="table${i}">
                                    <i class="icon-tools icon-tools-tables-edit"></i>
                                    <i class="icon-tools icon-tools-tables-edit-hover dnone"></i>
                                </div>
                         
                            </div>
                            
                            <div class="tools-tables-gridItem-table tools-tables-gridItem-square" style="height:50px; width:200px;">
                                <div class="tools-tables-gridItem-squareLabel " id="table${i}_label">&nbsp;${title}&nbsp;</div>
                            </div>
                            <div style="height:34px; margin-top:-4px;">
                                <div style="margin: 0px 7px; float:left;" class="app-table-seat tools-tables-gridItem-seat ui-droppable" id="table${i}_s4"></div>
                                    <div style="margin: 0px 7px; float:left;" class="app-table-seat tools-tables-gridItem-seat ui-droppable" id="table${i}_s3"></div>
                                    <div style="margin: 0px 7px; float:left;" class="app-table-seat tools-tables-gridItem-seat ui-droppable" id="table${i}_s2"></div>
                                    <div style="margin: 0px 7px; float:left;" class="app-table-seat tools-tables-gridItem-seat ui-droppable" id="table${i}_s1"></div>
                                </div>
                        </div>`
                    $("#result").append(html);
                  //  $(".ui-draggable").draggable();
        }


 */

        //공석 추가하기 
    /*     $(".icon-tools-table-5").click(function(){
            i++;
            //var title = prompt("제목");
          /*   var html = `<div id="table${i}" class="app-mesa-item tools-tables-gridItem flexItem ui-draggable" style="position: absolute; visibility: visible; top: 45px; left: 30px;" data-invitados="" data-numchairs="0" data-type="noSeats" data-name="table${title}" data-posx="309" data-posy="162">
        <div class="tools-tables-gridItem-settings app-table-settings" style="display: none;">
            <div class="app-table-remove mb15" data-id="table${i}">
                <i class="icon-tools icon-tools-tables-trash"></i>
                <i class="icon-tools icon-tools-tables-trash-hover dnone"></i>
            </div>
            <div class="app-table-edit mb15" data-id="table${i}">
                <i class="icon-tools icon-tools-tables-edit"></i>
                <i class="icon-tools icon-tools-tables-edit-hover dnone"></i>
            </div>
        </div>
    
            <div class="flex">
                    <div class="tools-tables-gridItem-table tools-tables-gridItem-square flex-va-center" style="height:px; width:px;">
                <div class="tools-tables-gridItem-squareLabel" id="table${i}_label">${title}</div>
            </div>
                </div>
        </div>`

            $("#result").append(html);
            $(".ui-draggable").draggable(); 
        });*/
 


   

    
    /* hover */
    // $(document).on("mouseover",".tools-tables-gridItem",function(){
    //     $(this).children(".tools-tables-gridItem-settings").css({display:"block"});
    // })
   

    //  function doAdd(){
    //      $("#result").append( $("#sample").html());
    //      $(".ui-draggable").draggable();
         

    //      $(".ui-droppable").droppable({
    //     accept:$(".list-draggable"),
    //     drop:function(event,ui){
    //        var lName= ui.helper.prevObject[0].parentElement.dataset.nombre; //성
    //        var fName=ui.helper.prevObject[0].parentElement.dataset.apellidos;//이름

    //         var html = `
    //        <div class="app-tables-persona app-seated-guest ui-draggable" data-idcontact="107273763" style="display: block;">
    //         <div class="tools-tables-gridItem-guest">
    //         <i class="app-tables-guest-icon icon-tools icon-tools-avatar-guest-adult-small-fulfilled list-draggable"></i>
    //         </div>
    //         <div class="app-tables-persona-name tools-tables-gridItem-guestName" title="${lName} ${fName}" style="display:block;">
    //             <span>${lName}</span>
    //             <span>${fName}</span>
    //         </div>
    //     </div>`
    //        $(this).append(html);
           
    //         }
    //     })


    //  }



    //     $(".ui-droppable").droppable({
    //     accept:$(".list-draggable"),
    //     drop:function(event,ui){
    //        var lName= ui.helper.prevObject[0].parentElement.dataset.nombre; //성
    //        var fName=ui.helper.prevObject[0].parentElement.dataset.apellidos;//이름

    //         var html = `
    //        <div class="app-tables-persona app-seated-guest ui-draggable" data-idcontact="107273763" style="display: block;">
    //         <div class="tools-tables-gridItem-guest">
    //         <i class="app-tables-guest-icon icon-tools icon-tools-avatar-guest-adult-small-fulfilled list-draggable"></i>
    //         </div>
    //         <div class="app-tables-persona-name tools-tables-gridItem-guestName" title="${lName} ${fName}" style="display:block;">
    //             <span>${lName}</span>
    //             <span>${fName}</span>
    //         </div>
    //     </div>`
    //       $(this).append(html);
           
    //         }
    //     })

/*<div id="sample" style="display: none">

		<div id="" class="app-mesa-item tools-tables-gridItem  ui-draggable"
			style="position: absolute; visibility: visible; top: 58.9861px; left: 279.997px;"
			data-numchairs="2" data-type="1side" data-name="test" data-posx="276"
			data-posy="39">
			<!-- hover시 edit trash rotate -->
			<div class="tools-tables-gridItem-settings app-table-settings"
				style="display: none;">
				<div class="app-table-remove mb15" data-id="">
					<i class="icon-tools icon-tools-tables-trash"></i> <i
						class="icon-tools icon-tools-tables-trash-hover dnone"></i>
				</div>
				<div class="app-table-edit mb15" data-id="">
					<i class="icon-tools icon-tools-tables-edit"></i> <i
						class="icon-tools icon-tools-tables-edit-hover dnone"></i>
				</div>
			
			</div>
			<!-- setting end -->

			<!-- 자리 동그라미 ui-droppable -->
			<div style="height: 34px; margin-bottom: -6px;">
				<div style="margin: 0px 7px; float: left;"
					class="app-table-seat tools-tables-gridItem-seat ui-droppable"
					id="_s1"></div>
				<div style="margin: 0px 7px; float: left;"
					class="app-table-seat tools-tables-gridItem-seat ui-droppable"
					id="_s2"></div>
			</div>
			<!-- table -->
			<div class="tools-tables-gridItem-table tools-tables-gridItem-square"
				style="height: 50px; width: 100px;">
				<!-- table 이름 -->
				<div class="tools-tables-gridItem-squareLabel " id="_label">&nbsp;생성&nbsp;</div>
			</div>
		</div>
	</div>
	<!-- sample end -->*/
  