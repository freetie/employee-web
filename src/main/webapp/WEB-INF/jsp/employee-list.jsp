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
							placeholder="社員番号" maxlength="8" pattern="\w*"
							value="${params.jobNumber}" />
					</div>
					<div class="col-auto">
						<label class="visually-hidden" for="name">名前</label> <input
							type="text" class="form-control" id="name" name="name"
							placeholder="名前"
							pattern="^([\u{3005}\u{3007}\u{303b}\u{3400}-\u{9FFF}\u{F900}-\u{FAFF}\u{20000}-\u{2FFFF}][\u{E0100}-\u{E01EF}\u{FE00}-\u{FE02}]?)+$"
							value="${params.name}" />
					</div>
					<div class="col-auto">
						<label class="visually-hidden" for="age">年齢</label> <input
							type="number" class="form-control" id="age" name="age"
							placeholder="年齢" min="18" max="70" value="${params.age}" />
					</div>
					<div class="col-auto">
						<label class="visually-hidden" for="gender">性別</label> <select
							class="form-select" id="gender" name="gender">
							<option
								${params.gender == null || params.gender == "" ? 'selected' : ''}
								value="">未選択</option>
							<option ${params.gender == 'MALE' ? 'selected' : ''} value="MALE">男</option>
							<option ${params.gender == 'FEMALE' ? 'selected' : ''}
								value="FEMALE">女</option>
						</select>
					</div>
					<div class="col-auto">
						<label for="marital-status" class="visually-hidden">配偶者の有無</label>
						<select class="form-select" id="marital-status"
							name="maritalStatus">
							<option
								${params.maritalStatus == null || params.maritalStatus == "" ? 'selected' : ''}
								value="">未選択</option>
							<option ${params.maritalStatus == 'MARRIED' ? 'selected' : ''}
								value="MARRIED">既婚</option>
							<option ${params.maritalStatus == 'UNMARRIED' ? 'selected' : ''}
								value="UNMARRIED">未婚</option>
						</select>
					</div>
					<div class="col-auto">
						<fmt:formatDate value="${params.hireDate}" var="formattedHireDate"
							pattern="yyyy-MM-dd" />
						<label class="visually-hidden" for="hireDate">入社日</label> <input
							type="date" class="form-control" id="hireDate" name="hireDate"
							placeholder="入社日" value="${formattedHireDate}" />
					</div>
					<div class="col-auto">
						<label class="visually-hidden" for="birthYear">生年月日</label>
						<div class="d-flex align-items-center">
							<input type="number" style="width: 78px;" class="form-control"
								id="birthYear" name="birthYear" placeholder="年" min="1990"
								max="2999" value="${params.birthYear}" /> <input type="number"
								style="width: 58px; margin-left: 4px;" class="form-control"
								id="birthMonth" name="birthMonth" placeholder="月" min="1"
								max="12" value="${params.birthMonth}" /> <input type="number"
								style="width: 58px; margin-left: 4px;" class="form-control"
								id="birthDay" name="birthDay" placeholder="日" min="1" max="31"
								value="${params.birthDay}" />
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
							<th scope="col">性別</th>
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
								<td><c:choose>
										<c:when test="${employee.gender == 'MALE'}">男</c:when>
										<c:when test="${employee.gender == 'FEMALE'}">女</c:when>
										<c:otherwise>未選択</c:otherwise>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${employee.maritalStatus == 'MARRIED'}">既婚</c:when>
										<c:when test="${employee.maritalStatus == 'UNMARRIED'}">未婚</c:when>
										<c:otherwise>未選択</c:otherwise>
									</c:choose></td>
								<td>${employee.hireYear}-${employee.hireMonth}-${employee.hireDay}</td>
								<td><fmt:formatDate value="${employee.birthDate}"
										pattern="yyyy-MM-dd" /></td>
								<td>${employee.email}</td>
								<td>${employee.phone}</td>
								<td><button type="button"
										class="btn btn-link btn-sm detail-button" style="padding: 0;"
										onclick="window.location.assign('/employee/${employee.id}')"
										disabled>照会</button>
									<button type="button" class="btn btn-link btn-sm delete-button"
										style="padding: 0;" data-id="${employee.id}" disabled>削除</button>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<nav style="display: flex; justify-content: flex-end;">
					<ul class="pagination" style="margin-bottom: 0;">
						<li class="page-item ${page == 1 ? 'disabled' : ''}"><a
							class="page-link" href="#" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">${page}</a></li>
						<li class="page-item ${page * 5 >= count ? 'disabled' : ''}"><a
							class="page-link" href="#" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<script>
					const $form = $('form');
					const $pageInput = $('#page');
					const currentPage = parseInt($pageInput.val());
					const $prevButton = $('.page-item').eq(0);
					const $nextButton = $('.page-item').eq(2);
					const $detailButtons = $('.detail-button');
					const $deleteButtons = $('.delete-button');
					const $radios = $('input[type="radio"]');

					$radios.on('change', (e) => {
						$detailButtons.prop('disabled', true);
						$deleteButtons.prop('disabled', true);
						$(e.target).parents('tr').find('button').prop('disabled', false);
					})

					$prevButton.on('click', () => {
						if ($prevButton.hasClass('disabled')) return;
						$pageInput.val(currentPage - 1);
						$form.submit();
					});

					$nextButton.on('click', () => {
						if ($nextButton.hasClass('disabled')) return;
						$pageInput.val(currentPage + 1);
						$form.submit();
					});

					$deleteButtons.on('click', (e) => {
						if (confirm('削除を確認しますか？')) {
							$.ajax({
								url: '/employee/delete?id=' + $(e.target).attr('data-id'),
								method: 'DELETE',
							}).done(() => {
								$form.submit();
							});
						}
					});

				</script>
</body>

</html>