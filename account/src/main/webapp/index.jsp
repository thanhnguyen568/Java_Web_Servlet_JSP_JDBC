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
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>

    <!-- Custom styles for this template -->
    <link href="/style/sidebars.css" rel="stylesheet">
</head>
<body>

<main>
    <%-- Menu --%>
    <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 15%;">
        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
            <span class="fs-4">Bài tập SS12</span>
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
</main>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
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