<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>

﻿<%@ include file="../include/nav.jsp"%>


<!-- s-content
    ================================================== -->
<section class="s-content s-content--narrow">

	<div class="row">
		<div class="col-full s-content__main">
			<h3>Posting</h3>

			<form name="cForm" id="cForm" method="post" action="/post/save">
				<fieldset>
					<input type="hidden" value = "${sessionScope.user.id}" name=userId >
					<div class="form-field">
						<input name="title" type="text" id="cName" class="full-width"
							placeholder="Title" value="">
					</div>
					<div class="form-field">
						<textarea name="content" id="summernote" name="editordata"></textarea>
					</div>
					<br/>
					<button type="submit" class="submit btn btn--primary full-width" style="width:20%;">Posting</button>

				</fieldset>
			</form>
			<!-- end form -->


		</div>
		<!-- end s-content__main -->

	</div>
	<!-- end row -->

</section>
<!-- s-content -->
<script>
	$('#summernote').summernote({
		placeholder : '글을 입력하세요.',
		tabsize : 1,
		height : 300
	});
	$('.dropdown-toggle').dropdown()
</script>


<%@ include file="../include/footer.jsp"%>
</body>

</html>