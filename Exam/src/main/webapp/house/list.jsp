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
            <a href="/houses" class="nav-link active">House</a>
        </li>
    </ul>

    <div class="alert alert-success" role="alert">
        <c:out value="${message}"/>
    </div>
    <h2 class="text-secondary">Management</h2>
    <div class="d-flex flex-row">
        <form action="/houses" class="col-6">
            <input type="hidden" name="action" value="create">
            <button class="btn btn-success">Create</button>
        </form>
        <form action="/houses" class="col-6">
            <div class="input-group">
                <input class="form-control" style="height: 40px; width: 500px" name="search">
                <input type="hidden" name="action" value="search">
                <button class="btn btn-info">Search</button>
            </div>
        </form>
    </div>


    <table class="table table-striped" id="tableAccount">
        <thead>
        <tr>
            <th>houseCode</th>
            <th>houseArea</th>
            <th>houseStatus</th>
            <th>houseFlour</th>
            <th>houseType</th>
            <th>houseDes</th>
            <th>housePrice</th>
            <th>houseStart</th>
            <th>houseEnd</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="acc" items="${listHouse}">
            <tr>
                <td><c:out value="${acc.houseCode}"/></td>
                <td><c:out value="${acc.houseArea}"/></td>
                <td><c:out value="${acc.houseStatus}"/></td>
                <td><c:out value="${acc.houseFlour}"/></td>
                <td><c:out value="${acc.houseType}"/></td>
                <td><c:out value="${acc.houseDes}"/></td>
                <td><c:out value="${acc.housePrice}"/></td>
                <td><c:out value="${acc.houseStart}"/></td>
                <td><c:out value="${acc.houseEnd}"/></td>
                <td>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-danger"
                            data-toggle="modal" data-target="#modelId">
                        Delete
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
                                    Body
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-danger">
                                        <a class="text-light" href="houses?action=delete&houseCode=${acc.houseCode}">
                                            Delete
                                        </a>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <script>
        $(document).ready(function () {
            $('#tableAccount').dataTable({
                'searching': false,
                'pageLength': 10
            })
        })
    </script>
    <script src="/static/js/jquery-3.5.1.min.js"></script>
    <script src="/static/js/bootstrap.js"></script>
    <script src="/static/datatables/js/jquery.dataTables.js"></script>
    <script src="/static/datatables/js/dataTables.bootstrap4.js"></script>
</body>
</html>