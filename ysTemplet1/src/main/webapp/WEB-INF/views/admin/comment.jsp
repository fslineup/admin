<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring"		uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"		uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link href="/resources/fslineup/css/pages/plans.css" rel="stylesheet"> 
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="widget stacked">
				<div class="widget-header">
					<i class="icon-tasks"></i>
					<h3>Horizontal Form</h3>
				</div>
				<!-- /.widget-header -->


				<div class="widget-content">
					<form:form commandName="" name="frmDefault" id="frmDefault" method="post" class="form-horizontal col-md-7" role="form">
					<input type="hidden" name="lgCd" id="lgCd" value="${lgCd}"/>						
						<div class="form-group">
							<label class="col-md-4">경기 시간</label>
							<div class="col-md-8">
								<input type="text" id="time" name="time" value="" class="form-control" />
							</div>
						</div>
						<div class="form-group ">
							<label for="select1" class="col-md-4">리그</label>
							<div class="col-md-8">
							<select id="league" name="league" class="form-control">
							<option>리그 선택</option>
							<c:forEach var="result" items="${lgList}" varStatus="status">															
									<option value="${result.koNm}">${result.koNm}</option>
									</c:forEach>
								</select>								
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4">홈팀</label>
							<div class="col-md-8">
								<select id="home" name="home" class="form-control">
								<option>홈팀 선택</option>								
								<c:forEach var="result" items="${teamList}" varStatus="status">
									<option value="${result.koNm}">${result.koNm}</option>
								</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4">원정팀</label>
							<div class="col-md-8">
								<select id="away" name="away" class="form-control">
								<option>원정팀 선택</option>
								<c:forEach var="result" items="${teamList}" varStatus="status">
									<option value="${result.koNm}">${result.koNm}</option>
								</c:forEach>
								</select>
							</div>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="col-md-4">경기장</label>
							<div class="col-md-8">
								<select id="place" name="place" class="form-control">
								<option>경기장 선택</option>
								<c:forEach var="result" items="${stmnmList}" varStatus="status">
									<option value="${result.stmNm}">${result.stmNm}</option>
								</c:forEach>
								</select>
								
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4">부상여부</label>
							<div class="col-md-8">
								<select id="wound" name="wound" class="form-control">
								<option>유</option>
								<option>무</option>
								</select>
							</div>
						</div>
						<!-- /.form-group -->
						<!-- <div class="form-group ">
							<label for="select1" class="col-md-4">구분</label>
							<div class="col-md-8">
								<select id="type" name="type" class="form-control">
									<option value="info">정보</option>
									<option value="talk">잡담</option>
								</select>
							</div>
						</div> -->

						<div class="form-group">

							<div class="col-md-offset-4 col-md-8">

								<button id="btnSave" class="btn btn-default">등록</button>
							</div>

						</div>
						<!-- /.form-group -->
				</form:form>
				</div>
				<!-- /.widget-content -->


			</div>
			<!-- /.widget -->

		</div>
		<!-- /.col-md-12 -->


	</div>
	<!-- /.row -->

	<!-- 스크립트,js 넣기 -->
	<content tag="botton_javascript"> 
	<script>
		$(document).ready(function() {
			$("#btnSave").click(function(){
		    	fncProc();return false;
		    });
		});
		function fncProc(){
				$("#frmDefault").attr({"action": "insertProc", "target": "_self", "method": "post"}).submit();
		} 
	</script> </content>
</body>
</html>