/**
 * 
 */

	  /* stringBuffer */
	    var StringBuffer = function() {
		    this.buffer = new Array();
		};
			StringBuffer.prototype.append = function(str) {
			    this.buffer.push(str);
			    return this;
		};
			StringBuffer.prototype.toString = function(){
			    return this.buffer.join("");
		};
		
		
	
  		/* accordion */
    	 $('.collapse').collapse();
    	 
    	 /* eventPropagation 해제 accordion 때문에 !! */
       	$(document).on("click","a", function(e){
       		e.stopPropagation();
       	}); 
       	
     	/* modal */    	
     	$(document).on("click","a[href='msgModal']",function(e){
     		var modal = $(this).attr("data-target");
        	$(modal).children(".modal-dialog").css({
        		left:e.clientX,
        		top:e.clientY
        	});
     	});
     	
     	$(document).on("click","a[href='userElpsModal']",function(e){
     		var modal = $(this).attr("data-target");
        	$(modal).children(".modal-dialog").css({
        		left:e.clientX,
        		top:e.clientY
        	});
     	});
 
     	
        
        
        /* button 기능 */
        function doReader(memNo){
    	 	$(".modal").hide();
        	$.ajax({
        		url:"<c:url value='doReader.do'/>",
        		data:"memNo="+memNo
        	}).done(function(data){
        		$(".accordion").children().remove();
        		$(".modalSection").children().remove();
        		swal({
        			position:'center-center',
        			type:'success',
        			title:'Success!!',
        			showConfirmbutton:false,
        			timer:1500
        		});
        		studentList();
        		
        	});
        };
        
        function removeReader(memNo){
        	$(".modal").hide();
        	$.ajax({
        		url:"<c:url value='removeReader.do'/>",
        		data:"memNo="+memNo
        	}).done(function(data){
        		$(".accordion").children().remove();
        		$(".modalSection").children().remove();
        		swal({
        			position:'center-center',
        			type:'success',
        			title:'Success!!',
        			showConfirmbutton:false,
        			timer:1500
        		});
        		studentList();
        		
        	});
        };
        
        function doIgnore(memNo){
        	$(".modal").hide();
        	$.ajax({
        		url:"<c:url value='doIgnore.do'/>",
        		data:"memNo="+memNo
        	}).done(function(data){
        		$(".accordion").children().remove();
        		$(".modalSection").children().remove();
        		swal({
        			position:'center-center',
        			type:'success',
        			title:'Success!!',
        			showConfirmbutton:false,
        			timer:1500
        		});
        		studentList();
        		
        	});
        };
        

      


        /* page 호출 시 list 출력 */
        $(function(){
        	studentList();
        })
        
         function studentList(){
        	$.ajax({
        		url:"<c:url value='studentList.do'/>"
        	}).done(function(data){
        		var html = new StringBuffer();
        		var modalHtml = new StringBuffer();
        		
        		for(let i of data){
        			/* accordion data */
        			html.append("<div class='card'>");
        		    html.append("<div class='card-header' role='tab' href='#collapse"+i.memNo+"' data-toggle='collapse'>");
        		    html.append("<div class='user-info'>");
        		    html.append("<div class='user-pic'>"+i.user.profile+"</div>");
        		    html.append("<div class='user-name'>");
        		    
        		    if(i.pNo==1001){
        		    	html.append("<i class='fas fa-crown'></i>");
        		    }
        			html.append(" <a href='#'>"+i.user.name+" ("+i.user.id+")</a></div>");
        			html.append("<div class='user-elps'>");
        			html.append("<a href='msgModal' data-toggle='modal' data-target='#msgModal"+i.memNo+"'>");
        			html.append("<i class='far fa-envelope'></i></a>");
        			html.append("　<a href='userElpsModal' data-toggle='modal' data-target='#userElpsModal"+i.memNo+"'>");
        			html.append("<i class='fas fa-ellipsis-v'></i></a></div></div></div>");
        			html.append("<div id='collapse"+i.memNo+"' role='tabpanel' class='collapse'>");
        			html.append("<div class='card-body'>");
        			html.append("<div class='user-detail'>");
        			html.append("<span><i class='fas fa-map-marker-alt'></i>"+i.user.addr+"</span>");
        			html.append("<span><i class='fas fa-phone'></i>"+i.user.phone+"</span>");
        			html.append("</div></div></div></div>");
        	    	
        			/* modal data */
        	    	/* 쪽지 */
        			modalHtml.append("<div class='modal fade' id='msgModal"+i.memNo+"' tabindex='-1' role='dialog'>");
        	    	modalHtml.append("<div class='modal-dialog'>");
        	    	modalHtml.append("<div class='modal-content'>");
        	    	modalHtml.append("<div class='modal-body'>");
        	    	modalHtml.append("<ul class='modal-ul'>");
        	    	modalHtml.append("<li><a>쪽지보내기</a></li>");
        	    	modalHtml.append("</ul></div></div></div></div>");
        	    	/* elippsis */
        	    	modalHtml.append("<div class='modal fade' id='userElpsModal"+i.memNo+"' tabindex='-1' role='dialog'>");
        	    	modalHtml.append("<div class='modal-dialog'>");
        	    	modalHtml.append("<div class='modal-content'>");
        	    	modalHtml.append("<div class='modal-body'>");
        	    	modalHtml.append("<ul class='modal-ul'>");
        	    	if(i.pNo==1001){
        	    		modalHtml.append("<li><a href='#' onclick='removeReader("+i.memNo+")'>반장위임취소</a></li>");
        	    	} else {
        	    		modalHtml.append("<li><a href='#' onclick='doReader("+i.memNo+")'>반장위임</a></li>");
        	    	}
        	    	modalHtml.append("<li><a href='#' onclick='doIgnore("+i.memNo+")'>내보내기</a></li>");
        	    	modalHtml.append("</ul></div></div></div></div>");
        	    	
        		    
        		}
        			$(".accordion").append(html.toString());
        			$(".modalSection").append(modalHtml.toString());
        		
        	});
        } 
