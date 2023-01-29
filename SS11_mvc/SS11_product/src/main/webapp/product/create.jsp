<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Create new product</title>
  <style>
    .message{
      color:green;
    }
  </style>
</head>
<body>
<h1>Create new product</h1>
<p>
  <c:if test='${requestScope["message"] != null}'>
    <span class="message">${requestScope["message"]}</span>
  </c:if>
</p>
<p>
  <a href="/products">Back to product list</a>
</p>
<form method="post">
  <fieldset>
    <legend>Product information</legend>
    <table>
      <tr>
        <td>Id: </td>
        <td><input type="text" name="id" id="id"></td>
      </tr>
      <tr>
        <td>Name Product: </td>
        <td><input type="text" name="nameProduct" id="nameProduct"></td>
      </tr>
      <tr>
        <td>Price: </td>
        <td><input type="text" name="price" id="price"></td>
      </tr>
      <tr>
        <td>Description: </td>
        <td><input type="text" name="description" id="description"></td>
      </tr>
      <tr>
        <td>Manufacturer: </td>
        <td><input type="text" name="manufacturer" id="manufacturer"></td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="Create product"></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>