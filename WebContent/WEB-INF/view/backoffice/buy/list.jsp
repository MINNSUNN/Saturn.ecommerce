<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/buy/list.jsp" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	
	<%@ include file="/include/backoffice/css.jsp" %>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/backoffice.js"></script>
	<style>
	.search-container {
		display: flex;
		align-items: center; /* 세로 가운데 정렬 */
		
	}

	.search-container select,
	.search-container input {
		height: 30px;
	}
</style>
	<script>
	
	// JavaScript로 옵션을 동적으로 업데이트
	// JavaScript로 검색 옵션을 동적으로 업데이트
	function updateSearchOptions() {
		const searchKey = document.getElementById("searchKey").value;
		const searchWordContainer = document.getElementById("searchWordContainer");
		

			if (searchKey == "cd_state") {
				searchWordContainer.innerHTML = `
					<select id="searchWord" name="searchWord">
						<option value="">선택</option>
						<option value="9">결제실패</option>
						<option value="1">결제완료</option>
						<option value="2">취소</option>
						<option value="3">교환</option>
						<option value="4">환불</option>
					</select>
				`;
			} else if (searchKey == "cd_state_pay") {
				searchWordContainer.innerHTML = `
					<select id="searchWord" name="searchWord">
						<option value="">선택</option>
						<option value="9">결제실패</option>
						<option value="N">실패</option>
						<option value="Y">성공</option>
						<option value="C">취소</option>
					</select>
				`;
			} else if (searchKey == "cd_state_delivery") {
				searchWordContainer.innerHTML = `
					<select id="searchWord" name="searchWord">
						<option value="">선택</option>
						<option value="9">결제실패</option>
						<option value="C">판매 확인중</option>
						<option value="P">배송 준비중</option>
						<option value="D">배송중</option>
						<option value="Y">배송완료</option>
					</select>
				`;
			} else if (searchKey == "email" || searchKey == "mbr_nm") {
				searchWordContainer.innerHTML = `
					<input type="text" id="searchWord" name="searchWord" class="form-control" style="height: 30px;" placeholder="검색어 입력">
				`;
			}
	}
	
	function validateSearch() {
		const searchKey = document.getElementById("searchKey").value;
		const searchWord = document.getElementById("searchWord").value;

		if (!searchKey) {
			alert("검색 기준을 선택하세요.");
			return false;
		}

		if (!searchWord) {
			alert("검색어 또는 옵션을 선택하세요.");
			return false;
		}

		return true;
	}
	
	function goView(value) {

		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("seq_buy_mst").value = value;
		
		frmMain.action="/console/buy/view.web";
		frmMain.submit();
	}

	function goModifyState(seq_buy_mst) {
		
		if (confirm("상태를 변경하시겠습니까?")) {
			
			var frmMain = document.getElementById("frmMain");
			
			cd_state = document.getElementById("select_1").options[document.getElementById("select_1").selectedIndex].value;
			cd_state_delivery = document.getElementById("select_3").options[document.getElementById("select_3").selectedIndex].value;
			
			document.getElementById("seq_buy_mst").value = seq_buy_mst;
			// select_1의 선택된 value
			document.getElementById("cd_state").value = cd_state;
			// select_3의 선택된 value
			document.getElementById("cd_state_delivery").value = cd_state_delivery;

			//alert(cd_state);
			//alert(cd_state_delivery);
			//return;
			
			frmMain.action="/console/buy/modifyProc.web";
			frmMain.submit();
		}
	}
	
	function goPage(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = value;
		frmMain.action="/console/buy/list.web";
		frmMain.submit();
	}
	
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST" action="/console/buy/list.web">
<input type="hidden" name="seq_buy_mst"			id="seq_buy_mst" />
<input type="hidden" name="cd_state"			id="cd_state" />
<input type="hidden" name="cd_state_pay"		id="cd_state_pay" />
<input type="hidden" name="cd_state_delivery"	id="cd_state_delivery" />
<input type="hidden" name="currentPage"	id="currentPage" value="${paging.currentPage}" />	
	<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header" style="display: flex; align-items: center; margin-left: 215px;">
		<h1>
		주문 관리
		</h1>
	</section>

	<!-- Main content -->
	<section class="content" style="display: flex; justify-content: center; align-items: center;">
	
		
		<!-- /.col -->
		<div class="col-md-9">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">주문 목록</h3>&nbsp;&nbsp;&nbsp;
					<div class="box-tools pull-right">
						<div class="has-feedback">
							<div style="display: flex; align-items: center; ">&nbsp;&nbsp;
							<div class="search-container">
								<select id="searchKey" name="searchKey" style="height: 30px;" onchange="updateSearchOptions()">
							<!-- 첫 번째 검색 기준 선택 -->
								
									<option value=""<c:if test="${paging.searchKey == ''}"> selected</c:if>>검색 기준 선택</option>
									<option value="email"<c:if test="${paging.searchKey == 'email'}"> selected</c:if>>이메일</option>
									<option value="mbr_nm"<c:if test="${paging.searchKey == 'mbr_nm'}"> selected</c:if>>성명</option>
									<option value="cd_state"<c:if test="${paging.searchKey == 'cd_state'}"> selected</c:if>>구매상품 상태</option>
									<option value="cd_state_pay"<c:if test="${paging.searchKey == 'cd_state_pay'}"> selected</c:if>>결제 상태</option>
									<option value="cd_state_delivery"<c:if test="${paging.searchKey == 'cd_state_delivery'}"> selected</c:if>>배송 상태</option>
								</select>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- 검색 기준을 선택했을 때 해당 조건에 맞는 입력 필드를 동적으로 변경 -->
								<span id="searchWordContainer">
									<c:choose>
										<c:when test="${paging.searchKey == 'cd_state'}">
											<select id="searchWord" name="searchWord" style="height: 30px;">
												<option value="" <c:if test="${paging.searchWord == ''}">selected</c:if>>선택</option>
												<option value="9" <c:if test="${paging.searchWord == '9'}">selected</c:if>>결제실패</option>
												<option value="1" <c:if test="${paging.searchWord == '1'}">selected</c:if>>결제완료</option>
												<option value="2" <c:if test="${paging.searchWord == '2'}">selected</c:if>>취소</option>
												<option value="3" <c:if test="${paging.searchWord == '3'}">selected</c:if>>교환</option>
												<option value="4" <c:if test="${paging.searchWord == '4'}">selected</c:if>>환불</option>
											</select>
										</c:when>
										<c:when test="${paging.searchKey == 'cd_state_pay'}">
											<select id="searchWord" name="searchWord" style="height: 30px;">
												<option value="" <c:if test="${paging.searchWord == ''}">selected</c:if>>선택</option>
												<option value="9" <c:if test="${paging.searchWord == '9'}">selected</c:if>>결제실패</option>
												<option value="N" <c:if test="${paging.searchWord == 'N'}">selected</c:if>>실패</option>
												<option value="Y" <c:if test="${paging.searchWord == 'Y'}">selected</c:if>>성공</option>
												<option value="C" <c:if test="${paging.searchWord == 'C'}">selected</c:if>>취소</option>
											</select>
										</c:when>
										<c:when test="${paging.searchKey == 'cd_state_delivery'}">
											<select id="searchWord" name="searchWord" style="height: 30px;">
												<option value="" <c:if test="${paging.searchWord == ''}">selected</c:if>>선택</option>
												<option value="9" <c:if test="${paging.searchWord == '9'}">selected</c:if>>결제실패</option>
												<option value="C" <c:if test="${paging.searchWord == 'C'}">selected</c:if>>판매 확인중</option>
												<option value="P" <c:if test="${paging.searchWord == 'P'}">selected</c:if>>배송 준비중</option>
												<option value="D" <c:if test="${paging.searchWord == 'D'}">selected</c:if>>배송중</option>
												<option value="Y" <c:if test="${paging.searchWord == 'Y'}">selected</c:if>>배송완료</option>
											</select>
										</c:when>
										<c:otherwise>
											<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}" />
										</c:otherwise>
									</c:choose>
								</span>
								
								&nbsp;&nbsp;
								<input type="submit" onclick="if(validateSearch()) { executeSearch(); }" value="검색"/>
							</div>	
							</div>
						</div>
					</div>
			<!-- /.box-tools -->
				</div>
			<!-- /.box-header -->
			<div class="box-body no-padding">
				<div class="table-responsive mailbox-messages">
					<table class="table table-hover table-striped">
						<tbody>
							<tr>
							<th style="width: 5%;text-align: center;">NO</th>
							<th style="text-align: center;">이메일(아이디)</th>
							<th style="width: 7%; text-align: center;">성명</th>
							<th style="width: 7%;text-align: center;">주문 번호</th>
							<th style="width: 25%;text-align: center;">구매상품 정보</th>
							<th style="width: 10%;text-align: center;">주문일</th>
							<th style="width: 10%;text-align: center;">구매상품 상태</th>
							<th style="width: 10%;text-align: center;">결제 상태</th>
							<th style="width: 10%;text-align: center;">배송 상태</th>
							</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="5">등록된 구매자(회원)가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list">
							<tr>
								<td style="text-align: center;">
									${list.rnum}
								</td>
								<td class="txtRight" style="text-align: center;">
									<a href="javascript:goView(${list.seq_buy_mst});">
										<bravomylifeTag:masking text="${list.email}" letter="*" count="13" mode="right" />
									</a>
								</td>
								<td style="text-align: center;">
								<bravomylifeTag:masking text="${list.mbr_nm}" letter="*" count="1" mode="left" />
								</td>
								<td style="text-align: center;">
									${list.seq_buy_mst}
								</td>
								<td style="text-align: center;">
									${list.buy_info}
								</td>
								<td style="text-align: center;">
									${list.dt_reg}
								</td>
								<!-- 주문 목록에서 각 주문의 상태(주문 상태, 결제 상태, 배송 상태)를 관리자가 선택할 수 있도록 -->
								<td style="text-align: center;">
									<select id="select_1" style="background:#F0F0F0" onchange="goModifyState(${list.seq_buy_mst});">
										<option value="9"<c:if test="${list.cd_state == 9}"> selected</c:if>>결제실패</option>
										<option value="1"<c:if test="${list.cd_state == 1}"> selected</c:if>>결제완료</option>
										<option value="2"<c:if test="${list.cd_state == 2}"> selected</c:if>>취소</option>
										<option value="3"<c:if test="${list.cd_state == 3}"> selected</c:if>>교환</option>
										<option value="4"<c:if test="${list.cd_state == 4}"> selected</c:if>>환불</option>
									</select>
								</td>
								<td style="text-align: center;">
									<select style="background:#F0F0F0" disabled>
										<option value="9"<c:if test="${list.cd_state_pay == '9'}"> selected</c:if>>결제실패</option>
										<option value="N"<c:if test="${list.cd_state_pay == 'N'}"> selected</c:if>>실패</option>
										<option value="Y"<c:if test="${list.cd_state_pay == 'Y'}"> selected</c:if>>성공</option>
										<option value="C"<c:if test="${list.cd_state_pay == 'C'}"> selected</c:if>>취소</option>
									</select>
								</td>
								<td style="text-align: center;">
									<select id="select_3" style="background:#F0F0F0" onchange="goModifyState(${list.seq_buy_mst});">
										<option value="9"<c:if test="${list.cd_state_delivery == '9'}"> selected</c:if>>결제실패</option>
										<option value="C"<c:if test="${list.cd_state_delivery == 'C'}"> selected</c:if>>판매 확인중</option>
										<option value="P"<c:if test="${list.cd_state_delivery == 'P'}"> selected</c:if>>배송 준비중</option>
										<option value="D"<c:if test="${list.cd_state_delivery == 'D'}"> selected</c:if>>배송중</option>
										<option value="Y"<c:if test="${list.cd_state_delivery == 'Y'}"> selected</c:if>>배송완료</option>
									</select>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
					</c:choose>
				</tbody>
				</table>
				<!-- /.table -->
				
				</div>
				<!-- /.mail-box-messages -->
			</div>
			<!-- /.box-body -->
			<div class="box-footer no-padding">
				<div class="mailbox-controls">
				<!-- /.btn-group -->
				<button type="button" class="btn btn-default btn-sm" onclick="location.reload();"><i class="fa fa-refresh"></i></button>
					<span style="float: right;margin-right: 10px;margin-top: 5px;justify-content: center; ">전체 ${paging.totalLine}개 [${paging.currentPage}/${paging.totalPage} 페이지]</span>
				<div class="pull-right">
				<div class="btn-group">
					<bravomylifeTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goList" />
				</div>
				<!-- /.btn-group -->
				</div>
				<!-- /.pull-right -->
				</div>
			</div>
			</div>
		  <!-- /. box -->
		</div>
	<!-- /.col -->
	
	<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /Maincontent -->

	<%@ include file="/include/backoffice/footer.jsp" %>

	<%@ include file="/include/backoffice/sideBar.jsp" %>

	<%@ include file="/include/backoffice/js.jsp" %>
</form>
</body>
</html>
