<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="../include/header.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<h1>Collabo Review 상세보기</h1>



<section class="content">
	<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">Collabo Review</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>id</th>
							<th>title</th>
							<th>email</th>
							<th>user.nickname</th>
							<th>total_price</th>
							<th>like_count</th>
							<th>grade_total_count</th>
							<th>view_count</th>
							<th>regdate</th>
							<th>updatedate</th>
						</tr>

						<tr>
							<td>${collaboReview.id}</td>
							<td>${collaboReview.title}</td>
							<td>${collaboReview.user.email}</td>
							<td>${collaboReview.user.nickname}</td>
							<td>${collaboReview.total_price}</td>
							<td>${collaboReview.like_count}</td>
							<td>${collaboReview.grade_total_count}</td>
							<td>${collaboReview.view_count}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${collaboReview.regdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${collaboReview.updatedate}" /></td>
						</tr>
					
					</table>
					<br>
					<br>
					
					<table class="table table-bordered">
						<tr>
							<th>맛</th>
							<th>가성비</th>
							<th>칼로리</th>
						</tr>

						<tr>
							<td>${collaboReview.grade.id}</td>
							<td>${collaboReview.grade.cost_ratio}</td>
							<td>${collaboReview.grade.calory}</td>
						</tr>

					</table>
					
					<br>
					<br>
					
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="false">
  					<!-- Indicators -->
					  <ol class="carousel-indicators">
					    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
					  </ol>
					
					  <!-- Wrapper for slides -->
					  <div class="carousel-inner" role="listbox">
					   	<div class="item active">
					   		<img width="100px" height="100px" src="/resources/img/IMG_0001.jpg">
					   	</div>
					   	<div class="item">
					   		<img width="100px" height="100px" src="/resources/img/IMG_0002.jpg">
					   	</div>
					   
						
						<c:forEach items="${list}" var="attachPhoto">
						<div class="item">
					      <img width="200px" height = "100px" src="${attachPhoto.attach_photo_fullname}">
					    </div>							
					   	</c:forEach>
					    
						
					  </div>
					
					  <!-- Controls -->
					  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
					</div>
					
					<br>
					<br>
					<table class="table table-bordered">
						<tr>
							<th>recipe</th>
							<th>tips</th>
							<th>ispenalty</th>
						</tr>

						<tr>
							<td>${collaboReview.recipe}</td>
							<td>${collaboReview.tips}</td>
							<td>${collaboReview.ispenalty}</td>
						</tr>

					</table>
					
					
				</div>
				<!-- /.box-body -->
</div>


<%-- <form action="read.jsp" method=post>
	<input type="hidden" name="c_id" value="${collaboReview.id}">
</form> --%>

<table id="replies" class="table table-bordered">
	

</table>



	<ul id="replies1">
	</ul>
	
	<ul class='pagination'>
	</ul>	


</section>

<script>
		var c_id = 7;
		
		getPageList(1);
		//getPageList때문에 getAllList의 로그

		function getPageList(page){
			
			 // 아래 c_id에 id를 가져와야 하는데 . 위에 html코드에서 스크립트로 어떻게 이동하지??
		  $.getJSON("/collabo/replies/"+c_id+"/"+page , function(data){
			  
			  console.log(data.list.length);
			  
			  var str ="";
			  $(data.list).each(function(){
				  str+=  
				  "<tr data-id='"+this.id+"' class='replyLi'>"
				  	+"<td>"
				  		+"<div class="+"thumbnail"+">"
						  +"<img width="+ "100px" + " height=" + "100px" + " src=" + this.user.photo + " class=" + "img-circle" + ">"
						  +"<td>"
						  +"<div class="+"caption"+">"
						  	+ "<h4>" +this.user.email+" , "+ this.user.nickname + "</h4>"  
						  	+ "<p>" + this.content1 + " : "+ this.content2 + " : "+ this.content3 + "</p>"
						 +"</div>"
						 +"</td>"
						+"</div>"
						+  "</td>"
					+"</tr>";
			  });
			  
			  
			  
			  /* $(data.list).each(function(){
				  str+=  
				  "<div class="+"row"+">"
				  	+"<div class="+"col-sm-8 col-md-3"+">"
				  		+"<li data-id='"+this.id+"' class='replyLi'>"
				  		+"<div class="+"thumbnail"+">"
						  +"<img width="+ "100px" + " height=" + "100px" + " src=" + this.user.photo + " class=" + "img-circle" + ">"
						  +"<div class="+"caption"+">"
						  	+ "<h4>" +this.user.email+" , "+ this.user.nickname + "</h4>"  
						  	+ "<p>" + this.content1 + " : "+ this.content2 + " : "+ this.content3 + "</p>"
						 +"</div>"
						+"</div>"
						+  "</li>"
					+"</div>"
				+ "</div>";
			  }); */
			  
			  
			  $("#replies").html(str);
			  
			  printPaging(data.pageMaker);
			  
		  });
	  }		
		
		  
		function printPaging(pageMaker){
			
			var str = "";
			
			if(pageMaker.prev){
				str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
			}
			
			for(var i=pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){				
					var strClass= pageMaker.cri.page == i?'class=active':'';
				  str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
			}
			
			if(pageMaker.next){
				str += "<li><a href='"+(pageMaker.endPage + 1)+"'> >> </a></li>";
			}
			$('.pagination').html(str);				
		}
		
		var replyPage = 1;
		
		$(".pagination").on("click", "li a", function(event){
			
			//a href의 기본동작인 페이지 전환을 막는 역할을 한다.
			event.preventDefault();
			
			replyPage = $(this).attr("href");
			
			getPageList(replyPage);
			
		});
		
		
	  		
	  		
	</script>





<%@ include file="../include/footer.jsp" %>