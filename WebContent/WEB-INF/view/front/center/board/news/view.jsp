<!-- html 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- JSP 파일이 위치한 경로 입력 -->
<%@ page info="/WEB-INF/view/front/center/board/news/view.jsp" %>
<!-- 이 부분은 필요에 따라 추가하는 것이 맞으므로 개별 판단에 따라 추가하거나 삭제해도 되고 사용하지 않더라도 그대로 넣어둬도 무방하다고 판단 -->
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<style>
	
	</style>
	<script>
	
	<!-- 각 페이지의 기능에 따라 스크립트 추가 -->
	
	function download(type, sequence) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", type);
		frmMain.sequence.setAttribute("value", sequence);
		frmMain.action = "/front/center/board/download.web";
		frmMain.target = "frmBlank";
		frmMain.submit();
		
		frmMain.target = "_self";
	}
	
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/front/center/board/list.web";
		frmMain.submit();
		
	}
	
	</script>

	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>

	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>

<body>
<form id="frmMain" method="POST">
<input type="hidden" id="type"			name="type" />
<input type="hidden" id="sequence"		name="sequence" />
<input type="hidden" id="cd_bbs_type"	name="cd_bbs_type" />
<input type="hidden" id="seq_bbs"		name="seq_bbs"		value="${boardDto.seq_bbs}" />

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<!-- 페이지의 상단에 보이는 로고 및 로그인 / 회원가입 코드 -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<!-- Breadcrumb End -->
<section class="shop spad">
	<div class="container">
		<article class="txtCenter">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="checkout__form__input">
					<p style="font-weight: bold; margin-bottom: 5px; font-size: 16px; margin-left: 300px;">제목 <span></span></p>
					<input type="text" id="title" name="title" value="${boardDto.title}" style="width: 50%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-left: 300px;" />
				</div>
			</div>	
			<br/>
			<br/>
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="checkout__form__input">
				<p style="font-weight: bold; margin-bottom: 5px; font-size: 16px; margin-left: 300px;">
					<img src="/img/news/${boardDto.file_save}" alt="첨부 이미지" style="width: 300px; height: auto;" />
				</div>
			</div>
			<br/>
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="checkout__form__input">
					<p style="font-weight: bold; margin-bottom: 5px; font-size: 16px; margin-left: 300px;">내용 <span></span></p>
					<textarea id="content" name="content" style="width: 50%; height: 200px; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-left: 300px; overflow: auto;">${boardDto.content}</textarea>
				</div>
			</div>
			<br/>
			<br/>
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="checkout__form__input">
					<p style="font-weight: bold; margin-bottom: 5px; font-size: 16px; margin-left: 300px;">등록 일자 <span></span></p>
					<input type="text" id="dt_reg" name="dt_reg" value="${boardDto.dt_reg}" style="width: 50%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-left: 300px;" />
				</div>
			</div>
			<br/>
			<br/>
			<div style="width: 900px; margin-left: auto; margin-right: auto; text-align: center;">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="checkout__form__input">
				<c:if test="${boardDto.seq_reply == 0}">
				</c:if>
					<input type="button" value="목록" style="width:100px" onclick="javascript:goList(4);"/>
				</div>
			</div>
			</div>
		</article>
	</div>
</section>
	<!-- Instagram Begin -->
	<!-- 페이지 하단 이미지가 나열 되는 곳 data-setbg="/img/instagram/insta-1.jpg" 이 부분을 우리 상품 이미지로 -->
	<%@ include file="/include/common/footerpic.jsp" %>
	<!-- Instagram End -->

	<!-- Footer Section Begin -->
	<%@ include file="/include/common/footer.jsp" %>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>
<iframe name="frmBlank" id="frmBlank" width="0" height="0"></iframe>
</form>
</body>
</html>