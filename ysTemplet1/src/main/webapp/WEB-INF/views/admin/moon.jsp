<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



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
					<form:form commandName="" name="frmDefault" id="frmDefault"
						method="post" class="form-horizontal col-md-7" role="form">
						
						
					
					

						<div class="form-group ">
							<label for="select1" class="col-md-4">리그코드</label>
							<div class="col-md-8">
								<select id="LG_CD" name="LG_CD" class="form-control">
									<option>리그 코드</option>
									<c:forEach var="result" items="${lgList}" varStatus="status">
										<option value="${result.lgCd}">${result.koNm}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4">홈팀</label>
							<div class="col-md-8">
								<select id="HM_TM" name="HM_TM" class="form-control">
									<option>홈팀 선택</option>
									<c:forEach var="result" items="${teamList}" varStatus="status">
										<option value="${result.tmCd}">${result.koNm}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4">원정팀</label>
							<div class="col-md-8">
								<select id="AW_TM" name="AW_TM" class="form-control">
									<option>원정팀 선택</option>
									<c:forEach var="result" items="${teamList}" varStatus="status">
										<option value="${result.tmCd}">${result.koNm}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<!-- /.form-group -->
						<div class="form-group">
							<label class="col-md-4">경기시간</label>
							<div class="col-md-8">
								<input type="text" id="MT_DTM" name="MT_DTM" value=""	class="form-control" />
									
								
							</div>
						</div>

						
						<!-- /.form-group -->
						<!--  <div class="form-group ">
							<label for="select1" class="col-md-4">구분</label>
							<div class="col-md-8">
								<select id="type" name="type" class="form-control">
									<option value="info">정보</option>
									<option value="talk">잡담</option>
								</select>
							</div>
						</div>  -->

						<div class="form-group">

							<div class="col-md-offset-4 col-md-8">

								<button id="btnSave" class="btn btn-default">등록</button>
							</div>

						</div>
						<!-- /.form-group -->
					</form:form>
					
							<div class="widget-content">
							<div class="dataTable_wrapper">
								<table
									class="table table-striped table-bordered table-hover textc"
									id="dataTables-example">
									<thead>
										<tr>
											 <th>리그코드</th>
											<th>홈팀</th>
											<th>원정팀</th>
											<th>경기시간</th>
											<th>경기장</th>
											<th>지역명</th>
											<th>글쓴시간</th>
											<th>글쓴시간</th>
											<th>글쓴시간</th>
											<th>글쓴시간</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="result" items="${resultList}" varStatus="status">
										<tr>
											<td>${result.lgko}</td>
											<td>${result.hmko}</td>
											<td>${result.awko}</td>
											<td>${result.MT_DTM}</td>
											<td>${result.STM_NM}</td>
											<td>${result.arko}</td>
											<td>${result.DTM}</td>
										
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>							
						</div>
				</div>
				<!-- /.widget-content -->


			</div>
			<!-- /.widget -->

		</div>
		<!-- /.col-md-12 -->


	</div>
	<!-- /.row -->

	<!-- 스크립트,js 넣기 -->
	<content tag="botton_javascript"><script>
		$(document).ready(function() {
			alert("${lgCd}");
			$("select[name='LG_CD'] option[value='${lgCd}']").attr("selected", true);
			
			$("#btnSave").click(function(){
		    	fncProc();return false;
		    });
			
			$("#LG_CD").change(function(){
				$("#frmDefault").attr({"action": "main", "target": "_self", "method": "post"}).submit();
		    });
		});
		function fncProc(){
				$("#frmDefault").attr({"action": "insertProc", "target": "_self", "method": "post"}).submit();
		}
		
	</script></content>
</body>
</html>