<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <title>Home</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">  <style>
    /*
DEMO STYLE
*/

    @import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";
    body {
      font-family: 'Poppins', sans-serif;
      background: #fafafa;
    }

    p {
      font-family: 'Poppins', sans-serif;
      font-size: 1.1em;
      font-weight: 300;
      line-height: 1.7em;
      color: #999;
    }

    a,
    a:hover,
    a:focus {
      color: inherit;
      text-decoration: none;
      transition: all 0.3s;
    }

    .navbar {
      padding: 15px 10px;
      background: #fff;
      border: none;
      border-radius: 0;
      margin-bottom: 40px;
      box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
    }

    .navbar-btn {
      box-shadow: none;
      outline: none !important;
      border: none;
    }

    .line {
      width: 100%;
      height: 1px;
      border-bottom: 1px dashed #ddd;
      margin: 40px 0;
    }

    /* ---------------------------------------------------
        SIDEBAR STYLE
    ----------------------------------------------------- */

    .wrapper {
      display: flex;
      width: 100%;
      align-items: stretch;
    }

    #sidebar {
      min-width: 250px;
      max-width: 250px;
      /*background: #7386D5;*/
      background:#34495e;

      color: #fff;
      transition: all 0.3s;
    }

    #sidebar.active {
      margin-left: -250px;
    }

    #sidebar .sidebar-header {
      padding: 20px;
      /*background: #6d7fcc;*/
      background: #2c3e50;
    }

    #sidebar ul.components {
      padding: 20px 0;
      border-bottom: 1px solid #47748b;
    }

    #sidebar ul p {
      color: #fff;
      padding: 10px;
    }

    #sidebar ul li a {
      padding: 10px;
      font-size: 1.1em;
      display: block;
    }

    #sidebar ul li a:hover {
      /*color: #7386D5; */
      color: #3498db;
      background: #fff;
    }

    #sidebar ul li.active>a,
    a[aria-expanded="true"] {
      color: #fff;
      /*background: #6d7fcc;*/
      background: #2c3e50;
    }

    a[data-toggle="collapse"] {
      position: relative;
    }

    .dropdown-toggle::after {
      display: block;
      position: absolute;
      top: 50%;
      right: 20px;
      transform: translateY(-50%);
    }

    ul ul a {
      font-size: 0.9em !important;
      padding-left: 30px !important;
      /*background: #6d7fcc;*/
      background: #2c3e50;
    }

    ul.CTAs {
      padding: 20px;
    }

    ul.CTAs a {
      text-align: center;
      font-size: 0.9em !important;
      display: block;
      border-radius: 5px;
      margin-bottom: 5px;
    }

    a.download {
      background: #fff;
      color: #7386D5;
    }

    a.article,
    a.article:hover {
      /*background: #6d7fcc !important;*/
      background: #2c3e50 !important;
      color: #fff !important;
    }

    /* ---------------------------------------------------
        CONTENT STYLE
    ----------------------------------------------------- */

    #content {
      width: 100%;
      padding: 20px;
      min-height: 100vh;
      transition: all 0.3s;
    }

    /* ---------------------------------------------------
        MEDIAQUERIES
    ----------------------------------------------------- */

    @media (max-width: 768px) {
      #sidebar {
        margin-left: -250px;
      }
      #sidebar.active {
        margin-left: 0;
      }
      #sidebarCollapse span {
        display: none;
      }
    }
  </style>

</head>
<body>
<div class="wrapper">
  <!-- Sidebar  -->
  <nav id="sidebar">
    <div class="sidebar-header">
      <h3>Bootstrap Sidebar</h3>
    </div>

    <ul class="list-unstyled components">
      <p>Main menu</p>
      <li class="active">
        <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a>
        <ul class="collapse list-unstyled" id="homeSubmenu">
          <li>
            <a href="#">Home 1</a>
          </li>
          <li>
            <a href="#">Home 2</a>
          </li>
          <li>
            <a href="#">Home 3</a>
          </li>
        </ul>
      </li>
      <li>
        <a href="#">About</a>
      </li>
      <li>
        <a href="#">Portfolio</a>
      </li>
      <li>
        <a href="#">Contact</a>
      </li>
      <!--            <li>-->
      <!--                <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Pages</a>-->
      <!--                <ul class="collapse list-unstyled" id="pageSubmenu">-->
      <!--                    <li>-->
      <!--                        <a href="#">Page 1</a>-->
      <!--                    </li>-->
      <!--                    <li>-->
      <!--                        <a href="#">Page 2</a>-->
      <!--                    </li>-->
      <!--                    <li>-->
      <!--                        <a href="#">Page 3</a>-->
      <!--                    </li>-->
      <!--                </ul>-->
      <!--            </li>-->
    </ul>

    <ul class="list-unstyled components">
      <li>
        <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">User</a>
        <ul class="collapse list-unstyled" id="pageSubmenu">
          <li>
            <a href="#">Profile</a>
          </li>
          <li>
            <a href="#">Setting</a>
          </li>
          <li>
            <a href="#">Log out</a>
          </li>
        </ul>
      </li>
    </ul>
    <!--        <ul class="list-unstyled CTAs">-->
    <!--            <li>-->
    <!--                <a href="https://bootstrapious.com/tutorial/files/sidebar.zip" class="download">Download source</a>-->
    <!--            </li>-->
    <!--            <li>-->
    <!--                <a href="https://bootstrapious.com/p/bootstrap-sidebar" class="article">Back to article</a>-->
    <!--            </li>-->
    <!--        </ul>-->
  </nav>

  <!-- Page Content  -->
  <div id="content">

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">

        <button type="button" id="sidebarCollapse" class="btn btn-info">
          <i class="fas fa-align-left"></i>
          <span>Toggle Sidebar</span>
        </button>
        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <i class="fas fa-align-justify"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="nav navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Page</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Page</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Page</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Page</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <h2>Collapsible Sidebar Using Bootstrap 4</h2>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

    <div class="line"></div>

    <h2>Lorem Ipsum Dolor</h2>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

    <div class="line"></div>

    <h2>Lorem Ipsum Dolor</h2>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

    <div class="line"></div>

    <h3>Lorem Ipsum Dolor</h3>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
  </div>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script>
  $(document).ready(function () {
    $('#sidebarCollapse').on('click', function () {
      $('#sidebar').toggleClass('active');
    });
  });
</script>
</body>
</html>