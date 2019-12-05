<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
﻿<%@ include file="../include/nav.jsp"%>
<!-- s-content
    ================================================== -->
<section
	class="s-content s-content--narrow s-content--no-padding-bottom">

	<article class="row format-gallery">

		<div class="s-content__header col-full">
			<h1 class="s-content__header-title">${post.title}</h1>
			<ul class="s-content__header-meta">
				<li class="date">${post.createDate}</li>
				<li class=>${post.username}</li>
			</ul>
		</div>
		<!-- end s-content__header -->
	<button type="button" class="btn full-width" onclick = "location.href = '/post/updateForm/${post.id}'">Revise</button>
	<button type="button" class="btn full-width" onclick = "location.href = '/post/delete/${post.id}'">Delete</button>
	

		<div class="col-full s-content__main">

			<p class="lead">${post.content}</p>


		</div>
		<!-- end s-content__main -->

	</article>
</section>
<!-- s-content -->

<%@ include file="../include/footer.jsp"%>
</body>

</html>