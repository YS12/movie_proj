<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>

	<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<!-- Bootstrap -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script src="http://code.jquery.com/jquery.js"></script>
<!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
</head>
<body>
	<div class="container">
		<!-- 좌우측의 공간 확보 -->

		<!-- 모달창 -->
		<div class="modal fade" id="defaultModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title">알림</h4>
					</div>
					<div class="modal-body">
						<p class="modal-contents"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		<!--// 모달창 -->
		<br>
		<!-- 본문 들어가는 부분 -->

		<form>
			<div class="form-group" id="divId">
				<label for="inputId" class="col-lg-2 control-label">아이디</label>
				<div class="col-lg-10">
					<input type="text" class="form-control onlyAlphabetAndNumber"
						id="id" data-rule-required="true"
						placeholder="30자이내의 알파벳, 한글, 숫자만 입력 가능합니다." maxlength="30">
				</div>
			</div>
			<div class="form-group" id="divPassword">
				<label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="password"
						name="excludeHangul" data-rule-required="true" placeholder="비밀번호"
						maxlength="30">
				</div>
			</div>
			<div class="form-group" id="divPasswordCheck">
				<label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드
					확인</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="passwordCheck"
						data-rule-required="true" placeholder="비밀번호 확인" maxlength="30">
				</div>
			</div>
			<div class="form-group" id="divName">
				<label for="inputName" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-10">
					<input type="text" class="form-control onlyHangul" id="name"
						data-rule-required="true" placeholder="본인 이름을 넣어주세요."
						maxlength="15">
				</div>
			</div>

			<div class="form-group" id="divNickname">
				<label for="inputNickname" class="col-lg-2 control-label">별명</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="nickname"
						data-rule-required="true" placeholder="게시판에서 사용할 닉네임" maxlength="15">
				</div>
			</div>

			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<button type="submit" class="btn btn-primary">Sign in</button>
				</div>
			</div>
		</form>


		<script>
			$(function() {

				$('.onlyAlphabetAndNumber').keyup(function(event) {
					if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
						var inputVal = $(this).val();
						$(this).val($(this).val().replace(/[^_a-z0-9]/gi, '')); //_(underscore), 영어, 숫자만 가능
					}
				});

				$(".onlyHangul").keyup(function(event) {
					if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
						var inputVal = $(this).val();
						$(this).val(inputVal.replace(/[a-z0-9]/gi, ''));
					}
				});

				$(".onlyNumber").keyup(function(event) {
					if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
						var inputVal = $(this).val();
						$(this).val(inputVal.replace(/[^0-9]/gi, ''));
					}
				});

				//------- 검사하여 상태를 class에 적용
				$('#id').keyup(function(event) {

					var divId = $('#divId');

					if ($('#id').val() == "") {
						divId.removeClass("has-success");
						divId.addClass("has-error");
					} else {
						divId.removeClass("has-error");
						divId.addClass("has-success");
					}
				});

				$('#password').keyup(function(event) {

					var divPassword = $('#divPassword');

					if ($('#password').val() == "") {
						divPassword.removeClass("has-success");
						divPassword.addClass("has-error");
					} else {
						divPassword.removeClass("has-error");
						divPassword.addClass("has-success");
					}
				});

				$('#passwordCheck').keyup(function(event) {

					var passwordCheck = $('#passwordCheck').val();
					var password = $('#password').val();
					var divPasswordCheck = $('#divPasswordCheck');

					if ((passwordCheck == "") || (password != passwordCheck)) {
						divPasswordCheck.removeClass("has-success");
						divPasswordCheck.addClass("has-error");
					} else {
						divPasswordCheck.removeClass("has-error");
						divPasswordCheck.addClass("has-success");
					}
				});

				$('#name').keyup(function(event) {

					var divName = $('#divName');

					if ($.trim($('#name').val()) == "") {
						divName.removeClass("has-success");
						divName.addClass("has-error");
					} else {
						divName.removeClass("has-error");
						divName.addClass("has-success");
					}
				});

				$('#nickname').keyup(function(event) {

					var divNickname = $('#divNickname');

					if ($.trim($('#nickname').val()) == "") {
						divNickname.removeClass("has-success");
						divNickname.addClass("has-error");
					} else {
						divNickname.removeClass("has-error");
						divNickname.addClass("has-success");
					}
				});

				$('#email').keyup(function(event) {

					var divEmail = $('#divEmail');

					if ($.trim($('#email').val()) == "") {
						divEmail.removeClass("has-success");
						divEmail.addClass("has-error");
					} else {
						divEmail.removeClass("has-error");
						divEmail.addClass("has-success");
					}
				});

				$('#phoneNumber').keyup(function(event) {

					var divPhoneNumber = $('#divPhoneNumber');

					if ($.trim($('#phoneNumber').val()) == "") {
						divPhoneNumber.removeClass("has-success");
						divPhoneNumber.addClass("has-error");
					} else {
						divPhoneNumber.removeClass("has-error");
						divPhoneNumber.addClass("has-success");
					}
				});

				//------- validation 검사
				$("form").submit(
						function(event) {
							var provision = $('#provision');
							var memberInfo = $('#memberInfo');
							var divId = $('#divId');
							var divPassword = $('#divPassword');
							var divPasswordCheck = $('#divPasswordCheck');
							var divName = $('#divName');
							var divNickname = $('#divNickname');
							var divEmail = $('#divEmail');
							var divPhoneNumber = $('#divPhoneNumber');
						});

			});
		</script>
		<!--// 본문 들어가는 부분 -->

	</div>
</body>
</html>



</body>
</html>
