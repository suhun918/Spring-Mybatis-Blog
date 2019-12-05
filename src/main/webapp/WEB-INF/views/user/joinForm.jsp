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

                <form name="cForm" id="cForm" method="post" action="/user/join" onsubmit="return validateCheck()">
                    <fieldset>

                        <div class="form-field">
                            <input name="username" type="text" id="cName" class="full-width" placeholder="Username" required="required">
                        </div>

                        <div class="form-field">
                            <input name="password" type="password" id="password" class="full-width" placeholder="password" required="required" maxlength="20">
                        </div>
                        
                        <div class="form-field">
                            <input name="passwordCheck" type="password" id="passwordCheck" class="full-width" placeholder="passwordCheck" required="required" maxlength="20">
                        </div>

                        <div class="form-field">
                            <input name="email" type="email" id="cWebsite" class="full-width" placeholder="email"  required="required" maxlength="40">
                        </div>

                        <button type="submit" class="submit btn btn--primary full-width">Join</button>

                    </fieldset>
                </form> <!-- end form -->


            </div> <!-- end s-content__main -->

        </div> <!-- end row -->
        


    </section> <!-- s-content -->
<script>
	function validateCheck() {
		var password = document.querySelector('#password').value
		var passwordCheck = document.querySelector('#passwordCheck').value

		if (password === passwordCheck) {
			return true;
		} else {
			alert('비밀번호가 일치하지 않습니다.');
			return false;
		}

	}
</script>
<%@ include file = "../include/footer.jsp"%>
</body>

</html>