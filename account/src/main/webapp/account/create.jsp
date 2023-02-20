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
<ul class="nav nav-tabs nav-stacked">
    <li class="nav-item">
        <a href="/accounts" class="nav-link active">Account</a>
    </li>
    <li class="nav-item">
        <a href="/accounts" class="nav-link">Term</a>
    </li>
</ul>
<%--Header--%>
<h3>Management</h3>
<hr>

<%--Form--%>
<div class="row justify-content-center mt-4">
    <form class="col-md-4" method="post" >
        <div class="form-group row text-center d-flex flex-column">
            <input type="hidden" name= "action" value="create">
            <h1 class="text-danger">Create new</h1>

            <div class="form-group">
                <label for="Code">Code</label>
                <input type="text" class="form-control" name="code" id="Code">
            </div>
            <div class="form-group">
                <label for="Name">Name</label>
                <input type="text" class="form-control" name="name" id="Name">
            </div>
            <div class="form-group">
                <label for="CreateDate">CreateDate</label>
                <input type="text" class="form-control" name="CreateDate" id="CreateDate">
            </div>
            <div class="form-group">
                <label for="SavingAmount">SavingAmount</label>
                <input type="text" class="form-control" name="SavingAmount" id="SavingAmount">
            </div>
            <div class="form-group">
                <label for="DepositDate">DepositDate</label>
                <input type="text" class="form-control" name="DepositDate" id="DepositDate">
            </div>
            <div class="form-group">
                <label for="InterestRate">InterestRate</label>
                <input type="text" class="form-control" name="InterestRate" id="InterestRate">
            </div>
            <div class="form-group">
                <label for="TermId">TermId</label>
                <input type="text" class="form-control" name="TermId" id="TermId">
            </div>
            <div class="form-group mt-2">
                <button class="btn btn-warning" role="button">
                    <a class="text-light" href="/accounts">Cancel</a>
                </button>
                <button class="btn btn-success" role="button" type="submit">Save</button>
            </div>
        </div>
    </form>
</div>

<script src="/static/js/jquery-3.5.1.min.js"></script>
<script src="/static/js/bootstrap.js"></script>
<script src="/static/datatables/js/jquery.dataTables.js"></script>
<script src="/static/datatables/js/dataTables.bootstrap4.js"></script>
<script>
    $(document).ready(function () {
        $('#tableAccount').dataTable({
            'searching': false,
            'pageLength': 2
        })
    })

    function deleteAlert(id) {
        document.getElementById("delLink").href = '/accounts?action=delete&id=' + id;
    }
</script>
</body>
</html>