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

    <%--Form--%>
    <div class="row justify-content-center mt-4">
        <form class="col-md-4" method="post">
            <div class="form-group row text-center d-flex flex-column">
                <input type="hidden" name="action" value="create">
                <h1 class="text-success">Create new</h1>

                <div class="form-group">
                    <label for="accountCode" class="text-left">Code</label>
                    <input type="text" class="form-control" name="accountCode" id="accountCode">
                </div>
                <div class="form-group">
                    <label for="accountName">Name</label>
                    <input type="text" class="form-control" name="accountName" id="accountName">
                </div>
                <div class="form-group">
                    <label for="createDate">CreateDate</label>
                    <input type="date" class="form-control" name="createDate" id="createDate">
                </div>
                <div class="form-group">
                    <label for="amount">Amount</label>
                    <input type="text" class="form-control" name="amount" id="amount">
                </div>
                <div class="form-group">
                    <label for="depositDate">DepositDate</label>
                    <input type="date" class="form-control" name="depositDate" id="depositDate">
                </div>
                <div class="form-group">
                    <label for="interestRate">InterestRate</label>
                    <input type="text" class="form-control" name="interestRate" id="interestRate">
                </div>
                <div class="form-group">
                    <label for="termId">Term</label>
                    <select class="form-control" name="termId" id="termId">
                        <c:forEach items="${listTerm}" var="term">
                            <option value="${term.termId}">
                                    ${term.termName}
                            </option>
                        </c:forEach>
                    </select>
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