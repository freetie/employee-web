<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>社員管理システム - ログイン</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.js"></script>
</head>
<body style="padding: 24px;">
	<div style="width: 60%; margin: 0 auto;">
		<h2>ようこそ</h2>
		<div class="card" style="margin-top: 24px;">
			<div class="card-body">
				<form action="/login.action">
					<div class="mb-3">
						<label for="name" class="form-label">ユーザー名</label> <input
							type="text" class="form-control" id="name" name="name"
							aria-describedby="emailHelp" required />
						<div id="emailHelp" class="form-text">We'll never share your
							email with anyone else.</div>
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">パスワード</label> <input
							type="password" class="form-control" id="password"
							name="password" required />
					</div>
					<button type="submit" class="btn btn-primary">ログイン</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
