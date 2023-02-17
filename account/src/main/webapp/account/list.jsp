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
            <span class="fs-4">BÀI THI</span>
        </a>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="/saving-accounts" class="nav-link active" aria-current="page">
                    Saving Account
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
        <div align="center">
            <table cellpadding="5" class="table table-striped table-hover">
                <thead>
                <tr>
                    <th colspan="9">
                        <form action="/saving-accounts">
                            <input type="hidden" name="action" value="sort">
                            <button class="btn btn-dark">Sort</button>
                        </form>
                    </th>
                </tr>
                <tr>
                    <th colspan="8">
                        <form action="/saving-accounts">
                            <input class="form-check-inline" style="height: 40px; width: 500px" name="find">
                            <input type="hidden" name="action" value="find">
                            <button class="btn btn-info text-light">Search</button>
                        </form>
                    </th>
                    <th colspan="1">
<%--                        <form action="/saving-accounts?action=create">--%>
                        <form action="/saving-accounts">
                            <input type="hidden" name="action" value="create">
                            <button class="btn btn-success">Create New</button>
                        </form>
                    </th>
                </tr>
                <tr>
                    <th>Account Id</th>
                    <th>Account Code</th>
                    <th>Account Name</th>
                    <th>Create Date</th>
                    <th>Saving Amount</th>
                    <th>Deposit Date</th>
                    <th>Interest Rate(%)</th>
                    <th>Term Name</th>
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
                                   href="/saving-accounts?action=update&id=${acc.accountId}">Update</a>
                            </button>

                                <%--                            onclick set hàm href--%>
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
    <%-- End Content --%>
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
                    <%--                    Đổi id để gọi hàm--%>
                    <a id="delLink" class="text-light" href="#">Delete</a>
                </button>
            </div>
        </div>
    </div>
</div>


<script>
    function deleteAlert(id) {
        document.getElementById("delLink").href = '/saving-accounts?action=delete&id=' + id;
    }
</script>
<script src="assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="/style/sidebars.js"></script>
</body>
</html>