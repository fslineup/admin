<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<link href="/resources/fslineup/css/lineup.css" rel="stylesheet">
</head>
<body>
<div class="panel panel-default">
			  <div class="panel-body">
			  <div class="col-xs-8">
			  	<h1>Daily Lineups <small>National Basketball Association</small></h1>
			  </div>
			  <div class="col-xs-4">
			  	<blockquote class="exp">
			  		<strong>예상 - </strong> 해당 라인업은 예상 라인업 입니다.
			  	</blockquote>
			  	<blockquote class="exp on">
			  		<strong>확정 - </strong> 해당 라인업은 확정된 라인업 입니다.
			  	</blockquote>
			  	<span class="icon icon-star"></span>, <span class="icon icon-star-empty"></span> 는 팀내 선수의 중요도를 나타냅니다.
			  </div>
			  </div>
			</div>
			<c:forEach var="result" items="${teamList}" varStatus="status">
			<c:if test="${status.count % 3 == 1}">
			<div class="row">
			</c:if>			<div class="col-xs-4">
				<div class="widget stacked lineup">
					<div class="widget-header lineup-header">
						<div class="col-xs-4 textl team-name">
									<c:out value="${result.hm_team}"/><img src="/resources/fslineup/img/nba/${result.hm_team}.png" class="img-rounded icon">
						</div>
						<div class="col-xs-4 textc">
							<p><c:out value="${result.time}"/></p>
							<p><small>일단대기</small></p>
						</div>
						<div class="col-xs-4 textr team-name">
							<img src="/resources/fslineup/img/nba/${result.aw_team}.png" class="img-rounded icon"><c:out value="${result.aw_team}"/>
						</div>
					</div>
					<div class="widget-content">
							<div class="col-xs-6">
								<blockquote class="${result.hm_stat}">
									<c:forEach var="result1" items="${playList}" varStatus="status1">
										<c:if test="${result.hm_team eq result1.team}">
											<p><small><c:out value="${result1.pos}"/></small> <c:out value="${result1.name}"/></p>
										</c:if>
									</c:forEach>
								</blockquote>	
									<div class="injuries">
									injuries
									</div>
									<c:forEach var="result2" items="${injList}" varStatus="status2">
										<c:if test="${result.hm_team == result2.team}">
											<p><small><c:out value="${result2.pos}"/></small> <c:out value="${result2.name}"/> <span class="i-${result2.state}"><c:out value="${result2.state}"/></span></p>
										</c:if>											
									</c:forEach>
							</div>
							<div class="col-xs-6">
								<blockquote class="${result.hm_stat}">
									<c:forEach var="result1" items="${playList}" varStatus="status1">
										<c:if test="${result.aw_team == result1.team}">
											<p><small><c:out value="${result1.pos}"/></small> <c:out value="${result1.name}"/></p>
										</c:if>
									</c:forEach>
								</blockquote>	
									<div class="injuries">
									injuries
									</div>
									<c:forEach var="result2" items="${injList}" varStatus="status2">
										<c:if test="${result.aw_team == result2.team}">
											<p><small><c:out value="${result2.pos}"/></small> <c:out value="${result2.name}"/> <span class="i-${result2.state}"><c:out value="${result2.state}"/></span></p>
										</c:if>		
									</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<c:if test="${status.count % 3 == 0}">
				</div>
				</c:if>
			</c:forEach>
     <content tag="botton_javascript">
     <script src="/resources/fslineup/js/plugins/flot/jquery.flot.js"></script>
	 <script src="/resources/fslineup/js/plugins/flot/jquery.flot.pie.js"></script>
	 <script src="/resources/fslineup/js/plugins/flot/jquery.flot.resize.js"></script>
	 <script src="/resources/fslineup/js/charts/area.js"></script>
	 <script src="/resources/fslineup/js/charts/donut.js"></script>
	    <script>
	        $(function() {
	            console.log('This is a test');
	        });
	    </script>
	</content>
</body>
</html>