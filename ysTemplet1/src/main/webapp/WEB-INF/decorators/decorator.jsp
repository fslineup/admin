<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>FS Lineup</title>

<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport" content="width=1024">
<link href="/resources/fslineup/css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="/resources/fslineup/css/bootstrap-responsive.min.css" rel="stylesheet"> -->

<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">
<link href="/resources/fslineup/css/font-awesome.min.css" rel="stylesheet">

<link href="/resources/fslineup/css/ui-lightness/jquery-ui-1.10.0.custom.min.css"
	rel="stylesheet">

<link href="/resources/fslineup/css/base-admin-3.css" rel="stylesheet">
<link href="/resources/fslineup/css/base-admin-3-responsive.css" rel="stylesheet">

<link href="/resources/fslineup/css/pages/dashboard.css" rel="stylesheet">

<link href="/resources/fslineup/css/custom.css" rel="stylesheet">

<decorator:head />

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>

<body>

	<nav class="navbar navbar-inverse" role="navigation">

		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <i class="icon-cog"></i>
				</button>
				<a class="navbar-brand" href="/resources/fslineup/index.html">Base Admin 3.0</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="javscript:;"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="icon-cog"></i> Settings <b class="caret"></b>
					</a>

						<ul class="dropdown-menu">
							<li><a href="/resources/fslineup/account.html">Account Settings</a></li>
							<li><a href="javascript:;">Privacy Settings</a></li>
							<li class="divider"></li>
							<li><a href="javascript:;">Help</a></li>
						</ul></li>

					<li class="dropdown"><a href="javscript:;"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="icon-user"></i> Rod Howard <b class="caret"></b>
					</a>

						<ul class="dropdown-menu">
							<li><a href="javascript:;">My Profile</a></li>
							<li><a href="javascript:;">My Groups</a></li>
							<li class="divider"></li>
							<li><a href="javascript:;">Logout</a></li>
						</ul></li>
				</ul>

				<form class="navbar-form navbar-right" role="search">
					<div class="form-group">
						<input type="text" class="form-control input-sm search-query"
							placeholder="Search">
					</div>
				</form>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>





	<div class="subnavbar">

		<div class="subnavbar-inner">

			<div class="container">

				<a href="javascript:;" class="subnav-toggle" data-toggle="collapse"
					data-target=".subnav-collapse"> <span class="sr-only">Toggle
						navigation</span> <i class="icon-reorder"></i>

				</a>

				<div class="collapse subnav-collapse">
				<ul class="mainnav">
				
					<li class="active">
						<a href="/resources/fslineup/index.html">
							<i class="icon-home"></i>
							<span>Home</span>
						</a>	    				
					</li>
					
					<li class="dropdown">					
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-th"></i>
							<span>Components</span>
							<b class="caret"></b>
						</a>	    
					
						<ul class="dropdown-menu">
							<li><a href="/resources/fslineup/elements.html">Elements</a></li>
							<li><a href="/resources/fslineup/forms.html">Form Styles</a></li>
							<li><a href="/resources/fslineup/jqueryui.html">jQuery UI</a></li>
							<li><a href="/resources/fslineup/charts.html">Charts</a></li>
							<li><a href="/resources/fslineup/popups.html">Popups/Notifications</a></li>
						</ul> 				
					</li>
					
					<li class="dropdown">					
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-copy"></i>
							<span>Sample Pages</span>
							<b class="caret"></b>
						</a>	    
					
						<ul class="dropdown-menu">
							<li><a href="/resources/fslineup/pricing.html">Pricing Plans</a></li>
							<li><a href="/resources/fslineup/faq.html">FAQ's</a></li>
							<li><a href="/resources/fslineup/gallery.html">Gallery</a></li>
							<li><a href="/resources/fslineup/reports.html">Reports</a></li>
							<li><a href="/resources/fslineup/account.html">User Account</a></li>
						</ul> 				
					</li>
					
					<li class="dropdown">					
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-external-link"></i>
							<span>Extra Pages</span>
							<b class="caret"></b>
						</a>	
					
						<ul class="dropdown-menu">
							<li><a href="/resources/fslineup/login.html">Login</a></li>
							<li><a href="/resources/fslineup/signup.html">Signup</a></li>
							<li><a href="/resources/fslineup/error.html">Error</a></li>
							<li class="dropdown-submenu">
							    <a tabindex="-1" href="#">More options</a>
							    <ul class="dropdown-menu">
							      <li><a tabindex="-1" href="#">Second level</a></li>

							      <li><a href="#">Second level</a></li>
							      <li><a href="#">Second level</a></li>
							    </ul>
							  </li>
						</ul>    				
					</li>
					<li class="dropdown">					
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-th"></i>
							<span>라인업</span>
							<b class="caret"></b>
						</a>	    
					
						<ul class="dropdown-menu">
							<li><a href="/resources/fslineup/lineup.html">라인업</a></li>
						</ul> 				
					</li>
					<li class="dropdown">					
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-th"></i>
							<span>결장자</span>
							<b class="caret"></b>
						</a>	    
					
						<ul class="dropdown-menu">
							<li><a href="/resources/fslineup/absence.html">결장자</a></li>
						</ul> 				
					</li>
					<li class="dropdown">					
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-th"></i>
							<span>꿀정보</span>
							<b class="caret"></b>
						</a>	    
					
						<ul class="dropdown-menu">
							<li><a href="/resources/fslineup/honey.html">꿀정보</a></li>
						</ul> 				
					</li>
				
				</ul>
			</div> <!-- /.subnav-collapse -->

			</div>
			<!-- /container -->

		</div>
		<!-- /subnavbar-inner -->

	</div>
	<!-- /subnavbar -->



	<div class="main">
		<!-- 메인컨테이너 -->
		<div class="container">
			<decorator:body />
		</div>
		<!-- /메인컨테이너 -->
	</div>
	<!-- /main -->

	<div class="extra">

		<div class="container">

			<div class="row">

				<div class="col-xs-3">

					<h4>About</h4>

					<ul>
						<li><a href="javascript:;">About Us</a></li>
						<li><a href="javascript:;">Twitter</a></li>
						<li><a href="javascript:;">Facebook</a></li>
						<li><a href="javascript:;">Google+</a></li>
					</ul>

				</div>
				<!-- /span3 -->

				<div class="col-xs-3">

					<h4>Support</h4>

					<ul>
						<li><a href="javascript:;">Frequently Asked Questions</a></li>
						<li><a href="javascript:;">Ask a Question</a></li>
						<li><a href="javascript:;">Video Tutorial</a></li>
						<li><a href="javascript:;">Feedback</a></li>
					</ul>

				</div>
				<!-- /span3 -->

				<div class="col-xs-3">

					<h4>Legal</h4>

					<ul>
						<li><a href="javascript:;">License</a></li>
						<li><a href="javascript:;">Terms of Use</a></li>
						<li><a href="javascript:;">Privacy Policy</a></li>
						<li><a href="javascript:;">Security</a></li>
					</ul>

				</div>
				<!-- /span3 -->

				<div class="col-xs-3">

					<h4>Settings</h4>

					<ul>
						<li><a href="javascript:;">Consectetur adipisicing</a></li>
						<li><a href="javascript:;">Eiusmod tempor </a></li>
						<li><a href="javascript:;">Fugiat nulla pariatur</a></li>
						<li><a href="javascript:;">Officia deserunt</a></li>
					</ul>

				</div>
				<!-- /span3 -->
			</div>
		</div>
		<!-- /row -->

	</div>
	<!-- /container -->






	<div class="footer">

		<div class="container">

			<div class="row">

				<div id="footer-copyright" class="col-xs-6">&copy; 2012-13
					Jumpstart UI.</div>
				<!-- /span6 -->

				<div id="footer-terms" class="col-xs-6">
					Theme by <a href="http://jumpstartui.com" target="_blank">Jumpstart
						UI</a>
				</div>
				<!-- /.span6 -->

			</div>
			<!-- /row -->

		</div>
		<!-- /container -->

	</div>
	<!-- /footer -->





	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="/resources/fslineup/js/libs/jquery-1.9.1.min.js"></script>
	<script src="/resources/fslineup/js/libs/jquery-ui-1.10.0.custom.min.js"></script>
	<script src="/resources/fslineup/js/libs/bootstrap.min.js"></script>
	<script src="/resources/fslineup/js/Application.js"></script>
	<decorator:getProperty property="page.botton_javascript"></decorator:getProperty>
</body>
</html>
