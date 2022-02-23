<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="page" value="${(param.p == null) ? 1 : param.p}"/>
<c:set var="startNum" value="${page - (page-1) % 5 }"/>
<c:set var="lastNum" value="23"/>	
<c:set var="isLast" value="4" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/semtle/css/style.css" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500;700&display=swap" rel="stylesheet" />

    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
  </head>
  <body>
<jsp:include page="${pageContext.request.contextPath}/semtle/header.jsp" flush="true" />

    <section class="heading">
      <div class="heading-box">
        <span>printf("공지사항 꼭 확인해주세요")</span>
      </div>
    </section>

    <section class="noticeboard">
    
    <c:choose>
    	<c:when test="${not empty userInfo.userId && userIndo.userRole != '셈틀회원'}">
      <div class="talkboard-head">
        <a href="notice_write.doNotice"
          ><span class="talkboard-head_write">글쓰기</span></a
        >
      </div>
      	</c:when>
    </c:choose>
    
    <c:choose>
    	<c:when test="${ post_count == 0}">
      	<table style="margin:0 auto;">
			<td style="height:300px;">
				게시판에 저장된 글이 없습니다.
			</td>
		</table>
		</c:when>
		<c:otherwise>
		<c:forEach items="${ list }" var="dto" varStatus="i">
      <div class="noticeboard-box">
        <a href="notice_view.doNotice?postId=${ dto.postId }">
          <div class="notice-content">
          	<span>${ dto.userRole }</span>
            <div class="notice-content-head">
              <span>${ dto.p_title }</span>
              <c:choose>
              <c:when test="${ dto.fileUrl  ne null }" >
              	<i class="fas fa-paperclip"></i>
              </c:when>
              </c:choose>
            </div>
            <div class="notice-content-foot">
              <span>${ dto.updateAt }</span>
            </div>
          </div>
        </a>

<!--        <div class="notice-content">
          <div class="notice-content-head">
            <span>[공지] 셈틀 회원 모집합니다 :)</span>
          </div>
          <div class="notice-content-foot">
            <span>2022.01.06</span>
          </div>
        </div>

        <div class="notice-content">
          <div class="notice-content-head">
            <span>[공지] 셈틀 회원 모집합니다 :)</span>
          </div>
          <div class="notice-content-foot">
            <span>2022.01.06</span>
          </div>
        </div>

        <div class="notice-content">`
          <div class="notice-content-head">
            <span>[공지] 셈틀 회원 모집합니다 :)</span>
          </div>
          <div class="notice-content-foot">
            <span>2022.01.06</span>
          </div>
        </div>

        <div class="notice-content">
          <div class="notice-content-head">
            <span>[공지] 셈틀 회원 모집합니다 :)</span>
          </div>
          <div class="notice-content-foot">
            <span>2022.01.06</span>
          </div>
        </div>-->
      </div>
      </c:forEach>
      <!-- <div class="page">
		<ul class="paging modal">
      		<li> <a href="#" class="first">처음으로</a></li>
			<li> <a href="#" class="arrow left">&lt;&lt;&lt;</a></li>
     		<li> <a href="#" class="num">1</a></li>
      		<li> <a href="#" class="arrow right">&gt;&gt;&gt;</a></li>
				<li> <a href="#" class="last">마지막으로</a></li>
      	</ul>
	</div> -->
      </c:otherwise>
      
      </c:choose>
    </section>

<jsp:include page="${pageContext.request.contextPath}/semtle/footer.jsp" flush="true" />

</body>
</html>