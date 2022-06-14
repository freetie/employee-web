<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>top-bar-component</title>
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.js"></script>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.css" />
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.js"></script>
    </head>

    <body>
      <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid" style="padding-left: 24px; padding-right: 24px;">
          <span class="navbar-brand mb-0 h1">社員管理システム</span>
          <div class="d-flex">
          	<span  style="color: white;">
	           	こんにちは、 ${user.name}
	          </span>
	          <a href="/employee/logout" style="margin-left: 8px;">ログアウト</a>
          </div>
        </div>
      </nav>
    </body>

    </html>