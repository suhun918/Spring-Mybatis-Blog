<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>

<!--- basic page needs
    ================================================== -->
<meta charset="utf-8">
<title>SH BLOG</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- mobile specific metas
    ================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
    ================================================== -->
<link rel="stylesheet" href="/css/base.css">
<link rel="stylesheet" href="/css/vendor.css">
<link rel="stylesheet" href="/css/main.css">

<!-- script
    ================================================== -->
<script src="/js/modernizr.js"></script>
<script src="/js/pace.min.js"></script>

<!-- favicons
    ================================================== -->
<link rel="shortcut icon" href="favicon.ico" type="/images/x-icon">
<link rel="icon" href="favicon.ico" type="/images/x-icon">

</head>

<body id="top">

	<!-- pageheader
    ================================================== -->
	<section class="s-pageheader s-pageheader--home">

		<header class="header">
			<div class="header__content row">

				<div class="header__logo">
					<a class="logo" href="/post"> <img src="/images/mylogo.png" alt="Homepage">
					</a>
				</div>
				<!-- end header__logo -->

				<ul class="header__social">
					<c:choose>
						<c:when test="${empty sessionScope.user}">
							<li><i class="fa fa-facebook" aria-hidden="true"></i></li>
							<li><i class="fa fa-twitter" aria-hidden="true"></i></li>
							<li><i class="fa fa-instagram" aria-hidden="true"></i></li>
							<li><i class="fa fa-pinterest" aria-hidden="true"></i></li>
						</c:when>
						<c:otherwise>
							<li><a href="/user/uploadForm"><img src ="${sessionScope.user.userProfile}" alt="" width = "100px" height="100px" style ="border-radius: 50%;"/></a></li>
							<li>${sessionScope.user.username}</li>
						</c:otherwise>
					</c:choose>

				</ul>
				<!-- end header__social -->

				<a class="header__toggle-menu" href="#0" title="Menu"><span>Menu</span></a>

				<nav class="header__nav-wrap">

					<h2 class="header__nav-heading h6">Site Navigation</h2>

					<ul class="header__nav">
						<li><a href="/post" title="">Home</a></li>
						<li><a href="/post/writeForm" title="">Posting</a></li>
						<li><a href="/user/joinForm">Join</a></li>
						<c:choose>
							<c:when test="${empty sessionScope.user}">
								<li><a href="/user/loginForm" title="">Login</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/user/logout" title="">Logout</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					<!-- end header__nav -->

					<a href="#0" title="Close Menu"
						class="header__overlay-close close-mobile-menu">Close</a>

				</nav>
				<!-- end header__nav-wrap -->

			</div>
			<!-- header-content -->
		</header>
		<!-- header -->
	</section>
	<!-- end s-pageheader -->