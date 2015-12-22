<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<link href="/resources/fslineup/css/honey.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="/resources/fslineup/css/dataTables.bootstrap.css" rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="/resources/fslineup/css/dataTables.responsive.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="/resources/fslineup/css/morris.css" rel="stylesheet">
</head>
<body>
<div class="panel panel-default">
			  <div class="panel-body">
			  <div class="col-xs-8">
			  	<h1>Honey Info <small> ${resultMap.KO_NM}</small></h1>
			  </div>
			  <div class="col-xs-4">
			  </div>
			  </div>
			</div>
			<!-- /.row -->
			<div class="row">
		<div class="col-xs-12"
			style="border-bottom-width: 10px; margin-bottom: 10px;">
			<!-- Nav tabs -->
			<div class="btn-group">
				<button type="button" class="btn btn-primary dropdown-toggle"
					data-toggle="dropdown">
					남자 프로 농구팀<span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li><a href="main?team=오리온스">오리온스</a></li>
					<li><a href="main?team=모비스">모비스</a></li>
					<li><a href="main?team=KGC인삼공사">KGC인삼공사</a></li>
					<li><a href="main?team=KCC">KCC</a></li>
					<li><a href="main?team=서울삼성">서울삼성</a></li>
					<li><a href="main?team=원주동부">원주동부</a></li>
					<li><a href="main?team=부산KT">부산KT</a></li>
					<li><a href="main?team=전자랜드">전자랜드</a></li>
					<li><a href="main?team=서울SK">서울SK</a></li>
					<li><a href="main?team=창원LG">창원LG</a></li>
				</ul>
			</div>
			
			<div class="btn-group">
				<button type="button" class="btn btn-warning dropdown-toggle"
					data-toggle="dropdown">
					여자 프로 농구팀<span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li><a href="main?team=우리은행">우리은행</a></li>
					<li><a href="main?team=신한은행">신한은행</a></li>
					<li><a href="main?team=KEB하나은행">KEB하나은행</a></li>
					<li><a href="main?team=삼성생명">삼성생명</a></li>
					<li><a href="main?team=KB스타즈">KB스타즈</a></li>
					<li><a href="main?team=KDB">KDB생명</a></li>
				</ul>
			</div>
			<!-- /btn-group -->
			<!-- Tab panes -->
			<!-- <div class="tab-content">
						<div class="tab-pane fade in active" id="home-pills">
							<blockquote>
								<p>
									<button type="button" class="btn btn-outline btn-default">클리블랜드</button>
									<button type="button" class="btn btn-outline btn-default">마이애미</button>
									<button type="button" class="btn btn-outline btn-default">시카고</button>
									<button type="button" class="btn btn-outline btn-default">인디애나</button>
									<button type="button" class="btn btn-outline btn-default">애틀랜타</button>
									<button type="button" class="btn btn-outline btn-default">토론토</button>
									<button type="button" class="btn btn-outline btn-default">워싱턴</button>
									<button type="button" class="btn btn-outline btn-default">샬럿</button>
									<button type="button" class="btn btn-outline btn-default">보스턴</button>
									<button type="button" class="btn btn-outline btn-default">뉴욕</button>
									<button type="button" class="btn btn-outline btn-default">디트로이트</button>
									<button type="button" class="btn btn-outline btn-default">밀워키</button>
									<button type="button" class="btn btn-outline btn-default">올랜도</button>
									<button type="button" class="btn btn-outline btn-default">브루클린</button>
									<button type="button" class="btn btn-outline btn-default">필라델피아</button>
								</p>
							</blockquote>
						</div>
						<div class="tab-pane fade" id="profile-pills">
							<blockquote>
								<p>
									<button type="button" class="btn btn-outline btn-default">골든스테이트</button>
									<button type="button" class="btn btn-outline btn-default">샌안토니오</button>
									<button type="button" class="btn btn-outline btn-default">댈러스</button>
									<button type="button" class="btn btn-outline btn-default">오클라호마</button>
									<button type="button" class="btn btn-outline btn-default">피닉스</button>
									<button type="button" class="btn btn-outline btn-default">멤피스</button>
									<button type="button" class="btn btn-outline btn-default">클리퍼스</button>
									<button type="button" class="btn btn-outline btn-default">유타</button>
									<button type="button" class="btn btn-outline btn-default">미네소타</button>
									<button type="button" class="btn btn-outline btn-default">덴버</button>
									<button type="button" class="btn btn-outline btn-default">포틀랜드</button>
									<button type="button" class="btn btn-outline btn-default">휴스턴</button>
									<button type="button" class="btn btn-outline btn-default">새크라멘토</button>
									<button type="button" class="btn btn-outline btn-default">뉴올리언즈</button>
									<button type="button" class="btn btn-outline btn-default">레이커스</button>
								</p>
							</blockquote>
						</div>
					</div> -->
		</div>
	</div>
			<div class="row">
				<div class="col-xs-12">
					<div class="widget stacked">

						<div class="widget-header">
							<i class="icon-th-list"></i>
<!-- 							<h3>경기 결과</h3> -->
							<h3>경기결과</h3>
						</div>
						<!-- /widget-header -->

						<div class="widget-content">
							<div class="dataTable_wrapper">
								<table
									class="table table-striped table-bordered table-hover textc"
									id="dataTables-example">
									<thead>
										<tr>
											<th>경기일</th>
											<th>시간</th>
											<th>요일</th>
											<th>홈/원정</th>
											<th>상대</th>
											<th>홈 점수</th>
											<th>원정점수</th>
											<th>결과</th>
											<th>기준점</th>
											<th>핸디 결과</th>
											<th>기준점</th>
											<th>언/오 결과</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="result" items="${resultList}" varStatus="status">
										<tr>
											<td>${result.mtDtm}</td>
											<td>${result.mtTime}</td>
											<td>${result.yoil}</td>
											<td>${result.HM_AW}</td>
											<td>${result.OPP_TM_CD}</td>
											<td>${result.HM_SCR}</td>
											<td>${result.AW_SCR}</td>
											<td>${result.MT_RES}</td>
											<td>${result.EHD_PM}</td>
											<td>${result.EHD_PM_RES}</td>
											<td>${result.EHD_UO}</td>
											<td>${result.EHD_UO_RES}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
							<!-- <div class="well">
                                <h4>DataTables Usage Information</h4>
                                <p>DataTables is a very flexible, advanced tables plugin for jQuery. In SB Admin, we are using a specialized version of DataTables built for Bootstrap 3. We have also customized the table headings to use Font Awesome icons in place of images. For complete documentation on DataTables, visit their website at <a target="_blank" href="https://datatables.net/">https://datatables.net/</a>.</p>
                                <a class="btn btn-default btn-lg btn-block" target="_blank" href="https://datatables.net/">View DataTables Documentation</a>
                            </div> -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>

			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-xs-8">
					<div class="widget widget-nopad stacked">

						<div class="widget-header">
							<i class="icon-list-alt"></i>
							<h3>Recent News</h3>
						</div>
						<!-- /widget-header -->

						<div class="widget-content">

							<ul class="news-items">
								<li>

									<div class="news-item-detail">
										<a href="javascript:;" class="news-item-title">Duis aute
											irure dolor in reprehenderit</a>
										<p class="news-item-preview">Lorem ipsum dolor sit amet,
											consectetur adipisicing elit, sed do eiusmod tempor
											incididunt ut labore et dolore.</p>
									</div>

									<div class="news-item-date">
										<span class="news-item-day textc"><span
											class="icon icon-comment"></span></span> <span
											class="news-item-month textc">11.21 08:23</span>
									</div>
								</li>
								<li>
									<div class="news-item-detail">
										<h4>Lorem ipsum</h4>
										<p class="news-item-preview">Lorem ipsum dolor sit amet,
											consectetur adipisi</p>
									</div>

									<div class="news-item-date">
										<span class="news-item-day textc"><span
											class="icon icon-comment"></span></span> <span
											class="news-item-month textc">11.22 11:30</span>
									</div>
								</li>
								<li>
									<div class="news-item-date textl">
										<span class="news-item-day textc"><span
											class="icon icon-info-sign"></span></span> <span
											class="news-item-month">11.23 09:00</span>
									</div>
									<div class="news-item-detail">
										<a href="javascript:;" class="news-item-title">Duis aute
											irure dolor in reprehenderit</a>
										<p class="news-item-preview">Lorem ipsum dolor sit amet,
											consectetur adipisi</p>
									</div>
								</li>
							</ul>

						</div>
						<!-- /widget-content -->

					</div>
					<!-- /widget -->

				</div>
				<div class="col-xs-4">
					<div class="widget widget-nopad stacked">

						<div class="widget-header">
							<i class="icon-list-alt"></i>
							<h3>!!!!!!!</h3>
						</div>
						<!-- /widget-header -->

						<div class="widget-content">
							<div id="morris-donut-chart"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- /row -->
     <content tag="botton_javascript">
     <!-- DataTables JavaScript -->
	<script src="/resources/fslineup/js/jquery.dataTables.min.js"></script>
	<script src="/resources/fslineup/js/dataTables.bootstrap.min.js"></script>
	<!-- Morris Charts JavaScript -->
	<script src="/resources/fslineup/js/raphael-min.js"></script>
	<script src="/resources/fslineup/js/morris.min.js"></script>
	<script src="/resources/fslineup/js/morris-data.js"></script>
	    <script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
			$('[data-toggle="tooltip"]').tooltip();
		});
		</script>
	</content>
</body>
</html>