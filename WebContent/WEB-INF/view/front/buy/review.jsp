<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/review.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
	function reviewWriteProc(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		var rateStar = document.getElementById("rate_star");
		
		if (!rateStar || rateStar.getAttribute('data-value') == null || rateStar.getAttribute('data-value') == "") {
			
			alert("평점을 입력하세요.");
			return;
		}
		
		var fileInput = document.getElementById("files[0]");
		
		if (!fileInput || fileInput.files.length === 0) {
			
			alert("파일을 선택하세요.");
			return;
		}
		
		if (document.getElementById("rate_review").value == "") {
			
			alert("후기 내용을 입력하세요.");
			return;
		}
		frmMain.action="/front/buy/reviewWriteProc.web";
		frmMain.submit();
	}
	</script>
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>
	
	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
</head>
<!-- 
var star = document.querySelector('.fa-star-large');
var value = star.getAttribute('data-value');
alert("평점 확인" + value);
 -->
<body>
<form id="frmMain" method="POST" enctype="multipart/form-data">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<ul class="my-custom-ul" >
				<li><img src="/img/mypage/mypage1.png"><a style="font-size :30px" href="/front/myPage/" class="menuLnb">마이 페이지</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/member/modifyForm.web" class="menuLnb">개인정보 수정</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="javascript:goList(3);" class="menuLnb">문의 이력</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">포인트</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">맞춤건강 결과표</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">찜한 상품</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="#" class="menuLnb">구매이력</a></li>
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px"href="/front/member/withdraw.web" class="menuLnb">회원 탈퇴</a></li>
	</ul>
	<!-- Breadcrumb End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12" >
						<div class="review-form" style="height: 100% !important; display: flex; flex-direction: column;">
							<input type="hidden" name="seq_sle"				id="seq_sle"		value="${saleDto.seq_sle}"/>
							<div class="review-title" style="border-bottom: 0px !important; border-top: 0px !important;">
								<div>
									<img src="/img/review/review.png" style="height: 26px !important;"><span class="reviewtitle">상품 후기</span>
								</div>
								<div>
									<span class="reviewsub">이 상품에 대해서 얼마나 만족하시나요?</span>
								</div>
							</div>
							<div class="review-name" style="border-bottom: 0px !important;">
								<div class="photoreview" style="padding: 25px 20px !important;">
									<img src="${saleDto.img}" style="height: 100px !important; ">
								</div>
								<div class="product-name" style="flex-grow: 1;">
									<div class="product-name" style="padding: 0px !important; padding-top: 20px !important; font-weight: bold !important;">
										${saleDto.sle_nm}
									</div>
									<div class="product-name" style="padding: 0px !important;">
										<div class="rating">
											<i class="fa fa-star-large" style="color: #e0e0e0;" data-value="1"></i>
											<i class="fa fa-star-large" style="color: #e0e0e0;" data-value="2"></i>
											<i class="fa fa-star-large" style="color: #e0e0e0;" data-value="3"></i>
											<i class="fa fa-star-large" style="color: #e0e0e0;" data-value="4"></i>
											<i class="fa fa-star-large" style="color: #e0e0e0;" data-value="5"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="review-name" style="border-bottom: 0px !important;">
								<div class="photoreview" style="display: flex !important; justify-content: flex-start !important; align-items: center !important;">
									사진첨부
								</div>
								<div class="product-name">
									<div>
										<input type="file" style="display: none;" id="files[0]" name="files[0]"/>
										<label for="files[0]" class="cart-btn-review" style="background: #fff; color: #346aff !important; border: 1px solid #346aff !important; margin: 0;">
											파일 선택
										</label>
									</div>
								</div>
							</div>
							<div class="review-name" style="border-bottom: 0px !important; height: auto !important; flex-grow: 2 !important; min-height: 250px !important;">
								<div class="photoreview">
									상세후기
								</div>
								<div class="product-name" style="display: flex; justify-content: center; align-items: center; height: 100% !important; padding: 20px 0px 20px 20px !important;">
									<div style="height: 100% !important; display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start; width: 100%;">
										<textarea id="rate_review" name="rate_review" class="review-text" placeholder="다른 고객님께 도움이 되도록 후기를 남겨주세요."></textarea>
										<div style="display: flex; justify-content: flex-end; gap: 10px; margin-top: 10px; width: 100%;">
											<a href="#" class="cart-btn" style="background: #fff; color: #111 !important; border: 1px solid #ccc !important; margin: 0; padding: 10px 10px 10px !important;">
												취소하기
											</a>
											<a href="javascript:reviewWriteProc();" class="cart-btn" style="background: #346aff; color: white !important; border: 1px solid #346aff !important; margin: 0 ; padding: 10px 10px 10px !important;">
												등록하기
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
<!-- Checkout Section end -->

	<!-- Instagram Begin -->
	<!-- 페이지 하단 이미지가 나열 되는 곳 data-setbg="/img/instagram/insta-1.jpg" 이 부분을 우리 상품 이미지로 -->
	<%@ include file="/include/common/footerpic.jsp" %>
	<!-- Instagram End -->

	<!-- Footer Section Begin -->
	<%@ include file="/include/common/footer.jsp" %>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@ include file="/include/common/js.jsp" %>	
<script>
	var stars = document.querySelectorAll('.fa-star-large');
	
	stars.forEach(star => {
		star.addEventListener('click', function() {
			var value = this.getAttribute('data-value');
			
			stars.forEach(s => {
				s.removeAttribute('name');
				s.removeAttribute('id');
				
				if (s.getAttribute('data-value') <= value) {
					s.style.setProperty('color', 'gold', 'important');
				} else {
					s.style.setProperty('color', '#e0e0e0', 'important');
				}
			});
			
			this.setAttribute('name', 'rate_star');
			this.setAttribute('id', 'rate_star');
		});
	});
</script>
</form>
</body>
</html>