<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
﻿<%@ include file="../include/nav.jsp"%>
<!-- s-content
    ================================================== -->
<section class="s-content s-content--narrow">

	<div class="row">
		<div class="col-full s-content__main">
			<h3>Welcome</h3>

			<form name="cForm" id="cForm" method="post" action="/user/login">
				<fieldset>

					<div class="form-field">
						<input name="username" type="text" id="username" class="full-width" placeholder="Username" required="required">
					</div>

					<div class="form-field">
						<input name="password" type="password" id="password" class="full-width" placeholder="password" required="required">
					</div>

					<button type="submit" class="submit btn btn--primary full-width">Login</button>

				</fieldset>
			</form>
			<!-- end form -->


		</div>
		<!-- end s-content__main -->

	</div>
	<!-- end row -->

</section>
<!-- s-content -->


<%@ include file="../include/footer.jsp"%>
</body>

</html>