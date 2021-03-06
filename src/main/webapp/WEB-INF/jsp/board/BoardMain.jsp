<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="fade-in">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="김도영">
    <meta name="generator" content="Eclipse Photon">
<title>(Before + After)Trip</title>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      html, body {
	      height: 100%;
      }
      
      body {
      	padding-top: 60px;
      }
      
      #searchForm {
			  width: 100%;
			  max-width: 500px;
			  padding: 15px;
			}
			
	  .content {
		   display: grid;
		   place-items: center;
	  }
    </style>

<%@ include file="/WEB-INF/include/include-header.jspf" %>

</head>	
<body>

<%@ include file="/WEB-INF/jsp/navbar.jsp" %>
	
<main role="main">
	<div class="container text-right">
			<a href="#" class="btn btn-primary" role="button" id="openWritePage">
				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
				  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
				</svg> 글쓰기
			</a>
	</div>

	<div class="py-5">
		<div class="container">
	  	<div class="row">
			<c:forEach items="${list }" var="row">
				<c:choose>
					<c:when test="${row.TOTAL_COUNT > 0}">
						<div class="col-md-4">
				       		<div class="card mb-4 shadow-sm">
				         	<!-- 썸네일 여부 확인  없으면 회색바탕의 No Thumbnail 있으면 썸네일 불러오기-->
				          	<a href="#" class="openBoardDetail">
					          	<c:choose>
						          	<c:when test="${empty row.THUMBNAIL }">
						          		<svg class="bd-placeholder-img card-img-top " width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
							          		<title>No Thumbnail</title>
							          		<rect width="100%" height="100%" fill="#55595c"/>
							          		<text x="50%" y="50%" fill="#eceeef" dy=".3em">No Thumbnail</text>
						          		</svg>
						          	</c:when>
						          	<c:otherwise>
						          			<img src="${row.THUMBNAIL }" width="100%" height="225">
						          	</c:otherwise>
						        </c:choose>
				            </a>
				            <!-- 썸네일 끝 -->
				            
				            <div class="card-body">
				            	<table style="width:100%">
				            		<tr>
					            		<td>
					            			<a href="#this" class="openBoardDetail card-text">${row.TITLE }</a>
					            			<small class="text-muted">[${row.CMT_CNT }]</small>
					            			<input type="hidden" id="B_ID" value="${row.B_ID }">
					            		</td>
					            		<td class="text-right">
					            			<small>
								              <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pen" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
															  <path fill-rule="evenodd" d="M13.498.795l.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"/>
															</svg>&nbsp; <span class="sr-only">작성자</span> ${row.WRITER }
							              </small>
					            		</td>
				            		</tr>
				            	</table>
	
				              <div class="d-flex justify-content-between align-items-center">
				              	<small class="text-muted">
				              		<!-- 조회수 아이콘 -->
													<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-eye" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
													  <path fill-rule="evenodd" d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.134 13.134 0 0 0 1.66 2.043C4.12 11.332 5.88 12.5 8 12.5c2.12 0 3.879-1.168 5.168-2.457A13.134 13.134 0 0 0 14.828 8a13.133 13.133 0 0 0-1.66-2.043C11.879 4.668 10.119 3.5 8 3.5c-2.12 0-3.879 1.168-5.168 2.457A13.133 13.133 0 0 0 1.172 8z"/>
													  <path fill-rule="evenodd" d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
													</svg>
													<span class="sr-only">조회수</span>
													${row.HIT_CNT }
													<!-- 좋아요 아이콘 -->
													<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
													  <path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
													</svg>
													<span class="sr-only">좋아요</span>
													${row.LIKE_CNT }
													
													</small>
				                <small class="text-muted">
				               	 	<!-- 시계 아이콘 -->
					                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-smartwatch" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
													  <path d="M14 5h.5a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H14V5z"/>
													  <path fill-rule="evenodd" d="M8.5 4.5A.5.5 0 0 1 9 5v3.5a.5.5 0 0 1-.5.5H6a.5.5 0 0 1 0-1h2V5a.5.5 0 0 1 .5-.5z"/>
													  <path fill-rule="evenodd" d="M4.5 2h7A2.5 2.5 0 0 1 14 4.5v7a2.5 2.5 0 0 1-2.5 2.5h-7A2.5 2.5 0 0 1 2 11.5v-7A2.5 2.5 0 0 1 4.5 2zm0 1A1.5 1.5 0 0 0 3 4.5v7A1.5 1.5 0 0 0 4.5 13h7a1.5 1.5 0 0 0 1.5-1.5v-7A1.5 1.5 0 0 0 11.5 3h-7z"/>
													  <path d="M4 2.05v-.383C4 .747 4.746 0 5.667 0h4.666C11.253 0 12 .746 12 1.667v.383a2.512 2.512 0 0 0-.5-.05h-7c-.171 0-.338.017-.5.05zm0 11.9c.162.033.329.05.5.05h7c.171 0 .338-.017.5-.05v.383c0 .92-.746 1.667-1.667 1.667H5.667C4.747 16 4 15.254 4 14.333v-.383z"/>
													</svg>
													<span class="sr-only">작성일</span>
					              	${row.CREA_DTM }</small>
				              </div>
				            </div>
				          </div>
				        </div>
			        </c:when>
					<c:otherwise>
						등록된 게시글이 없습니다.
					</c:otherwise>
				</c:choose>
				</c:forEach>

	
			</div>
		</div>
	</div>

	<!-- 페이지네이션 -->
	<c:if test="${not empty paginationInfo}">
			<div class="container">
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_pagination"/>
					</ul>
				</nav>
			</div>
    </c:if>
	<input type="hidden" id="currentPageNo" name="currentPageNo"  value="${paginationInfo.currentPageNo }"/>
	<!-- 페이지네이션 끝 -->

	<!-- Search -->
	<div class="content">
		<form id="searchForm" name="searchForm" method="get">
			<div class="input-group">
				<div class="input-group-prepend">
					<input class="btn btn-outline-secondary" id="searchCondition" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" value="검색조건">
					<div class="dropdown-menu" id="ConditionList" role="menu">
			    	<a href="#this" class="dropdown-item" id="search_Title">제목</a>
			    	<a href="#this" class="dropdown-item" id="search_Writer">글쓴이</a>
			    </div>
		    </div>	<!-- input-group-prepend end -->
		    
				<input type="text" class="form-control" id="searchWord" name="searchWord">
				
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" id="search">검색</button>
				</div>	<!-- input-group-append end -->
				
			</div> <!-- input-group end -->
		</form>
	</div>
	<!-- Search end -->
	
</main>


<%@ include file="/WEB-INF/jsp/footer.jsp" %>
<script>
	$(document).ready(function() {
		// 검색 조건 선택
		$('#ConditionList > a').on('click', function() {
			$('#searchCondition').val($(this).text());
		});
		
		// 검색 버튼 클릭
		$('#search').on('click', function(e) {
			e.preventDefault();
			fn_search();
		});
		
		// 검색에서 Enter 입력
		$("#searchWord").keypress(function (e) {
	        if (e.which == 13){
	        	e.preventDefault();
						fn_search();
	       	}
	  });
		
		// 글 상세 보기
		$(".openBoardDetail").on("click", function(e) {
			e.preventDefault();
			fn_openBoardDetail($(this));
		})
		
		// 글쓰기 버튼
		$("#openWritePage").on("click", function(e){
			e.preventDefault();
			
			if (${not empty sessionScope.login}) {	// 로그인 했으면
				fn_openWritePage();
			} else {																// 비로그인이면
				alert("로그인 후 사용이 가능합니다.");
			}
		});
	});
	
	function fn_openWritePage() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board/openWritePage.do'/>");
		comSubmit.submit();
	}
	
	function fn_openBoardDetail(obj) {
		var B_ID = obj.parent().find("#B_ID").val();
		var userNick = "";
		
		var comSubmit = new ComSubmit();
		comSubmit.setMethod("get");
		comSubmit.setUrl("<c:url value='/board/openBoardDetail.do'/>");
		
		if (${not empty sessionScope.login}) {	// 로그인 했으면
			userNick = "${login.NICKNAME}";
			comSubmit.addParam("NICKNAME", userNick);
		}
		
		if (window.location.href.indexOf("search.do") > 0) { // 검색이면
			var searchWord = getParameter("searchWord");
			var searchCondition = getParameter("searchCondition");

			comSubmit.addParam("searchWord", searchWord);
	        comSubmit.addParam("searchCondition", searchCondition);
	         
		}

		comSubmit.addParam("currentPageNo", $("#currentPageNo").val());
		comSubmit.addParam("B_ID", B_ID);
		comSubmit.submit();
	}
	
	function fn_pagination(pageNo){
		var comSubmit = new ComSubmit();
		comSubmit.setMethod("get");
		
		if (window.location.href.indexOf("search.do") > 0) { // 검색이면
		var searchWord = getParameter("searchWord");
		var searchCondition = getParameter("searchCondition");
		
 		comSubmit.addParam("searchWord", searchWord);
		comSubmit.addParam("searchCondition", searchCondition);

	        comSubmit.setUrl("<c:url value='/board/search.do' />");
		} else {
			comSubmit.setUrl("<c:url value='/board/openBoard.do' />");
		}
		
		comSubmit.addParam("currentPageNo", pageNo);
		comSubmit.submit();
	}
	
	function fn_search() {
		var SearchCondition = $('#searchCondition').val();
		
		if (SearchCondition !== "검색조건") {
			if ($("#searchWord").val() != "") {
					var comSubmit = $("#searchForm")[0];
					comSubmit.action = "<c:url value='/board/search.do'/>";
					$("#searchForm").append($("<input type='hidden' name='searchCondition' id='searchCondition' value='" + SearchCondition + "'>"));
					comSubmit.submit();
			} else {	// 검색어가 없으면
					alert("검색어를 입력하세요.");
			}
		} else {	// 검색조건을 선택하지 않았으면
			alert("검색조건을 설정해주세요.")
		}
	}
</script>
</body>
</html>