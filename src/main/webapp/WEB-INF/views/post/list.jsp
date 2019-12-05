<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
﻿<%@ include file="../include/nav.jsp"%>

<!-- s-content
    ================================================== -->
<section class="s-content">

	<div class="row masonry-wrap">
		<div class="masonry">

			<div class="grid-sizer"></div>

			<c:forEach var ="post" items="${posts}">
				<article class="masonry__brick entry format-standard"
					data-aos="fade-up">

					<div class="entry__thumb">
						<a href="/post/detail/${post.id}" class="entry__thumb-link"> <img style="width:100%; height:367.99" src="${post.previewImg}" alt="">
						</a>
					</div>

					<div class="entry__text">
						<div class="entry__header">

							<div class="entry__date">
								<a href="/post/detail/${post.id}">${post.createDate}</a>
							</div>
							<h1 class="entry__title">
								<a href="/post/detail/${post.id}">${post.title}</a>
							</h1>

						</div>
						<div class="entry__excerpt" style="display: -webkit-box; -webkit-box-orient: vertical;text-align: left; overflow: hidden; text-overflow: ellipsis; white-space: normal; line-height: 1.2; height: 3.2em; -webkit-line-clamp: 2; margin-bottom: 20px; word-break:break-all">
							<p>${post.content}</p>
						</div>
						<div class="entry__meta">
							<span class="entry__meta-links"> <a href="category.html">${post.username}</a>
							</span>
						</div>
					</div>

				</article>
				<!-- end article -->
			</c:forEach>

		</div>
		<!-- end masonry -->
	</div>
	<!-- end masonry-wrap -->

	<div class="row">
		<div class="col-full">
			<nav class="pgn">
				<ul>
					<li><a class="pgn__prev" href="/post/1">Prev</a></li>
					<li><a class="pgn__num current" href="/post/1">1</a></li>
					<li><a class="pgn__num" href="/post/2">2</a></li>
					<li><a class="pgn__num" href="/post/3">3</a></li>
					<li><a class="pgn__num" href="/post/4">4</a></li>
					<li><a class="pgn__num" href="/post/5">5</a></li>
					<li><a class="pgn__next" href="/post/2">Next</a></li>
				</ul>
			</nav>
		</div>
	</div>

</section>
<!-- s-content -->

<%@ include file="../include/footer.jsp"%>

</body>

</html>