<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>社員管理システム - 社員リスト</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.3/moment.min.js"></script>
</head>

<body>
	<div style="padding: 24px;">
		<div class="d-flex align-items-center justify-content-between">
			<h2 style="margin-bottom: 0;">社員リスト</h2>
			<a class="btn btn-primary" href="/employee/new">新規</a>
		</div>
		<div class="card" style="margin-top: 16px;">
			<div class="card-body">
				<form class="row gy-2 gx-3 align-items-center"
					action="/employee/list" method="post">
					<input type="hidden" id="page" name="page" value="${page}">
					<div class="col-auto">
						<label class="visually-hidden" for="jobNumber">社員番号</label> <input
							type="text" class="form-control" id="jobNumber" name="jobNumber"
							placeholder="社員番号" maxlength="8"
							pattern="[A-Z][A-Za-z]{0,3}[0-9]{4,7}" />
					</div>
					<div class="col-auto">
						<label class="visually-hidden" for="name">名前</label> <input
							type="text" class="form-control" id="name" name="name"
							placeholder="名前"
							pattern="^([\u{3005}\u{3007}\u{303b}\u{3400}-\u{9FFF}\u{F900}-\u{FAFF}\u{20000}-\u{2FFFF}][\u{E0100}-\u{E01EF}\u{FE00}-\u{FE02}]?)+$" />
					</div>
					<div class="col-auto">
						<label class="visually-hidden" for="age">年齢</label> <input
							type="number" class="form-control" id="age" name="age"
							placeholder="年齢" min="18" max="70" />
					</div>
					<div class="col-auto">
						<label class="visually-hidden" for="gender">性別</label> <select
							class="form-select" id="gender" name="gender">
							<option selected value="">未選択</option>
							<option value="MALE">男</option>
							<option value="FEMALE">女</option>
						</select>
					</div>
					<div class="col-auto">
						<label for="marital-status" class="visually-hidden">配偶者の有無</label>
						<select class="form-select" id="marital-status"
							name="maritalStatus">
							<option selected value="">未選択</option>
							<option value="MARRIED">既婚</option>
							<option value="UNMARRIED">未婚</option>
						</select>
					</div>
					<div class="col-auto">
						<label class="visually-hidden" for="hireDate">入社日</label> <input
							type="date" class="form-control" id="hireDate" name="hireDate"
							placeholder="入社日" />
					</div>
					<div class="col-auto">
						<label class="visually-hidden" for="birthYear">生年月日</label>
						<div class="d-flex align-items-center">
							<input type="number" style="width: 78px;" class="form-control"
								id="birthYear" name="birthYear" placeholder="年" min="1990"
								max="2999" /> <input type="number"
								style="width: 58px; margin-left: 4px;" class="form-control"
								id="birthMonth" name="birthMonth" placeholder="月" min="1"
								max="12" /> <input type="number"
								style="width: 58px; margin-left: 4px;" class="form-control"
								id="birthDay" name="birthDay" placeholder="日" min="1" max="31" />
						</div>
					</div>
					<div class="col-auto">
						<button type="submit" class="btn btn-primary">検索</button>
					</div>
				</form>
			</div>
		</div>
		<div class="card" style="margin-top: 16px;">
			<div class="card-body">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">選択</th>
							<th scope="col">社員番号</th>
							<th scope="col">名前</th>
							<th scope="col">年齢</th>
							<th scope="col">配偶者の有無</th>
							<th scope="col">入社日</th>
							<th scope="col">生年月日</th>
							<th scope="col">Eメール</th>
							<th scope="col">携帯番号</th>
							<th scope="col">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="employee">
							<tr>
								<th scope="row"><input class="form-check-input"
									type="radio" name="row-select" value="${employee.id}"></th>
								<td>${employee.jobNumber}</td>
								<td>${employee.name}</td>
								<td>${employee.age}</td>
								<td>${employee.maritalStatus}</td>
								<td>${employee.hireYear}-${employee.hireMonth}-${employee.hireDay}</td>
								<td><fmt:formatDate value="${employee.birthDate}"
										pattern="yyyy-MM-dd" /></td>
								<td>${employee.email}</td>
								<td>${employee.phone}</td>
								<td><a href="/employee/${employee.id}">照会</a> <a
									href="/employee/${employee.id}.delete">削除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<nav style="display: flex; justify-content: flex-end;">
					<ul class="pagination" style="margin-bottom: 0;">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>

</html>