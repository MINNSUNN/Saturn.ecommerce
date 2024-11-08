<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/center/board/notice/writeForm.jsp" %>
<%@ taglib prefix="bravomylifeTag"		uri="/WEB-INF/tld/com.bravomylife.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/backoffice/header.jsp" %>
	<%@ include file="/include/backoffice/css.jsp" %>
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
<script>
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/console/center/board/list.web";
		frmMain.submit();
	}
	
	function remove(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("cd_bbs_type").value = value;
		frmMain.action="/console/center/board/remove.web";
		frmMain.submit();
	}
	
	function modifyForm(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("cd_bbs_type").value = value;
		frmMain.action="/console/center/board/modifyForm.web";
		frmMain.submit();
	}
	
	function download(type, sequence) {
		
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.type.setAttribute("value", type);
		frmMain.sequence.setAttribute("value", sequence);
		frmMain.action = "/console/center/board/download.web";
		frmMain.target = "frmBlank";
		frmMain.submit();
		
		frmMain.target = "_self";
	}
	
	function consolegoList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.cd_bbs_type.setAttribute("value", value);
		frmMain.action = "/console/center/board/list.web";
		frmMain.submit();
	}
	
	
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<form id="frmMain" method="POST" enctype="multipart/form-data" >
<input type="hidden" id="type"		name="type" />
<input type="hidden" id="sequence"	name="sequence" />
<input type="hidden" id="cd_bbs_type"	name="cd_bbs_type"	value="${boardDto.cd_bbs_type}" />
<input type="hidden" id="seq_bbs"		name="seq_bbs"		value="${boardDto.seq_bbs}" />
<%@ include file="/include/backoffice/mainSide.jsp" %>

<!-- Main content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
		고객 센터
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-3">
				<div class="box box-solid">
					<div class="box-header with-border">
						<h3 class="box-title">고객 센터</h3>
						<div class="box-tools">
							<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
							</button>
						</div>
					</div>
					<div class="box-body no-padding">
						<ul class="nav nav-pills nav-stacked">
							<li class="active"><a href="javascript:consolegoList(1);"><i class="fa fa-bullhorn"></i> 공지사항</a>
							<li class="active"><a href="javascript:consolegoList(2);"><i class="fa fa-fw fa-users"></i> 자주찾는 질문(FAQ)</a>
							<li class="active"><a href="javascript:consolegoList(3);"><i class="fa fa-fw fa-user"></i> 1:1문의</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="box box-primary">
				
				<!-- /.box-header -->
				<div class="box-body no-padding">
					<div class="mailbox-read-info">
					<h3 style="font-size:30px; text-align:center" >${boardDto.title}</h3><br/><br/><br/>
						<input type="checkbox" id= "flg_top" name="flg_top"  value="" disabled
						<c:if test="${boardDto.flg_top == 'Y'}">checked</c:if>/> 
						<label>최상위</label>
					<h5 style="font-size:20px; padding: 20px 0 0 0;">작성자 : Bravo My Life
						<span class="mailbox-read-time pull-right" style="font-size:18px">작성 일자 : ${boardDto.dt_reg}</span></h5>
					</div>
					<br/>
					<div class="form-group" style="padding: 10px;border-bottom: 1px solid #f4f4f4;margin-bottom: 1px;">
					<label>카테고리(*)</label>
						<select class="form-control" id="cd_ctg" name="cd_ctg" style="height: 34px;margin-bottom: 15px;"disabled>
							<option value="0"<c:if test="${boardDto.cd_ctg == '0'}"> selected</c:if>>선택</option>
							<option value="1"<c:if test="${boardDto.cd_ctg == '1'}"> selected</c:if>>가입 및 탈퇴</option>
							<option value="2"<c:if test="${boardDto.cd_ctg == '2'}"> selected</c:if>>상품</option>
							<option value="3"<c:if test="${boardDto.cd_ctg == '3'}"> selected</c:if>>구매</option>
							<option value="4"<c:if test="${boardDto.cd_ctg == '4'}"> selected</c:if>>결제</option>
							<option value="5"<c:if test="${boardDto.cd_ctg == '5'}"> selected</c:if>>배송</option>
							<option value="6"<c:if test="${boardDto.cd_ctg == '6'}"> selected</c:if>>환불</option>
							<option value="9"<c:if test="${boardDto.cd_ctg == '9'}"> selected</c:if>>기타</option>
						</select>
					</div>
					<br/>
					<div class="mailbox-read-message"style="font-size:20px">
						${boardDto.content}
					</div>
				<c:if test="${boardDto.file_orig != ''}">	
					<div class="box-footer">
						<ul class="mailbox-attachments clearfix" style="text-align:center">	
							<c:if test="${boardDto.file_orig != ''}">
								<a href="javascript:download('BbsNotice', ${boardDto.seq_bbs});">[첨부파일 다운로드]</a>
							</c:if>
						</ul>
					</div>
				</c:if>	
					<!-- /.mailbox-read-message -->
				<!-- /.box-footer -->
					<div class="box-footer">
						<div class="pull-right">
							<button type="button" class="btn btn-primary" onclick="modifyForm(1);"><i class="fa fa-pencil"></i> 수정</button>
							<button type="button" class="btn btn-default" onclick="goList(1);"><i class="fa fa-fw fa-align-justify"></i> 목록</button>
						</div>
						<button type="button" onclick="javascript:remove(1);" class="btn btn-default"><i class="fa fa-trash-o"></i> 삭제</button>
					</div>
				<!-- /.box-footer -->
				</div>
				<!-- /. box -->
			</div>
			<!-- /.col -->
		</div>
	</div>
	<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /Maincontent -->
	<%@ include file="/include/backoffice/footer.jsp" %>
	<%@ include file="/include/backoffice/sideBar.jsp" %>
	<%@ include file="/include/backoffice/js.jsp" %>
	</form>
	<script src="/backoffice/js/bootstrap3-wysihtml5.all.min.js"></script>
	<script>
	$(function () {
	//Add text editor
	$("#content").wysihtml5();
	});
</script>
</body>
</html>