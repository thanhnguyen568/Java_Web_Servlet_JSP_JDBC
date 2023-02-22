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
<div class="container-fluid">
    <%--Menu--%>
    <ul class="nav nav-tabs nav-stacked">
        <li class="nav-item">
            <a href="/accounts" class="nav-link active">Account</a>
        </li>
        <li class="nav-item">
            <a href="/accounts" class="nav-link">Term</a>
        </li>
    </ul>
    <div class="alert alert-success" role="alert">
        <c:out value="${message}"/>
    </div>
    <h2 class="text-secondary">Management</h2>
    <div class="d-flex flex-row">
        <form action="/accounts" class="col-6">
            <input type="hidden" name="action" value="create">
            <button class="btn btn-success">Create</button>
        </form>
        <form action="/accounts" class="col-6">
            <div class="input-group">
                <input class="form-control" style="height: 40px; width: 500px" name="search">
                <input type="hidden" name="action" value="search">
                <button class="btn btn-info">Search</button>
            </div>
        </form>
    </div>

    <form action="accounts">
        <input type="hidden" name="action" value="multiDel">
        <%--Table--%>
        <table class="table table-striped" id="tableAccount">
            <thead>
            <tr>
                <th>Id</th>
                <th>Code</th>
                <th>Name</th>
                <th>Create Date</th>
                <th>Saving Amount</th>
                <th>Deposit Date</th>
                <th>Interest Rate(%)</th>
                <th>Term Name</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="acc" items="${listAccount}">
                <tr>
                    <td>
                        <input type="checkbox" name="checkbox" id="checkbox" value="${acc.accountId}">
                    </td>
                    <td><c:out value="${acc.accountCode}"/></td>
                    <td><c:out value="${acc.accountName}"/></td>
                    <td><c:out value="${acc.createDate}"/></td>
                    <td><c:out value="${acc.amount}"/></td>
                    <td><c:out value="${acc.depositDate}"/></td>
                    <td><c:out value="${acc.interestRate}"/></td>
                    <td>
                        <c:choose>
                            <c:when test="${acc.termId == 1}"> Day</c:when>
                            <c:when test="${acc.termId == 2}"> Month</c:when>
                        </c:choose>
                    </td>
                    <td>
                        <button type="button" class="btn btn-warning">
                            <a class="text-light"
                               href="/accounts?action=update&accountId=${acc.accountId}">Update</a>
                        </button>
                            <%-- onclick set hàm href--%>
<%--                        <button onclick="deleteAlert(${acc.accountId})" type="button" class="btn btn-danger"--%>
<%--                                data-toggle="modal" data-target="#modelId">--%>
<%--                            Delete--%>
<%--                        </button>--%>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!-- Button trigger modal -->
        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modelId">
            Multi Delete
        </button>

        <!-- Modal -->
        <div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Confirm delete?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-danger">Confirm</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>


<!-- Modal -->
<%--<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title">Modal title</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                Do you want to delete ?--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
<%--                <button type="button" class="btn btn-primary">--%>
<%--                    &lt;%&ndash;Đổi id để gọi hàm&ndash;%&gt;--%>
<%--                    <a id="delLink" class="text-light" href="#">Delete</a>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<script src="/static/js/jquery-3.5.1.min.js"></script>
<script src="/static/js/bootstrap.js"></script>
<script src="/static/datatables/js/jquery.dataTables.js"></script>
<script src="/static/datatables/js/dataTables.bootstrap4.js"></script>
<script>
    $(document).ready(function () {
        $('#tableAccount').dataTable({
            'searching': false,
            'pageLength': 10
        })
    })

    function deleteAlert(id) {
        document.getElementById("delLink").href = '/accounts?action=delete&accountId=' + id;
    }
</script>
</body>
</html>