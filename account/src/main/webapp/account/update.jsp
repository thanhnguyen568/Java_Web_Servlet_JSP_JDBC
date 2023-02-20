<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>User Management Application</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
  <!-- Bootstrap core CSS -->
  <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="/style/sidebars.css" rel="stylesheet">
  <style>
    .row {
      display: -ms-flexbox;
      display: -webkit-box;
      display: flex;
      -ms-flex-align: center;
      -ms-flex-pack: center;
      -webkit-box-align: center;
      align-items: center;
      -webkit-box-pack: center;
      justify-content: center;
      padding-top: 40px;
      padding-bottom: 40px;
    }
  </style>
</head>
<body>
<main>
  <%-- Menu --%>
  <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 15%;">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
      <span class="fs-4">Menu !</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="/accounts" class="nav-link active" aria-current="page">
          Account
        </a>
      </li>
      <li>
        <a href="#" class="nav-link text-white">
          Term
        </a>
      </li>
    </ul>
    <hr>
  </div>
  <div class="b-example-divider"></div>
  <%-- End Menu --%>

  <%-- Content --%>
  <div class="d-flex flex-column flex-shrink-0 p3" style="width: 83%">
    <form method="post">
      <div class="form-group row text-center d-flex flex-column">
        <h1 class="text-secondary nav-link">Edit Information</h1>

        <c:if test="${acc != null}">
        <input type="hidden" name="id" value="${acc.id}">
        </c:if>

        <label class="col-sm-3 col-form-label text-start">Code:</label>
        <div class="col-sm-3"><input type="text" class="form-control" name="code" value="${acc.code}"></div>

        <label class="col-sm-3 col-form-label text-start">Name:</label>
        <div class="col-sm-3"><input type="text" class="form-control" name="name" value="${acc.name}"></div>

        <label class="col-sm-3 col-form-label text-start">CreateDate:</label>
        <div class="col-sm-3"><input type="date" class="form-control" name="createDate"></div>

        <label class="col-sm-3 col-form-label text-start">SavingAmount:</label>
        <div class="col-sm-3"><input type="text" class="form-control" name="savingAmount"></div>

        <label class="col-sm-3 col-form-label text-start">DepositDate:</label>
        <div class="col-sm-3"><input type="date" class="form-control" name="depositDate"></div>

        <label class="col-sm-3 col-form-label text-start">InterestRate(%):</label>
        <div class="col-sm-3"><input type="text" class="form-control" name="interestRate"></div>

        <label class="col-sm-3 col-form-label text-start">TermId:</label>
        <div class="col-sm-3"><input type="text" class="form-control" name="termId"></div>
      </div>

      <div class="form-group row text-center d-flex flex-row">
        <button class="btn btn-dark col-1">
          <a class="text-light" href="/accounts">Cancel</a>
        </button>
        &nbsp;
        <button class="btn btn-success col-1">Save</button>
      </div>
    </form>
  </div>
  <%-- End Content --%>
</main>
<script src="assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="/style/sidebars.js"></script>
</body>
</html>