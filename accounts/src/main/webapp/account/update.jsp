<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Title</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="/static/css/bootstrap.css">
  <link rel="stylesheet" href="/static/datatables/css/dataTables.bootstrap4.css">
</head>
<body>
<%--Menu--%>
<div class="container-fluid">
  <ul class="nav nav-tabs nav-stacked">
    <li class="nav-item">
      <a href="/accounts" class="nav-link active">Account</a>
    </li>
    <li class="nav-item">
      <a href="/accounts" class="nav-link">Term</a>
    </li>
  </ul>

  <div class="alert alert-warning" role="alert">
    <c:out value="${message}"/>
  </div>

  <%--Form--%>
  <div class="row justify-content-center mt-4">
    <form class="col-md-4" method="post">
      <div class="form-group row text-center d-flex flex-column">
        <h1 class="text-warning">Update Information</h1>

        <div class="form-group">
          <label for="accountCode" class="text-left">Code</label>
          <input type="text" class="form-control" name="accountCode" id="accountCode"
                 value="${updateAccount.accountCode}">
        </div>
        <div class="form-group">
          <label for="accountName">Name</label>
          <input type="text" class="form-control" name="accountName" id="accountName"
                 value="${updateAccount.accountName}">
        </div>
        <div class="form-group">
          <label for="createDate">CreateDate</label>
          <input type="date" class="form-control" name="createDate" id="createDate"
                 value="${updateAccount.createDate}">
        </div>
        <div class="form-group">
          <label for="amount">SavingAmount</label>
          <input type="text" class="form-control" name="amount" id="amount"
                 value="${updateAccount.amount}">
        </div>
        <div class="form-group">
          <label for="depositDate">DepositDate</label>
          <input type="date" class="form-control" name="depositDate" id="depositDate"
                 value="${updateAccount.depositDate}">
        </div>
        <div class="form-group">
          <label for="interestRate">InterestRate</label>
          <input type="text" class="form-control" name="interestRate" id="interestRate"
                 value="${updateAccount.interestRate}">
        </div>
        <div class="form-group">
          <label for="termId">Term</label>
          <input type="text" class="form-control" name="termId" id="termId" value="${updateAccount.termId}">
        </div>

        <div class="form-group mt-2">
          <button class="btn btn-warning" role="button">
            <a class="text-light" href="/accounts">Cancel</a>
          </button>
          &nbsp;
          &nbsp;
          &nbsp;
          &nbsp;
          <button class="btn btn-success" role="button" type="submit">Save</button>
        </div>
      </div>
    </form>
  </div>
</div>

<script src="/static/js/jquery-3.5.1.min.js"></script>
<script src="/static/js/bootstrap.js"></script>
<script src="/static/datatables/js/jquery.dataTables.js"></script>
<script src="/static/datatables/js/dataTables.bootstrap4.js"></script>
</body>
</html>