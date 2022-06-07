<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8" />
    <title>社員管理システム - 新規</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.js"></script>
  </head>

  <body>
    <div style="padding: 24px;">
      <h2>照会</h2>
      <div class="card" style="margin-top: 16px;">
        <div class="card-body">
          <form action="/employee/new.create" novalidate>
            <div class="mb-3">
              <label for="job-number" class="form-label">社員番号</label> <input type="text" class="form-control"
                id="job-number" name="jobNumber" maxlength="8" pattern="[A-Z][A-Za-z]{0,3}[0-9]{4,7}" required />
              <div class="invalid-feedback" id="job-number-feedback">
                4文字+4つの数字、最初の文字は大文字になります
              </div>
            </div>
            <div class="mb-3">
              <label for="name" class="form-label">名前</label> <input type="text" class="form-control" id="name"
                name="name" required
                pattern="^([\u{3005}\u{3007}\u{303b}\u{3400}-\u{9FFF}\u{F900}-\u{FAFF}\u{20000}-\u{2FFFF}][\u{E0100}-\u{E01EF}\u{FE00}-\u{FE02}]?)+$" />
              <div class="invalid-feedback">
                漢字だけ
              </div>
            </div>
            <div class="mb-3">
              <label for="age" class="form-label">年齢</label> <input type="number" class="form-control" id="age"
                name="age" min="18" max="70" />
              <div class="invalid-feedback">
                18〜70歳
              </div>
            </div>
            <div class="mb-3">
              <label for="gender" class="form-label">性別</label>
              <div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="gender" id="gender-null" value="" checked /> <label
                    class="form-check-label" for="gender-null">未選択</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="gender" id="gender-male" value="male" /> <label
                    class="form-check-label" for="gender-male">男</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="gender" id="gender-female" value="female" /> <label
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
                    value="male" />
                  <label class="form-check-label" for="marital-status-married">既婚</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="maritalStatus" id="marital-status-unmarried"
                    value="female" /> <label class="form-check-label" for="marital-status-unmarried">未婚</label>
                </div>
              </div>
            </div>
            <div class="mb-3">
              <label class="form-label" for="hire-date">入社日</label> <input type="date" class="form-control"
                id="hire-date" name="hireDate" placeholder="入社日" min="1900101" required />
              <div class="invalid-feedback">受け入れられる日付の範囲は1990-01-01から2022-12-31の間です</div>
            </div>
            <div class="mb-3">
              <label class="form-label" for="birth-date">生年月日</label> <input type="date" class="form-control"
                id="birth-date" name="birthDate" placeholder="生年月日" />
              <div class="invalid-feedback">受け入れられる日付の範囲は1960-01-01から2010-12-31の間です</div>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Eメール</label> <input type="email" class="form-control" id="email" />
              <div class="invalid-feedback">正しいメールアドレスを入力してください</div>
            </div>
            <div class="mb-3">
              <label for="phone" class="form-label">携帯番号</label> <input type="tel" class="form-control" id="phone"
                pattern="^0[9872]0\d{8}$" />
              <div class="invalid-feedback">正しい携帯番号を入力してください</div>
            </div>
            <div class="mb-3">
              <label for="account-name" class="form-label">アカウント</label> <input type="text" class="form-control"
                id="account-name" name="accountName" pattern="^[A-Z][A-Za-z]{7,15}$" required />
              <div class="invalid-feedback">英語の文字を入力してください。最初の文字は大文字で、長さは8〜16文字です。</div>
            </div>
            <div class="mb-3">
              <label for="account-password" class="form-label">パスワード</label> <input type="password" class="form-control"
                id="account-password" name="accountPassword" pattern="^[A-Z]{1}[a-z]{1}\d{6}$" required />
              <div class="invalid-feedback">最初の2文字は大文字と小文字で、その後に6つの数字が続きます。</div>
            </div>
            <div style="text-align: right;">
              <button type="button" class="btn btn-secondary">戻る</button>
              <button type="submit" class="btn btn-primary">作成</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <script>
      let jobNumbers = [];
      $.get('/job-number', (data) => {
        jobNumbers = data;
      });

      let accountNames = [];
      $.get('/account/name', (data) => {
        accountNames = data;
      });

      const $jobNumberInput = $('#job-number');
      const $jobNumberFeedback = $('#job-number-feedback');

      $('#job-number').on('change', (event) => {
        
        if (!/^[A-Z][A-Za-z]{0,3}[0-9]{4,7}$/.test(event.target.value)) {
          
        }
      })

      const $form = $('form');
      $form.on('submit', (event) => {
        if (!form[0].checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }
        $form.removeClass('was-validated');
        $form.addClass('was-validated');
      });

    </script>
  </body>

  </html>