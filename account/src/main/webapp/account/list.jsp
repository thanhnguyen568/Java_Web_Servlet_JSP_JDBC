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
    <div class="d-flex flex-column flex-shrink-0 p3 col-auto" style="width: 83%">
        <h1 class="text-secondary text-center">All List</h1>

        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>

        <%--Create & Sort &Search--%>
        <div class="d-flex flex-row col-auto nav-link">
            <%--Create--%>
            <div class="d-flex col-6">
                <form action="/accounts">
                    <input type="hidden" name="action" value="create">
                    <button class="btn btn-success">Create</button>
                </form>
                &nbsp;
                <form action="/accounts">
                    <input type="hidden" name="action" value="sort">
                    <button class="btn btn-dark">Sort</button>
                </form>
            </div>
            <%--Search--%>
            <div class="d-flex flex-row-reverse col-6">
                <form action="/accounts">
                    <div class="input-group mb-3">
                        <input class="form-control" style="height: 40px; width: 500px" name="search">
                        <input type="hidden" name="action" value="search">
                        <button class="btn btn-info text-light">Search</button>
                    </div>
                </form>
            </div>
        </div>

        <%--Table--%>
        <div class="d-flex flex-row col-auto nav-link">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Create Date</th>
                    <th>Saving Amount</th>
                    <th>Deposit Date</th>
                    <th>Interest Rate(%)</th>
                    <th>
                        Term Name
                    </th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="acc" items="${savingAccounts}">
                    <tr>
                        <td><c:out value="${acc.accountId}"/></td>
                        <td><c:out value="${acc.accountCode}"/></td>
                        <td><c:out value="${acc.accountName}"/></td>
                        <td><c:out value="${acc.accountCreateDate}"/></td>
                        <td><c:out value="${acc.savingAmount}"/></td>
                        <td><c:out value="${acc.savingDepositDate}"/></td>
                        <td><c:out value="${acc.savingInterestRate}"/></td>
                        <td><c:out value="${acc.termId}"/></td>
                        <td>
                            <button type="button" class="btn btn-warning">
                                <a class="text-light"
                                   href="/accounts?action=update&id=${acc.accountId}">Update</a>
                            </button>
                                <%-- onclick set hàm href--%>
                            <button onclick="deleteAlert(${acc.accountId})" type="button" class="btn btn-danger"
                                    data-bs-toggle="modal" data-bs-target="#modalDelete">
                                Delete
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</main>

<!-- Modal -->
<div class="modal fade" id="modalDelete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Alert!</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Do you want to delete it ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">
                    <%--Đổi id để gọi hàm--%>
                    <a id="delLink" class="text-light" href="#">Delete</a>
                </button>
            </div>
        </div>
    </div>
</div>
<script>
    function deleteAlert(id) {
        document.getElementById("delLink").href = '/accounts?action=delete&id=' + id;
    }
</script>
<script src="assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="/style/sidebars.js"></script>
</body>
</html>