<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8" />
    <title>社員管理システム - 新規</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.3/moment.min.js"></script>
  </head>

  <body>
  	<jsp:include page="./top-bar.jsp" />
    <div style="padding: 24px;">
      <h2>新規</h2>
      <div class="card" style="margin-top: 16px;">
        <div class="card-body">
          <form action="/employee/create" novalidate method="post">
            <input type="hidden" name="id" id="id">
            <input type="hidden" name="accountId" id="account-id">
            <div class="mb-3">
              <label for="job-number" class="form-label">社員番号</label> <input type="text" class="form-control"
                id="job-number" name="jobNumber" maxlength="8" pattern="[A-Z][A-Za-z]{0,3}[0-9]{4,7}" required />
              <div class="invalid-feedback" id="job-number-feedback">
                4文字+4つの数字を入力してください、最初の文字は大文字になります。</div>
            </div>
            <div class="mb-3">
              <label for="name" class="form-label">名前</label> <input type="text" class="form-control" id="name"
                name="name" required
                pattern="^([\u{3005}\u{3007}\u{303b}\u{3400}-\u{9FFF}\u{F900}-\u{FAFF}\u{20000}-\u{2FFFF}][\u{E0100}-\u{E01EF}\u{FE00}-\u{FE02}]?)+$" />
              <div class="invalid-feedback">漢字を入力してください。</div>
            </div>
            <div class="mb-3">
              <label for="age" class="form-label">年齢</label> <input type="number" class="form-control" id="age"
                name="age" min="18" max="70" />
              <div class="invalid-feedback">入力範囲は18〜70歳です。</div>
            </div>
            <div class="mb-3">
              <label for="gender" class="form-label">性別</label>
              <div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="gender" id="gender-null" value="" checked /> <label
                    class="form-check-label" for="gender-null">未選択</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="gender" id="gender-male" value="MALE" /> <label
                    class="form-check-label" for="gender-male">男</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="gender" id="gender-female" value="FEMALE" /> <label
                    class="form-check-label" for="gender-female">女</label>
                </div>
              </div>
            </div>
            <div class="mb-3">
              <label for="marital-status" class="form-label">配偶者の有無</label>
              <div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="maritalStatus" id="marital-status-null" value=""
                    checked />
                  <label class="form-check-label" for="marital-status-null">未選択</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="maritalStatus" id="marital-status-married"
                    value="MARRIED" /> <label class="form-check-label" for="marital-status-married">既婚</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="maritalStatus" id="marital-status-unmarried"
                    value="UNMARRIED" /> <label class="form-check-label" for="marital-status-unmarried">未婚</label>
                </div>
              </div>
            </div>
            <div class="mb-3">
              <label class="form-label" for="hire-date">入社日</label> <input type="date" class="form-control"
                id="hire-date" name="hireDate" placeholder="入社日" min="1990-01-01" required />
              <div class="invalid-feedback">受け入れられる日付の範囲は1990-01-01から今日の間です。</div>
            </div>
            <div class="mb-3">
              <label class="form-label" for="birth-date">生年月日</label> <input type="date" class="form-control"
                id="birth-date" name="birthDate" placeholder="生年月日" min="1960-01-01" max="2010-12-31" />
              <div class="invalid-feedback">受け入れられる日付の範囲は1960-01-01から2010-12-31の間です。</div>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Eメール</label> <input type="email" class="form-control" id="email"
                name="email" />
              <div class="invalid-feedback">正しいメールアドレスを入力してください。</div>
            </div>
            <div class="mb-3">
              <label for="phone" class="form-label">携帯番号</label> <input type="tel" class="form-control" id="phone"
                pattern="^0[9872]0\d{8}$" name="phone" />
              <div class="invalid-feedback">正しい携帯番号を入力してください。</div>
            </div>
            <div class="mb-3">
              <label for="account-name" class="form-label">アカウント</label> <input type="text" class="form-control"
                id="account-name" name="accountName" pattern="^[A-Z][A-Za-z]{7,15}$" required />
              <div class="invalid-feedback" id="account-name-feedback">英語の文字を入力してください。最初の文字は大文字で、長さは8〜16文字です。</div>
            </div>
            <div class="mb-3">
              <label for="account-password" class="form-label">パスワード</label> <input type="password" class="form-control"
                id="account-password" name="accountPassword" pattern="^[A-Z]{1}[a-z]{1}\d{6}$" required />
              <div class="invalid-feedback">最初の2文字は大文字と小文字で、その後に6つの数字が続きます。</div>
            </div>
            <div style="text-align: right;">
              <button type="button" class="btn btn-secondary" id="back-button">戻る</button>
              <button type="button" class="btn btn-primary" id="enter-modify-button">修正</button>
              <button type="button" class="btn btn-secondary" id="cancel-modify-button"
                style="display: none;">キャンセル</button>
              <button type="button" class="btn btn-primary" id="submit-button">保存</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <script>
      let jobNumbers = [];
      let accountNames = [];
      const isNew = window.location.pathname === '/employee/new';
      let detail;
      $.get('/employee/job-number', (data) => {
        jobNumbers = data;
      });
      $.get('/employee/account/name', (data) => {
        accountNames = data;
      });

      $(document).ready(() => {
        const $form = $('form');
        const $submitButton = $('#submit-button');
        const $enterModifyButton = $('#enter-modify-button');
        const $idInput = $('#id');
        const $accountIdInput = $('#account-id');
        const $jobNumberInput = $('#job-number');
        const $nameInput = $('#name');
        const $ageInput = $('#age');
        const $genderRadios = $('input[name="gender"]');
        const $maritalStatusRadios = $('input[name="maritalStatus"]');
        const $hireDateInput = $('#hire-date');
        const $birthDateInput = $('#birth-date');
        const $emailInput = $('#email');
        const $phoneInput = $('#phone');
        const $accountNameInput = $('#account-name');
        const $accountPasswordInput = $('#account-password');

        const loadFormData = () => {
          $idInput.val(detail.id);
          $accountIdInput.val(detail.accountId);
          $jobNumberInput.val(detail.jobNumber);
          $nameInput.val(detail.name);
          $ageInput.val(detail.age);
          $genderRadios.each((index, ele) => {
            $(ele).prop('checked', $(ele).val() === detail.gender);
          });
          $maritalStatusRadios.each((index, ele) => {
            $(ele).prop('checked', $(ele).val() === detail.maritalStatus);
          });
          if (detail.hireYear && detail.hireMonth && detail.hireDay) {
            $hireDateInput.val(moment(detail.hireYear + '-' + detail.hireMonth + '-' + detail.hireDay).format('YYYY-MM-DD'));
          }
          $birthDateInput.val(detail.birthDate);
          $emailInput.val(detail.email);
          $phoneInput.val(detail.phone);
          $accountNameInput.val(detail.accountName);
          $accountPasswordInput.val(detail.accountPassword);
        }

        if (isNew) {
          $enterModifyButton.hide();
        } else {
          $('title').text('社員管理システム - 照会');
          $('h2').text('照会');
          $('.form-control').prop('disabled', true);
          $('.form-check-input').prop('disabled', true);
          $submitButton.hide();
          $form.attr('action', '/employee/update');
          const id = parseInt(window.location.pathname.replace('/employee/', ''));
          $.get('/employee/detail?id=' + id, (res) => {
            detail = res;
            loadFormData();
          });
        }

        $hireDateInput.attr('max', moment().format('YYYY-MM-DD'));

        $jobNumberInput.on('input', (e) => {
          const $jobNumberFeedback = $('#job-number-feedback');
          if (
            _.includes(
              _.filter(jobNumbers, jobNumberItem => jobNumberItem !== detail?.jobNumber),
              e.target.value
            )
          ) {
            $jobNumberInput[0].setCustomValidity('already-exists');
            $jobNumberFeedback.text('社員番号は既に存在します。');
          } else {
            $jobNumberInput[0].setCustomValidity('');
            $jobNumberFeedback.text('4文字+4つの数字を入力してください、最初の文字は大文字になります。');
            // if ($jobNumberInput[0].validity.valid) {
            //   $jobNumberInput[0].setCustomValidity('')
            // }
          }
        });

        $accountNameInput.on('input', (e) => {
          const $accountNameFeedback = $('#account-name-feedback');
          if (
            _.includes(
              _.filter(accountNames, accountNameItem => accountNameItem !== detail?.accountName),
              e.target.value
            )
          ) {
            $accountNameInput[0].setCustomValidity('already-exists');
            $accountNameFeedback.text('アカウントは既に存在します。');
          } else {
            $accountNameFeedback.text('英語の文字を入力してください。最初の文字は大文字で、長さは8〜16文字です。');
            $accountNameInput[0].setCustomValidity('')
            // if ($accountNameInput[0].validity.valid) {
            //   $accountNameInput[0].setCustomValidity('')
            // }
          }
        });

        const $backButton = $('#back-button');
        const $cancelModifyButton = $('#cancel-modify-button');
        $backButton.on('click', () => {
          window.history.back();
        });
        $enterModifyButton.on('click', () => {
          $('.form-control[name!="jobNumber"]').prop('disabled', false);
          $('.form-check-input').prop('disabled', false);
          $backButton.hide();
          $enterModifyButton.hide();
          $cancelModifyButton.show();
          $submitButton.show();
        });
        $cancelModifyButton.on('click', () => {
          $('.form-control').prop('disabled', true);
          $('.form-check-input').prop('disabled', true);
          $backButton.show();
          $enterModifyButton.show();
          $cancelModifyButton.hide();
          $submitButton.hide();
          loadFormData();
        });
        $submitButton.on('click', () => {
          if (isNew) {
            $form.submit();
            return;
          }
          if (window.confirm('修正を確認しますか？')) {
            $form.submit();
          }
        });
        $form.on('submit', (event) => {
          if (!$form[0].checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
          }
          $form.removeClass('was-validated');
          $form.addClass('was-validated');
        });
      });
    </script>
  </body>

  </html>