<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/member/withdraw.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<!-- Css Styles -->
	<%@ include file="/include/common/css.jsp" %>
	
	<!-- Google Font -->
	<%@ include file="/include/common/webfont.jsp" %>
		
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/front.js"></script>
	<script type="text/javascript" src="/js/package/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/package/tinymce.js"></script>		
	<script>
	function withdraw() {
		
		if (confirm("탈퇴를 하시겠습니까?")) {
			
			var frmMain = document.getElementById("frmMain");
	
			frmMain.action="/front/member/withdrawProc.web";
			frmMain.submit();
		}
	}
	</script>
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<ul class="my-custom-ul" >
				<li><img src="/img/mypage/mypage2.png"><a style="font-size :20px" href="/front/member/modifyForm.web" class="menuLnb">&nbsp;마이 페이지</a></li>
				<li><img src="/img/mypage/mypage1.png"><a href="#" class="menuLnb">개인정보 수정</a></li>
				<li><img src="/img/mypage/mypage1.png"><a href="#" class="menuLnb">문의 이력</a></li>
				<li><img src="/img/mypage/mypage1.png"><a href="#" class="menuLnb">포인트</a></li>
				<li><img src="/img/mypage/mypage1.png"><a href="#" class="menuLnb">맞춤건강 결과표</a></li>
				<li><img src="/img/mypage/mypage1.png"><a href="#" class="menuLnb">찜한 상품</a></li>
				<li><img src="/img/mypage/mypage1.png"><a href="#" class="menuLnb">구매이력</a></li>
				<li><img src="/img/mypage/mypage1.png"><a href="#" class="menuLnb">회원 탈퇴</a></li>
	</ul>
	<!-- Breadcrumb End -->

				<!-- Checkout Section Begin -->
				<section class="checkout spad" >
					<div class="container">
						<form id="frmMain" method="POST" class="checkout__form">
						<input type="hidden" name="phone" id="phone" />
							<div class="row"style="display: flex; justify-content: center; align-items: center;">
								<div class="col-lg-8">
									<h5 >회원 탈퇴 </h5>
									<div class="row">
										<!-- 이메일 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="checkout__form__input">
												<p>01.회원 탈퇴 안내</p>
												<div style="display: flex; align-items: center; gap: 10px;">
													<textarea id="withdraw-textarea" readonly style="resize: none; padding: 8px; font-size: 16px; white-space: pre-wrap;overflow-wrap: break-word;height:280px;width:100%;border: 1px solid #e1e1e1;">
BRAVO My Life 탈퇴안내

회원님께서 회원 탈퇴를 원하신다니 저희 쇼핑몰의 서비스가 많이 부족하고 미흡했나 봅니다.
불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.

■ 아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.
1. 회원 탈퇴 시 회원님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한
고객정보 보호정책에따라 관리 됩니다.
2. 탈퇴 시 회원님께서 보유하셨던 마일리지는 삭제 됩니다
													</textarea>
												</div>
												<br>
											</div>
										</div>

										<!-- 수정 버튼 -->
										<div class="col-lg-12 col-md-12 col-sm-12">
										<br>
										<br>
											<div class="checkout__form__input">
												<input type="button" value="탈퇴하기"
													style="width: 100%; text-align: center;" id="registerId" onClick="withdraw();"/>
											</div>
										</div>
									</div>
								</div>
								</div>
							</form>
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
</body>
</html>