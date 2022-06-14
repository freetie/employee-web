<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8" />
			<title>社員管理システム - ログイン</title>
			<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.js"></script>
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.css" />
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.js"></script>
		</head>

		<body style="padding: 24px;">
			<div style="width: 60%; margin: 0 auto;">
				<h2>ようこそ</h2>
				<div class="card" style="margin-top: 24px;">
					<div class="card-body">
						<input type="hidden" id="name-message" value="${nameMessage}">
						<input type="hidden" id="password-message" value="${passwordMessage}">
						<form action="/employee/signin" method="post" novalidate>
							<div class="mb-3">
								<label for="name" class="form-label">ユーザー名</label> <input type="text" class="form-control" id="name"
									name="name" value="${name}" required />
								<div id="name-feedback" class="invalid-feedback">
									ユーザー名を入力してください</div>
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">パスワード</label> <input type="password" class="form-control"
									id="password" name="password" required />
								<div id="password-feedback" class="invalid-feedback">
									パスワードを入力してください</div>
							</div>
							<button type="submit" class="btn btn-primary">ログイン</button>
						</form>
					</div>
				</div>
			</div>
			<script>
				$(document).ready(() => {
					const $form = $('form');
					const $nameInput = $('#name');
					const $passwordInput = $('#password');
					const $nameFeedback = $('#name-feedback');
					const $passwordFeedback = $('#password-feedback');
					const nameMessage = $('#name-message').val();
					const passwordMessage = $('#password-message').val();

					if (nameMessage) {
						$nameInput.addClass('is-invalid');
						$nameFeedback.text(nameMessage);
					}
					if (passwordMessage) {
						$passwordInput.addClass('is-invalid');
						$passwordFeedback.text(passwordMessage);
					}

					$nameInput.on('input', e => {
						if ($nameInput.hasClass('is-invalid')) {
							$nameInput.removeClass('is-invalid');
						}
						$nameFeedback.text('ユーザー名を入力してください');
					});
					$passwordInput.on('input', e => {
						if ($passwordInput.hasClass('is-invalid')) {
							$passwordInput.removeClass('is-invalid');
						}
						$passwordFeedback.text('パスワードを入力してください');
					});

					$form.on('submit', (event) => {
						if (!$form[0].checkValidity()) {
							event.preventDefault();
							event.stopPropagation();
						}
						$form.addClass('was-validated');
					})
			});
			</script>
		</body>

		</html>