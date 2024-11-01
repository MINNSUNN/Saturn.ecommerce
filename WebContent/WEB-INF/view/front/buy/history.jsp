	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/basket/index.jsp" %>
<!DOCTYPE html>
<html lang="kor">

<head>
	<%@ include file="/include/common/header.jsp" %>
	<script>
	function goWriteForm(value, value2, value3) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.cd_ctg_m.setAttribute("value", value2);
		frmMain.cd_ctg_b.setAttribute("value", value3);
		
		frmMain.action="/front/buy/writeForm.web";
		
		frmMain.submit();
	}
	
	function goPages(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.currentPage.setAttribute("value", value);
		
		frmMain.action="/front/member/myLike.web";
		frmMain.submit();
	}
	
	function setBasket(value, value2, value3,value4, value5, value6,value7, value8, value9, value10) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.sle_nm.setAttribute("value", value2);
		frmMain.discount_sale.setAttribute("value", value3);
		frmMain.count.setAttribute("value", value4);
		frmMain.img.setAttribute("value", value5);
		frmMain.point_stack.setAttribute("value", value6);
		frmMain.cd_ctg_m.setAttribute("value", value7);
		frmMain.cd_ctg_b.setAttribute("value", value8);
		frmMain.price_sale.setAttribute("value", value9);
		frmMain.discount.setAttribute("value", value10);
		
		var item = value + "|" + value2 + "|" + value3 + "|" +1+ "|" + value5 + "|" + value6 + "|" + value7 + "|" + value8 + "|" +  value9 + "|" + value10;
		document.getElementById("item").value = item;
		
		var frmMain = document.getElementById("frmMain");
		frmMain.action = "/front/basket/setBasket.web";
		frmMain.target = "frmBlank";
		frmMain.submit();
	}
	
	function delivery(value, value2, value3, value4) {
	
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.seq_buy_mst.setAttribute("value", value2);
		frmMain.seq_buy_dtl.setAttribute("value", value3);
		frmMain.seq_mbr_addr.setAttribute("value", value4);
		
		frmMain.action="/front/buy/buyDelivertView.web";
		frmMain.submit();
	}
	
	function cancelForm(value, value2, value3) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.seq_sle.setAttribute("value", value);
		frmMain.seq_buy_mst.setAttribute("value", value2);
		frmMain.seq_buy_dtl.setAttribute("value", value3);
		
		frmMain.action="/front/pay/cancelForm.web";
		frmMain.submit();
	}
	
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
	
		document.getElementById("cd_bbs_type").value = value;
		
		frmMain.action = "/front/center/board/myPageNotice/list.web";
		frmMain.submit();
	}
	
	function goMyList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("cd_bbs_type").value = value;

		frmMain.action = "/front/center/board/myPageNotice/list.web";
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
<input type="hidden" name="item"				id="item"/>
<input type="hidden" name="point_stack"			id="point_stack"		value="0"/>
<input type="hidden" name="discount_sale"		id="discount_sale"		value="0"/>
<input type="hidden" name="img"					id="img"				/>
<input type="hidden" name="seq_sle"				id="seq_sle"			/>
<input type="hidden" name="sle_nm"				id="sle_nm"				/>
<input type="hidden" name="cd_ctg_m"			id="cd_ctg_m"			/>
<input type="hidden" name="cd_ctg_b"			id="cd_ctg_b"			/>
<input type="hidden" name="count"				id="count"				value="0"/>
<input type="hidden" name="price_sale"			id="price_sale"			value="0"/>
<input type="hidden" name="discount"			id="discount"			value="0"/>
<input type="hidden" name="seq_buy_dtl"			id="seq_buy_dtl"		value="0"/>
<input type="hidden" name="seq_buy_mst"			id="seq_buy_mst"		/>
<input type="hidden" name="seq_mbr_addr"		id="seq_mbr_addr"		value="0"/>
<input type="hidden" name="cd_bbs_type"			id="cd_bbs_type"		/>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
		<%@ include file="/include/front/maingnb.jsp" %>
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
		<%@ include file="/include/front/mygnb.jsp" %>
	<!-- Breadcrumb End -->

	<!-- Shop Cart Section Begin -->
	<section class="shop-cart spad" style="min-height: calc(100vh - 100px);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h6 class="lowgnb-title" style="padding-bottom: 20px; text-align: left; font-size: 35px;">주문 내역</h6>
					<h6 class="cart-title">*이미지를 클릭하면 상품으로 이동합니다</h6>
						<div class="shop__cart__table" style="border: 1px solid #dbdbdb; border-radius: 4px;">
							<table id="productBasket" class="cart-table">
								<thead style="border-bottom: 1px solid #dbdbdb !important;">
									<tr style="border-color: #707070 !important;">
										<th class="cart-th" style="width: 5%">
										<th class="cart-th" >상품정보</th>
										<th class="cart-th" style="width: 10%">수량</th>
										<th class="cart-th" style="width: 10%">상품금액</th>
										<th class="cart-th" style="width: 20%">구매일</th>
										<th class="cart-th" style="width: 10%"></th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${empty list}">
										<tr style="text-align: center; border-bottom: 1px solid #707070;">
											<td colspan="7">구매한 상품이 없습니다</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="list" items="${list}">
											<tr style="border: 0;">
												<td class="cart-td" style="text-align: center; vertical-align: middle;">
													<div class="cart-div" style="width: 80px; height: 80px; overflow: hidden; display: inline-block;">
														<a href="javascript:goWriteForm('${list.seq_sle}', '${list.cd_ctg_m}', '${list.cd_ctg_b}');">
															<img class="cart-img" src="${list.img}" class="cart-img">
														</a>
													</div>
												</td>
												<td class="cart-td" style="text-align: center !important;">
													${list.sle_nm}
												</td>
												<td class="cart-td" style="text-align: center !important;">
													${list.count} 개
												</td>
												<td class="cart-td">
													<fmt:formatNumber value="${list.price}" type="number" />원
												</td>
												<td class="cart-td" style="text-align: center !important;">
													${list.dt_reg}
												</td>
												<td class="cart-td">
													<div style="display: flex; flex-direction: column; align-items: center; ">
														<a href="javascript:setBasket('${list.seq_sle}', '${list.sle_nm}', '${list.discount_sale}', '${list.count}'
														, '${list.img}', '${list.point_stack}', '${list.cd_ctg_m}', '${list.cd_ctg_b}', '${list.price_sale}', '${list.discount}');" 
														class="cart-btn" style="padding: 5px 10px 5px !important; font-size: 13px !important; background: #2c2c2c; color: white !important; border: 1px solid #2c2c2c;margin-top:0px">장바구니 담기</a>
														<a href="javascript:delivery('${list.seq_sle}', '${list.seq_buy_mst}', '${list.seq_buy_dtl}', '${list.seq_mbr_addr}');" class="cart-btn" style="padding: 5px 10px 5px !important; font-size: 13px !important; margin-top: 10px !important; background: white; color: #2c2c2c; border: 1px solid #2c2c2c;">배송조회 확인</a>
														<a href="javascript:cancelForm('${list.seq_sle}', '${list.seq_buy_mst}', '${list.seq_buy_dtl}');" class="cart-btn" style="padding: 5px 10px 5px !important; font-size: 13px !important; margin-top: 10px !important; background: white; color: #2c2c2c; border: 1px solid #2c2c2c;">주문취소 신청</a>
													</div>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6" style="max-width: 100% !important; flex: 0 0 100% !important; border-bottom: none;">
					<div style="display: flex; justify-content: flex-end;">
						<div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="text-align: center; width: 100%; margin-top: 20px; color: black !important;">
		<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPages" />
		</div>
	</section>
<div id="loadingSpinner" style=" display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999;">
	<img src="https://i.gifer.com/ZZ5H.gif" alt="Loading..." style="width: 50px; height: 50px;">
</div>
	<!-- Shop Cart Section End -->

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
</script>
</form>
<iframe name="frmBlank" id="frmBlank" width="0" height="0"></iframe>
</body>
</html>