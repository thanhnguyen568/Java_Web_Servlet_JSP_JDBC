<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Sidebar  -->
<nav id="sidebar">
    <div class="sidebar-header">
        <h3>
            <a href="#">Home</a>
        </h3>
    </div>

    <ul class="list-unstyled components">

        <li class="active">
            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">User</a>
            <ul class="collapse list-unstyled" id="homeSubmenu">

                <li>
                    <a href="/users">Display</a>
                </li>

                <li>
                    <a href="#">Create</a>
                </li>

            </ul>
        </li>

        <li>
            <a href="#homeSubmenu1" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Object</a>
            <ul class="collapse list-unstyled" id="homeSubmenu1">

                <li>
                    <a href="#">Display</a>
                </li>

                <li>
                    <a href="#">Create</a>
                </li>

            </ul>
        </li>

    </ul>
</nav>
